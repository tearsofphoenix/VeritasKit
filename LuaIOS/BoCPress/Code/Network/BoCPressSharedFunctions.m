//
//  BoCPressSharedFunctions.m
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

#import "BoCPressSharedFunctions.h"

NSString *formatXMLValueAndKey(NSString *value, NSString *key )
{
    if (value)
    {
        return [NSString stringWithFormat:@"<%@>%@</%@>", key, value, key];
    }else
    {
        return [NSString stringWithFormat:@"<%@></%@>", key, key];
    }
}

NSString *formatXMLIntegerValueAndKey(NSInteger value, NSString *key)
{
    return [NSString stringWithFormat:@"<%@>%d</%@>", key, value, key];
}

NSString *formatXMLFloatValueAndKey(CGFloat value, NSString *key)
{
    return [NSString stringWithFormat:@"<%@>%f</%@>", key, value, key];
}

NSValue *storeCFunctionInNSValue(void *pFunction)
{
    return [NSValue valueWithPointer: pFunction];
}


void appendResolvedStringsToString(NSString *contentString, NSUInteger startIndex)
{
    NSString *reservedString = @" ";
    
    static const NSUInteger kMaxResolverIndex = 6;
    
    NSUInteger iLooper = startIndex;
    while (iLooper < kMaxResolverIndex)
    {
        contentString = [contentString stringByAppendingString:formatXMLValueAndKey(reservedString, [NSString stringWithFormat:@"rsvd%ld", iLooper])];        
        ++iLooper;
    }
}