//
//  LuaEngineNetworkManager.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaEngineNetworkManager.h"

#define kLuaEngine_Network_ServerURL @"http://www.google.com"

#define kLuaEngine_Network_TimeoutInterval (10)

@implementation LuaEngineNetworkManager

- (id)init
{
    if ((self = [super init]))
    {
        _receivedData = [[NSMutableData alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [_receivedData release];
    
    [super dealloc];
}

- (void)postRequestToServerWithInfo: (id)info
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: [NSURL URLWithString: kLuaEngine_Network_ServerURL]
                                                  cachePolicy: NSURLRequestUseProtocolCachePolicy
                                              timeoutInterval: kLuaEngine_Network_TimeoutInterval];
    
    NSURLConnection *handShakeConnectionWithServer = [[NSURLConnection alloc] initWithRequest: request 
                                                                                     delegate: self 
                                                                             startImmediately: YES];
    [request release];
    
    [handShakeConnectionWithServer release];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"did receive response:%@", response);
    [_receivedData setLength: 0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receivedData appendData: data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"data:%@", _receivedData);
}

@end
