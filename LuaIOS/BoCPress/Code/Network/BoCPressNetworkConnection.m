//
//  BoCPressNetworkConnection.m
//  BoCPress
//
//  Created by LeixSnake on 6/15/11.
/*************************************************************************
 
 *
 
 * EREACH CONFIDENTIAL
 
 * ____________________
 
 *
 
 * [2011] eReach Mobile Software Technology Co., Ltd.
 
 * All Rights Reserved.
 
 *
 
 * NOTICE: All information contained herein is, and remains the
 
 * property of eReach Mobile Software Technology and its suppliers,
 
 * if any. The intellectual and technical concepts contained herein
 
 * are proprietary to eReach Mobile Software Technology and its
 
 * suppliers and may be covered by U.S. and Foreign Patents, patents
 
 * in process, and are protected by trade secret or copyright law.
 
 * Dissemination of this information or reproduction of this material
 
 * is strictly forbidden unless prior written permission is obtained
 
 * from eReach Mobile Software Technology Co., Ltd.
 
 */

#import "BoCPressNetworkConnection.h"

#import "BoCPressNetworkConstant.h"

#import "BoCPressSoapXMLParser.h"

#import "BoCPressConstant.h"

@implementation BoCPressNetworkConnection

@synthesize soapXMLParser = _soapXMLParser;

- (id)initWithURL:(NSURL *)anURL 
    requestString:(NSString *)requestString 
     callbackInfo:(id) callbackInfo
{
    if ((self = [super init]))
    {
        _receivedData = [[NSMutableData alloc] init];
        _callbackInfo = [callbackInfo retain];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: anURL 
                                                               cachePolicy: NSURLRequestUseProtocolCachePolicy 
                                                           timeoutInterval: kNetwork_TimeOutTimeInterval]; 
        
        // This is necessary for soap on iOS
        //
        [request addValue: @"text/xml; charset=utf-8" 
       forHTTPHeaderField: @"Content-Type"];
        
        // Set the action to Post
        //
        [request setHTTPMethod: @"POST"];
        
        // Set the body
        //
        [request setHTTPBody: [requestString dataUsingEncoding: NSUTF8StringEncoding]];
        
        _connection = [[NSURLConnection alloc] initWithRequest: request 
                                                      delegate: self];
        
    }
    
    return self;
}

- (void) dealloc
{
    [_receivedData release];
    [_connection release];
    [_callbackInfo release];
    
    [super dealloc];
}

- (void)start
{
    [_connection start];
    
    _timerForTimeOutControl = [NSTimer scheduledTimerWithTimeInterval: kNetwork_TimeOutTimeInterval 
                                                               target: self
                                                             selector: @selector(cancelConnection:) 
                                                             userInfo: nil
                                                              repeats: NO];
    
}

- (void)cancel
{
    [_connection cancel];
    [_timerForTimeOutControl invalidate];
}

- (void)cancelConnection: (NSTimer *)timer
{
    [timer invalidate];
    
    if (_timerForTimeOutControl == timer)
    {        
        [_connection cancel];
        
        [self handleTimeOutEventWithError: nil];
    }
}


#pragma mark - Methods of NSURLConnetion's Delegate


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    //
    
    [_receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    //
    [_receivedData appendData:data];
    
    //NSLog(@"receive data");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{    
    NSLog(@"Network Error:%@", error);
    [self handleTimeOutEventWithError: error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //finished data receive
    //
    [_timerForTimeOutControl invalidate];
    
    [_soapXMLParser parseData: _receivedData
             withCallBackInfo: _callbackInfo];
}

- (void)handleTimeOutEventWithError: (NSError *)error
{
    
    [self cancel];
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject: _callbackInfo
                 forKey: kNetwork_CallbackObject];
    if (error)
    {
        [userInfo setObject: error
                     forKey: kNetwork_ConnectionError];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kBoCPress_Global_NotificationForNetworkTimeOut 
                                                        object: self 
                                                      userInfo: userInfo];    
    [userInfo release];
}

@end

