//
//  BoCPressRemoteNotificationConfigurationPrivateHandler.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressCallback.h"

@class BoCPressRemoteNotificationConfigurationPage;

@interface BoCPressRemoteNotificationConfigurationPrivateHandler : BoCPressCallback<UITableViewDataSource, UITableViewDelegate>
{
@private
    BoCPressRemoteNotificationConfigurationPage *_page;
    NSArray *_columnTags;
    NSDictionary *_remoteNotificationConfiguration;
    NSMutableDictionary *_allColumnCells;
}

- (id)initWithRemoteNotificationConfigurationPage: (BoCPressRemoteNotificationConfigurationPage *)page
                                       columnTags: (NSArray *)columnTags
                  remoteNotificationConfiguration: (NSDictionary *)remoteNotificationConfiguration
                                   allColumnCells: (NSMutableDictionary *)allColumnCells;

@end
