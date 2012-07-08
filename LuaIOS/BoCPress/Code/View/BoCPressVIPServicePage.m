//
//  BoCPressVIPServicePage.m
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

#import "BoCPressVIPServicePage.h"

#import "BoCPressVIPServicePagePrivateHandler.h"

#import "BoCPressConstant.h"

#import "BoCPressVIPServiceDataSource.h"

#import "UIView+LoadingIndicatorView.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressVIPServicePage

- (id)initWithLastPage:(id<BoCPressPage>)lastPage
            dataSource:(id<BoCPressVIPServiceDataSource>)dataSource
{
    if ((self = [super init]))
    {
       [self setLastPage: lastPage];
        [self setPageTitle: @"获取VIP服务"];
        
        _dataSource = [dataSource retain];
        _handler = [[BoCPressVIPServicePagePrivateHandler alloc] initWithPage: self
                                                                 enableCoupon: [_dataSource enableCoupon]];
        
        UIView *backgroundView = [[UIView alloc] init ];
                                
        [backgroundView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BoCPressGetVIPServiceBackground"]]];
        [backgroundView setFrame:CGRectMake(0, 0, 320, 365)];
        
        UIImageView *infoShadowView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]];        
        [backgroundView addSubview:infoShadowView];        
        [infoShadowView release];
        
        
        _buttonGroup = [[UITableView alloc] init];
        [_buttonGroup setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [_buttonGroup setBackgroundColor: [UIColor clearColor]];
        [_buttonGroup setFrame: CGRectMake(10, 0, 320 - 10 * 2, 98)];
        [_buttonGroup setScrollEnabled: NO];

        if (![_dataSource enableCoupon])
        {
            CGRect frame = [_buttonGroup frame];
            frame.origin.y += 30;
            frame.size.height -= 30;
            [_buttonGroup setFrame: frame];
        }
        [_buttonGroup setDataSource: (BoCPressVIPServicePagePrivateHandler *)_handler];
        [_buttonGroup setDelegate: (BoCPressVIPServicePagePrivateHandler *)_handler];
        [backgroundView addSubview: _buttonGroup];
        
        CGRect frame = [_buttonGroup frame];
        _announceMentLabel = [[UITextView alloc] init];
        [_announceMentLabel setFrame:CGRectMake(17, frame.origin.y + frame.size.height + 28.5, 320 - 15 * 2, 210)];
        [_announceMentLabel setBackgroundColor:[UIColor clearColor]];
        [_announceMentLabel setFont:[UIFont fontWithName:@"Helvetica" size:19.3]];
        [_announceMentLabel setEditable: NO];
        [_announceMentLabel setTextColor:[UIColor grayColor]];
        
        [backgroundView addSubview:_announceMentLabel];
        
        [self addSubview:backgroundView];
        [backgroundView release];
    }
    
    return self;
}
- (void)dealloc
{
    [_dataSource release];
    [_handler release];
    [_announceMentLabel release];
    [_buttonGroup release];
    
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
    [_dataSource getVIPServiceAnnouncementWithCallback:_handler];
}

- (void)updatePromptMessage: (id)data
{
    [self wantToFinishDataUpdate];
    [_announceMentLabel setText:[data objectForKey:kGlobal_ProtocolContent]];
}

- (void)willBrowseBackward
{
    [self didUpdateData];
    
    [_handler cancelAllCallback];
    
    BOOL couldExecuteAttachedCallbackInfo = NO;
    NSString *dealLine = [[_dataSource userPrivateInfo] objectForKey: kUserInfo_PAY_END_DATE];
    NSLog( @"deadLine: %@", dealLine);
    
    if ([[_dataSource userPrivateInfo] count] > 0)
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

@end
