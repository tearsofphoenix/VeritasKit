//
//  BoCPressQuoteContentPageSecurityChooseViewController.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/22/11.
/*************************************************************************

*

* EREACH CONFIDENTIAL

* ____________________

*

* [2011] eReach Mobile Software Technology Co., Ltd.

* All Rights Reserved.

*

* NOTICE: All information contained herein is, and remains the

* property of eReach Mobile Software Technology and its suppliers,

* if any. The intellectual and technical concepts contained herein

* are proprietary to eReach Mobile Software Technology and its

* suppliers and may be covered by U.S. and Foreign Patents, patents

* in process, and are protected by trade secret or copyright law.

* Dissemination of this information or reproduction of this material

* is strictly forbidden unless prior written permission is obtained

* from eReach Mobile Software Technology Co., Ltd.

*/

#import "BoCPressQuoteContentPageSecurityChooseViewController.h"

#import "BoCPressConstant.h"

#import "BoCPressEntry.h"

#import "BoCPressBroadCastCell.h"

@implementation BoCPressQuoteContentPageSecurityChooseViewController
- (id)initWithEntries: (NSArray *)entries
             selected: (id)selected
{
    if ((self = [super init])) 
    {
        [[self tableView] setShowsVerticalScrollIndicator:NO];
        [[self tableView] setShowsHorizontalScrollIndicator:NO];

        _entries = entries;
        _pickerView = [[UIPickerView alloc] init];
        [_pickerView setDelegate:self];
        [_pickerView setDataSource:self];
        [_pickerView setShowsSelectionIndicator:YES];

        CGRect frame = CGRectMake(0, 0, 300, 216);
        [_pickerView setFrame:frame];
        
        NSUInteger index = [entries indexOfObject: selected];
        
        [_pickerView selectRow: index 
                   inComponent: 0
                      animated: YES];
        
        [[self tableView] setScrollEnabled: NO];
        
        CGSize size = frame.size;
        size.height = 180;
        [self setContentSizeForViewInPopover: size];        
    }
    
    return self;
}

- (void)dealloc
{
    
    [_pickerView release];

    [super dealloc];
}

#pragma mark - UIPicker view delegate && datasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_entries count];
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return [_pickerView frame].size.width;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row < [_entries count])
    {        
        return [[_entries objectAtIndex:row] name];
    }else
    {
        return @" ";
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (row < [_entries count])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName: kSecurityChooseViewController_didSelectedEntryAtIndex
                                                            object: self 
                                                          userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                    [NSNumber numberWithInteger:row], kBoCPress_Global_Index, nil]];
    }
}

#pragma mark - UITableViewController delegate
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_pickerView frame].size.height - 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    // Return the number of sections.
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{   
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    if (section == 0)
    {
        return 1;
    }else
    {
        return 0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ;
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    BoCPressBroadCastCell *cell = [[BoCPressBroadCastCell alloc] init];
    [cell addSubview:_pickerView];
    return [cell autorelease];
}

@end
