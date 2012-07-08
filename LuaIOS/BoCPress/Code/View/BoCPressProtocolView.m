//
//  BoCPressProtocolView.m
//  BoCPress
//
//  Created by LeixSnake on 10/24/11.
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

#import "BoCPressProtocolView.h"

#import "BoCPressProtocolViewPrivateHandler.h"

#import "BoCPressConstant.h"

@implementation BoCPressProtocolView

- (id)initWithProtocolContent: (NSString *)protocolContent
{
    if ((self = [super init]))
    {
        _handler = [[BoCPressProtocolViewPrivateHandler alloc] initWithProtocolView:self];

        [self setFrame:CGRectMake(5, 58, 297, 337)];
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressProtocolBackground"]]];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        [titleLabel setText:@"用户协议"];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel setFrame:CGRectMake(106, 10, 90, 25)];
        
        [self addSubview:titleLabel];
        [titleLabel release];
        
        UITextView *contentTextView = [[UITextView alloc] init];
        [contentTextView setBackgroundColor:[UIColor clearColor]];
        [contentTextView setFont:[UIFont fontWithName:@"Helvetica" size:17]];
 
        [contentTextView setText:protocolContent];
//        [contentTextView setText:@"《用户协议内容，含免责说明》\n  感谢您使用中银财经通产品，\n中银财经通提供专业投资参考。部分功能是需要收费的。如您完成注册后，可以在2011年10月30日之前免费使用中银财经通的所有功能，请正确输入您的邮箱及密码，谢谢！"];
        [contentTextView setFrame:CGRectMake(25, 60, 260, 180)];
        [contentTextView setEditable:NO];
        
        [self addSubview:contentTextView];
        [contentTextView release];
        
        _agreeButton = [[UIButton alloc] init];
        [_agreeButton setTitle:@"我同意" forState:UIControlStateNormal];
        [_agreeButton setFrame:CGRectMake(16, 278, 124, 49)];
        [_agreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_agreeButton setBackgroundImage:[UIImage imageNamed:@"BoCPressNormalButtonBackground"] forState:UIControlStateNormal];
        [_agreeButton setBackgroundImage:[UIImage imageNamed:@"BoCPressProtocolButtonPressedBackground"] forState:UIControlStateHighlighted ];
        
        [_agreeButton addTarget:_handler action:@selector(handleAgreeButtonPressedEvent:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:_agreeButton];

        
        UIButton *cancelButton = [[UIButton alloc] init];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [cancelButton setFrame:CGRectMake(155, 280, 124, 49)];
        [cancelButton setBackgroundImage:[UIImage imageNamed:@"BoCPressProtocolCancelButtonBackground"] forState:UIControlStateNormal];
        [cancelButton setBackgroundImage:[UIImage imageNamed:@"BoCPressProtocolCancelButtonPressedBackground"] forState:UIControlStateHighlighted];
        
        [cancelButton addTarget:_handler action:@selector(handleCancelButtonPressedEvent:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:cancelButton];
        [cancelButton release];
                     
    }
    return self;
}
- (void)dealloc
{
    
    [_handler release];
    
    [super dealloc];
}


- (void)handleAgreeButtonPressedEvent
{   
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithBool:YES], kBoCPress_Global_ObjectID, nil];
            
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_finishedShowProtocolView
                                                        object:self
                                                      userInfo:userInfo];
    [userInfo release];
}

- (void)handleCancelButtonPressedEvent
{

    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithBool:NO], kBoCPress_Global_ObjectID, nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_finishedShowProtocolView
                                                        object:self
                                                      userInfo:userInfo];
    [userInfo release];
}
@end
