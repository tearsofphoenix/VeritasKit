//
//  VMKDebugServer.m
//
//  Copyright (c) 2012 Damian Kolakowski. All rights reserved.
//

#import <assert.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

#import "VMKDebugFunctions.h"
#import "VMKDebugServer.h"
#import "VMKDebugRequestHandler.h"
#import "VMKDebugCommandHandler.h"
#import "NSData+Base64.h"

#import <LuaKit/LuaKit.h>

@interface VMKDebugServer ()<VMKDebugCommandHandlerDelegate>

@end

@implementation VMKDebugServer

static VMKDebugServer *sSharedServer = nil;

+ (VMKDebugServer*)sharedServer
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
                  (^
                   {
                       sSharedServer = [[VMKDebugServer alloc] init];
                   }));
    
    return sSharedServer;
}

- (id)init
{
    if ((self = [super init]))
    {
        _handler = [[VMKDebugCommandHandler alloc] init];
        [_handler setDelegate: self];
    }
    
    return self;
}

- (void)dealloc
{
    [self stop];
    
    [_handler release];
    _handler = nil;
    
    [super dealloc];
}

- (void)setState:(VMKLuaStateRef)state
{
    [_handler setState: state];
}

- (VMKLuaStateRef)state
{
    return [_handler state];
}

- (void)handleClientConnection: (NSArray *)args
{
    int socket = [[args objectAtIndex:1] intValue];
    
    @autoreleasepool
    {
        
        NSData *reveicedData = dataFromSocket(socket);
        
        if (reveicedData)
        {
            NSError *error = nil;
            NSDictionary *info = [NSPropertyListSerialization propertyListWithData: reveicedData
                                                                           options: NSPropertyListImmutable
                                                                            format: NULL
                                                                             error: &error];
            if (error)
            {
                NSLog(@"%@", error);
                
            }else
            {
                NSLog(@"%@", info);
                [_handler handleRequest: info
                               onSocket: socket];
            }
        }
        
        cleanSocket(socket);
    }    
}

- (void)acceptClientConnectionsLoop
{
    @autoreleasepool
    {
        
        while (!_done)
        {
            struct sockaddr clientAddr;
            unsigned int addrLen = sizeof(clientAddr);
            int clientSocket = accept(_listenSocket, &clientAddr, &addrLen);
            
            if (clientSocket == -1)
            {
                _done = YES;
                
            } else
            {
                int no_sig_pipe = 1;
                
                setsockopt(clientSocket, SOL_SOCKET, SO_NOSIGPIPE, &no_sig_pipe, sizeof no_sig_pipe);
                
                NSString *clientIpAddress = sockaddrToNSString(&clientAddr);
                
                NSArray *args = @[clientIpAddress, @(clientSocket)];
                
                if (clientIpAddress)
                {
                    [self performSelectorInBackground: @selector(handleClientConnection:)
                                           withObject: args];
                }
            }
        }
        
        cleanSocket(_listenSocket);
        
    }
}

- (BOOL)start: (int)port
{
    _listenPort = port;
    _done = NO;
    
    struct sockaddr_in addr;
    
    memset(&addr, 0, sizeof addr);
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = INADDR_ANY;
    addr.sin_port = htons(_listenPort);
    
    _listenSocket = socket(AF_INET, SOCK_STREAM, 0);
    
    if (_listenSocket == -1)
    {
        return NO;
    }
    
    int value = 1;
    
    if (setsockopt(_listenSocket, SOL_SOCKET, SO_REUSEADDR, &value, sizeof(value)) == -1)
    {
        cleanSocket(_listenSocket);
        return NO;
    }
    
    int no_sig_pipe = 1;
    setsockopt(_listenSocket, SOL_SOCKET, SO_NOSIGPIPE, &no_sig_pipe, sizeof no_sig_pipe);
    
    if (bind(_listenSocket, (struct sockaddr *)&addr, sizeof(addr)) == -1)
    {
        cleanSocket(_listenSocket);
        
        return NO;
    }
    
    if (listen(_listenSocket, 150 /* max connections */) == -1)
    {
        cleanSocket(_listenSocket);
        return NO;
    }
    
    [self performSelectorInBackground: @selector(acceptClientConnectionsLoop)
                           withObject: nil];
    
    return YES;
}

- (void)start
{
    if (!_done)
    {
        @autoreleasepool
        {
            if(![self start: 9449])
            {
                NSLog(@"Could not start server!");
            }
        }
        
        while (!_canLauch)
        {
            @autoreleasepool
            {
                [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
            }
        }
    }
}

- (void)stop
{
    _done = YES;
    cleanSocket(_listenSocket);
}

#pragma mark - VMKDebugCommandHandlerDelegate

- (void)commandHandler: (VMKDebugCommandHandler *)handler
    didReceivedCommand: (NSString *)command
             arguments: (NSDictionary *)arguments
{
    if ([command isEqualToString: VMKDebugCommandLaunch])
    {
        _canLauch = YES;
    }
}

- (void)commandHandler: (VMKDebugCommandHandler *)handler
 wantToPauseForCommand: (NSString *)command
             arguments: (NSDictionary *)arguments
{
    if (!_pausingForCommand)
    {
        _pausingForCommand = YES;
        
        while (_pausingForCommand)
        {
            @autoreleasepool
            {
                [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
            }
        }
    }
}

- (void)commandHandler: (VMKDebugCommandHandler *)handler
wantToResumeForCommand: (NSString *)command
             arguments: (NSDictionary *)arguments
{
    _pausingForCommand = NO;
}

@end
