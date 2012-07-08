//
//  BoCPressNormalAccountRegisterDataSource.m
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

#import "BoCPressNormalAccountRegisterDataSource.h"

#import "BoCPressCallback.h"

#import "BoCPressDataSource.h"

#import "BoCPressConstant.h"

@implementation BoCPressNormalAccountRegisterDataSource

- (id)initWithService:(id<BoCPressDataSource>)rootDataSource
{
    if ((self = [super init]))
    {
        _rootDataSource = rootDataSource;
    }
    return self;
}

- (void)registerNormalAccountWithEmail:(NSString *)accountName 
                              password:(NSString *)password 
                              callback:(id<BoCPressCallback>)callback
{
    [_rootDataSource registerNormalAccountWithEmail:accountName
                                           password:password 
                                           callback:callback];
}

- (BOOL)isEnableEmailAsAccountName
{
    return [_rootDataSource isEnableEmailAsAccountName];
}

- (void)getProtocolContentWithCallback:(id<BoCPressCallback>)callback
{
    [_rootDataSource getPromptMessageWithArgument:kPromptMessage_Register
                                         callback:callback];
}

- (void)storeUserInfo:(id)userInfo
{
    [_rootDataSource storeUserInfo:userInfo];
}

@end
