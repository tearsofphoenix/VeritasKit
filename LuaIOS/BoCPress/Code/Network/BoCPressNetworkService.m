//
//  BocPressNetworkManager.m
//  BoCPress
//
//  Created by LeixSnake on 6/7/11.
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


#import "BoCPressNetworkService.h"

#import "BoCPressSoapXMLParser.h"

#import "BoCPressConstant.h"

#import "NSTaggedObject.h"

#import "NSIdentifiedObject.h"

#import "BoCPressNetworkConnection.h"

#import "BoCPressDownloadConnection.h"

#import "BoCPressNetworkSession.h"

#import "BoCPressNetworkConstant.h"

static NSURL * __kURL_Network_SoapTargetURL = nil;

@implementation BoCPressNetworkService

- (id)init
{
    self = [super init];
    if (self) 
    {        
        if (!__kURL_Network_SoapTargetURL)
        {
            __kURL_Network_SoapTargetURL = [[NSURL URLWithString: kNetwork_SoapURLString] retain];
            
        }

        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(postRequest:) 
                                                     name:kNetworkManager_postRequestNotification 
                                                   object:nil];
        
    }
    
    return self;
}

- (void)dealloc
{    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [__kURL_Network_SoapTargetURL release];
    
    [super dealloc];
}

- (void)postToURL: (NSURL *)anURL 
       andRequest: (NSString *)requestString 
 withCallbackInfo: (id) callbackInfo
   parserDelegate: (id<BoCPressSoapXMLParserDelegate>)delegate
{
    
    if (requestString)
    {
        BoCPressSoapXMLParser *parser = [[BoCPressSoapXMLParser alloc] init];
        [parser setDelegate: delegate];
                
        BoCPressNetworkConnection *newConnection = [[BoCPressNetworkConnection alloc] initWithURL: anURL 
                                                                                    requestString: requestString 
                                                                                     callbackInfo: callbackInfo];
        [newConnection setSoapXMLParser: parser];
        [parser release];
        
        [newConnection start];
        [newConnection release];
        
    }else
    {
        BoCPressDownloadConnection *downloadConnection = [[BoCPressDownloadConnection alloc] initWithURL: anURL 
                                                                                            callbackInfo: callbackInfo] ;
        
        [downloadConnection release];
    }
}


- (void)postRequest: (NSNotification *) notification
{
    NSDictionary *info = [notification userInfo];
    
    NSURL *url = [NSURL URLWithString:[info objectForKey:kNetworkManager_TargetURL]];
    
    NSString *rs = [info objectForKey:kNetworkManager_RequestString];
    
    NSDictionary *callbackInfo = [info objectForKey:kNetwork_CallbackObject];
    id<BoCPressSoapXMLParserDelegate> delegate = [info objectForKey: kNetwork_SoapXMLParserDelegate];
    [self postToURL: url
         andRequest: rs
   withCallbackInfo: callbackInfo
     parserDelegate: delegate];
    
    
}

- (void)postRequestString: (NSString *)requestString 
          andCallbackInfo: (id)callbackInfo
           parserDelegate: (id<BoCPressSoapXMLParserDelegate>)delegate
{
    [self postToURL: __kURL_Network_SoapTargetURL
         andRequest: requestString
   withCallbackInfo: callbackInfo
     parserDelegate: delegate];
}

- (void)postNetworkSession: (id<BoCPressNetworkSession>)session
            parserDelegate: (id<BoCPressSoapXMLParserDelegate>)delegate
{
    [self postRequestString: [session requestContent]
            andCallbackInfo: [session callbackInfo]
             parserDelegate: delegate];
}

- (id)identity
{
    return BoCPressNetworkServiceID;
}
@end

NSString * const BoCPressNetworkServiceID = @"com.bocpress.coreservice.network";
