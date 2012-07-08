//
//  BoCPressCacheService.h
//  BoCPress
//
//  Created by E-Reach Administrator on 9/23/11.
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

@protocol BoCPressCacheService<NSIdentifiedObject>

@required

- (void)storeObject: (id)object 
           withInfo: (id)info;

- (id)cachedObjectWithCallbackInfo: (id)callbackInfo;

@end;


@interface BoCPressCacheService : NSObject<BoCPressCacheService>

@property (nonatomic) NSTimeInterval invalidTimeInterval;

@end

extern NSString * const BoCPressCacheServiceID;