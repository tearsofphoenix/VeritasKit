//
//  BoCPressRemoteNotificationConfigurationPage.m
//  BoCPress
//
//  Created by E-Reach Administrator on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressRemoteNotificationConfigurationPage.h"

#import "BoCPressRemoteNotificationDataSource.h"

#import "BoCPressConstant.h"

#import "BoCPressColumn.h"

#import "BoCPressEntry.h"

#import "BoCPressRemoteNotificationConfigurationPrivateHandler.h"

#import "BoCPressRemoteNotificationConfigurationCell.h"

static NSString *BoCPress_convertColumnNameToReadableName(NSDictionary *_convertTable, NSString *name)
{
    NSString *newName = [_convertTable objectForKey: name];
    if (newName)
    {
        return newName;
    }
    
    return name;
}

static void BoCPress_initNameConvertTable(NSDictionary **_convertTable)
{
    NSDictionary *convertTable = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"资讯", @"news",
                                  @"观点", @"opinion",
                                  @"消息保存时间", @"keep_days",
                                  @"一周", @"week_1",
                                  @"一月", @"month_1",
                                  @"三月", @"month_3"
                                  , nil];
    *_convertTable = convertTable;
}


@implementation BoCPressRemoteNotificationConfigurationPage

- (id)initWithLastPage: (id<BoCPressPage>)lastPage 
configurationFromServer: (NSDictionary *)config
            dataSource: (id<BoCPressRemoteNotificationDataSource>)dataSource
{
    if ((self = [super init]))
    {
        [self setPageTitle: @"通知"];
        [self setLastPage: lastPage];
        
        BoCPress_initNameConvertTable(&_convertTable);
        _dataSource = [dataSource retain];
        _columnTags = [[config objectForKey: kType_Global_NSArray] retain];
        
        _remoteNotificationConfiguration = [[NSMutableDictionary alloc] initWithDictionary: config];
        [_dataSource storeRemoteNotificationConfiguration: _remoteNotificationConfiguration];
        
        _allColumnCells = [[NSMutableDictionary alloc] init];
        
        _handler = [[BoCPressRemoteNotificationConfigurationPrivateHandler alloc] initWithRemoteNotificationConfigurationPage: self
                                                                                                                   columnTags: _columnTags
                                                                                              remoteNotificationConfiguration: _remoteNotificationConfiguration
                                                                                                               allColumnCells: _allColumnCells];
        
        _contentView = [[UITableView alloc] initWithFrame: CGRectZero
                                                    style: UITableViewStyleGrouped];
        [_contentView setDataSource: (BoCPressRemoteNotificationConfigurationPrivateHandler*)_handler];
        [_contentView setDelegate: (BoCPressRemoteNotificationConfigurationPrivateHandler*)_handler];
        
        [self addSubview: _contentView];
        
    }
    return self;
}

- (void)dealloc
{
    [_allColumnCells release];
    [_contentView release];
    [_dataSource release];
    [_remoteNotificationConfiguration release];
    [_columnTags release];
    [_handler release];
    [_convertTable release];

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
    
    [_contentView setFrame: [self bounds]];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != 0)
    {
        //confirm the delete and change
        NSInteger row = [alertView tag];
        NSArray *timeConfiguration = [_remoteNotificationConfiguration objectForKey: [_columnTags lastObject]];
        
        for ( id<BoCPressEntry> entryLooper in timeConfiguration)
        {
            [entryLooper setIsChosen: NO];
        }
        
        id<BoCPressEntry> newEntry = [timeConfiguration objectAtIndex: row];
        [newEntry setIsChosen: YES];
        [_dataSource setRemoteNotificationDeadLine: [newEntry name] 
                                      withCallback: _handler];
        [self reloadConfiguration];
    }
}

- (void)reloadConfiguration
{
    [_remoteNotificationConfiguration setDictionary: [_dataSource loadRemoteNotificationConfiguration]]; 
    [_contentView reloadData];
}

- (void)handleColumnNotificationSwitchChangedEvent: (id)sender
{
    NSInteger tag = [sender tag];
    UISwitch *swither = (UISwitch *)sender;
    BOOL enableRemoteNotification = [swither isOn];
    
    [self wantToShowLoadingIndicatorWithMessage: nil
                                    onsuperView: NO];
    
    [_dataSource setColumn: [NSString stringWithFormat: @"%d", tag]
        notificationEnable: enableRemoteNotification 
              withCallback: _handler];    
}

- (void)restoreConfigurationToLastStateWithData: (NSDictionary *)data
{
    NSLog(@"Fail to update remote notification configuration on server!");
    
    id columnTag = [data objectForKey: kNetwork_CallbackArgument];
    
    BOOL enable = [[data objectForKey: kRemoteNotificationPage_ColumnEnableStatus] boolValue];
    BOOL lastStatus = !enable;
    
    BoCPressRemoteNotificationConfigurationCell *cell = [_allColumnCells objectForKey: columnTag];
    [cell restoreToLastState: lastStatus];
    
    [_dataSource restoreConfigurationOfColumn: columnTag 
                                   lastStatus: lastStatus];    
}

- (void)didUpdateRemoteNotificationWithData: (id)data
{
    //if fail reset back
    //
    BOOL isSucceed = [[data objectForKey: kBoCPress_Global_ResponseStatus] boolValue];
    if (!isSucceed)
    {
        [self restoreConfigurationToLastStateWithData: data];
    }
    
    [self wantToFinishDataUpdate];
}

- (NSString *)columnNameOfIdentity: (id)identity
{
    return [[_dataSource queryIdentitedObjectWithID: identity] name];
}

- (void)wantToUpdateDeadLineToRow: (NSInteger)row
{
    
    NSArray *timeConfiguration = [_remoteNotificationConfiguration objectForKey: [_columnTags lastObject]];
    
    id<BoCPressEntry> lastChosenEntry = nil;
    for ( lastChosenEntry in timeConfiguration)
    {
        if ([lastChosenEntry isChosen])
        {
            break;
        }
    }
    
    id<BoCPressEntry> newEntry = [timeConfiguration objectAtIndex: row];
    NSInteger lastChosenIndex = [timeConfiguration indexOfObject: lastChosenEntry];
    
    NSString *startDate = BoCPress_convertColumnNameToReadableName(_convertTable, [newEntry name]);


    if (lastChosenEntry &&  (row < lastChosenIndex))
    {
        NSString *msg = [NSString stringWithFormat: @"这将会立即删除%@之前的消息，是否继续？", startDate];
        UIAlertView *alertForDeleteOldNotification = [[UIAlertView alloc] initWithTitle: @"提示"
                                                                                message: msg
                                                                               delegate: self
                                                                      cancelButtonTitle: @"取消"
                                                                      otherButtonTitles: @"确定", nil];
        [alertForDeleteOldNotification setTag: row];
        [alertForDeleteOldNotification show];
        [alertForDeleteOldNotification release];
    }else 
    {
        [newEntry setIsChosen: YES];
        [_dataSource setRemoteNotificationDeadLine: [newEntry name] 
                                      withCallback: _handler];
        [self reloadConfiguration];
    }
}

- (NSString *)readableNameOfColumn: (NSString *)columnName
{
    return BoCPress_convertColumnNameToReadableName(_convertTable, columnName);
}

- (void)clearCurrentPageAfterNetworkTimeOutWithInfo:(NSDictionary *)data
{
    id action = [data objectForKey: kNetwork_CallbackAction];
    
    if ([kCallbackAction_uploadRemoteNotificationConfiguration isEqualToString: action])
    {
        [self didUpdateRemoteNotificationWithData: data];
    }else if([kCallbackAction_uploadRemoteNotificationConfigurationDeadLine isEqualToString: action])
    {
        [self didUpdateRemoteNotificationDeadLineWithData: data];
    }
    [self didUpdateData];
}

- (void)didUpdateRemoteNotificationDeadLineWithData: (NSDictionary *)data
{
    BOOL isSucceed = [[data objectForKey: kBoCPress_Global_ResponseStatus] boolValue];
    if (!isSucceed)
    {
        id oldDeadLine = [data objectForKey: kNetwork_CallbackArgument];
        [_dataSource restoreDeadLineOfConfigurationWithValue: oldDeadLine];
    
    }else 
    {
        id newDeadLine = [data objectForKey: kObject_RemoteNotification_NewDeadLine];
        [_dataSource deleteOldRemoteNotificationBeforeDeadLine: newDeadLine];
    }
    
    [_contentView reloadData];
}
@end
