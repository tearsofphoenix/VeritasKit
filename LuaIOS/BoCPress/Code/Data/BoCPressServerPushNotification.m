//
//  BoCPressServerPushNotification.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressServerPushNotification.h"

@implementation BoCPressServerPushNotification

@synthesize action = _action;
@synthesize actionArgument = _actionArgument;
@synthesize messageContent = _messageContent;
@synthesize messageTitle = _messageTitle;
@synthesize plannedSendDateTime = _plannedSendDateTime;
@synthesize pushType = _pushType;
@synthesize status = _status;
@synthesize statusLastUpdate = _statusLastUpdate;
@synthesize targetDeviceVersion = _targetDeviceVersion;
@synthesize targetSoftVersion = _targetSoftVersion;
@synthesize targetUserEmail = _targetUserEmail;
@synthesize targetUserType = _targetUserType;
@synthesize identity = _identity;
@synthesize hasBeenRead = _hasBeenRead;
@synthesize deleteStatus = _deleteStatus;

- (void)dealloc
{
    [_action release];
    [_actionArgument release];
    [_messageContent release];
    [_messageTitle release];
    [_plannedSendDateTime release];
    [_pushType release];
    [_status release];
    [_statusLastUpdate release];
    [_targetDeviceVersion release];
    [_targetSoftVersion release];
    [_targetUserEmail release];
    [_targetUserType release];
    [_identity release];
    
    [super dealloc];
}

@end
