//
//  VMKDebugServer.h
//
//  Copyright (c) 2012 Damian Kolakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

struct lua_State;

@protocol HVRequestHandler;

@interface VMKDebugServer : NSObject
{
    int _listenPort;
    int _listenSocket;
    BOOL _done;
    NSMutableDictionary *_handlers;
}

@property (nonatomic, assign) struct lua_State *state;

+ (VMKDebugServer *)sharedServer;

- (void)registerHandler: (id<HVRequestHandler>)handler
           forURLScheme: (NSString *)url;

- (void)registerHandler: (id<HVRequestHandler>)handler
          forURLSchemes: (NSArray *)urls;

- (void)stop;

- (void)start;

@end
