//
//  BoCPressUserFeedBackPage.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/4/11.
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

#import "BoCPressUserFeedBackPage.h"

#import "BoCPressUserFeedBackDataSource.h"

#import "BoCPressConstant.h"

#import "UIView+ResponderFindable.h"

#import "UIView+LoadingIndicatorView.h"

#import <QuartzCore/QuartzCore.h>


@implementation BoCPressUserFeedBackPage

- (id)initWithLastPage:(id<BoCPressPage>)lastPage
         andDataSource: (id<BoCPressUserFeedBackDataSource>) dataSource
{
    if ((self = [super init]))
    {
        [self setLastPage: lastPage];
        [self setPageTitle: @"用户反馈"];
        
        _dataSource = [dataSource retain];
                
        _backgroundView = [[UIView alloc] init];
        [_backgroundView setFrame:CGRectMake(0, 0, 320, 480)];
        [_backgroundView setBackgroundColor:
         [UIColor colorWithRed:200 / 255.0 green:200 / 255.0 blue:200 / 255.0 alpha:1.0]];
        
        [self addSubview:_backgroundView];
        
        float offset = 40;
        
        UILabel *promptLabel = [[[UILabel alloc] init] autorelease];
        [promptLabel setFont:[UIFont fontWithName:@"Helvetica" size:18]];
        [promptLabel setTextAlignment:UITextAlignmentCenter];
        [promptLabel setText:@"请详细描述您的建议、意见、问题等："];
        [promptLabel setFrame:CGRectMake(0, 64 - offset, 320, 20)];
        [promptLabel setBackgroundColor:[UIColor clearColor]];
        [[promptLabel layer] setCornerRadius:5.0f];
        
        [_backgroundView addSubview:promptLabel];
        
        _userInputTextView = [[UITextView alloc] init];
        
        [_userInputTextView setDelegate:self];
        [_userInputTextView setAutocorrectionType:UITextAutocorrectionTypeNo];
        [_userInputTextView setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [_userInputTextView setFrame:CGRectMake(10, 90-offset, 300, 84)];
        [_userInputTextView setBackgroundColor:[UIColor whiteColor]];
        [[_userInputTextView layer] setCornerRadius:5.0f];
        [[_userInputTextView layer] setBorderWidth: 1.5];
        [[_userInputTextView layer] setBorderColor: [[UIColor grayColor] CGColor]];
        [_backgroundView addSubview:_userInputTextView];
        
        _submitButton = [[UIButton alloc] init] ;
        
        [_submitButton setFrame:CGRectMake(92, 180-offset, 140, 40)];
        [_submitButton setBackgroundImage:[UIImage imageNamed:@"BoCPressUserFeedbackSubmitButton"] forState:UIControlStateNormal];
        
        UITapGestureRecognizer *submitButtonTapGestureRecognizer = 
        [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(submitUserFeedback:)] autorelease];
        
        [_submitButton addGestureRecognizer:submitButtonTapGestureRecognizer];
        
        [_backgroundView addSubview:_submitButton];
        
        UITapGestureRecognizer *tapGestureRecognizerForHideKeyboard = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBackgroundTapedEvent:)] autorelease];
        
        [_backgroundView addGestureRecognizer:tapGestureRecognizerForHideKeyboard];
        
        
        _alertForSaveUserFeedbackView = [[UIAlertView alloc] initWithTitle: @"警告"
                                                                   message: kBoCPress_View_FeedbackPageWillBrowseBackwardAlertString
                                                                  delegate: self 
                                                         cancelButtonTitle: @"确定" 
                                                         otherButtonTitles: @"取消", nil];
        
        _alertForNilSubmit = [[UIAlertView alloc] initWithTitle: @"错误"
                                                        message: @"您还未填写任何反馈信息!" 
                                                       delegate: nil 
                                              cancelButtonTitle: @"确定" 
                                              otherButtonTitles: nil];
        
        _alertViewForSubmitResult = [[UIAlertView alloc] initWithTitle: @"信息" 
                                                               message: @"反馈提交成功" 
                                                              delegate: self 
                                                     cancelButtonTitle: @"确定" 
                                                     otherButtonTitles: nil];
    }
    return self;
}

- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardWillShowNotification 
                                                  object:nil];
    [_dataSource release];
    
    [_userInputTextView release];
    [_backgroundView release];
    [_alertForSaveUserFeedbackView release];
    [_alertForNilSubmit release];
    [_alertViewForSubmitResult release];
    [_submitButton release];
    
    [super dealloc];
}

#pragma mark - BoCPressPage protocol

- (BOOL)needNavigationBar
{
    return YES;
}

- (void)willBrowseBackward
{
    //if user has inputed something
    if([[_userInputTextView text] length] > 0)
    {
        
        [_alertForSaveUserFeedbackView show];
        
    }else
    {
        
        [_userInputTextView resignFirstResponder];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_couldBrowseBackward 
                                                            object:self 
                                                          userInfo:nil]; 
    }
}


#pragma mark - UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView == _alertForSaveUserFeedbackView)
    {
        
        if (buttonIndex == 0)
        {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_couldBrowseBackward 
                                                                object:self 
                                                              userInfo:nil];
            [_alertForSaveUserFeedbackView setHidden:YES];
        }
    }
}

#pragma mark - handle submit user back event


- (void) submitUserFeedback: (id)sender
{
    
    if ([[_userInputTextView text] length] > 0)
    {
        [self wantToShowLoadingIndicatorWithMessage: kBoCPress_Global_LoadingIndicatorMessageWaiting 
                                        onsuperView: NO];
        [_submitButton setEnabled:NO];
        [_dataSource submitUserFeedback: [_userInputTextView text] 
                      withCallbackBlock: (^(id data) 
                                          {
                                              [self updateFeedbackResultWithData:data];
                                          })
         ];
    }else
    {
        [_alertForNilSubmit show];
    }
}

- (void)updateFeedbackResultWithData:(id)data
{
    [self wantToFinishDataUpdate];
    
    if ([[data objectForKey:kNetwork_SetUserFeedBackReturnContent ] boolValue])
    {
        
        [_userInputTextView setText:nil];
        
    }else
    {        
        [_alertViewForSubmitResult setMessage:@"反馈提交失败"];
        
    }
    
    [_submitButton setEnabled:YES];
    
    [_alertViewForSubmitResult show];
    
}

- (void)handleBackgroundTapedEvent: (id)sender
{
    
    [_userInputTextView resignFirstResponder];
}

@end
