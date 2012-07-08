//
//  BoCPressNetworkConnection.h
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

#import <Foundation/Foundation.h>

@class BoCPressSoapXMLParser;

@interface BoCPressNetworkConnection : NSObject<NSURLConnectionDelegate>
{                
    NSMutableData * _receivedData;

    NSTimer* _timerForTimeOutControl;
    
    NSURLConnection *_connection;
    id _callbackInfo;
}

@property (nonatomic, retain) BoCPressSoapXMLParser *soapXMLParser;

- (id)initWithURL: (NSURL *)anURL 
    requestString: (NSString *)requestString 
     callbackInfo: (id)callbackInfo;

- (void)start;

- (void)cancel;

@end
