//
//  BoCPressAccountLoginPage.h
//  BoCPress
//
//  Created by LeixSnake on 9/19/11.
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

//@protocol BoCPressPage;
@protocol BoCPressAccountDataSource;

@class BoCPressAccountLoginPrivateHandler;


@interface BoCPressAccountLoginPage : BoCPressMetaPage< UITextFieldDelegate, UIAlertViewDelegate>
{
    id<BoCPressAccountDataSource> _accountLoginDataSource;
        
    UIView *_backgroundView;
    UIView *_backgroundViewOfUserInfo;
    UILabel *_userNameLabel;
    UILabel *_vipServiceDeadLineLabel;
    
    UITextField *_userNameTextField;
    UITextField *_passwordTextField;
        
    id _userInfo;
    UIAlertView * _alertForWantToLogout;
    BOOL _reponseStatus;
    UIAlertView *_alertForLogoutResult;
        
    UITableView *_buttonGroup;
    
#pragma mark - Email hide
    BOOL _isEnableEmailAsAccountName;
    
    NSString * _userPasswordMD5String;
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
            dataSource: (id<BoCPressAccountDataSource>) dataSource;

- (void)wantToLogin;

- (void)showLoginResult: (id)data;

- (void)wantToLogout;

- (void)showLogoutResult:(id)data;

- (void)updateUserInfoWithData: (id)data;
@end
