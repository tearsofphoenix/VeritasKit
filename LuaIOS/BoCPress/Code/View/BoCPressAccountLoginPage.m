//
//  BoCPressAccountLoginPage.m
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

#import "BoCPressAccountLoginPage.h"

//#import "BoCPressPage.h"

#import "BoCPressAccountDataSource.h"

#import "BoCPressAccountLoginPrivateHandler.h"

#import "BoCPressConstant.h"

#import "NSString+MD5.h"

#import "BoCPressRightArrowedButton.h"

#import "NSDate+getStringOfYearMonthDay.h"

#import "NSString+NSDateWithYearMonthDayString.h"

#import "UIView+LoadingIndicatorView.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressAccountLoginPage

static void BoCPressAccountLoginPage_updateCurrentContent(id *_userInfo,
                                                          UIView *_backgroundView,
                                                          UIView *_backgroundViewOfUserInfo,
                                                          id<BoCPressAccountDataSource> _accountLoginDataSource,
                                                          UILabel *_userNameLabel,
                                                          UILabel *_vipServiceDeadLineLabel,
                                                          id<BoCPressCallback> _handler
                                                          )
{
    [*_userInfo release];
    *_userInfo = [[_accountLoginDataSource userPrivateInfo] retain];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNavigationBarView_updatePageTitle 
                                                        object:_handler 
                                                      userInfo:nil];
    
    
    if ([*_userInfo count] > 0)
    {
        [UIView animateWithDuration: 0.5
                         animations: (^{
            
                                        [_backgroundView setAlpha:0];
                                        [_backgroundViewOfUserInfo setAlpha:1];

                                    })
         ];
        
        
        [_accountLoginDataSource getUserInfoFromServerWithInfo: nil 
                                                      callback: _handler];        
    }else
    {
        [UIView animateWithDuration: 0.5
                         animations: (^{
                    
                                        [_backgroundView setAlpha:1];
                                        [_backgroundViewOfUserInfo setAlpha:0];
                                        [_userNameLabel setText:nil];
                                        [_vipServiceDeadLineLabel setText:nil];
                                    })
         ];
        
    }
    
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
            dataSource: (id<BoCPressAccountDataSource>) dataSource
{
    if ((self = [super init]))
    {
        [self setLastPage: lastPage];
        _accountLoginDataSource = [dataSource retain];
        _handler = [[BoCPressAccountLoginPrivateHandler alloc] initWithPage:self];
        _userInfo = [[_accountLoginDataSource userPrivateInfo] retain];        
        _isEnableEmailAsAccountName = [_accountLoginDataSource isEnableEmailAsAccountName];
        
        _backgroundView = [[UIView alloc] init];
        [_backgroundView setFrame:CGRectMake(0, 0, 320, 365)];
        [_backgroundView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressAccountLoginInBackground"]]];
        
        UIImageView *shadowView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]];        
        [_backgroundView addSubview:shadowView];        
        [shadowView release];
        
        [self addSubview:_backgroundView];
        
        
        UILabel *userNameLabel = [[UILabel alloc] init];
        [userNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:19]];
        [userNameLabel setText:@"用户名："];   
        CGSize size = [[userNameLabel text] sizeWithFont:[userNameLabel font]];
        [userNameLabel setBackgroundColor:[UIColor clearColor]];
        [userNameLabel setFrame:CGRectMake(10, 24, size.width, size.height)];
        [_backgroundView addSubview:userNameLabel];
        [userNameLabel release];
        
        CGRect frame = [userNameLabel frame];
        
        UILabel *passwordLabel = [[UILabel alloc] init];
        [passwordLabel setFont:[UIFont fontWithName:@"Helvetica" size:19]];
        [passwordLabel setText:@"密码："];     
        size = [[passwordLabel text] sizeWithFont:[passwordLabel font]];
        [passwordLabel setBackgroundColor:[UIColor clearColor]];
        [passwordLabel setFrame:CGRectMake(26, frame.origin.y + frame.size.height + 20, size.width, size.height)];
        [_backgroundView addSubview:passwordLabel];
        [passwordLabel release];
        
        
        _userNameTextField = [[UITextField alloc] init];
        [_userNameTextField setFrame:CGRectMake(frame.origin.x + frame.size.width + 5, frame.origin.y + 2, 225, 46)];
        [[_userNameTextField layer] setCornerRadius:5.0];
        [_userNameTextField setKeyboardType:UIKeyboardTypeASCIICapable];
        
        if (_isEnableEmailAsAccountName)
        {
            [_userNameTextField setPlaceholder:@"请输入邮箱地址"];
        }else
        {
            [_userNameTextField setPlaceholder:@"请使用字母，数字和下划线"];
        }
        [_userNameTextField setAutocapitalizationType: UITextAutocapitalizationTypeNone];
        [_userNameTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
        [_userNameTextField setBackgroundColor:[UIColor clearColor]];
        [_userNameTextField setFont:[UIFont fontWithName:@"Helvatica" size:19]];
        [_userNameTextField setDelegate:self];
        [_backgroundView addSubview:_userNameTextField];
        
        frame = [_userNameTextField frame];
        
        _passwordTextField = [[UITextField alloc] init];
        [_passwordTextField setFrame:CGRectMake(frame.origin. x, frame.origin.y + frame.size.height - 4, frame.size.width, frame.size.height)];
        [_passwordTextField setSecureTextEntry:YES];
        [[_passwordTextField layer] setCornerRadius:5.0];
        [_passwordTextField setPlaceholder:@"8－16位数字和字母组合"];
        [_passwordTextField setKeyboardType:UIKeyboardTypeNamePhonePad];
        [_passwordTextField setBackgroundColor:[UIColor clearColor]];
        [_passwordTextField setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [_passwordTextField setDelegate:self];
        [_backgroundView addSubview:_passwordTextField];
        
        frame = [_passwordTextField frame];
        
        UIButton *loginButton = [[UIButton alloc] init];
        [loginButton setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 15, 147, 48)];
        [loginButton addTarget:_handler action:@selector(handlLoginButtonPressedEvent:) forControlEvents:UIControlEventTouchDown];
        [loginButton setBackgroundImage:[UIImage imageNamed:@"BoCPressNormalButtonBackground"] forState:UIControlStateNormal];
        [loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_backgroundView addSubview:loginButton];
        [loginButton release];
        
        frame = [loginButton frame];
        
        UIButton *registerButton = [[UIButton alloc] init];
        [registerButton setFrame:CGRectMake(frame.origin.x + 11, frame.origin.y + frame.size.height + 30, 125, 21)];
        //        [registerButton setTitle:@"注册" forState: UIControlStateNormal];
        [registerButton setBackgroundColor:[UIColor clearColor]];
        [registerButton setBackgroundImage:[UIImage imageNamed:@"BoCPressAccountRegisterButton"] forState: UIControlStateNormal];
        [registerButton addTarget: _handler action:@selector(handleRegisterButtonPressedEvent:) forControlEvents: UIControlEventTouchDown];
        
        [_backgroundView addSubview:registerButton];
        [registerButton release];
        
        frame = [registerButton frame];
        UIButton *findPasswordButton = [[UIButton alloc] init];
        [findPasswordButton setFrame:CGRectMake(frame.origin.x + 4, frame.origin.y + frame.size.height + 18, 121, 21)];
        [findPasswordButton setBackgroundColor:[UIColor clearColor]];
        //        [findPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [findPasswordButton setBackgroundImage:[UIImage imageNamed:@"BoCPressFindPasswordButtonBackground"] forState: UIControlStateNormal];
        [findPasswordButton addTarget:_handler action:@selector(handleFindPasswordButtonPressedEvent:) forControlEvents:UIControlEventTouchDown];
        
        [_backgroundView addSubview:findPasswordButton];
        
        if (!_isEnableEmailAsAccountName)
        {
            [findPasswordButton setAlpha:0];
        }
        
        [findPasswordButton release];
        
        
        UITapGestureRecognizer *tapForHideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
        [_backgroundView addGestureRecognizer:tapForHideKeyboard];
        [tapForHideKeyboard release];
        
        
#pragma mark - userInfo
        _backgroundViewOfUserInfo = [[UIView alloc] init];
        [_backgroundViewOfUserInfo setFrame:CGRectMake(0, 0, 320, 365)];
        [_backgroundViewOfUserInfo setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressUserInfoBackground"]]];     
        
        UIImageView *infoShadowView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]];        
        [_backgroundViewOfUserInfo addSubview:infoShadowView];        
        [infoShadowView release];
        
        UILabel *accountNameLabel = [[UILabel alloc] init];
        [accountNameLabel setText:@"账户："];
        [accountNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:18]];
        size = [[accountNameLabel text] sizeWithFont:[accountNameLabel font]];
        [accountNameLabel setFrame:CGRectMake(16, 17, size.width, size.height)];
        [accountNameLabel setBackgroundColor:[UIColor clearColor]];
        [_backgroundViewOfUserInfo addSubview:accountNameLabel];
        [accountNameLabel release];
        
        frame = [accountNameLabel frame];
        
        NSString *userEmail = [_userInfo objectForKey:@"email"];
        
        _userNameLabel = [[UILabel alloc] init];
        [_userNameLabel setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 5, 300, 40)];
        [_userNameLabel setTextAlignment:UITextAlignmentLeft];
        [_userNameLabel setText:userEmail];
        [_userNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:18]];
        [_userNameLabel setBackgroundColor:[UIColor clearColor]];
        [[_userNameLabel layer] setCornerRadius:5];
        
        [_backgroundViewOfUserInfo addSubview:_userNameLabel];
        
        
        
        UILabel *infoNameLabel = [[UILabel alloc] init];
        [infoNameLabel setText:@"VIP服务有效期至："];
        [infoNameLabel setFont:[UIFont fontWithName:@"Helvetica" size:18]];
        size = [[infoNameLabel text] sizeWithFont:[infoNameLabel font]];
        [infoNameLabel setFrame:CGRectMake(16, 98, size.width, size.height)];
        [infoNameLabel setBackgroundColor:[UIColor clearColor]];
        [_backgroundViewOfUserInfo addSubview:infoNameLabel];
        [infoNameLabel release];
        
        frame = [infoNameLabel frame];
        
        NSString *deadLine = [[_userInfo objectForKey:kUserInfo_PAY_END_DATE] stringOfYearMonthDayWithFormatterString:kNetwork_DateFormatterString];
        
        _vipServiceDeadLineLabel = [[UILabel alloc] init];
        [_vipServiceDeadLineLabel setNumberOfLines:1];
        [_vipServiceDeadLineLabel setFrame:CGRectMake(frame.origin.x,frame.origin.y + frame.size.height + 5, 300, 40)];
        [_vipServiceDeadLineLabel setTextAlignment:UITextAlignmentLeft];
        [_vipServiceDeadLineLabel setFont:[UIFont fontWithName:@"Helvetica" size:18]];
        [_vipServiceDeadLineLabel setText:deadLine];        
        [_vipServiceDeadLineLabel setBackgroundColor:[UIColor clearColor]];
        [[_vipServiceDeadLineLabel layer] setCornerRadius:5];
        
        [_backgroundViewOfUserInfo addSubview:_vipServiceDeadLineLabel];
                
#pragma mark - button group        
        _buttonGroup = [[UITableView alloc] init];
        [_buttonGroup setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [_buttonGroup setScrollEnabled: NO];
        [_buttonGroup setBackgroundColor: [UIColor clearColor]];
        [_buttonGroup setFrame: CGRectMake(10, 176, 320 - 10 * 2, 184)];
        [_backgroundViewOfUserInfo addSubview: _buttonGroup];
        [_buttonGroup setDelegate: (BoCPressAccountLoginPrivateHandler *)_handler];
        [_buttonGroup setDataSource: (BoCPressAccountLoginPrivateHandler *)_handler];
                
        [self addSubview:_backgroundViewOfUserInfo];
        
        if ([_userInfo count] > 0)
        {
            [_backgroundView setAlpha:0];
            [_backgroundViewOfUserInfo setAlpha:1];
        }else
        {
            [_backgroundView setAlpha:1];
            [_backgroundViewOfUserInfo setAlpha:0];
            
        }
        
    }
    
    return self;
}

- (void)dealloc
{
    
    [_backgroundView release];
    [_userNameTextField release];
    [_passwordTextField release];
    [_accountLoginDataSource release];
    [_handler release];
    [_userPasswordMD5String release];
    [_userNameLabel release];
    [_vipServiceDeadLineLabel release];
    
    [_backgroundViewOfUserInfo release];
    [_userInfo release];
    [_buttonGroup release];
    
    [super dealloc];
}

#pragma mark - BoCPressPage protocol

- (void)willBrowseBackward
{
    [self didUpdateData];
    
    [_handler cancelAllCallback];
    
    BOOL couldExecuteAttachedCallbackInfo = NO;
    if ([[_accountLoginDataSource userPrivateInfo] count] > 0)
    {
        couldExecuteAttachedCallbackInfo = YES;
    }
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              [NSNumber numberWithBool: couldExecuteAttachedCallbackInfo],
                              kBoCPress_AttachedCallbackInfo_couldExecute,
                              nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_couldBrowseBackward 
                                                        object: self 
                                                      userInfo: userInfo];
    
    [userInfo release];
}


- (NSString *)pageTitle
{
    [_userInfo release];
    _userInfo = [[_accountLoginDataSource userPrivateInfo] retain];
    if ([_userInfo count] > 0)
    {
        return @"账户管理";
    }else
    {
        return @"用户登录";
    }
}

- (BOOL)needNavigationBar
{
    return YES;
}


- (void)wantToUpdateDataWithInfo: (id)info
{
    BoCPressAccountLoginPage_updateCurrentContent(&_userInfo, 
                                                  _backgroundView, 
                                                  _backgroundViewOfUserInfo, 
                                                  _accountLoginDataSource,
                                                  _userNameLabel,
                                                  _vipServiceDeadLineLabel, 
                                                  _handler);
}
- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    BoCPressAccountLoginPage_updateCurrentContent(&_userInfo, 
                                                  _backgroundView, 
                                                  _backgroundViewOfUserInfo, 
                                                  _accountLoginDataSource,
                                                  _userNameLabel,
                                                  _vipServiceDeadLineLabel, 
                                                  _handler);
}

- (void)beforeRefetchConfiguration
{
    ;
}

- (void)didBeenSwitchToFromOtherTabCompletion: (void (^)(void))block
{
    BoCPressAccountLoginPage_updateCurrentContent(&_userInfo, 
                                                  _backgroundView, 
                                                  _backgroundViewOfUserInfo, 
                                                  _accountLoginDataSource,
                                                  _userNameLabel,
                                                  _vipServiceDeadLineLabel, 
                                                  _handler);
}

- (void)updateUserInfoWithData:(id)data
{
    BOOL responseStatus = [[data objectForKey:kBoCPress_Global_ResponseStatus] boolValue];
    if (responseStatus)
    {
        
        NSString *userEmail = [data objectForKey:@"email"];
        [_userNameLabel setText:userEmail];
        
        NSString *endTime = [data objectForKey:@"PAY_END_DATE"];
        NSString *deadLine = [endTime stringOfYearMonthDayWithFormatterString:kNetwork_DateFormatterString];
        [_vipServiceDeadLineLabel setText:deadLine];
        
        NSString *passwordFromServer = [data objectForKey:@"password"];
        
        NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] initWithDictionary:data];
        
        if (!passwordFromServer
            &&_userPasswordMD5String)
        {
            [userInfo setObject:_userPasswordMD5String forKey:@"password"];
        }
        
        [_accountLoginDataSource storeUserInfo:userInfo];
        
        [userInfo release];
    }else
    {
        UIAlertView *alertForFailToLogin = [[UIAlertView alloc] initWithTitle:@"错误" 
                                                                      message:nil 
                                                                     delegate:nil
                                                            cancelButtonTitle:@"确定"
                                                            otherButtonTitles: nil];
        [alertForFailToLogin setMessage:[data objectForKey:kBoCPress_Global_ServerErrorMessage_CN]];
        [alertForFailToLogin show];
        [alertForFailToLogin release];
    }
}



#pragma mark - login

- (void)wantToLogin
{
    BOOL formatIllegal = NO;
    NSString * errorMessage = @"请正确填写信息" ;
    
    if ([[_userNameTextField text] length] == 0
        ||[[_passwordTextField text] length] == 0)
    {
        formatIllegal = YES;
        
    }else if (_isEnableEmailAsAccountName)
        {  
            if([[_userNameTextField text] rangeOfString: @"^([a-zA-Z0-9_\\-\\.]+@[a-zA-Z0-9_\\-\\.]*[a-zA-Z0-9_\\-]\\.[a-zA-Z]+)?$" 
                                               options: NSRegularExpressionSearch].location == NSNotFound)
            {
                formatIllegal = YES;
                errorMessage = @"请输入有效的邮箱";
            
            }
        }else if([[_userNameTextField text] rangeOfString: @"^([a-zA-Z0-9_]+)?$" 
                                                   options: NSRegularExpressionSearch].location == NSNotFound)
        {
            formatIllegal = YES;
            
        }else if([[_passwordTextField text] rangeOfString:@"^[a-zA-Z0-9]{8,16}$" options: NSRegularExpressionSearch].location == NSNotFound)
        {
            formatIllegal = YES;
            errorMessage = @"非法的密码";
        }
    
    if(formatIllegal)
    {
        UIAlertView *alertForInput = [[UIAlertView alloc] initWithTitle:@"错误" 
                                                                message:errorMessage
                                                               delegate:self 
                                                      cancelButtonTitle:@"确定" 
                                                      otherButtonTitles: nil];
        [alertForInput show];
        [alertForInput release];
        
    }else
    {   
        [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];        
        _userPasswordMD5String = [[[NSString stringWithFormat:kBoCPress_Global_SecretSalt, [_passwordTextField text]] MD5] retain];
        
        [_accountLoginDataSource loginWithUserName: [_userNameTextField text] 
                                          password:  _userPasswordMD5String
                                          callback: _handler];
    }
    
}


- (void)showLoginResult: (id)data
{
    _reponseStatus = [[data objectForKey:kBoCPress_Global_ResponseStatus] boolValue];
    
    [self wantToFinishDataUpdate];
    
    if (_reponseStatus)
    {
        
        NSString *endTime = [data objectForKey:@"PAY_END_DATE"];
        
        NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] initWithDictionary:data];
        [userInfo setObject:_userPasswordMD5String forKey:@"password"];
        
        [_accountLoginDataSource storeUserInfo:userInfo];
        
        [userInfo release];
        
        [_userNameTextField setText:nil];
        [_passwordTextField setText:nil];
                
        NSString *userEmail = [data objectForKey:@"email"];
        [_userNameLabel setText:userEmail];
        
        NSString *deadLine = [endTime stringOfYearMonthDayWithFormatterString:kNetwork_DateFormatterString];
        [_vipServiceDeadLineLabel setText:deadLine];
        
        [UIView animateWithDuration: 0.5
                         animations: (^{
                                        [_backgroundView setAlpha:0];
                                        [_backgroundViewOfUserInfo setAlpha:1.0];
                                        
                                     })
         ];
                
        BoCPressAccountLoginPage_updateCurrentContent(&_userInfo, _backgroundView, _backgroundViewOfUserInfo, 
                                                      _accountLoginDataSource, _userNameLabel, _vipServiceDeadLineLabel, _handler);
    }else
    {
        UIAlertView *alertForLoginFail = [[UIAlertView alloc] initWithTitle:@"登录失败"
                                                                    message:nil
                                                                   delegate:nil
                                                          cancelButtonTitle:@"确定" 
                                                          otherButtonTitles: nil];
        
        NSString *messageContent = [data objectForKey:kBoCPress_Global_ServerErrorMessage_CN];
        [alertForLoginFail setMessage:messageContent];
        
        [alertForLoginFail show];
        [alertForLoginFail release];
        
    }
}


#pragma mark - delegate for text field
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger kMaxTextFieldLength = 128;
    
    if (textField == _userNameTextField) 
    {
        ;
    }else
    {
        kMaxTextFieldLength = kBoCPress_Global_MaxTextLengthOfPassword;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    if (newLength > kMaxTextFieldLength)
    {
        return NO;
    }else
    {
        return YES;
    }
    
}

#pragma mark - hide keyboard
- (void)hideKeyboard: (id)sender
{
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

#pragma mark - UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == _alertForWantToLogout && buttonIndex == 0)
    {        
                [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];
        [_accountLoginDataSource wantToLogoutCurrentUserWithCallback:_handler];
        
    }else if(alertView == _alertForLogoutResult && buttonIndex == 0)
    {
        BoCPressAccountLoginPage_updateCurrentContent(&_userInfo, 
                                                      _backgroundView, 
                                                      _backgroundViewOfUserInfo, 
                                                      _accountLoginDataSource,
                                                      _userNameLabel,
                                                      _vipServiceDeadLineLabel, 
                                                      _handler);
    }
}

#pragma mark - logout

- (void)wantToLogout
{
    _alertForWantToLogout = [[UIAlertView alloc] initWithTitle:@"提示" 
                                                       message:@"您确定要注销吗？" 
                                                      delegate:self 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:@"取消", nil];
    
    [_alertForWantToLogout show];
    [_alertForWantToLogout release];
}

- (void)showLogoutResult:(id)data
{
    [self wantToFinishDataUpdate];
    _reponseStatus = [[data objectForKey:kBoCPress_Global_ResponseStatus] boolValue];
    
    if (_reponseStatus)
    {
        [_accountLoginDataSource didLogoutCurrentUser];
        [[NSNotificationCenter defaultCenter] postNotificationName:kNavigationBarView_updatePageTitle 
                                                            object:self 
                                                          userInfo:nil];
        _alertForLogoutResult = [[UIAlertView alloc] initWithTitle:nil
                                                           message:nil 
                                                          delegate:self 
                                                 cancelButtonTitle:@"确定" 
                                                 otherButtonTitles: nil];
        
        [_alertForLogoutResult setTitle:@"注销成功"];
        [_alertForLogoutResult setMessage: nil];
        
        [_alertForLogoutResult show];
        [_alertForLogoutResult release];
        
    }else
    {
        UIAlertView *alertForLogoutFail = [[UIAlertView alloc] initWithTitle:@"注销失败" 
                                                                     message:nil
                                                                    delegate:nil 
                                                           cancelButtonTitle:@"确定" 
                                                           otherButtonTitles: nil];
        NSString *messageContent = [data objectForKey:kBoCPress_Global_ServerErrorMessage_CN];
        [alertForLogoutFail setMessage:messageContent];
        
        [alertForLogoutFail show];
        [alertForLogoutFail release];
    }
    
}


@end
