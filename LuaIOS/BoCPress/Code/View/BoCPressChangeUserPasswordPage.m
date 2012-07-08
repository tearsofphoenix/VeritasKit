//
//  BoCPressChangeUserPasswordPage.m
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

#import "BoCPressChangeUserPasswordPage.h"

#import "BoCPressChangeUserPasswordPagePrivateHandler.h"

#import "BoCPressAccountDataSource.h"

#import "BoCPressConstant.h"

#import "BoCPressAccountDataSource.h"

#import "NSString+MD5.h"

#import "UIView+LoadingIndicatorView.h"

#import <QuartzCore/QuartzCore.h>

static NSString *userPassword = nil;

static NSString *newUserPassword = nil;

@implementation BoCPressChangeUserPasswordPage

- (id)initWithLastPage:(id<BoCPressPage>)lastPage 
            dataSource:(id<BoCPressAccountDataSource>)dataSource
{
    if ((self = [super init]))
    {
        [self setLastPage:  lastPage];
        [self setPageTitle: @"更改密码"];
        
        _changeUserPasswordDataSource = [dataSource retain];
        _handler = [[BoCPressChangeUserPasswordPagePrivateHandler alloc] initWithPage: self];
        
        
        UIView *backgroundView = [[UIView alloc] init];
        [backgroundView setFrame:CGRectMake(0, 0, 320, 365)];
        [backgroundView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressChangePasswordPageBackground"]]];
        UIImageView *shadowView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]];        
        [backgroundView addSubview:shadowView];        
        [shadowView release];

        UITapGestureRecognizer *tapForHideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
        [backgroundView addGestureRecognizer:tapForHideKeyboard];
        [tapForHideKeyboard release];

        UILabel *oldPasswordLabel = [[UILabel alloc] init];
        [oldPasswordLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [oldPasswordLabel setText:@"旧密码："];
        CGSize size = [[oldPasswordLabel text] sizeWithFont:[oldPasswordLabel font]];
        [oldPasswordLabel setBackgroundColor:[UIColor clearColor]];
        [oldPasswordLabel setFrame:CGRectMake(38, 25, size.width, size.height)];
        [backgroundView addSubview:oldPasswordLabel];
        [oldPasswordLabel release];
        
        CGRect frame = [oldPasswordLabel frame];
        
        _oldPasswordInputField = [[UITextField alloc] init];
        [_oldPasswordInputField setFrame:CGRectMake(frame.origin.x + frame.size.width + 3, 25, 193, 30)];
        [_oldPasswordInputField setDelegate:self];
        [[_oldPasswordInputField layer] setCornerRadius:5];
        [_oldPasswordInputField setBackgroundColor: [UIColor clearColor]];
        [_oldPasswordInputField setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [_oldPasswordInputField setSecureTextEntry:YES];
        [_oldPasswordInputField setKeyboardType:UIKeyboardTypeNamePhonePad];
        [backgroundView addSubview:_oldPasswordInputField];
        
        
        UILabel *newPasswordLabel = [[UILabel alloc] init];
        [newPasswordLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [newPasswordLabel setText:@"新密码："];
        
        size = [[newPasswordLabel text] sizeWithFont:[newPasswordLabel font]];
        [newPasswordLabel setBackgroundColor:[UIColor clearColor]];
        [newPasswordLabel setFrame:CGRectMake(38, frame.origin.y + frame.size.height + 20, size.width, size.height)];
        [backgroundView addSubview:newPasswordLabel];
        [newPasswordLabel release];
        
        frame = [_oldPasswordInputField frame];
        _newPasswordInputField = [[UITextField alloc] init];
        [_newPasswordInputField setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 9, frame.size.width, frame.size.height)];
        [_newPasswordInputField setPlaceholder:@"8－16位数字和字母组合"];
        [_newPasswordInputField setDelegate:self];
        [_newPasswordInputField setSecureTextEntry:YES];
        [[_newPasswordInputField layer] setCornerRadius:5.0];
        [_newPasswordInputField setBackgroundColor:[UIColor clearColor]];
        [_newPasswordInputField setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [_newPasswordInputField setKeyboardType:UIKeyboardTypeNamePhonePad];

        [backgroundView addSubview:_newPasswordInputField];
        
        frame = [newPasswordLabel frame];
        UILabel *verifyPasswordLabel = [[UILabel alloc] init];
        [verifyPasswordLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [verifyPasswordLabel setText:@"确认新密码："];
        size = [[verifyPasswordLabel text] sizeWithFont:[verifyPasswordLabel font]];
        [verifyPasswordLabel  setBackgroundColor:[UIColor clearColor]];
        [verifyPasswordLabel setFrame:CGRectMake(3, frame.origin.y + frame.size.height + 20, size.width, size.height)];
        [backgroundView addSubview:verifyPasswordLabel];
        [verifyPasswordLabel release];
        
        frame = [_newPasswordInputField frame];
        _confirmPasswordInputField = [[UITextField alloc] init];
        [_confirmPasswordInputField setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 14, frame.size.width, frame.size.height)];
        [_confirmPasswordInputField setPlaceholder:@"8－16位数字和字母组合"];
        [_confirmPasswordInputField setDelegate:self];
        [_confirmPasswordInputField setSecureTextEntry:YES];
        [[_confirmPasswordInputField layer] setCornerRadius:5.0];
        [_confirmPasswordInputField setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [_confirmPasswordInputField setBackgroundColor:[UIColor clearColor]];
        [_confirmPasswordInputField setKeyboardType:UIKeyboardTypeNamePhonePad];

        [backgroundView addSubview:_confirmPasswordInputField];
        
        
        frame = [_confirmPasswordInputField frame];
        
        
        
        UIButton *submitButton = [[UIButton alloc] init] ;
        
        [submitButton setFrame:CGRectMake(frame.origin.x - 20, frame.origin.y + frame.size.height + 23, 145, 43)];
        [submitButton setBackgroundImage:[UIImage imageNamed:@"BoCPressNormalButtonBackground"] forState:UIControlStateNormal];
        [submitButton setTitle: @"修改密码" forState: UIControlStateNormal];
        [submitButton addTarget:_handler action:@selector(handleSubmitButtonPressedEvent:) forControlEvents:UIControlEventTouchDown];
        
        [backgroundView addSubview:submitButton];
        [submitButton release];
        
        [self addSubview:backgroundView];
        [backgroundView release];
        
        
        
    }
    
    return self;
}
- (void)dealloc
{
    [_changeUserPasswordDataSource release];
    [_oldPasswordInputField release];
    [_newPasswordInputField release];
    [_confirmPasswordInputField release];
    
    [super dealloc];
}

#pragma mark - BoCPressPage protocol



- (BOOL)needNavigationBar
{
    return YES;
}

- (void)wantToChangePassword
{
    BOOL formatIllegal = NO;
    NSString *errorString = @"请正确填写信息";
    
    if ([[_oldPasswordInputField text] length] * [[_newPasswordInputField text] length] * [[_confirmPasswordInputField text] length] == 0) 
    {
        formatIllegal = YES;
    }else if([[_oldPasswordInputField text] rangeOfString:@"^[a-zA-Z0-9]{8,16}$" options: NSRegularExpressionSearch].location == NSNotFound)
    {
        formatIllegal = YES;
        errorString = @"旧密码非法";
        
    }else
    if(![[_newPasswordInputField text] isEqualToString:[_confirmPasswordInputField text]])
    {
        formatIllegal = YES;
        errorString = @"两次输入的密码不一致";
        
    }else if([[_newPasswordInputField text] rangeOfString:@"^[a-zA-Z0-9]{8,16}$" options: NSRegularExpressionSearch].location == NSNotFound)
    {
        formatIllegal = YES;
        errorString = @"新密码非法";
    }
    
    if (formatIllegal)
    {
        UIAlertView *alertForInput = [[UIAlertView alloc] initWithTitle:@"错误" message:errorString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertForInput show];
        [alertForInput release];
        
    }else
    {
        [self wantToShowLoadingIndicatorWithMessage: kBoCPress_Global_LoadingIndicatorMessageWaiting 
                                        onsuperView: NO];
        
        [userPassword release];
        [newUserPassword release];
        
        userPassword = [[[NSString stringWithFormat:kBoCPress_Global_SecretSalt, [_oldPasswordInputField text]] MD5] retain];

        newUserPassword = [[[NSString stringWithFormat:kBoCPress_Global_SecretSalt, [_newPasswordInputField text]] MD5] retain];
        
        [_changeUserPasswordDataSource changeOldPassword: userPassword
                                           toNewPassword: newUserPassword
                                                callback: _handler];
    }
}

- (void)showChangePasswordResultWithData: (id)data
{
    [self wantToFinishDataUpdate];
    
    [_oldPasswordInputField setText:nil];
    [_newPasswordInputField setText:nil];
    [_confirmPasswordInputField setText:nil];

    BOOL reponseStatus = [[data objectForKey:kBoCPress_Global_ResponseStatus] boolValue];
    
    UIAlertView *alertForChangePassword = [[UIAlertView alloc] initWithTitle:nil
                                                             message:nil 
                                                            delegate:self 
                                                   cancelButtonTitle:@"确定" 
                                                   otherButtonTitles: nil];
    if (reponseStatus)
    {
        [_changeUserPasswordDataSource  didChangedToNewPassword: newUserPassword 
                                                       callback: _handler];
        
        [alertForChangePassword setTitle:@"修改成功"];
        [alertForChangePassword setMessage: nil];
        
    }else
    {
        [alertForChangePassword setTitle:@"修改失败"];
        NSString *messageContent = [data objectForKey:kBoCPress_Global_ServerErrorMessage_CN];
        [alertForChangePassword setMessage:messageContent];
    }
    
    [alertForChangePassword show];
    [alertForChangePassword release];
    
}
#pragma mark - delegate for text field
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    if (newLength > kBoCPress_Global_MaxTextLengthOfPassword)
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
    [_oldPasswordInputField resignFirstResponder];
    [_newPasswordInputField resignFirstResponder];
    [_confirmPasswordInputField resignFirstResponder];
}

@end
