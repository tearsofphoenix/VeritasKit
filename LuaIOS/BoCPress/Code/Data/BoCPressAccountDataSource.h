//
//  BoCPressAccountDataSource.h
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

#import <Foundation/Foundation.h>

@protocol BoCPressAccountService;
@protocol BoCPressUserInfoService;
@protocol BoCPressConfigurationService;
@protocol BoCPressCallback;

@protocol BoCPressAccountDataSource<NSObject>

#pragma mark - login

- (void)loginWithUserName:(NSString *)userName
                 password: (NSString *)password
                 callback: (id<BoCPressCallback>)callback;

- (void)storeUserInfo:(id)userInfo;

- (id)userPrivateInfo;

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback;
#pragma mark - logout

- (void)didLogoutCurrentUser;

- (void)wantToLogoutCurrentUserWithCallback: (id<BoCPressCallback>) callback;


#pragma mark - email hide flag

- (BOOL)isEnableEmailAsAccountName;

#pragma mark - change password

- (void)changeOldPassword:(NSString *)oldPassword 
            toNewPassword:(NSString *)newPassword
                 callback:(id<BoCPressCallback>)callback;

- (void)didChangedToNewPassword: (NSString *)newPassword
                       callback: (id<BoCPressCallback>)callback;

#pragma mark - reset password

- (void)wantToResetPasswordWithEmail: (NSString *)email
                            callback: (id<BoCPressCallback>)callback;

- (void)didResetPasswordWithCallback: (id<BoCPressCallback>)callback;

@end

@interface BoCPressAccountDataSource : NSObject<BoCPressAccountDataSource>
{
    id<BoCPressAccountService> _accountService;
    id<BoCPressUserInfoService> _userInfoService;
    id<BoCPressConfigurationService> _configurationService;
}

- (id)initWithService: (id<BoCPressAccountService>)accountService
      userInfoService: (id<BoCPressUserInfoService>)userInfoService
 configurationService: (id<BoCPressConfigurationService>)configurationSerice;

@end
