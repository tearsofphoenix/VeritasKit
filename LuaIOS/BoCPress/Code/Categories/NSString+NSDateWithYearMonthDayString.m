//
//  NSString+NSDateWithYearMonthDayString.m
//  BoCPress
//
//  Created by LeixSnake on 10/28/11.
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

#import "NSString+NSDateWithYearMonthDayString.h"

#import "NSDate+getStringOfYearMonthDay.h"

#import "BoCPressConstant.h"

@implementation NSString (NSDateWithYearMonthDayString)

- (NSString *)stringOfYearMonthDayWithFormatterString:(NSString *)formatterString
{
    NSString *tmpFormatterString = formatterString;
    if (!tmpFormatterString)
    {
        tmpFormatterString = kNetwork_DateFormatterString ;        
    }
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:tmpFormatterString];
     
    return [[formatter dateFromString:self] getStringOfYearMonthDay];
}
@end
