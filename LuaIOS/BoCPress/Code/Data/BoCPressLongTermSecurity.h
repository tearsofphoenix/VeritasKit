//
//  BoCPressLongTermSecurity.h
//  BoCPress
//
//  Created by LeixSnake on 8/2/11.
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

#import "NSIdentifiedObject.h"

#import "NSNamedObject.h"

@interface BoCPressLongTermSecurity : NSObject<NSIdentifiedObject, NSNamedObject>
{
    
@private
    NSSet *_families;
    
    NSString *_name;
    NSString *_oneWeekValue;
    NSString *_oneMonthValue;
    NSString *_threeMonthValue;
    NSString *_sixMonthValue;
    NSString *_nineMonthValue;
    NSString *_twelveMonthValue;
    
    id _identity;
    
}

//- (id)initWithIdentity: (id)identity
//                  name: (NSString *)name
//             lastClose: (double)lastClose
//           latestValue: (double)latestValue
//              inFamily: (id<BoCPressSecurityFamily>)family;

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
               oneWeek: (NSString *)oneWeekValue
              oneMonth: (NSString *)oneMonthValue
            threeMonth: (NSString *)threeMonthValue
              sixMonth: (NSString *)sixMonthValue
             nineMonth: (NSString *)nineMonthValue
           twelveMonth: (NSString *)twelveMonthValue;


- (NSString *)oneWeekValue;

- (NSString *)oneMonthValue;

- (NSString *)threrMonthValue;

- (NSString *)sixMonthValue;

- (NSString *)nineMonthValue;

- (NSString *)twelveMonthValue;
@end
