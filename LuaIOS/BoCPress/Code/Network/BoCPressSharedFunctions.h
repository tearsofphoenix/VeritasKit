//
//  BoCPressSharedFunctions.h
//  BoCPress
//
//  Created by E-Reach Administrator on 11/30/11.
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

extern NSString *formatXMLValueAndKey(NSString *value, NSString *key );

extern NSString *formatXMLIntegerValueAndKey(NSInteger value, NSString *key);

extern NSString *formatXMLFloatValueAndKey(CGFloat value, NSString *key);

extern NSValue *storeCFunctionInNSValue(void *pFunction);


extern void appendResolvedStringsToString(NSString *contentString, NSUInteger startIndex);

@protocol BoCPressCacheService;

typedef void (* BoCPressSoapDataSourceCalbackFunctionPointer)(NSDictionary *callbackInfo, 
                                                              NSDictionary *returnedData, 
                                                              id<BoCPressCacheService> _cacheService);
