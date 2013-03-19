//
//  VMKDebugCommandHandler.h
//  VeritasMachineKit
//
//  Created by tearsofphoenix on 13-2-28.
//
//

#import "VMKDebugRequestHandler.h"

struct lua_State;

#define VMKDebugCommandConnect          @"connect"           /* connect to server */
#define VMKDebugCommandLaunch           @"run"
#define VMKDebugCommandBackTrace        @"backtrace"         /* bt for short*/
#define VMKDebugCommandBreakpointSet    @"breakpoint-set"    /* bs for short*/
#define VMKDebugCommandBreakpointDelete @"breakpoint-delete" /* bd for short*/
#define VMKDebugCommandBreakpointList   @"breakpoint-list"   /* bl for short*/

#define VMKDebugCommandExecutionStep    @"step"
#define VMKDebugCommandExecutionOver    @"over"
#define VMKDebugCommandExecutionFinish  @"finish"

#define VMKDebugCommandQueryMessage     @"message"          //internal usage

#define VMKDebugCommandHelp             @"help"             //get help message

#define VMKDebugCommandMessageKey       @"key_message"      //
#define VMKDebugCommandKey              @"command"      //

@class VMKDebugCommandHandler;

typedef NSString *(* VMKDebugCommandProcessor)(VMKDebugCommandHandler *handler, NSString *command, NSDictionary *arguments);

@protocol VMKDebugCommandHandlerDelegate <NSObject>

- (void)commandHandler: (VMKDebugCommandHandler *)handler
    didReceivedCommand: (NSString *)command
             arguments: (NSDictionary *)arguments;

- (void)commandHandler: (VMKDebugCommandHandler *)handler
 wantToPauseForCommand: (NSString *)command
             arguments: (NSDictionary *)arguments;

- (void)commandHandler: (VMKDebugCommandHandler *)handler
wantToResumeForCommand: (NSString *)command
             arguments: (NSDictionary *)arguments;

@end

@interface VMKDebugCommandHandler : VMKDebugRequestHandler
{
    CFMutableDictionaryRef _supportedCommands;
    
    //breakpoints
    //
    CFMutableDictionaryRef _breakpointHandlers;
    
    //interactive command support
    //
    NSMutableArray *_userCommandQueue;
    NSInteger _executionLevel;
    
    //for communication
    //
    NSMutableArray *_messages;
}

@property (nonatomic, assign) struct lua_State *state;
@property (nonatomic, assign) id<VMKDebugCommandHandlerDelegate> delegate;

- (void)registerProcessor: (VMKDebugCommandProcessor)processor
           forCommandName: (NSString *)comamndName;

@end
