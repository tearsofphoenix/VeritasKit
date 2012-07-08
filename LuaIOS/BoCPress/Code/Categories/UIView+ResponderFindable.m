//
//  UIView+ResponderFindable.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/10/11.
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

#import "UIView+ResponderFindable.h"

@implementation UIView(ResignableResponder)

- (UIView *)firstResponder
{
    
    if (self.isFirstResponder) 
    {        
        return self;     
    }
    
    UIView *subView;
    
    for (subView in self.subviews) 
    {
        
        UIView *firstResponder = [subView firstResponder];
        
        if (firstResponder != nil) 
        {
            return firstResponder;
        }
        
    }
    
    return nil;
}

//- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event
//{
//    
//    [super touchesEnded: touches withEvent: event];
//    
//    UIView * firstResponder = [self firstResponder];
//    if ([firstResponder isKindOfClass: [UITextView class]])
//    {
//        [firstResponder resignFirstResponder];
//    }
//    
//    NSLog(@"in touch event");
//}

@end