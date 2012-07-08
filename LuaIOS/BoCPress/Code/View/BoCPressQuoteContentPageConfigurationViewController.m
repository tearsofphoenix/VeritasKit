//
//  BoCPressQuoteContentPageConfigurationViewController.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/8/11.
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

#import "BoCPressQuoteContentPageConfigurationViewController.h"

#import "BoCPressChartImageConfiguration.h"

#import "BoCPressConstant.h"

#import "BoCPressEntry.h"

@implementation BoCPressQuoteContentPageConfigurationViewController

#pragma mark - Initialization

- (id)initWithSections: (NSArray *)sections
                groups: (NSDictionary *)groups
chartImageConfiguration: (BoCPressChartImageConfiguration *)chartImageConfiguration
{
    
    if ((self = [super initWithStyle:UITableViewStyleGrouped])) 
    {
        
        _chartImageConfiguration = chartImageConfiguration;
        
        _sections = sections;
        _groups = groups;
        
        _cells = [[NSMutableDictionary alloc] init];
    }
    return self;
}
- (void)dealloc
{
    NSLog(@"dealloc configuration");
    
    [_cells release];
    
    [super dealloc];
    
    
}
#pragma mark - View lifecycle

- (void)viewDidLoad 
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor clearColor]];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    // Return the number of sections.
    return [_sections count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section < [_sections count])
    {
        return  [_sections objectAtIndex:section];
    }else
    {
        return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    if (section < [_sections count])
    {        
        NSString *sectionTitle = [_sections objectAtIndex:section];
        return [[_groups objectForKey:sectionTitle] count];
    }else
    {
        return 0;
    }
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    UITableViewCell *cell = [_cells objectForKey:indexPath];
    if (cell) 
    {
        return cell;
    }else
    {        
        cell = [[UITableViewCell alloc] init];
        
        NSUInteger sectionIndex = [indexPath indexAtPosition:0];
        NSString *sectionTitle = nil;
        if (sectionIndex < [_sections count])
        {
            sectionTitle = [_sections objectAtIndex:sectionIndex];
        }
        NSArray *contents = [_groups objectForKey:sectionTitle];
        
        NSUInteger rowIndex = [indexPath indexAtPosition:1];
        
        if (rowIndex < [contents count]) 
        {
            BoCPressEntry *entry = [contents objectAtIndex:rowIndex];
            NSString  *rowContent = [entry name];
            if ([entry isChosen])
            {
                [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
            }else
            {
                [cell setAccessoryType:UITableViewCellAccessoryNone];
            }
            [[cell textLabel] setText:rowContent];
            
        }
        
        
        
        [_cells setObject:cell forKey:indexPath];
        
        return [cell autorelease];
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // Navigation logic may go here. Create and push another view controller.
    for (NSIndexPath *indexPathLooper in [_cells allKeys]) 
    {
        if ([indexPathLooper indexAtPosition:0] == [indexPath indexAtPosition:0]
            && indexPathLooper != indexPath)
        {
            UITableViewCell *cellInSameSection = [_cells objectForKey:indexPathLooper];
            
            [cellInSameSection setAccessoryType:UITableViewCellAccessoryNone];
            
            NSInteger sectionIndex = [indexPath indexAtPosition:0];
            if (sectionIndex < [_sections count])
            {
                NSString  *sectionTitle = [_sections objectAtIndex:sectionIndex];
                NSArray *contents = [_groups objectForKey:sectionTitle];
                for (BoCPressEntry *entryLooper in contents) 
                {
                    [entryLooper setIsChosen:NO];
                }
            }
        }
    }
    
    UITableViewCell *selectedCell = [_cells objectForKey:indexPath];
    [selectedCell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    NSInteger sectionIndex = [indexPath indexAtPosition:0];
    if (sectionIndex < [_sections count])
    {
        NSString  *sectionTitle = [_sections objectAtIndex:sectionIndex];
        NSArray *contents = [_groups objectForKey:sectionTitle];
        NSInteger rowIndex = [indexPath indexAtPosition:1];
        
        if (rowIndex < [contents count]) 
        {
            BoCPressEntry *selectedContent = [contents objectAtIndex:rowIndex];
            [selectedContent setIsChosen:YES];
            switch (sectionIndex)
            {

                case 0:
                {
                    [_chartImageConfiguration storeConfiguration:[selectedContent internalName] forKey:@"type"];
                    break;
                }
                case 1:
                {
                    [_chartImageConfiguration storeConfiguration:[selectedContent internalName] forKey:@"points"];
                    break;
                }
                case 2:
                {
                    [_chartImageConfiguration storeConfiguration:[selectedContent internalName] forKey:@"analyses"];
                    break;
                }
                default:
                {
                    break;
                }
            }

        }
    }
}

@end
