//
//  NSDate+getStringOfYearMonthDay.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/13/11.
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

#import "NSDate+getStringOfYearMonthDay.h"

@implementation NSDate (NSDate_getStringOfYearMonthDay)

- (NSString *)getStringOfYearMonthDay
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:
                                    NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self];

    return  [[[NSString alloc] initWithFormat:@"%i-%i-%i", [components year], [components month], [components day]] autorelease] ;

//    return [NSString stringWithFormat:@"%i-%i-%i", [components year], [components month], [components day]];
}

- (BOOL)isSameDayWithDate:(NSDate *)aDate
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate: self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate: aDate];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}
@end
