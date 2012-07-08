//
//  BocPressNetworkManager.h
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

#import "NSIdentifiedObject.h"

@protocol BoCPressNetworkSession;
@protocol BoCPressSoapXMLParserDelegate;

@protocol BoCPressNetworkService <NSIdentifiedObject>

@required

- (void)postToURL: (NSURL *)anURL 
       andRequest: (NSString *)requestString 
 withCallbackInfo: (id) callbackInfo
   parserDelegate: (id<BoCPressSoapXMLParserDelegate>)delegate;

- (void)postNetworkSession: (id<BoCPressNetworkSession>)session
            parserDelegate: (id<BoCPressSoapXMLParserDelegate>)delegate;

- (void)postRequestString: (NSString *)requestString 
          andCallbackInfo: (id)callbackInfo
           parserDelegate: (id<BoCPressSoapXMLParserDelegate>)delegate;

@end

@interface BoCPressNetworkService : NSObject<BoCPressNetworkService> 

@end

extern NSString * const BoCPressNetworkServiceID;