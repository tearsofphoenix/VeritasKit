//
//  VMKDebugCommandHandler.m
//  VeritasMachineKit
//
//  Created by tearsofphoenix on 13-2-28.
//
//

#import "VMKDebugCommandHandler.h"

static NSString *_VMKBacktraceStack(struct lua_State *state, NSString *commandString)
{
    struct lua_Debug ar;
    int i = 0;
    
    NSMutableString *content = [NSMutableString string];
    
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

@implementation VMKDebugCommandHandler

- (void)_registerSupportedCommands
{
    [self registerProcessor: _VMKBacktraceStack
             forCommandName: VMKDebugCommandBackTrace];
}

- (id)init
{
    if ((self = [super init]))
    {
        _supportedCommands = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, NULL);
        
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

- (void)registerProcessor: (VMKDebugCommandProcessor)processor
           forCommandName: (NSString *)comamndName
{
    CFDictionarySetValue(_supportedCommands, comamndName, processor);
}


- (BOOL)handleRequest: (NSString *)url
          withHeaders: (NSDictionary *)headers
                query: (NSDictionary *)query
              address: (NSString *)address
             onSocket: (int)socket
{
    
    if([self writeText: @"HTTP/1.0 200 OK\r\n\r\n"
              toSocket: socket])
    {
        NSString *commandString = [query objectForKey: @"command"];
        
        if (commandString)
        {
            VMKDebugCommandProcessor processor = CFDictionaryGetValue(_supportedCommands, commandString);
            
            if (processor)
            {
                [self writeText: processor(_state, commandString)
                       toSocket: socket] ;
            }
            
            NSLog(@"%@", commandString);
        }
    }
    
    return YES;
}

@end
