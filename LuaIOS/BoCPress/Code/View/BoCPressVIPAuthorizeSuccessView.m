//
//  BoCPressVIPAuthorizeSuccessView.m
//  ;
//
//  Created by LeixSnake on 10/27/11.
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

#import "BoCPressVIPAuthorizeSuccessView.h"

#import "BoCPressConstant.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressVIPAuthorizeSuccessView


- (id)initWithTitle: (NSString *)titleString
      contentString: (NSString *)contentString
{
    if ((self = [super init]))
    {
        [self setFrame:CGRectMake(22, 105, 275, 260)];
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressAuthorizeSuccessBackground"]]];
        [[self layer] setCornerRadius:5.0];
        
        CGRect frame = [self frame];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        [titleLabel setText:titleString];
        [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:19.3]];
        CGSize size = [[titleLabel text] sizeWithFont:[titleLabel font]];
        [titleLabel setFrame:CGRectMake(20, 12, frame.size.width - 16 * 2, size.height * 3)];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel setNumberOfLines:3];
        
        [self addSubview:titleLabel];
        [titleLabel release];
        
        frame = [titleLabel frame];
        
        UILabel *contentLabel = [[UILabel alloc] init];
        [contentLabel setText:contentString];
        [contentLabel setFont:[UIFont fontWithName:@"Helvetica" size:19.3]];
        size = [[contentLabel text] sizeWithFont:[contentLabel font]];
        [contentLabel setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 24, size.width, size.height * 3)];
        [contentLabel setNumberOfLines:3];
        [contentLabel setBackgroundColor:[UIColor clearColor]];
        
        [self addSubview:contentLabel];
        [contentLabel release];        
        
        UIButton *submitButton = [[UIButton alloc] init];
        [submitButton setFrame:CGRectMake(80, 200, 115, 38)];
        [submitButton setTitle:@"确定" forState:UIControlStateNormal];
        [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [submitButton setBackgroundImage:[UIImage imageNamed:@"BoCPressAuthorizeOKButtonBackground"] forState:UIControlStateNormal];
        [submitButton addTarget:self action:@selector(handleSubmitButtonPressedEvent:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:submitButton];
        [submitButton release];
    }
    
    return self;
}

- (void)handleSubmitButtonPressedEvent: (id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_finishedShowVIPAuthorizeSuccessView object:self];
}

@end
