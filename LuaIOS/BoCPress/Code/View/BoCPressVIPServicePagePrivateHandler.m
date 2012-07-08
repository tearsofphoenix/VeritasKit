//
//  BoCPressVIPServicePagePrivateHandler.m
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

#import "BoCPressVIPServicePagePrivateHandler.h"

#import "BoCPressVIPServicePage.h"

#import "BoCPressConstant.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressVIPServicePagePrivateHandler

- (id)initWithPage: (BoCPressVIPServicePage *)page
      enableCoupon: (BOOL)enableCoupon
{
    if ((self = [super init]))
    {
        _page = page;
        _enableCoupon = enableCoupon;
    }
    return self;
}

- (void)handleVIPAuthorizeButtonPressedEvent: (id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToShowVIPActivateCodePage 
                                                        object: self];
}

- (void)handleBuyCardButtonPressedEvent: (id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToShowBuyCardPage 
                                                        object: self];
}

- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        if([kCallbackAction_getPromptMsg isEqualToString:action])
        {
            [_page updatePromptMessage: data];
        }
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_enableCoupon)
    {
        return 2;
    }else 
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 34;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    return [headerView autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [cell setClipsToBounds: YES];
    [cell setSelectionStyle: UITableViewCellSelectionStyleBlue];
    [[cell textLabel] setBackgroundColor: [UIColor clearColor]];
    [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
    [[cell textLabel] setTextColor: [UIColor blackColor]];
    [[cell textLabel] setFont: [UIFont fontWithName: @"Helvetica"
                                               size: 18]];
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressVIPAuthorizeButtonBackground"]];
    [cell setBackgroundView: backgroundView];
    [backgroundView release];
    
    [[cell layer] setCornerRadius:5.0];
    
    if (_enableCoupon)
    {
        switch ([indexPath section])
        {
            case 0:
            {
                [[cell textLabel] setText: @"中行贵宾用户授权"];
                break;
            }
            case 1:
            {
                [[cell textLabel] setText: @"购买VIP服务"];
                break;
            }
            default:
            {
                break;
            }
        }
        
    }else 
    {
        [[cell textLabel] setText: @"购买VIP服务"];
    }
    
    return [cell autorelease];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath: indexPath] setSelected: NO 
                                                     animated: NO];
    if (_enableCoupon)
    {
        switch ([indexPath section])
        {
            case 0:
            {
                [self handleVIPAuthorizeButtonPressedEvent: nil];
                break;
            }
            case 1:
            {
                [self handleBuyCardButtonPressedEvent: nil];
                break;
            }
            default:
            {
                break;
            }
        }
    }else 
    {
        [self handleBuyCardButtonPressedEvent: nil];
    }
}

@end
