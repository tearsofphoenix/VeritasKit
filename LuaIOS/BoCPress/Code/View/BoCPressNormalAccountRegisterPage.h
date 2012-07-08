//
//  BoCPressNormalAccountRegisterPage.h
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

#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

@protocol BoCPressNormalAccountRegisterDataSource;

@class BoCPressNormalAccountRegisterPagePrivateHandler;

@interface BoCPressNormalAccountRegisterPage : BoCPressMetaPage<UITextFieldDelegate, UIAlertViewDelegate>
{
#pragma mark - logic
    id<BoCPressNormalAccountRegisterDataSource> _normalAccountRegisterDataSource;
    
#pragma mark - UI
    UIView *_backgroundView;
    UIButton *_submitButton;
    
    UITextField *_emailInputField;
    UITextField *_firstPasswordField;
    UITextField *_verificatePasswordField;
        
    BOOL _isEnableEmailAsAccountName;
    
    NSString *_protocolContent;
}

- (id)initWithLastPage: (id<BoCPressPage>) lastPage
            dataSource: (id<BoCPressNormalAccountRegisterDataSource>)dataSource;

- (void)wantToRegisterNewAccount;        

- (void)showRegisterResultWithData: (id)data;

- (void)reigsterNewAccount;

- (void)updateProtocolContentWithData: (id)data;

@end
