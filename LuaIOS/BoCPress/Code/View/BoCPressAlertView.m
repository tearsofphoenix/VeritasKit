//
//  BoCPressAlertView.m
//  BoCPress
//
//  Created by E-Reach Administrator on 12/5/11.
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

#import "BoCPressAlertView.h"

@implementation BoCPressAlertView

@synthesize delegate = _delegate;

- (void)setDelegate:(id)delegate
{
    if (!delegate) 
    {
        _delegate = self;
    }
}
- (id)initWithTitle: (NSString *)title 
            message: (NSString *)message 
           delegate: (id)delegate
  cancelButtonTitle: (NSString *)cancelButtonTitle 
  otherButtonTitles: (NSString *)otherButtonTitles, ...
{
    if ((self = [super init]))
    {

        [self setDelegate: delegate];
        _alertView = [[UIAlertView alloc] initWithTitle: title
                                                message: message
                                               delegate: self
                                      cancelButtonTitle: cancelButtonTitle
                                      otherButtonTitles: otherButtonTitles, nil];
        _isWaitingForTap = YES;
        _clickedButtonIndex = 0;
    }
    
    return self;
}

- (id)init
{
    if ((self = [super init]))
    {        
        [self setDelegate: nil];
        _alertView = [[UIAlertView alloc] initWithTitle: nil
                                                message: nil
                                               delegate: self
                                      cancelButtonTitle: nil
                                      otherButtonTitles: nil];
        _isWaitingForTap = YES;
        _clickedButtonIndex = 0;
    }
    
    return self;
    
}

- (void)dealloc
{
    [_alertView release];
    [_alertView setDelegate: nil];
    
    [super dealloc];
}

- (NSString *)title
{
    return [_alertView title];
}

@synthesize title = _title;
@synthesize message = _message;

- (void)setTitle:(NSString *)title
{
    [_alertView setTitle: title];
}

- (NSString *)message
{
    return [_alertView message];
}

- (void)setMessage:(NSString *)message
{
    [_alertView setMessage: message];
}

@synthesize numberOfButtons = _numberOfButtons;

- (NSInteger)numberOfButtons
{
    return [_alertView numberOfButtons];
}

@synthesize cancelButtonIndex = _cancelButtonIndex;

- (NSInteger)cancelButtonIndex
{
    return [_alertView cancelButtonIndex];
}

@synthesize firstOtherButtonIndex = _firstOtherButtonIndex;

- (NSInteger)firstOtherButtonIndex
{
    return [_alertView firstOtherButtonIndex];
}

@synthesize visible = _visible;

- (BOOL)isVisible
{
    return [_alertView isVisible];
}

@synthesize alertViewStyle = _alertViewStyle;

- (UIAlertViewStyle)alertViewStyle
{
    return [_alertView alertViewStyle];
}

- (void)setAlertViewStyle:(UIAlertViewStyle)alertViewStyle
{
    [_alertView setAlertViewStyle: alertViewStyle];
}

- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex
{
    return [_alertView textFieldAtIndex: textFieldIndex];
}

- (NSInteger)show
{
    _isWaitingForTap = YES;
    [_alertView show];
    
    while (_isWaitingForTap) 
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    
    return _clickedButtonIndex;
}

- (NSInteger)addButtonWithTitle:(NSString *)title
{
    return [_alertView addButtonWithTitle: title];
}

- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex
{
    return [_alertView buttonTitleAtIndex: buttonIndex];
}

#pragma UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (_delegate == self)
    {
        _clickedButtonIndex = buttonIndex;
        _isWaitingForTap = NO;
    }else
    {
        [_delegate alertView: alertView clickedButtonAtIndex: buttonIndex];
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if (_delegate == self)
    {
        ;
    }else
    {
        [_delegate alertViewCancel: _alertView];
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    if (_delegate == self)
    {
        ;
    }else
    {
        [_delegate willPresentAlertView: _alertView];
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    if (_delegate == self)
    {
        ;
    }else
    {
        [_delegate didPresentAlertView: alertView];
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (_delegate == self)
    {
        ;
    }else
    {
        [_delegate alertView: _alertView willDismissWithButtonIndex: buttonIndex];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (_delegate == self)
    {
        ;
    }else
    {
        [_delegate alertView: _alertView didDismissWithButtonIndex: buttonIndex];
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    if (_delegate == self)
    {
        return YES;
    }else
    {
        return [_delegate alertViewShouldEnableFirstOtherButton: _alertView];
    }
}



@end
