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

#import "VMKFunctions.h"
#import "VMKDebugServer.h"
#import "VMKDebugRequestHandler.h"
#import "HVBase64StaticFile.h"
#import "VMKDebugCommandHandler.h"
#import "VMKDebugServerBase64String.h"
#import "VMKJqueryMinBase64String.h"
#import "NSData+Base64.h"

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
        _handlers = [[NSMutableDictionary alloc] initWithCapacity: 10];
    }
    
    return self;
}

- (void)dealloc
{
    [self stop];
    
    [_handlers release];
    _handlers = nil;
    
    [super dealloc];
}

- (void)handleClientConnection: (NSArray *)args
{
 
    NSString *address = [args objectAtIndex:0];
    
    int socket = [[args objectAtIndex:1] intValue];
    
    @autoreleasepool
    {
        
        NSData *httpInitLine = dataOfLineFromSocket(socket);
        
        if (httpInitLine)
        {
            NSString *httpInitLineString = [[[NSString alloc] initWithData: httpInitLine
                                                                  encoding: NSASCIIStringEncoding] autorelease];
            
            NSLog(@"[VMKDebugServer] %@: REQUEST HTTP INIT LINE: %@", [NSDate date], httpInitLineString);
            
            NSArray *initLineTokens = [httpInitLineString componentsSeparatedByString: @" "];
            
            NSString *requestMethod = nil;
            NSURL *requestUrl = nil;
            
            if ([initLineTokens count] >= 3)
            {
                requestMethod = [initLineTokens objectAtIndex: 0];
                
                NSString *requestUrlString = [initLineTokens objectAtIndex: 1];
                
                if (requestUrlString)
                {
                    requestUrl = [NSURL URLWithString: requestUrlString];
                }
            }
            
            NSDictionary *requestQueryParams = queryParametersOfURL(requestUrl);
            NSDictionary *requestHeaders = headersOfSocket(socket);
            
            if (requestUrl)
            {
                NSString *relativePath = [requestUrl relativePath];
                if (relativePath)
                {
                    id<HVRequestHandler> handler = nil;
                    @synchronized (_handlers)
                    {
                        handler = [_handlers objectForKey: relativePath];
                    }
                    
                    if (handler)
                    {
                        [handler handleRequest: relativePath
                                   withHeaders: requestHeaders
                                         query: requestQueryParams
                                       address: address
                                      onSocket: socket];
                    }
                }
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
            const int clientSocket = accept(_listenSocket, (struct sockaddr *)&clientAddr, &addrLen);
            
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

- (void)registerHandler: (id<HVRequestHandler>)handler
           forURLScheme: (NSString *)url
{
    if (url && handler)
    {
        [_handlers setObject: handler
                      forKey: url];
    }
}

- (void)registerHandler: (id<HVRequestHandler>)handler
          forURLSchemes: (NSArray *)urls
{
    if (urls && handler)
    {
        for (NSString *iLooper in urls)
        {
            [_handlers setObject: handler
                          forKey: iLooper];
        }
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
        if([self start: 9449])
        {
            NSString *filePath = [[NSBundle bundleForClass: [self class]] pathForResource: @"websocketclient"
                                                                                   ofType: @"html"];
            NSData *HTMLData = [[NSData alloc] initWithContentsOfFile: filePath];
            
            [self registerHandler: [HVBase64StaticFile handler: [HTMLData base64EncodedString]]
                    forURLSchemes: @[ @"", @"/", @"/index", @"/index.html"]];
            
            [HTMLData release];
            
            [self registerHandler: [HVBase64StaticFile handler: VMKJqueryMinBase64String]
                     forURLScheme: @"/jquery-min.js"];
            
            VMKDebugCommandHandler *commandHandler = [VMKDebugCommandHandler handler];
            [commandHandler setState: _state];
            
            [self registerHandler: commandHandler
                     forURLScheme: @"/command"];
        }else
        {
            NSLog(@"Could not start server!");
        }
    }
}

- (void)stop
{
    _done = YES;
    cleanSocket(_listenSocket);
}

@end
