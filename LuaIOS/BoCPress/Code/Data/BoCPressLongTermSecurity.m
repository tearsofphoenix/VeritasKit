//
//  BoCPressLongTermSecurity.m
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

#import "BoCPressLongTermSecurity.h"

@implementation BoCPressLongTermSecurity

- (id)initWithIdentity: (id)identity
                  name: (NSString *)name
               oneWeek: (NSString *)oneWeekValue
              oneMonth: (NSString *)oneMonthValue
            threeMonth: (NSString *)threeMonthValue
              sixMonth: (NSString *)sixMonthValue
             nineMonth: (NSString *)nineMonthValue
           twelveMonth: (NSString *)twelveMonthValue
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
        _identity = [identity retain];
        _name = [name retain];
        _oneWeekValue = [oneWeekValue retain];
        _oneMonthValue = [oneMonthValue retain];
        _threeMonthValue = [threeMonthValue retain];
        _sixMonthValue = [sixMonthValue retain];
        _nineMonthValue = [nineMonthValue retain];
        _twelveMonthValue = [twelveMonthValue retain];
        _families = [[NSSet alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [_identity release];
    [_name release];
    
    [_oneWeekValue release];
    [_oneMonthValue release];
    [_threeMonthValue release];
    [_sixMonthValue release];
    [_nineMonthValue release];
    [_twelveMonthValue release];
    
    [super dealloc];
}

- (id)identity
{
    return _identity;
}

- (id)name
{
    return _name;
}

- (NSString *)oneWeekValue
{
    return _oneWeekValue;
}

- (NSString *)oneMonthValue
{
    return _oneMonthValue;
}

- (NSString *)threrMonthValue
{
    return _threeMonthValue;
}

- (NSString *)sixMonthValue
{
    return _sixMonthValue;
}

- (NSString *)nineMonthValue
{
    return _nineMonthValue;
}

- (NSString *)twelveMonthValue
{
    return _twelveMonthValue;
}

- (BOOL)isEqual:(id)object
{
    if ([object conformsToProtocol: @protocol(NSIdentifiedObject)])
    {
        return [[self identity] isEqual: [(id<NSIdentifiedObject>)object identity]];
    }
    else
    {
        return NO;
    }
}
@end
