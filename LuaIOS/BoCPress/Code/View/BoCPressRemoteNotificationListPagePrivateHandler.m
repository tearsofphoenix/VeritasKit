//
//  BoCPressRemoteNotificationListPagePrivateHandler.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressRemoteNotificationListPagePrivateHandler.h"

#import "BoCPressConstant.h"

#import "BoCPressRemoteNotificationListPage.h"

#import "NSDate+getStringOfYearMonthDay.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressServerPushNotification.h"

#import "BoCPressRemoteNotificationContentCell.h"

@implementation BoCPressRemoteNotificationListPagePrivateHandler

- (id)initWithRemoteNotificationContentPage: (BoCPressRemoteNotificationListPage *)page
                        remoteNotifications: (NSArray *)remoteNotifications
{
    if ((self = [super init]))
    {
        _page = page;
        _remoteNotifications = remoteNotifications;
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(notificationForRemoteNotificationChanged:)
                                                     name: kNotification_SoapDataSource_remoteNotificationDidChanged
                                                   object: nil];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(notificationForDidRemoteNotificationButtonTaped:)
                                                     name: kNotification_ViewController_didRemoteNotificationButtonTaped
                                                   object: nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
    
    [super dealloc];
}

- (void)callbackForAction: (id)action 
                 withData: (id)data
{
    if (_callbackFlag)
    {
        if ([kCallbackAction_getPushNotificationList isEqualToString: action])
        {
            [_page updateRemoteNotificationWithData: data];
        }else  if([kCallbackAction_didCancelledHandleErrorOfServer isEqualToString: action])
        {
            [_page didCancelledHandleErrorOfServerWithData: data];
        }
    }
}

#pragma mark - UITableView data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_remoteNotifications count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    if (row < [_remoteNotifications count])
    {
        id<BoCPressServerPushNotification> serverNotification = [_remoteNotifications objectAtIndex: row];
        BoCPressRemoteNotificationContentCell *cell = [[BoCPressRemoteNotificationContentCell alloc] initWithServerPushNotification: serverNotification];
                
        return [cell autorelease];
    }
    
    return nil;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    if (row < [_remoteNotifications count])
    {
        [_page wantToShowContentPageOfRemoteNotificationAtIndexPath: indexPath];
    }
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    
    if (editingStyle == UITableViewCellEditingStyleDelete
        && row < [_remoteNotifications count])
    {
        [_page wantToDeleteRemoteNotificationAtIndex: row];
    }
}


- (void)notificationForRemoteNotificationChanged: (NSNotification *)notification
{
    if (_callbackFlag)
    {
        [_page reloadData];
    }
}


- (void)notificationForDidRemoteNotificationButtonTaped: (NSNotification*)notification
{
    [_page didRemoteNotificationButtonTaped];
    
}

@end
