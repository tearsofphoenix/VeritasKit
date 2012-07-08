//
//  BoCPressFindPasswordPage.m
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

#import "BoCPressFindPasswordPage.h"

#import "BoCPressConstant.h"

#import "BoCPressFindPasswordPagePrivateHandler.h"

#import "BoCPressAccountDataSource.h"

#import "UIView+LoadingIndicatorView.h"

#import <QuartzCore/QuartzCore.h>

static NSString * userEmail = nil;

@implementation BoCPressFindPasswordPage

- (id)initWithLastPage:(id<BoCPressPage>)lastPage 
            dataSource:(id<BoCPressAccountDataSource>)dataSource
{
    if ((self = [super init]))
    {
        [self setLastPage: lastPage];
        [self setPageTitle: @"找回密码"];
        _handler = [[BoCPressFindPasswordPagePrivateHandler alloc] initWithPage:self];
        _findPasswordDataSource = [dataSource retain];
        
        _backgroundView = [[UIView alloc] init];
        [_backgroundView setFrame:CGRectMake(0, 0, 320, 365)];
        [_backgroundView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressFindPasswordPageBackground"]]];
        
        UIImageView *shadowView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]];        
        [_backgroundView addSubview:shadowView];        
        [shadowView release];

        
        UITapGestureRecognizer *tapForHideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
        [_backgroundView addGestureRecognizer:tapForHideKeyboard];
        [tapForHideKeyboard release];

        UILabel *emailLabel = [[UILabel alloc] init];
        [emailLabel setFont:[UIFont fontWithName:@"Helvetica" size:21]];
        [emailLabel setText:@"您的用户名："];
        CGSize size = [[emailLabel text] sizeWithFont:[emailLabel font]];
        
        [emailLabel setFrame:CGRectMake(10, 22, size.width, size.height)];
        [emailLabel setBackgroundColor:[UIColor clearColor]];
        [_backgroundView addSubview:emailLabel];
        [emailLabel release];
        
        CGRect frame = [emailLabel frame];
        _emailField = [[UITextField alloc] init];
        [_emailField setFrame:CGRectMake(12, frame.origin.y + frame.size.height + 12, 320 - 22, 30)];
        [_emailField setKeyboardType:UIKeyboardTypeASCIICapable];
        [_emailField setAutocorrectionType:UITextAutocorrectionTypeNo];
        [_emailField setBackgroundColor:[UIColor clearColor]];
        [_emailField setPlaceholder:@"请输入邮箱地址"];
        [[_emailField layer] setCornerRadius:5.0];
        [_emailField setDelegate:self];
        
        [_backgroundView addSubview:_emailField];
        
        UIButton *submitButton = [[UIButton alloc] init];
        [submitButton setFrame:CGRectMake(frame.origin.x + 80, frame.origin.y + frame.size.height + 50, 145, 43)];
        [submitButton setTitle:@"找回密码" forState:UIControlStateNormal];
        [submitButton setBackgroundImage:[UIImage imageNamed:@"BoCPressNormalButtonBackground"] forState:UIControlStateNormal];
        [submitButton addTarget:_handler action:@selector(handleSubmitButtonPressedEvent:) forControlEvents:UIControlEventTouchDown];
        [_backgroundView addSubview:submitButton];
        [submitButton release];
        
        
        [self addSubview:_backgroundView];
    }
    
    return self;
}
- (void)dealloc
{
    [_findPasswordDataSource release];
    [_handler release];
    [_backgroundView release];
    [_emailField release];
    
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
    
    if (textField == _emailField) 
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
#pragma mark - alert view delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self willBrowseBackward];
}


- (void)wantToFindPassword
{
    BOOL formatIllegal = NO;
    NSString * errorMessage = @"请正确填写信息" ;
    
    if ([[_emailField text] length] == 0)
    {
        formatIllegal = YES;
        
    }else  
        if ([[_emailField text] rangeOfString: @"^([a-zA-Z0-9_\\-\\.]+@[a-zA-Z0-9_\\-\\.]*[a-zA-Z0-9_\\-]\\.[a-zA-Z]+)?$" 
                                             options: NSRegularExpressionSearch].location == NSNotFound)
        {
            formatIllegal = YES;
            errorMessage = @"请输入有效的邮箱";
        }
    
    if(formatIllegal)
    {
        UIAlertView *alertForInput = [[UIAlertView alloc] initWithTitle:@"错误" 
                                                                message:errorMessage
                                                               delegate:nil 
                                                      cancelButtonTitle:@"确定" 
                                                      otherButtonTitles: nil];
        [alertForInput show];
        [alertForInput release];
        
    }else
    {
        [self wantToShowLoadingIndicatorWithMessage: kBoCPress_Global_LoadingIndicatorMessageWaiting 
                                        onsuperView: NO];
        userEmail = [_emailField text];
        [_findPasswordDataSource wantToResetPasswordWithEmail:userEmail callback:_handler];
        
        [_emailField setText:nil];
    }
}


- (void)showFindPasswordResultWithData:(id)data
{
    [self wantToFinishDataUpdate];
    
    BOOL resetPasswordStatus = [[data objectForKey:kBoCPress_Global_ResponseStatus] boolValue];
    
    if (resetPasswordStatus)
    {
        [_findPasswordDataSource didResetPasswordWithCallback:_handler];
        
        UIAlertView *alertForOK = [[UIAlertView alloc] initWithTitle:@"信息"
                                                             message:@"您已经成功重置密码，一封确认邮件已发送至您的邮箱，请使用新密码登录。" 
                                                            delegate:self
                                                   cancelButtonTitle:@"确定" 
                                                   otherButtonTitles: nil];
        [alertForOK show];
        [alertForOK release];
        
    }else
    {
        UIAlertView *alertForFail = [[UIAlertView alloc] initWithTitle:@"错误" 
                                                               message:[data objectForKey:kBoCPress_Global_ServerErrorMessage_CN] 
                                                              delegate:nil 
                                                     cancelButtonTitle:@"确定" 
                                                     otherButtonTitles: nil];
        [alertForFail show];
        [alertForFail release];
    }
    
    userEmail = nil;
    
    
}

#pragma mark - hide keyboard
- (void)hideKeyboard: (id)sender
{
    [_emailField resignFirstResponder];
}


@end
