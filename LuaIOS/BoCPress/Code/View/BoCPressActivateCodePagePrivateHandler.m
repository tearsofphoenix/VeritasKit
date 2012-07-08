//
//  BoCPressActivateCodePagePrivateHandler.m
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

#import "BoCPressActivateCodePagePrivateHandler.h"

#import "BoCPressConstant.h"

#import "BoCPressActivateCodePage.h"

@implementation BoCPressActivateCodePagePrivateHandler

- (id)initWithPage:(BoCPressActivateCodePage *)page
{
    if ((self = [super init]))
    {
        _page = page;
    }
    
    return self;
}

- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        if ([kCallbackAction_activateCode isEqualToString:action]) 
        {
            [_page showActivateCodeResult: data];
        }else if([kCallbackAction_getPromptMsg isEqualToString:action])
        {
            [_page updatePromptMessageWithData:data];
        }
    }
}

- (void)handleSubmitButtonPressedEvent:(id)sender
{
    [_page wantToActivateCode];
}
@end
