//
//  BoCPressRemoteNotificationDataSource.h
//  BoCPress
//
//  Created by E-Reach Administrator on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BoCPressDataSource;
@protocol BoCPressServerPushNotification;
@protocol BoCPressColumn;
@protocol BoCPressCallback;

@protocol BoCPressRemoteNotificationDataSource<NSObject>

- (void)setColumn: (id)tag notificationEnable: (BOOL)enable
     withCallback: (id<BoCPressCallback>)callback;

- (void)restoreConfigurationOfColumn: (id)columnTag
                          lastStatus: (BOOL)lastStatus;

- (void)storeRemoteNotificationConfiguration:(NSDictionary *)remoteNotificationConfiguration;

- (NSArray *)queryRemoteNotification;

- (void)deleteRemoteNotification: (id<BoCPressServerPushNotification>)notification;

- (void)saveReadedRemoteNotificationState: (NSArray *)modifiedNotifications;

- (void)setRemoteNotificationDeadLine: (id)deadLine
                         withCallback: (id<BoCPressCallback>)callback;

- (id<BoCPressColumn>)queryIdentitedObjectWithID: (id)identity;

- (NSDictionary *)loadRemoteNotificationConfiguration;

- (void)listOrderedRemoteNotificationFromServerWithCallback: (id<BoCPressCallback>)callback;

- (void)storeRemoteNotificationsOfServer: (NSArray *)remoteNotifications;

- (void)deleteOldRemoteNotificationBeforeDeadLine: (NSString *)deadLine;

- (void)restoreDeadLineOfConfigurationWithValue: (id)oldValue;

@end

@interface BoCPressRemoteNotificationDataSource : NSObject<BoCPressRemoteNotificationDataSource>
{
    id<BoCPressDataSource> _rootDataSource;
}

- (id)initWithService: (id<BoCPressDataSource>)dataSource;

@end
