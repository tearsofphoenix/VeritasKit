//
//  BoCPressRemoteNotificationListPagePrivateHandler.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressCallback.h"

@class BoCPressRemoteNotificationListPage;

@interface BoCPressRemoteNotificationListPagePrivateHandler : BoCPressCallback<UITableViewDataSource, UITableViewDelegate>
{
@private
    BoCPressRemoteNotificationListPage *_page;
    NSArray *_remoteNotifications;
}

- (id)initWithRemoteNotificationContentPage: (BoCPressRemoteNotificationListPage *)page
                        remoteNotifications: (NSArray *)remoteNotifications;


@end
