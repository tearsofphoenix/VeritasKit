//
//  BoCPressChangeUserPasswordPagePrivateHandler.m
//  BoCPress
//
//  Created by LeixSnake on 10/17/11.
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

#import "BoCPressChangeUserPasswordPagePrivateHandler.h"

#import "BoCPressChangeUserPasswordPage.h"

#import "BoCPressConstant.h"

@implementation BoCPressChangeUserPasswordPagePrivateHandler

- (id)initWithPage:(BoCPressChangeUserPasswordPage *)page
{
    if ((self = [super init]))
    {
        _page = page;
    }
    
    return self;
}

#pragma mark - call back protocol

- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        if ([kCallbackAction_changeUserPassword isEqualToString:action])
        {
            [_page showChangePasswordResultWithData:data];
        }
        
    }
}

- (void)handleSubmitButtonPressedEvent: (id)sender
{
    [_page wantToChangePassword];
}

@end
