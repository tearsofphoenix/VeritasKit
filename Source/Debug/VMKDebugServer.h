//
//  VMKDebugServer.h
//
//  Copyright (c) 2012 Damian Kolakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMKMachineService.h"

@class VMKDebugCommandHandler;

@interface VMKDebugServer : NSObject<VMKDebugServer>
{
    int _listenPort;
    int _listenSocket;
    BOOL _done;
    BOOL _canLauch;
    BOOL _pausingForCommand;
    
    VMKDebugCommandHandler *_handler;
}

@property (nonatomic, assign) VMKLuaStateRef state;

+ (VMKDebugServer *)sharedServer;

@end
