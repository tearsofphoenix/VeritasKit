//
//  BoCPressAccountLoginPrivateHandler.m
//  BoCPress
//
//  Created by LeixSnake on 9/19/11.
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

#import "BoCPressAccountLoginPrivateHandler.h"

#import "BoCPressConstant.h"

#import "BoCPressAccountLoginPage.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressAccountLoginPrivateHandler

- (id)initWithPage:(BoCPressAccountLoginPage *)page
{
    if ((self = [super init]))
    {
        _page = page;
    }
    
    return self;
}

- (void)callbackForAction: (id)action
                 withData: (id)data
{
    if (_callbackFlag)
    {
        if([kCallbackAction_userLogin isEqualToString:action])
        {
            [_page showLoginResult:data];
            
        }else if([kCallbackAction_userLogout isEqualToString:action])
        {
            [_page showLogoutResult:data];
            
        }else if([kCallbackAction_updateUserInfo isEqualToString:action])
        {
            NSDictionary *returnedData = [data objectForKey: @"returnedData"];
                                          
            [_page updateUserInfoWithData: returnedData];
            
        }
    }
}

#pragma mark - for login button
- (void)handlLoginButtonPressedEvent: (id)sender
{
    [_page wantToLogin];
}

- (void)wantToShowVIPAccountRegisterPageByTimer: (NSTimer *)timer
{
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToShowVIPAccountRegisterPage 
                                                        object: self 
                                                      userInfo: nil];
}

- (void)handleVIPAuthorizeButtonPressedEvent: (id)sender
{
    UITableViewCell *cell = (UITableViewCell*)[(UITapGestureRecognizer*)sender view];
    [cell setSelected: YES 
             animated: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.3
                                     target: self
                                   selector: @selector(wantToShowVIPAccountRegisterPageByTimer:) 
                                   userInfo: nil
                                    repeats: NO];

}

- (void)handleRegisterButtonPressedEvent: (id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_wantToShowNormalAccountRegisterPage object:self userInfo:nil];
}


- (void)handleFindPasswordButtonPressedEvent: (id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewcontroller_wantToShowFindPasswordPage object:self];
}



- (void)handleBuyButtonPressedEvent: (id)sender
{
    NSLog(@"want to buy card!");
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_wantToShowActivateCodePage object:self];
}

- (void)handleChangePasswordButtonPressedEvent: (id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_wantToShowChangePasswordPage object:self];
}

- (void)handleLogoutButtonPressedEvent: (id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:_page selector:@selector(wantToLogout) userInfo:nil repeats:NO];
//    [_page wantToLogout];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 36;
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
    
    switch ([indexPath section])
    {
        case 0:
        {
            [[cell textLabel] setText: @"获取VIP服务"];
            break;
        }
        case 1:
        {
            [[cell textLabel] setText:  @"修改密码"];
            break;
        }
        case 2:
        {
            [[cell textLabel] setText: @"注销"];
            break;
        }
        default:
        {
            break;
        }
    }
    
    return [cell autorelease];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath: indexPath] setSelected: NO 
                                                     animated: NO];
    switch ([indexPath section])
    {
        case 0:
        {
            [self handleVIPAuthorizeButtonPressedEvent: nil];
            break;
        }
        case 1:
        {
            [self handleChangePasswordButtonPressedEvent: nil];
            break;
        }
        case 2:
        {
            [self handleLogoutButtonPressedEvent: nil];
            break;
        }
        default:
        {
            break;
        }
    }
}
@end
