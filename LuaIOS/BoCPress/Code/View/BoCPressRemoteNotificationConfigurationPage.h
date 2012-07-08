//
//  BoCPressRemoteNotificationConfigurationPage.h
//  BoCPress
//
//  Created by E-Reach Administrator on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressMetaPage.h"

@protocol BoCPressRemoteNotificationDataSource;

@interface BoCPressRemoteNotificationConfigurationPage : BoCPressMetaPage<UIAlertViewDelegate>
{
@private
    UITableView *_contentView;
    NSArray *_columnTags;
    id<BoCPressRemoteNotificationDataSource> _dataSource;
    NSMutableDictionary *_remoteNotificationConfiguration;
    NSDictionary *_convertTable;
    
    NSMutableDictionary *_allColumnCells;
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage 
configurationFromServer: (NSDictionary *)config
            dataSource: (id<BoCPressRemoteNotificationDataSource>)dataSource;

- (void)didUpdateRemoteNotificationWithData: (id)data;

- (void)didUpdateRemoteNotificationDeadLineWithData: (NSDictionary *)data;

- (NSString *)columnNameOfIdentity: (id)identity;

- (void)wantToUpdateDeadLineToRow: (NSInteger)row;

- (NSString *)readableNameOfColumn: (NSString *)columnName;

@end
