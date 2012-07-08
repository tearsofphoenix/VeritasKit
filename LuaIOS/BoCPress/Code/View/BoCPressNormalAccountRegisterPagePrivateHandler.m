//
//  ;
//  BoCPress
//
//  Created by LeixSnake on 9/20/11.
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

#import "BoCPressNormalAccountRegisterPagePrivateHandler.h"

#import "BoCPressNormalAccountRegisterPage.h"

#import "BoCPressConstant.h"

@implementation BoCPressNormalAccountRegisterPagePrivateHandler

- (id)initWithPage:(BoCPressNormalAccountRegisterPage *)page
{
    if ((self = [super init]))
    {
        _page = page;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(stepToRegisterNormalAccount:) 
                                                     name:kNormalAccountRegister_stepToRegisterNormalAccount
                                                   object:nil];
    }
    
    return self;
}
- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}
#pragma mark - call back protocol
- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        if([action isEqual:kCallbackAction_registerNormalAccount])
        {
            [_page showRegisterResultWithData:data];
            
        }else if([kCallbackAction_getPromptMsg isEqualToString:action])
        {
            [_page updateProtocolContentWithData:data];
        }
    }
}
#pragma mark - handle event

- (void)handleSubmitButtonPressedEvent: (id)sender
{
    [_page wantToRegisterNewAccount];
    
}

- (void)stepToRegisterNormalAccount: (NSNotification *)notification
{
    [_page reigsterNewAccount];
}
@end
