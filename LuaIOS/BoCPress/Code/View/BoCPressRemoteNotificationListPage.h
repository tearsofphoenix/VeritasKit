//
//  BoCPressRemoteNotificationListPage.h
//  BoCPress
//
//  Created by E-Reach Administrator on 2/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressMetaPage.h"

@protocol BoCPressRemoteNotificationDataSource;

@interface BoCPressRemoteNotificationListPage : BoCPressMetaPage
{
    UITableView *_contentView;
    id<BoCPressRemoteNotificationDataSource> _dataSource;
    NSMutableArray *_remoteNotifications;
    
    NSIndexPath *_selectedIndexPath;
        
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage 
            dataSource: (id<BoCPressRemoteNotificationDataSource>)dataSource;

- (void)updateRemoteNotificationWithData: (id)data;

- (void)wantToDeleteRemoteNotificationAtIndex: (NSInteger)index;

- (void)reloadData;

- (void)didRemoteNotificationButtonTaped;

- (void)wantToShowContentPageOfRemoteNotificationAtIndexPath: (NSIndexPath *)indexPath;

- (void)didCancelledHandleErrorOfServerWithData: (NSDictionary *)data;

+ (id)identity;

@end
