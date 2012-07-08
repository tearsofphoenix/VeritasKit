//
//  BoCPressMoreHomeDataSource.m
//  BoCPress
//
//  Created by LeixSnake on 10/17/11.
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

#import "BoCPressMoreHomeDataSource.h"

#import "BoCPressDataSource.h"

@implementation BoCPressMoreHomeDataSource

- (id)initWithService: (id<BoCPressDataSource>)dataSource
{
    if ((self = [super init]))
    {
        _rootDataSource = dataSource;
    }
    return self;
}

- (id)userPrivateInfo
{
    return [_rootDataSource getUserInfo];
}

- (void)getRemoteNotificationConfigurationWithCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource getRemoteNotificationConfigurationWithCallback: callback];
}

- (NSUInteger)numberOfNewRemoteNotification
{
    return [_rootDataSource numberOfNewRemoteNotification];
}

@end
