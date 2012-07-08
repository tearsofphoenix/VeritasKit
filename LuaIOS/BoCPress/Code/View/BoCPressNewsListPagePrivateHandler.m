#import "BoCPressNewsListPagePrivateHandler.h"

#import "BoCPressNewsListPage.h"

#import "BoCPressNewsTag.h"

#import "BoCPressNews.h"

#import "BoCPressConstant.h"

#import "NSArraySlice.h"

#import "BoCPressNewsTagColumn.h"

#import "BoCPressMoreCell.h"

#import "BoCPressNewsHomeContentCell.h"

#import "BoCPressViewConstants.h"

@implementation BoCPressNewsListPagePrivateHandler

#pragma mark - Instance initialization

- (id)initWithListPage: (BoCPressNewsListPage *)page
                ofNews: (NSArray *)news
{
    
    self = [super init];
    if (self)
    {
        _page = page;
        _news = news;
        
        _callbackFlag = YES;
        _hasMoreCell = NO;
        _cells = [[NSMutableDictionary alloc] init];
    }
    
    return self;
    
}

- (void)dealloc
{
    [_cells release];
    [super dealloc];
}
#pragma mark - Data source callback

- (void)callbackForAction: (id)action
                 withData: (id)data
{
    if (_callbackFlag) 
    {
        if ([kCallbackAction_listOrderedNewsWithTag isEqualToString: action])
        {
            if ([data count] != kArraySliceMaxCount || [(NSArraySlice*)data countInSlice] == 0)
            {
                _hasMoreCell = NO;
            }else
            {
                _hasMoreCell = YES;
            }
            
            [_page updateContentForColumn: data];
        }else if([@"couldShowContentOfNews" isEqualToString: action])
        {
            [_page showContentOfNewsWithData: data];
            
        }else if ([kCallbackAction_tryWithPreviousCallbackActionAgainAfterServerError isEqualToString: action])
        {
            NSString *previousCallbackAction = [data objectForKey: kNetwork_CallbackStoredCallbackInfo];
            if ([previousCallbackAction isEqualToString: kCallbackAction_listOrderedNewsWithTag])
            {
                [_page didUpdateData];
                NSDictionary * animationInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                                kBoCPress_View_AnimationTypeTopToBottom, 
                                                kBoCPress_Global_AnimationType, nil];
                [_page wantToUpdateDataWithInfo: animationInfo];
                [animationInfo release];
            }
        }
    }
    
}
#pragma mark - Table data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_hasMoreCell)
    {
        return [_news count] + 1;
    }else
    {
        return [_news count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath indexAtPosition: 1] < [_news count])
    {
        id<BoCPressNews> news = [_news objectAtIndex: [indexPath indexAtPosition: 1]];
        BoCPressNewsHomeContentCell *cell = [[BoCPressNewsHomeContentCell alloc] initWithNews: news];
                
        return [cell autorelease];
    }else
    {
        BoCPressMoreCell *cell = [[[BoCPressMoreCell alloc] init] autorelease];        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] < [_news count])
    {
       return  [_page preferHeightForCellAtIndex: indexPath];
    }else
    {
        return 41;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger index = [indexPath indexAtPosition: 1];
    if (index < [_news count])
    {
        [_page wantToShowContentOfNewsAtIndex: index];
        
    }else
    {
        [_page wantToUpdateMoreData];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    if ([scrollView contentOffset].y < -41 )
    {
        [_page wantToUpdateDataWithInfo:nil];
    }
    
}
@end
