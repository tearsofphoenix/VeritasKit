//
//  VMKDebugCommandHandler.m
//  VeritasMachineKit
//
//  Created by tearsofphoenix on 13-2-28.
//
//

#import "VMKDebugCommandHandler.h"
#import "VMKDebugFunctions.h"
#import "VMKDebugBreakpoint.h"

#import <LuaKit/LuaKit.h>

#define VMKDebugCommandHandlerNameInLuaState "com.veritas.lua.debug.command.handler"

static NSDictionary *sCommandDict = nil;

static NSString *LongCommandStringForShot(NSString *shortCommand)
{
    if (!sCommandDict)
    {
        sCommandDict = [@{
                        @"bs" : VMKDebugCommandBreakpointSet,
                        @"bd" : VMKDebugCommandBreakpointDelete,
                        @"bl" : VMKDebugCommandBreakpointList,
                        @"bt" : VMKDebugCommandBackTrace,
                        } retain];
    }
    
    return [sCommandDict objectForKey: shortCommand];
}

@implementation VMKDebugCommandHandler

static void _VMKLuaHook(lua_State *L, lua_Debug *ar)
{
    int event = ar->event;
    int top = lua_gettop(L);
    
    lua_pushliteral(L, VMKDebugCommandHandlerNameInLuaState);
    lua_rawget(L, LUA_REGISTRYINDEX);
    
    VMKDebugCommandHandler *handler = lua_touserdata(L, -1);
    
    lua_pop(L, 1);
    
    switch (event)
    {
        case LUA_HOOKLINE:
        {
            NSMutableArray *commandQueue = handler->_userCommandQueue;
            NSString *currentCommand = nil;
            
            if ([commandQueue count] > 0)
            {
                currentCommand = commandQueue[0];
            }
            
            if (currentCommand)
            {
                if (CFEqual(VMKDebugCommandExecutionStep, currentCommand))
                {
                    handler->_executionLevel = 0;
                    
                    [handler _sendMessage: @"Step"];
                    
                }else if (CFEqual(VMKDebugCommandExecutionOver, currentCommand))
                {
                    if (!handler->_executionLevel)
                    {
                        [handler _sendMessage: @"Over"];
                        
                    }else
                    {
                        VMKDebugBreakpoint *breakpoint = CFDictionaryGetValue(handler->_breakpointHandlers, (const void *)ar->currentline);
                        if (breakpoint)
                        {
                            [handler _sendMessage: @"Found a breakpoint"];
                            
                            [[handler delegate] commandHandler: handler
                                         wantToPauseForCommand: VMKDebugCommandExecutionOver
                                                     arguments: nil];
                        }
                    }
                    
                }else if (CFEqual(VMKDebugCommandExecutionFinish, currentCommand))
                {
                    [[handler delegate] commandHandler: handler
                                wantToResumeForCommand: VMKDebugCommandExecutionFinish
                                             arguments: nil];
                }
            }else
            {
                VMKDebugBreakpoint *breakpoint = CFDictionaryGetValue(handler->_breakpointHandlers, (const void *)ar->currentline);
                if (breakpoint)
                {
                    [handler _sendMessage: @"Found a breakpoint"];
                    
                    [[handler delegate] commandHandler: handler
                                 wantToPauseForCommand: VMKDebugCommandExecutionOver
                                             arguments: nil];
                }
            }
            
            break;
        }
            
        case LUA_HOOKCALL:
        {
            handler->_executionLevel++;
            break;
        }
            
        case LUA_HOOKRET:
        case LUA_HOOKTAILCALL:
        {
            if (handler->_executionLevel)
            {
                handler->_executionLevel--;
            }
            
            break;
        }
        default:
        {
            break;
        }
    }
    
    assert(top == lua_gettop(L));
    
}

static NSString *_VMKLaunchApplication(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    [[handler delegate] commandHandler: handler
                    didReceivedCommand: commandString
                             arguments: arguments];
    return @"OK";
}

static NSString *_VMKBacktraceStack(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    struct lua_State *state = handler->_state;
    struct lua_Debug ar;
    int i = 0;
    
    NSMutableString *content = [NSMutableString stringWithString: @""];
    
    while (lua_getstack(state, i, &ar))
    {
        lua_getinfo(state, "nSl", &ar);
        
        [content appendFormat: @"%d    %s\n%d\n%s\n%s\n", i,
         ar.short_src,
         ar.currentline,
         (ar.name ?: "[N/A]"), *ar.what ? ar.what : "[N/A]"];
        i++;
    }
    
    return content;
}

#pragma mark - breakpoint

static NSString *_VMKSetBreakPoint(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    CFMutableDictionaryRef breakpointLines = handler->_breakpointHandlers;
    
    NSInteger lineNumber = [[arguments objectForKey: VMKDebugBreakpointLineKey] integerValue];
    
    VMKDebugBreakpoint *breakpoint = CFDictionaryGetValue(breakpointLines, (const void *)lineNumber);
    
    if (!breakpoint)
    {
        breakpoint = [[VMKDebugBreakpoint alloc] init];
        [breakpoint setLineNumber: lineNumber];
        
        CFDictionarySetValue(breakpointLines, (const void *)lineNumber, breakpoint);
        
        [breakpoint release];
    }
    
    [breakpoint updateFromSettings: arguments];
    
    return @"OK";
}

static NSString *_VMKDeleteBreakPoint(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    CFMutableDictionaryRef breakpointLines = handler->_breakpointHandlers;
    
    NSInteger lineNumber = [[arguments objectForKey: VMKDebugBreakpointLineKey] integerValue];
    
    CFDictionaryRemoveValue(breakpointLines, (const void *)lineNumber);
    
    return @"OK";
}

static CFComparisonResult __VMKComparatorFunction(const void *val1, const void *val2, void *context)
{
    NSInteger line1 = (NSInteger)val1;
    NSInteger line2 = (NSInteger)val2;
    
    if (line1 < line2)
    {
        return kCFCompareLessThan;
    }
    
    if (line1 > line2)
    {
        return kCFCompareGreaterThan;
    }
    
    return kCFCompareEqualTo;
}

static NSString *_VMKListBreakpoint(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    CFMutableDictionaryRef breakpointHandlers = handler->_breakpointHandlers;
    
    CFIndex count = CFDictionaryGetCount(breakpointHandlers);
    
    const void **keys = malloc(sizeof(const void *) * count);
    CFDictionaryGetKeysAndValues(breakpointHandlers, keys, NULL);
    
    CFMutableArrayRef allKeys = CFArrayCreateMutable(NULL, count, NULL);
    
    for (CFIndex iLooper = 0; iLooper < count; ++iLooper)
    {
        CFArrayAppendValue(allKeys, keys[iLooper]);
    }
    
    CFArraySortValues(allKeys, CFRangeMake(0, count), __VMKComparatorFunction, NULL);
    
    NSMutableString *result = [NSMutableString string];
    
    for (CFIndex iLooper = 0; iLooper < count; ++iLooper)
    {
        VMKDebugBreakpoint *breakpoint = CFDictionaryGetValue(breakpointHandlers, CFArrayGetValueAtIndex(allKeys, iLooper));
        
        [result appendString: [breakpoint description]];
    }
    
    free(keys);
    
    return result;
}


#pragma mark - execution

static NSString *_VMKStepExecution(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    [handler->_userCommandQueue addObject: VMKDebugCommandExecutionStep];
    return @"OK";
}

static NSString *_VMKOverExecution(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    [handler->_userCommandQueue addObject: VMKDebugCommandExecutionOver];
    return @"OK";
}

static NSString *_VMKFinishExecution(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    [handler->_userCommandQueue addObject: VMKDebugCommandExecutionFinish];
    return @"OK";
}

static NSString *_VMKQueryMessage(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    NSMutableArray *messages = handler->_messages;
    NSString *message = nil;
    NSInteger count = [messages count];
    
    if (count > 0)
    {
        message = [messages objectAtIndex: 0];
        
        [messages setArray: [messages subarrayWithRange: NSMakeRange(1, count - 1)]];
    }
    
    return message;
}

static NSString *_VMKHelpMessage(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    return @"Veritas Machine Kit Debugger\n"
    "supported command\n"
    "\n"
    "1.run                launch the process\n"
    "2.backtrace          show backtrace infomation\n"
    "3.breakpoint-set     bs for short, set a breakpoint\n"
    "4.breakpoint-delete  bd for short, delete a breakpoint\n"
    "5.breakpoint-list    bl for short, list breakpoints\n"
    "6.step               step in a function\n"
    "7.over               step over a function\n"
    "8.finish             finish a function call and return\n"
    "9.message            query current message from debug server\n"
    "10.help              show help message\n";
}

static NSString *_VMKConnectToServer(VMKDebugCommandHandler *handler, NSString *commandString, NSDictionary *arguments)
{
    return @"OK";
}

- (void)_registerSupportedCommands
{
    //connect to server
    [self registerProcessor: _VMKConnectToServer
             forCommandName: VMKDebugCommandConnect];
    
    [self registerProcessor: _VMKLaunchApplication
             forCommandName: VMKDebugCommandLaunch];
    
    [self registerProcessor: _VMKBacktraceStack
             forCommandName: VMKDebugCommandBackTrace];
    
    //break point
    //
    [self registerProcessor: _VMKSetBreakPoint
             forCommandName: VMKDebugCommandBreakpointSet];
    
    [self registerProcessor: _VMKDeleteBreakPoint
             forCommandName: VMKDebugCommandBreakpointDelete];
    
    [self registerProcessor: _VMKListBreakpoint
             forCommandName: VMKDebugCommandBreakpointList];
    
    //execution
    //
    [self registerProcessor: _VMKStepExecution
             forCommandName: VMKDebugCommandExecutionStep];
    
    [self registerProcessor: _VMKOverExecution
             forCommandName: VMKDebugCommandExecutionOver];
    
    [self registerProcessor: _VMKFinishExecution
             forCommandName: VMKDebugCommandExecutionFinish];
    
    //message
    [self registerProcessor: _VMKQueryMessage
             forCommandName: VMKDebugCommandQueryMessage];
    
    //help
    [self registerProcessor: _VMKHelpMessage
             forCommandName: VMKDebugCommandHelp];
}

- (void)_terminateDebug
{
    
}

- (id)init
{
    if ((self = [super init]))
    {
        _supportedCommands = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, NULL);
        _breakpointHandlers = CFDictionaryCreateMutable(NULL, 0, NULL, &kCFTypeDictionaryValueCallBacks);
        _userCommandQueue = [[NSMutableArray alloc] init];
        
        _messages = [[NSMutableArray alloc] init];
        
        [self _registerSupportedCommands];
    }
    
    return self;
}

- (void)dealloc
{
    CFRelease(_supportedCommands);
    _supportedCommands = NULL;
    
    [super dealloc];
}

- (void)setState: (struct lua_State *)state
{
    if (_state != state)
    {
        if (_state)
        {
            lua_sethook(_state, NULL, 0, 0);
        }
        
        _state = state;
        
        lua_pushliteral(_state, VMKDebugCommandHandlerNameInLuaState);
        lua_pushlightuserdata(_state, self);
        lua_rawset(_state, LUA_REGISTRYINDEX);
        
        lua_sethook(_state, _VMKLuaHook, LUA_MASKLINE | LUA_MASKCALL | LUA_MASKRET, 0);
    }
}

- (void)registerProcessor: (VMKDebugCommandProcessor)processor
           forCommandName: (NSString *)comamndName
{
    CFDictionarySetValue(_supportedCommands, comamndName, processor);
}

- (void)_sendMessage: (NSString *)message
{
    [_messages addObject: message];
}

- (BOOL)handleRequest: (NSDictionary *)parameters
             onSocket: (int)socket
{
    
    NSString *commandString = [parameters objectForKey: VMKDebugCommandKey];
    
    if (commandString)
    {
        VMKDebugCommandProcessor processor = CFDictionaryGetValue(_supportedCommands, commandString);
        
        if (!processor)
        {
            //may be a short command
            //
            commandString = LongCommandStringForShot(commandString);
            
            if (commandString)
            {
                processor = CFDictionaryGetValue(_supportedCommands, commandString);
            }
        }
    
        NSString *str = nil;
        
        if (processor)
        {
            str = processor(self, commandString, parameters);
            
        }else
        {
            str = [NSString stringWithFormat: @"%@    Unsurpported command: %@",
                               stringFromCurrentTime(),
                   commandString ?: [parameters objectForKey: VMKDebugCommandKey]];
        }
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        
        [dict setObject: str
                 forKey: VMKDebugCommandMessageKey];
        
        NSError *error = nil;
        NSData *data = [NSPropertyListSerialization dataWithPropertyList: dict
                                                                  format: NSPropertyListXMLFormat_v1_0
                                                                 options: NSPropertyListImmutable
                                                                   error: &error];
        if (error)
        {
            NSLog(@"%@", error);
        }else
        {
            [self writeData: data
                   toSocket: socket];
        }
        
        [dict release];
    }
    
    return YES;
}


@end
