//
//  BoCPressRemoteNotificationListPage.m
//  BoCPress
//
//  Created by E-Reach Administrator on 2/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressRemoteNotificationListPage.h"

#import "BoCPressRemoteNotificationDataSource.h"

#import "BoCPressConstant.h"

#import "BoCPressNotificationDefines.h"

#import "NSDate+getStringOfYearMonthDay.h"

#import "BoCPressRemoteNotificationListPagePrivateHandler.h"

#import "BoCPressServerPushNotification.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressRemoteNotificationListPage

- (id)initWithLastPage: (id<BoCPressPage>)lastPage 
            dataSource: (id<BoCPressRemoteNotificationDataSource>)dataSource
{
    if ((self = [super init]))
    {
        [self setLastPage: lastPage];
        
        [self setPageTitle: @"推送消息中心"];
        
        _dataSource = [dataSource retain];
        
        _remoteNotifications = [[NSMutableArray alloc] init];
        
        _handler = [[BoCPressRemoteNotificationListPagePrivateHandler alloc] initWithRemoteNotificationContentPage: self
                                                                                               remoteNotifications: _remoteNotifications];
        
        _contentView = [[UITableView alloc] initWithFrame: CGRectZero
                                                    style: UITableViewStylePlain];
        [_contentView setDataSource: (BoCPressRemoteNotificationListPagePrivateHandler *)_handler];
        [_contentView setDelegate: (BoCPressRemoteNotificationListPagePrivateHandler *)_handler];
        
        [self addSubview: _contentView];
        
        
        NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"NO", @"hide",
                                  @"编辑", @"title", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_NavigationBar_setRemoteNotificationButtonHidden
                                                            object: self
                                                          userInfo: userInfo];
        [userInfo release];
        
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
    
    [_handler cancelAllCallback];
    [_handler release];
    [_contentView release];
    [_dataSource release];
    [_remoteNotifications release];
    
    [super dealloc];
}

- (BOOL)needNavigationBar
{
    return YES;
}

- (BOOL)needTabBar
{
    return NO;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = [self bounds];
    [_contentView setFrame: frame];
    
}
- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"NO", @"hide",
                              @"编辑", @"title", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_NavigationBar_setRemoteNotificationButtonHidden
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
    
    id<BoCPressServerPushNotification> notification = [_remoteNotifications objectAtIndex: [_selectedIndexPath row]];            
    [notification setHasBeenRead: YES];
    
    [_dataSource saveReadedRemoteNotificationState: _remoteNotifications];
    
    [self reloadData];
}

- (void)willBeSlidedToOtherPage
{
    [self wantToFinishDataUpdate];
    
    [self setUserInteractionEnabled: YES];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"YES", @"hide",
                              @"编辑", @"title", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_NavigationBar_setRemoteNotificationButtonHidden
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
}
- (void)willBrowseBackward
{
    [self wantToFinishDataUpdate];

    [self setUserInteractionEnabled: YES];
    
    [_contentView setEditing: NO
                    animated: YES];
    
    [self saveReadedRemoteNotificationState];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"YES", @"hide",
                              @"编辑", @"title", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_NavigationBar_setRemoteNotificationButtonHidden
                                                        object: self
                                                      userInfo: userInfo];
    
    [userInfo release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_couldBrowseBackward 
                                                        object:self 
                                                      userInfo: nil];
    
}

- (void)saveReadedRemoteNotificationState
{
    [_dataSource saveReadedRemoteNotificationState: _remoteNotifications];
}

- (void)wantToUpdateDataWithInfo:(id)info
{
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
    [_dataSource listOrderedRemoteNotificationFromServerWithCallback: _handler];
}

- (void)didUpdateData
{
    
    [self reloadData];    
    
    [super didUpdateData];
}

- (void)clearCurrentPageAfterNetworkTimeOutWithInfo:(NSDictionary *)info
{
    [super didUpdateData];    
    [_remoteNotifications setArray: [_dataSource queryRemoteNotification]];
    [self reloadData];
}

- (void)updateRemoteNotificationWithData: (id)data
{
    [_dataSource storeRemoteNotificationsOfServer: data];
    [_remoteNotifications setArray: [_dataSource queryRemoteNotification]];
    
    [self wantToFinishDataUpdate];    
}

- (void)wantToDeleteRemoteNotificationAtIndex: (NSInteger)index
{
    id<BoCPressServerPushNotification> notification = [_remoteNotifications objectAtIndex: index];
    [_dataSource deleteRemoteNotification: notification];
    
    [_remoteNotifications removeObjectAtIndex: index];
    [_contentView reloadData];
    
}

- (void)reloadData
{
    [_contentView reloadData];
}

- (void)didRemoteNotificationButtonTaped
{
    if ([_contentView isEditing])
    {
        [_contentView setEditing: NO
                        animated: YES];
        
        [self saveReadedRemoteNotificationState];
    }else
    {
        [_contentView setEditing: YES 
                        animated: YES];
    }
}

- (void)wantToShowContentPageOfRemoteNotificationAtIndexPath:(NSIndexPath *)indexPath
{
    [self setUserInteractionEnabled: NO];
    
    if (_selectedIndexPath != indexPath)
    {
        [_selectedIndexPath release];
        _selectedIndexPath = [indexPath retain];
    }
    
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
    
    id<BoCPressServerPushNotification> notification = [_remoteNotifications objectAtIndex: [indexPath row]];            
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                              notification, @"notification",
                              _handler, kNetwork_CallbackObject,
                              nil];

    NSLog(@"In func:%s, line:%d", __func__, __LINE__);

    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_ViewController_wantToShowContentPageOfRemoteNotification
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
    
}

- (BOOL)respondsToRemoteNotification:(NSDictionary *)info
{
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
    [_dataSource listOrderedRemoteNotificationFromServerWithCallback: _handler];
    return YES;
}

+ (id)identity
{
    return NSStringFromClass(self);
}

- (void)didCancelledHandleErrorOfServerWithData: (NSDictionary *)data
{
    [self setUserInteractionEnabled: YES];
}

@end

