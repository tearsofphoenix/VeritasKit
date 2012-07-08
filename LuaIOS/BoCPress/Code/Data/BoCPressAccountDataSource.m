//
//  BoCPressAccountDataSource.m
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

#import "BoCPressAccountDataSource.h"

#import "BoCPressAccountService.h"
#import "BoCPressUserInfoService.h"
#import "BoCPressConfigurationService.h"

#import "BoCPressCallback.h"
#import "BoCPressConstant.h"

@implementation BoCPressAccountDataSource

- (id)initWithService: (id<BoCPressAccountService>)accountService
      userInfoService: (id<BoCPressUserInfoService>)userInfoService
 configurationService: (id<BoCPressConfigurationService>)configurationSerice
{
    if ((self = [super init]))
    {
        _accountService = accountService;
        _userInfoService = userInfoService;
        _configurationService = configurationSerice;
    }
    
    return self;
}

- (void)loginWithUserName:(NSString *)userName
                 password: (NSString *)password
                 callback:(id<BoCPressCallback>)callback
{
    [_accountService loginWithUserName: userName
                              password: password
                              callback: callback];
}

- (void)wantToLogoutCurrentUserWithCallback: (id<BoCPressCallback>) callback
{
    [_accountService wantToLogoutCurrentUserWithCallback: callback];
}

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback
{
    [_accountService getUserInfoFromServerWithInfo: info
                                          callback: callback];
}

- (void)storeUserInfo:(id)userInfo
{
    [_userInfoService storeUserInfo:userInfo];
}

- (void)didLogoutCurrentUser
{
    NSLog(@"log out!");
    [_userInfoService clearUserInfo];
}

- (id)userPrivateInfo
{
    return [_userInfoService userInfo];
}

- (BOOL)isEnableEmailAsAccountName
{
    return [[_configurationService queryConfigurationWithTag:kAppStore_boc_enable_email_as_account] boolValue];
}


- (void)changeOldPassword:(NSString *)oldPassword 
            toNewPassword:(NSString *)newPassword
                 callback:(id<BoCPressCallback>)callback
{
    [_accountService changeOldPassword: oldPassword
                         toNewPassword: newPassword
                              callback: callback];
}

- (void)didChangedToNewPassword: (NSString *)newPassword
                       callback: (id<BoCPressCallback>)callback
{
    [_userInfoService changeUserPasswordToNewPassword: newPassword];
}

- (void)wantToResetPasswordWithEmail:(NSString *)email 
                            callback:(id<BoCPressCallback>)callback
{
    [_accountService wantToResetPasswordWithEmail: email
                                         callback: callback];
}

- (void)didResetPasswordWithCallback:(id<BoCPressCallback>)callback
{
    [_userInfoService changeUserPasswordToNewPassword: nil];
}

@end
