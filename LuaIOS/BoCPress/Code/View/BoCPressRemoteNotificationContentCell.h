//
//  BoCPressRemoteNotificationContentCell.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BoCPressServerPushNotification;

@interface BoCPressRemoteNotificationContentCell : UITableViewCell

- (id)initWithServerPushNotification: (id<BoCPressServerPushNotification>)serverPushNotification;

@end
