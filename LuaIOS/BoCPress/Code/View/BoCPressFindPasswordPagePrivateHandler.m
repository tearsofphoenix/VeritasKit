//
//  BoCPressFindPasswordPagePrivateHandler.m
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

#import "BoCPressFindPasswordPagePrivateHandler.h"

#import "BoCPressFindPasswordPage.h"

#import "BoCPressConstant.h"


@implementation BoCPressFindPasswordPagePrivateHandler

- (id)initWithPage:(BoCPressFindPasswordPage *)page
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
        if([kCallbackAction_findUserPassword isEqualToString:action])
        {
            [_page showFindPasswordResultWithData:data];
        }
    }
}

#pragma mark - handle event
- (void)handleSubmitButtonPressedEvent: (id)sender
{
    [_page wantToFindPassword];
}

@end
