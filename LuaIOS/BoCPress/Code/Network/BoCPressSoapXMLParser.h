//
//  BoCPressSoapXMLParser.h
//  BoCPress
//
//  Created by LeixSnake on 6/8/11.
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

@protocol BoCPressSoapXMLParserDelegate;

@interface BoCPressSoapXMLParser : NSObject
{
    NSMutableDictionary *_results;
    NSString*  _tag;
    NSMutableDictionary *_supportedSoapMethods;
    
    struct 
    {
        unsigned int delegateRespondsFinishedParseWithResult: 1;        
    }_delegateFlag;
}

@property (nonatomic, assign) id<BoCPressSoapXMLParserDelegate> delegate;

#pragma mark - manage all parse

- (void)parseData: (id)data 
 withCallBackInfo: (id)callbackInfo;

@end

@protocol BoCPressSoapXMLParserDelegate <NSObject>

@optional

- (void)soapXMLParser: (BoCPressSoapXMLParser*)parser finishedParseWithResult: (id)result;
                    
@end
