//
//  BoCPressRemoteNotificationConfigurationPrivateHandler.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressRemoteNotificationConfigurationPrivateHandler.h"

#import "BoCPressRemoteNotificationConfigurationPage.h"

#import "BoCPressConstant.h"

#import "BoCPressColumn.h"

#import "BoCPressEntry.h"

#import "BoCPressRemoteNotificationConfigurationCell.h"


@implementation BoCPressRemoteNotificationConfigurationPrivateHandler

- (id)initWithRemoteNotificationConfigurationPage: (BoCPressRemoteNotificationConfigurationPage *)page
                                       columnTags: (NSArray *)columnTags
                  remoteNotificationConfiguration: (NSDictionary *)remoteNotificationConfiguration
                                   allColumnCells: (NSMutableDictionary *)allColumnCells
{
    if ((self = [super init]))
    {
        _page = page;
        _columnTags = columnTags;
        _remoteNotificationConfiguration = remoteNotificationConfiguration;
        _allColumnCells = allColumnCells;
    }
    
    return self;
}

- (void)callbackForAction: (id)action 
                 withData: (id)data
{
    if (_callbackFlag)
    {
        if ([kCallbackAction_uploadRemoteNotificationConfiguration isEqualToString: action])
        {
            [_page didUpdateRemoteNotificationWithData: data];
        }else if([kCallbackAction_uploadRemoteNotificationConfigurationDeadLine isEqualToString: action])
        {
            [_page didUpdateRemoteNotificationDeadLineWithData: data];
        }
    }
}

#pragma mark - UITableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_columnTags count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *tagName = [_columnTags objectAtIndex: section];
    NSArray *subConfigurations = [_remoteNotificationConfiguration objectForKey: tagName];
    return [subConfigurations count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *tagName = [_columnTags objectAtIndex: section];
    return [_page readableNameOfColumn: tagName];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = nil;
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSArray *configOfColumn = [_remoteNotificationConfiguration objectForKey: [_columnTags objectAtIndex: section]];
    
    if (section < [_columnTags count] - 1)
    {        
        
        id<BoCPressEntry> entry = [configOfColumn objectAtIndex: row];
        BOOL enable = [entry isChosen];
        id entryIdentity = [entry identity];
                
        cell = [[BoCPressRemoteNotificationConfigurationCell alloc] initWithTag: [entryIdentity integerValue]
                                                                    switchState: enable
                                                                         target: _page
                                                                         action: @selector(handleColumnNotificationSwitchChangedEvent:)];
        
        NSString *columnName = [_page columnNameOfIdentity: entryIdentity];
        [[cell textLabel] setText: columnName];
        
        [_allColumnCells setObject: cell
                            forKey: entryIdentity];

    }else 
    {

        //time configuration
        //
        cell = [[UITableViewCell alloc] init];
        [cell setSelectionStyle: UITableViewCellSelectionStyleNone];
        
        id<BoCPressEntry> entry = [configOfColumn objectAtIndex: row];
        
        [[cell textLabel] setText: [_page readableNameOfColumn: [entry name]]];
        
        if ([entry isChosen])
        {
            [cell setAccessoryType: UITableViewCellAccessoryCheckmark];
        }else 
        {
            [cell setAccessoryType: UITableViewCellAccessoryNone];
        }
    }
    
    return [cell autorelease];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    
    if (section == [_columnTags count] - 1)
    {        
        NSInteger row = [indexPath row];
        

        [_page wantToUpdateDeadLineToRow: row];
    }
}

@end
