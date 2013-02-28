//
//  VMKDebugCommandHandler.h
//  VeritasMachineKit
//
//  Created by tearsofphoenix on 13-2-28.
//
//

#import "VMKDebugRequestHandler.h"
#import <LuaKit/LuaKit.h>

#define VMKDebugCommandBackTrace @"backtrace"

typedef NSString *(* VMKDebugCommandProcessor)(struct lua_State *state, NSString *command);

@interface VMKDebugCommandHandler : VMKDebugRequestHandler
{
    CFMutableDictionaryRef _supportedCommands;
}

@property (nonatomic, assign) struct lua_State *state;

- (void)registerProcessor: (VMKDebugCommandProcessor)processor
           forCommandName: (NSString *)comamndName;

@end
