//
//  BoCPressActivateCodePage.m
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

#import "BoCPressActivateCodePage.h"

#import "BoCPressActivateCodePagePrivateHandler.h"

#import "BoCPressConstant.h"

#import "BoCPressActivateCodeDataSource.h"

#import "NSDate+getStringOfYearMonthDay.h"

#import "NSString+NSDateWithYearMonthDayString.h"

#import "UIView+LoadingIndicatorView.h"

#import <QuartzCore/QuartzCore.h>


@implementation BoCPressActivateCodePage

- (id)initWithLastPage:(id<BoCPressPage>)lastPage 
            dataSource:(id<BoCPressActivateCodeDataSource>)dataSource
{
    if ((self = [super init]))
    {
        [self setLastPage: lastPage];
        [self setPageTitle: @"中行贵宾用户授权"];
        
        _activateCodeDataSource = [dataSource retain];
        _handler = [[BoCPressActivateCodePagePrivateHandler alloc] initWithPage:self];
        
        UIView *backgroundView = [[UIView alloc] init];
        [backgroundView setFrame:CGRectMake(0, 0, 320, 460)];
        [backgroundView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressActivateCodePageBackground"]]];
        
        UIImageView *infoShadowView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]];        
        [backgroundView addSubview:infoShadowView];        
        [infoShadowView release];
        
        UITapGestureRecognizer *tapForHideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
        [backgroundView addGestureRecognizer:tapForHideKeyboard];
        [tapForHideKeyboard release];
        
        _activeCodeTextFiled = [[UITextField alloc] init];
        [_activeCodeTextFiled setFrame:CGRectMake(58, 22, 210, 35)];
        [_activeCodeTextFiled setKeyboardType:UIKeyboardTypeNumberPad];
        [[_activeCodeTextFiled layer] setCornerRadius:5.0];
        [_activeCodeTextFiled setBackgroundColor:[UIColor clearColor]];
        [_activeCodeTextFiled setPlaceholder:@"请输入授权号"];
        [_activeCodeTextFiled setTextAlignment:UITextAlignmentCenter];
        [_activeCodeTextFiled setDelegate:self];
        
        [backgroundView addSubview:_activeCodeTextFiled];
        
        CGRect frame = [_activeCodeTextFiled frame];
        
        UIButton *submitButton = [[UIButton alloc] init];
        [submitButton setFrame:CGRectMake(86, frame.origin.y + frame.size.height + 10, 147, 48)];
        [[submitButton titleLabel] setFont:[UIFont fontWithName:@"Helvetica" size:19]];
        [submitButton setTitle:@"激活" forState:UIControlStateNormal];
        [submitButton setBackgroundImage:[UIImage imageNamed:@"BoCPressNormalButtonBackground"] forState:UIControlStateNormal];
        [submitButton addTarget:_handler action:@selector(handleSubmitButtonPressedEvent:) forControlEvents:UIControlEventTouchDown];
        
        [backgroundView addSubview:submitButton];
        [submitButton release];
        
        frame = [submitButton frame];
        
        _textLabel = [[UITextView alloc] init];
        [_textLabel setEditable: NO];
        [_textLabel setFrame:CGRectMake(17, frame.origin.y + frame.size.height + 20, 320 - 15 * 2, 200)];
        [_textLabel setBackgroundColor:[UIColor clearColor]];
        [[_textLabel layer] setCornerRadius:5.0];
        [_textLabel setTextColor:[UIColor grayColor]];
        [_textLabel setFont:[UIFont fontWithName:@"Helvetica" size:19.2]];
        
        [backgroundView addSubview:_textLabel];
        
        [self addSubview:backgroundView];
        [backgroundView release];
        
    }
    return self;
}
- (void)dealloc
{
    
    [_textLabel release];
    [_activeCodeTextFiled release];
    [_handler release];
    [_activateCodeDataSource release];
    
    [super dealloc];
}

#pragma mark - BoCPressPage protocol

- (BOOL)needNavigationBar
{
    return YES;
}


- (void)wantToUpdateDataWithInfo: (id)info
{
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
    
    [_activateCodeDataSource getAnnounceContentWithCallback:_handler];
}

#pragma mark - delegate for text field
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    if (newLength > 32)
    {
        return NO;
    }else
    {
        return YES;
    }
    
}

#pragma mark - handle events

- (void)wantToActivateCode
{
    if ([[_activeCodeTextFiled text] length] == 0 
        || [[_activeCodeTextFiled text] rangeOfString:@"^[0-9]+$" options:NSRegularExpressionSearch].location == NSNotFound)
    {
        UIAlertView *alertForInput = [[UIAlertView alloc] initWithTitle:@"错误" message:@"请填写正确的授权码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertForInput show];
        [alertForInput release];
    }else
    {
        [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];
        [_activateCodeDataSource wantToActivateCode:[_activeCodeTextFiled text] withCallback:_handler];
        
    }
}

-  (void)showActivateCodeResult:(id)data
{
    [self wantToFinishDataUpdate];
    BOOL responseStatus = [[data objectForKey:kBoCPress_Global_ResponseStatus] boolValue];
    if (responseStatus)
    {
        NSString *endDate = [data objectForKey:@"PAY_END_DATE"];
        NSString *endTime = [endDate stringOfYearMonthDayWithFormatterString:kNetwork_DateFormatterString];
        
        [_activateCodeDataSource storeUserInfo:data];
        [_activeCodeTextFiled setText:nil];
        
        NSString *title = @"您的授权已经成功激活，感谢使用金汇掌中宝";
        NSString *content = [NSString stringWithFormat:@"VIP服务有效期至：\n%@", endTime];
        
        NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  title, kBoCPressVIPAuthorizeView_Title,
                                  content, kBoCPressVIPAuthorizeView_Content,
                                  nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_wantToShowVIPAuthorizeSuccessView object:self userInfo:userInfo];
        
        [userInfo release];
        
    }else
    {
        UIAlertView *alertForFailToActivate = [[UIAlertView alloc] initWithTitle:@"错误"
                                                                         message:nil
                                                                        delegate:nil 
                                                               cancelButtonTitle:@"确定" 
                                                               otherButtonTitles: nil];
        
        [alertForFailToActivate setMessage:[data objectForKey:kBoCPress_Global_ServerErrorMessage_CN]];
        
        [alertForFailToActivate show];
        [alertForFailToActivate release];
    }
}

#pragma mark - hide keyboard
- (void)hideKeyboard: (id)sender
{
    [_activeCodeTextFiled resignFirstResponder];
}

- (void)finishedShowVIPAuthorizeView
{
    [self setLastPage: [[self lastPage] lastPage]];
    [self willBrowseBackward];
}

- (void)updatePromptMessageWithData:(id)data
{
    [self wantToFinishDataUpdate];
    
    NSString *content = [data objectForKey:kGlobal_ProtocolContent];
    [_textLabel setText: content];
    
}

@end
