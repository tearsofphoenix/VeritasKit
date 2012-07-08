//
//  BoCPressProtocolViewPrivateHandler.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/17/11.
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

#import "BoCPressProtocolViewPrivateHandler.h"

#import "BoCPressProtocolView.h"

@implementation BoCPressProtocolViewPrivateHandler

- (id)initWithProtocolView:(BoCPressProtocolView *)view
{
    if ((self = [super init])) 
    {
        _view = view;
    }
    return self;
}

- (void)handleAgreeButtonPressedEvent: (id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:_view 
                                   selector:@selector(handleAgreeButtonPressedEvent)
                                   userInfo:nil 
                                    repeats:NO];
}
- (void)handleCancelButtonPressedEvent: (id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:0.1 
                                     target:_view 
                                   selector:@selector(handleCancelButtonPressedEvent) 
                                   userInfo:nil 
                                    repeats:NO];
}
@end
