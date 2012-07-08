//
//  BoCPressRemoteNotificationDataSource.m
//  BoCPress
//
//  Created by E-Reach Administrator on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressRemoteNotificationDataSource.h"

#import "BoCPressDataSource.h"

#import "BoCPressConfigurationService.h"

#import "BoCPressConstant.h"

#import "BoCPressSharedFunctions.h"

#import "SqliteDatabase.h"
#import "SqliteDatabase(ApplicationDirectories).h"

#import "BoCPressEntry.h"

#import "BoCPressServerPushNotification.h"

#import "BoCPressNotificationDefines.h"

@implementation BoCPressRemoteNotificationDataSource

- (id)initWithService: (id<BoCPressDataSource>)dataSource
{
    if ((self = [super init]))
    {
        _rootDataSource = [dataSource retain];                           
    }
    return self;
}

- (void)dealloc
{
    [_rootDataSource release];
    
    [super dealloc];
}

- (id<BoCPressColumn>)queryIdentitedObjectWithID: (id)identity
{
    return [[_rootDataSource configuration] queryIdentitedObjectWithID: identity];
}


#pragma mark - remote notification configuration

- (void)storeRemoteNotificationConfiguration:(NSDictionary *)remoteNotificationConfiguration
{
    [_rootDataSource storeRemoteNotificationConfiguration: remoteNotificationConfiguration];
}

- (NSDictionary *)loadRemoteNotificationConfiguration
{
    return [_rootDataSource loadRemoteNotificationConfiguration];
}

- (void)setColumn: (id)tag notificationEnable: (BOOL)enable
     withCallback: (id<BoCPressCallback>)callback
{

    [_rootDataSource setColumn: tag
            notificationEnable: enable];
    
    [self uploadRemoteNotificationConfigurationOfColumn: tag
                                                 enable: enable
                                           withCallback: callback];
}


- (void)deleteOldRemoteNotificationBeforeDeadLine: (NSString *)deadLine
{
    [_rootDataSource deleteOldRemoteNotificationBeforeDeadLine: deadLine];
}

- (void)setRemoteNotificationDeadLine: (id)deadLine
                         withCallback: (id<BoCPressCallback>)callback
{

    NSString *oldDeadLine = [NSString stringWithString: [_rootDataSource getRemoteNotificationDeadLine]];
    
    [_rootDataSource setRemoteNotificationDeadLine: deadLine
                                      withCallback: callback];
    
    [_rootDataSource uploadRemoteNotificationConfigurationOfDeadline: oldDeadLine
                                                         newDeadLine: deadLine
                                                        withCallback: callback];
}

- (void)uploadRemoteNotificationConfigurationOfColumn: (id)column
                                               enable: (BOOL)enable
                                         withCallback: (id<BoCPressCallback>)callback
{
    [_rootDataSource uploadRemoteNotificationConfigurationOfColumn: column
                                                            enable: enable
                                                      withCallback: callback];
}

- (NSArray *)queryRemoteNotification
{
    return [_rootDataSource queryRemoteNotification];
}

- (void)storeRemoteNotificationsOfServer: (NSArray *)remoteNotifications
{ 
    NSArray *storedNotifications = [self queryRemoteNotification];
    
    NSMutableArray *freshNotifications = [[NSMutableArray alloc] initWithCapacity: [remoteNotifications count]];
    
    if ([storedNotifications count] == 0)
    {
        [freshNotifications setArray: remoteNotifications];
    }else 
    {
        for (id<BoCPressServerPushNotification> notificationLooper in remoteNotifications)
        {
            for (id<BoCPressServerPushNotification> storedLooper in storedNotifications)
            {
                if (! [[storedLooper identity] isEqual: [notificationLooper identity]] )
                {
                    [freshNotifications addObject: notificationLooper];
                    break;
                }
            }
        }
    }
    //    (NotificationID integer PRIMARY KEY UNIQUE,TimeStamp double,MessageTitle text,MessageContent text,PlannedSendDateTime text,PushType text,Status text,StatusLastUpdateDate text,TargetDeviceVersion text,TargetSoftVersion text,TargetUserEmail text,TargetUserType text, Action text,ActionArgument text, HasBeenRead text, DeleteStatus text)
    
    
    id<SQLDatabase> remoteNotificationDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS: kBoCPress_CacheDatabasePath];
    NSString *sqlString = @"insert or replace into BoCPressRemoteNotification(TimeStamp, MessageTitle, MessageContent,PlannedSendDateTime,PushType,"
    "Status,StatusLastUpdateDate,TargetDeviceVersion,TargetSoftVersion,TargetUserEmail,"
    "TargetUserType, Action, ActionArgument, HasBeenRead, DeleteStatus, NotificationID) values(?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?)";
    
    for (id<BoCPressServerPushNotification> notificationLooper in freshNotifications)
    {
        
        @autoreleasepool 
        {
            
            id<SQLStatement> insertStatement = [remoteNotificationDatabase prepareStatementForSQL: sqlString];
            
            [insertStatement setFloatParameter: 1
                                     withFloat: [NSDate timeIntervalSinceReferenceDate]];
            [insertStatement setStringParameter: 2
                                     withString: [notificationLooper messageTitle]];
            [insertStatement setIntegerParameter: 3
                                      withString: [notificationLooper messageContent]];
            [insertStatement setStringParameter: 4
                                     withString: [notificationLooper plannedSendDateTime]];
            [insertStatement setStringParameter: 5
                                     withString: [notificationLooper pushType]];
            
            
            [insertStatement setStringParameter: 6
                                     withString: [notificationLooper status]];
            [insertStatement setStringParameter: 7
                                     withString: [notificationLooper statusLastUpdate]];
            [insertStatement setStringParameter: 8
                                     withString: [notificationLooper targetDeviceVersion]];
            [insertStatement setStringParameter: 9
                                     withString: [notificationLooper targetSoftVersion]];
            [insertStatement setStringParameter: 10
                                     withString: [notificationLooper targetUserEmail]];
            
            
            [insertStatement setStringParameter: 11
                                     withString: [notificationLooper targetUserType]];
            [insertStatement setStringParameter: 12
                                     withString: [notificationLooper action]];
            [insertStatement setStringParameter: 13
                                     withString: [notificationLooper actionArgument]];
            [insertStatement setStringParameter: 14
                                     withString: @"NO"];
            [insertStatement setStringParameter: 15
                                     withString: @"NO"];
            [insertStatement setIntegerParameter: 16
                                      withString: [notificationLooper identity]];
            
            [insertStatement execute];
        }
    }
    
    [remoteNotificationDatabase release];
    
    if ([freshNotifications count] > 0)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_SoapDataSource_remoteNotificationDidChanged
                                                            object: self
                                                          userInfo: nil];
    }
    
    [freshNotifications release];
    
}

//not physicsly delete, just mark the status of the notification `DELETED'
//
- (void)deleteRemoteNotification: (id<BoCPressServerPushNotification>)notification
{
    @autoreleasepool 
    {
        id<SQLDatabase> remoteNotificationDataBase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS: kBoCPress_CacheDatabasePath];
        NSString *sqlString = @"update BoCPressRemoteNotification set DeleteStatus = ? where NotificationID = ?";
        id<SQLStatement> deleteStateMent = [remoteNotificationDataBase prepareStatementForSQL: sqlString];
        [deleteStateMent setStringParameter: 1
                                 withString: @"YES"];
        [deleteStateMent setIntegerParameter: 2
                                 withInteger: [[notification identity] intValue]];
        [deleteStateMent execute];
        
        [remoteNotificationDataBase release];
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_SoapDataSource_remoteNotificationDidChanged
                                                        object: self
                                                      userInfo: nil];
}

- (NSString *)stringToSetBadgeNumberOnServerWithBadgeNumber: (NSInteger)badgeNumber
{
    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey: kBoCPress_Global_DeviceToken];
    
    NSString *arg = formatXMLValueAndKey(deviceToken, @"token");
    arg = [arg stringByAppendingString: formatXMLValueAndKey([NSString stringWithFormat: @"%d", badgeNumber], @"badge")];
    
    return [_rootDataSource getBaseStringWithRequireType: kNetwork_setPushBadgeRequest
                                       andArgumentString: arg];
}

- (void)setBadgeNumberOfPushNotificationOnServer: (NSUInteger)badgeNumber
{
    //update badge number
    //
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: badgeNumber];
    
    NSString *requestString = [self stringToSetBadgeNumberOnServerWithBadgeNumber: badgeNumber];
    id callbackAction = kCallbackAction_setPushBadge;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callbackAction, kNetwork_CallbackAction,                                
                                  nil];
    
    [_rootDataSource postRequestString: requestString
                       andCallbackInfo: callbackInfo];
    
    [callbackInfo release];
}

- (void)saveReadedRemoteNotificationState: (NSArray *)modifiedNotifications
{
    id<SQLDatabase> saveDatabase = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS: kBoCPress_CacheDatabasePath];
    NSString *sqlString = @"update BoCPressRemoteNotification set  HasBeenRead = ? where NotificationID = ?";
    
    NSInteger notReadNotificationCount = [modifiedNotifications count];
    
    for (id<BoCPressServerPushNotification> iLooper in modifiedNotifications)
    {
        @autoreleasepool 
        {
            id<SQLStatement> saveStatement = [saveDatabase prepareStatementForSQL: sqlString];
            BOOL hasBeenRead = [iLooper hasBeenRead];
            if (hasBeenRead) 
            {
                --notReadNotificationCount;
                [saveStatement setStringParameter: 1
                                       withString: @"YES"];
            }else 
            {
                [saveStatement setStringParameter: 1
                                       withString: @"NO"];
            }
            
            [saveStatement setIntegerParameter: 2
                                   withInteger: [[iLooper identity] intValue]];
            [saveStatement execute];
        }
    }
    [saveDatabase release];
    

    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_SoapDataSource_remoteNotificationDidChanged
                                                            object: self
                                                          userInfo: nil];
   
    //upload badge number to server
    //
    [self setBadgeNumberOfPushNotificationOnServer: notReadNotificationCount];
}

- (NSInteger)getMaxRemoteNotificationID
{
    @autoreleasepool 
    {
        id<SQLDatabase> sqlConnection = [[SqliteDatabase alloc] initWithFilePathInDocumentDirectoryInIOS: kBoCPress_CacheDatabasePath];
        
        NSString *sqlString = @"select * from BoCPressRemoteNotification order by NotificationID desc";
        id<SQLStatement> statement = [sqlConnection prepareStatementForSQL: sqlString];
        [statement execute];
        id<SQLResultSet> resultSet = [statement currentResultSet];
        [resultSet moveCursorToNextRecord];
        id<SQLRecord> record = [resultSet currentRecord];

        NSInteger notificationID = [record integerValueNamed: @"NotificationID"];
        
        [sqlConnection release];
        
        return notificationID;
    }
}

- (NSString *)stringToListOrderedRemoteNotification
{
    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey: kBoCPress_Global_DeviceToken];
    
    if (!deviceToken)
    {
        deviceToken = @"58ce26fc60a9a62fc496838406329dc94dd51f88dcea0ceafd0d9f6039c2c4df";
    }
    
    NSString *args = formatXMLValueAndKey(deviceToken, @"rsvdStr1");
    NSString *maxNotificationID =  [NSString stringWithFormat: @"%d", [self getMaxRemoteNotificationID]];
    args = [args stringByAppendingString: formatXMLValueAndKey(maxNotificationID, @"rsvdLong1")];
    
    return [_rootDataSource getBaseStringWithRequireType: kNetwork_getPushNotificationListRequest
                                       andArgumentString: args];
}

- (void)listOrderedRemoteNotificationFromServerWithCallback: (id<BoCPressCallback>)callback
{
    id callbackAction = kCallbackAction_getPushNotificationList;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callbackAction, kNetwork_CallbackAction,
                                  callback, kNetwork_CallbackObject,
                                  nil];
    [_rootDataSource postRequestString: [self stringToListOrderedRemoteNotification]
                       andCallbackInfo: callbackInfo];
    [callbackInfo release];
}

- (void)restoreConfigurationOfColumn: (id)columnTag
                          lastStatus: (BOOL)lastStatus
{
    [_rootDataSource setColumn: columnTag
            notificationEnable: lastStatus];
}
- (void)restoreDeadLineOfConfigurationWithValue: (id)oldValue
{
    [_rootDataSource restoreDeadLineOfConfigurationWithValue: oldValue];
}
@end
