//
//  BoCPressNormalAccountRegisterPage.m
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

#import "BoCPressNormalAccountRegisterPage.h"

#import "BoCPressNormalAccountRegisterDataSource.h"

#import "BoCPressNormalAccountRegisterPagePrivateHandler.h"

#import "BoCPressConstant.h"

#import "UIView+LoadingIndicatorView.h"

#import "NSString+MD5.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressNormalAccountRegisterPage

static NSString * userPasswordMD5String = nil;

- (id)initWithLastPage:(id<BoCPressPage>)lastPage
            dataSource:(id<BoCPressNormalAccountRegisterDataSource>)dataSource
{
    if ((self = [super init]))
    {
        [self setLastPage: lastPage];
        
        _normalAccountRegisterDataSource = [dataSource retain];
        _handler = [[BoCPressNormalAccountRegisterPagePrivateHandler alloc] initWithPage:self];
        _isEnableEmailAsAccountName = [_normalAccountRegisterDataSource isEnableEmailAsAccountName];
        [self setPageTitle: @"用户注册"];
        
        _backgroundView = [[UIView alloc] init];
        [_backgroundView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressRegisterPageBackground"]]];
        [_backgroundView setFrame:CGRectMake(0, 0, 320, 365)];
        
        UIImageView *shadowView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]];        
        [_backgroundView addSubview:shadowView];        
        [shadowView release];
        
        [self addSubview:_backgroundView];
        
        UILabel *emailLabel = [[UILabel alloc] init];
        [emailLabel setFont:[UIFont fontWithName:@"Helvetica" size:19]];
        [emailLabel setText:@"用户名："];
        CGSize size = [[emailLabel text] sizeWithFont:[emailLabel font]];
        [emailLabel setBackgroundColor:[UIColor clearColor]];
        [emailLabel setFrame:CGRectMake(23, 25, size.width, size.height)];
        [_backgroundView addSubview:emailLabel];
        [emailLabel release];
        
        CGRect frame = [emailLabel frame];
        
        _emailInputField = [[UITextField alloc] init];
        [_emailInputField setFrame:CGRectMake(frame.origin.x + frame.size.width + 1, 25, 206, 30)];
        [_emailInputField setDelegate:self];
        [[_emailInputField layer] setCornerRadius:5];
        [_emailInputField setBackgroundColor: [UIColor clearColor]];
        [_emailInputField setKeyboardType:UIKeyboardTypeASCIICapable];
        [_emailInputField setFont:[UIFont fontWithName:@"Helvetica" size:16.8]];
        
        if (_isEnableEmailAsAccountName)
        {
            [_emailInputField setPlaceholder:@"请输入邮箱地址"];
            
        }else
        {
            [_emailInputField setPlaceholder: @"请使用字母，数字和下划线"];
        }
        
        [_emailInputField setAutocorrectionType:UITextAutocorrectionTypeNo];
        
        [_backgroundView addSubview:_emailInputField];
        
        
        UILabel *passwordLabel = [[UILabel alloc] init];
        [passwordLabel setFont:[UIFont fontWithName:@"Helvetica" size:19]];
        [passwordLabel setText:@"密码："];
        
        size = [[passwordLabel text] sizeWithFont:[passwordLabel font]];
        [passwordLabel setBackgroundColor:[UIColor clearColor]];
        [passwordLabel setFrame:CGRectMake(40, frame.origin.y + frame.size.height + 16, size.width, size.height)];
        [_backgroundView addSubview:passwordLabel];
        [passwordLabel release];
        
        frame = [_emailInputField frame];
        _firstPasswordField = [[UITextField alloc] init];
        [_firstPasswordField setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 11, frame.size.width, frame.size.height)];
        [_firstPasswordField setPlaceholder:@"8－16位数字和字母组合"];
        [_firstPasswordField setDelegate:self];
        [_firstPasswordField setSecureTextEntry:YES];
        [[_firstPasswordField layer] setCornerRadius:5.0];
        [_firstPasswordField setBackgroundColor:[UIColor clearColor]];
        [_firstPasswordField setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [_firstPasswordField setKeyboardType:UIKeyboardTypeNamePhonePad];
        
        [_backgroundView addSubview:_firstPasswordField];
        
        frame = [passwordLabel frame];
        UILabel *verifyPasswordLabel = [[UILabel alloc] init];
        [verifyPasswordLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [verifyPasswordLabel setText:@"确认密码："];
        size = [[verifyPasswordLabel text] sizeWithFont:[verifyPasswordLabel font]];
        [verifyPasswordLabel  setBackgroundColor:[UIColor clearColor]];
        [verifyPasswordLabel setFrame:CGRectMake(5, frame.origin.y + frame.size.height + 20, size.width, size.height)];
        [_backgroundView addSubview:verifyPasswordLabel];
        [verifyPasswordLabel release];
        
        frame = [_firstPasswordField frame];
        _verificatePasswordField = [[UITextField alloc] init];
        [_verificatePasswordField setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 14, frame.size.width, frame.size.height)];
        [_verificatePasswordField setPlaceholder:@"8－16位数字和字母组合"];
        [_verificatePasswordField setDelegate:self];
        [_verificatePasswordField setSecureTextEntry:YES];
        [[_verificatePasswordField layer] setCornerRadius:5.0];
        [_verificatePasswordField setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [_verificatePasswordField setBackgroundColor:[UIColor clearColor]];
        [_verificatePasswordField setKeyboardType:UIKeyboardTypeNamePhonePad];
        
        [_backgroundView addSubview:_verificatePasswordField];
        
        
        frame = [_verificatePasswordField frame];
        
        
        
        _submitButton = [[UIButton alloc] init] ;
        
        [_submitButton setFrame:CGRectMake(frame.origin.x - 10, frame.origin.y + frame.size.height + 23, 145, 43)];
        [_submitButton setBackgroundImage:[UIImage imageNamed:@"BoCPressNormalButtonBackground"] forState:UIControlStateNormal];
        [_submitButton setTitle: @"确认" forState: UIControlStateNormal];
        [_submitButton addTarget:_handler action:@selector(handleSubmitButtonPressedEvent:) forControlEvents:UIControlEventTouchDown];
        
        [_backgroundView addSubview:_submitButton];
                
        UITapGestureRecognizer *tapGestureRecognizerForHideKeyboard = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)] autorelease];
        
        [_backgroundView addGestureRecognizer:tapGestureRecognizerForHideKeyboard];
        
        [_normalAccountRegisterDataSource getProtocolContentWithCallback:_handler];
        
    }
    
    return self;
}

- (void)dealloc
{
    
    [_submitButton release];
    [_backgroundView release];
    [_emailInputField release];
    [_firstPasswordField release];
    [_verificatePasswordField release];
    [_normalAccountRegisterDataSource release];
    //    [_checkViewForProtocol release];
    [_handler release];
    [userPasswordMD5String release];
    
    [super dealloc];
}

#pragma mark - BoCPressPage protocol

- (BOOL)needNavigationBar
{
    return YES;
}

#pragma mark - delegate for text field
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger kMaxTextFieldLength = 128;
    
    if (textField == _emailInputField) 
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
    [_emailInputField resignFirstResponder];
    [_firstPasswordField resignFirstResponder];
    [_verificatePasswordField resignFirstResponder];
}

#pragma mark - alert view delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self willBrowseBackward];
    }
}

#pragma mark - register

- (void)wantToRegisterNewAccount
{
    BOOL formatIllegal = NO;
    NSString *errorMessage = @"请输入正确的信息";
    //No input error
    //
    if ([[_emailInputField text] length] * [[_firstPasswordField text] length] * [[_verificatePasswordField text] length] == 0)
    {
        formatIllegal = YES;
    }else  if (_isEnableEmailAsAccountName)
    { 
        if([[_emailInputField text] rangeOfString: @"^([a-zA-Z0-9_\\-\\.]+@[a-zA-Z0-9_\\-\\.]*[a-zA-Z0-9_\\-]\\.[a-zA-Z]+)?$" 
                                          options: NSRegularExpressionSearch].location == NSNotFound)
        {
            formatIllegal = YES;
            errorMessage = @"请输入有效的邮箱";
            
        }
        
    }else if([[_emailInputField text] rangeOfString: @"^([a-zA-Z0-9_]+)?$" 
                                            options: NSRegularExpressionSearch].location == NSNotFound)
    {
        formatIllegal = YES;
        
    }else if (![[_firstPasswordField text] isEqualToString:[_verificatePasswordField text]]) 
    {
        formatIllegal = YES;
        errorMessage = @"两次输入的密码不一致！";
        
    }else if([[_firstPasswordField text] rangeOfString:@"^[a-zA-Z0-9]{8,16}$" options: NSRegularExpressionSearch].location == NSNotFound)
    {
        formatIllegal = YES;
        errorMessage = @"非法的密码";
    }
    
    if (formatIllegal)
    {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: @"错误" 
                                                            message: errorMessage
                                                           delegate: nil
                                                  cancelButtonTitle: @"好" 
                                                  otherButtonTitles: nil];
        [alertView show];
        [alertView release];
        
    }else
    {
        NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  _protocolContent, kGlobal_ProtocolContent,
                                  nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_wantToShowProtocolView 
                                                            object:self
                                                          userInfo:userInfo];
        
        [userInfo release];
    }
}

- (void)reigsterNewAccount
{
    [self wantToShowLoadingIndicatorWithMessage: kBoCPress_Global_LoadingIndicatorMessageWaiting 
                                    onsuperView: NO];

    userPasswordMD5String = [[[NSString stringWithFormat:kBoCPress_Global_SecretSalt,[_firstPasswordField text]] MD5] retain];
    
    [_normalAccountRegisterDataSource registerNormalAccountWithEmail: [_emailInputField text]
                                                            password: userPasswordMD5String
                                                            callback: _handler];        
    
}

- (void)showRegisterResultWithData:(id)data
{
    [self wantToFinishDataUpdate];
    
    BOOL registerStatus = [[data objectForKey:kBoCPress_Global_ResponseStatus] boolValue];
    if (registerStatus)
    {
        UIAlertView *alertViewForRegister = [[UIAlertView alloc] initWithTitle:nil
                                                                       message:nil
                                                                      delegate:self
                                                             cancelButtonTitle:@"确定"
                                                             otherButtonTitles: nil];
        
        [alertViewForRegister setTitle:@"注册成功"];
        NSString *freeDayCount = [data objectForKey:@"FREE_DAYS_ON_REGISTRATION"];
        NSString *endTime = [data objectForKey:@"PAY_END_DATE"];
        NSString *messageContent = [NSString stringWithFormat:@"免费使用时间：%@天\n截止日期：%@", freeDayCount, endTime];
        
        if ([freeDayCount integerValue] <= 0)
        {
            messageContent = @"注册成功，感谢您使用金汇掌中宝";
        }
        
        [alertViewForRegister setMessage:messageContent];
        
        NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] initWithDictionary:data];
        [userInfo setObject:userPasswordMD5String forKey:@"password"];
        [_normalAccountRegisterDataSource storeUserInfo:userInfo];
        [userInfo release];
        
        [_emailInputField setText:nil];
        [_firstPasswordField setText:nil];
        [_verificatePasswordField setText:nil];
        
        [alertViewForRegister show];
        [alertViewForRegister release];
        
    }else
    {
        UIAlertView *alertForRegisterFail = [[UIAlertView alloc] initWithTitle:@"注册失败" 
                                                                       message:nil
                                                                      delegate:nil 
                                                             cancelButtonTitle:@"确定"
                                                             otherButtonTitles: nil];
        
        NSString *messageContent = [data objectForKey:kBoCPress_Global_ServerErrorMessage_CN];
        [alertForRegisterFail setMessage:messageContent];
        
        [alertForRegisterFail show];
        [alertForRegisterFail release];
        
    }
    
    userPasswordMD5String = nil;
    
}


- (void)updateProtocolContentWithData:(id)data
{
    [_protocolContent release];
    _protocolContent = [[data objectForKey:kGlobal_ProtocolContent] retain];
}

@end
