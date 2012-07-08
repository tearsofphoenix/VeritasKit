//
//  BoCPressServerPushNotification.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSIdentifiedObject.h"

//    <id>12</id>
//    <msgActionExtra>17176</msgActionExtra>
//    <msgActionType>post</msgActionType>
//    <msgContent></msgContent>
//    <msgTitle>日本将协助缅甸组建证交所--消息</msgTitle>
//    <plannedSendDateTime>2012-04-11 10:25:45</plannedSendDateTime>
//    <pushType>USER</pushType>
//    <status>DONE</status>
//    <statusLastUpdate>2012-04-11 10:27:54</statusLastUpdate>
//    <targetDeviceVersion>["all"]</targetDeviceVersion>
//    <targetSoftVersion>["all"]</targetSoftVersion>
//    <targetUserEmail></targetUserEmail>
//    <targetUserType>["all"]</targetUserType>

@protocol BoCPressServerPushNotification <NSIdentifiedObject>

@property (nonatomic, retain) NSString *action;
@property (nonatomic, retain) NSString *actionArgument;
@property (nonatomic, retain) NSString *messageContent;
@property (nonatomic, retain) NSString *messageTitle;
@property (nonatomic, retain) NSString *plannedSendDateTime;
@property (nonatomic, retain) NSString *pushType;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *statusLastUpdate;
@property (nonatomic, retain) NSString *targetDeviceVersion;
@property (nonatomic, retain) NSString *targetSoftVersion;
@property (nonatomic, retain) NSString *targetUserEmail;
@property (nonatomic, retain) NSString *targetUserType;

@property (nonatomic, retain) id identity;

@property (nonatomic) BOOL hasBeenRead;
@property (nonatomic) BOOL deleteStatus;

@end

@interface BoCPressServerPushNotification : NSObject<BoCPressServerPushNotification>

@end
