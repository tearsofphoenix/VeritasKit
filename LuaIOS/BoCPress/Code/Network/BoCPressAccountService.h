//
//  BoCPressAccountService.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressMetaService.h"

@protocol BoCPressAccountService <BoCPressMetaService>

#pragma mark - user activies

- (void)loginWithUserName:(NSString *)userName
                 password: (NSString *)password
                 callback:(id<BoCPressCallback>)callback;

- (void)registerNormalAccountWithEmail: (NSString *)accountName 
                              password: (NSString *)password 
                              callback: (id<BoCPressCallback>)callback;

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback;

- (void)getProtocolContentWithCallback:(id<BoCPressCallback>)callback;

- (void)wantToLogoutCurrentUserWithCallback: (id<BoCPressCallback>) callback;

#pragma mark - find password

- (void) wantToResetPasswordWithEmail:(NSString *)email
                             callback: (id<BoCPressCallback>)callback;

#pragma mark - change password

- (void)changeOldPassword:(NSString *)oldPassword 
            toNewPassword:(NSString *)newPassword
                 callback: (id<BoCPressCallback>)callback;

- (void)getPromptMessageWithArgument: (NSString *)argument 
                            callback: (id<BoCPressCallback>)callback;

@end

@interface BoCPressAccountService : BoCPressMetaService<BoCPressAccountService>

@end

extern NSString * const BoCPressAccountServiceID;