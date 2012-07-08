#import "BoCPressNewsHomePagePrivateHandler.h"

#import "BoCPressNewsHomePage.h"

#import "BoCPressNewsTag.h"

#import "BoCPressColumnBarView.h"

#import "BoCPressNews.h"

#import "BoCPressConstant.h"

#import "BoCPressNewsTagColumn.h"

#import "BoCPressViewConstants.h"

#import "BoCPressNewsHomeContentCell.h"

#import "BoCPressMoreCell.h"

@implementation BoCPressNewsHomePagePrivateHandler

#pragma mark - Instance initialization

- (id)initWithHomePage: (BoCPressNewsHomePage *)page
             inColumns: (NSDictionary *)columns
         fromColumnBar: (BoCPressColumnBarView *)columnBar
                ofNews: (NSDictionary *)news
{
    
    self = [super init];
    if (self)
    {
        _page = page;
        _columns = columns;
        _news = news;
        _columnBar = columnBar;
        _currentColumnIsMoreColumn = NO;
        _maxCount = 5;
    }
    
    return self;
    
}

#pragma mark - Table data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{    

    NSArray *subColumns = [_page currentSubcolumns];
        id identity = [(BoCPressNewsTagColumn *)[subColumns objectAtIndex: section] identity];
        
        NSUInteger count = [[_news objectForKey: identity] count];
        
        //for newest column
        if ([subColumns count] == 1)
        {
            if (count == 0)
            {
                //no data, so no `more cell'
                //
                return 0;
            }else 
            {
                return count + 1;
            }
        }
        
        if (count > _maxCount)
        {
            return _maxCount;
        }
        else
        {
            return count;
        }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_page currentSubcolumns] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    NSArray *subColumns = [_page currentSubcolumns];
    if (section < [subColumns count])
    {
        
        BoCPressNewsTagColumn *column = [subColumns objectAtIndex: section];
        NSArray *newsOfSubColumn = [_news objectForKey: [column identity]];
        if (row < [newsOfSubColumn count])
        {
            
            id<BoCPressNews> news = [newsOfSubColumn objectAtIndex: row];
            BoCPressNewsHomeContentCell *cell = [[BoCPressNewsHomeContentCell alloc] initWithNews: news];
            
            return [cell autorelease];
        }
        
        //`more cell' for newest column
        
        if ([subColumns count] == 1 &&
            row == [newsOfSubColumn count]) 
        {
            BoCPressMoreCell *cell = [[[BoCPressMoreCell alloc] init] autorelease];        
            return cell;
        }
        
    }
    
    return [[[UITableViewCell alloc] init] autorelease];
    
}

#pragma mark - Table delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{    
    if (_couldRefreshPage)
    {
        [_page wantToForceRefreshCurrentContentWithInfo: nil];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView contentOffset].y < - 41)
    {
        _couldRefreshPage = YES;
    }else
    {
        _couldRefreshPage = NO;
    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    NSArray *subColumns = [_page currentSubcolumns];

    if (section < [subColumns count])
    {
        BoCPressNewsTagColumn *column = [subColumns objectAtIndex: section];
        
        NSArray *newsOfColumn = [_news objectForKey: [column identity]];
        if (row < [newsOfColumn count])
        {               
            [_page wantToShowContentOfNewsAtIndex: indexPath];
        }
        
        //for newest column
        if ([subColumns count] == 1
            && row == [newsOfColumn count])
        {
            [_page wantToUpdateMoreDataWithInfo: nil];
        }
        
    }    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //for newest column
    //
    NSArray *subColumns = [_page currentSubcolumns];

    if ([subColumns count] == 1)
    {
        return nil;
    }
    
    if (section < [subColumns count])
    {
        NSString *imageName = @"BoCPressNewsContentViewSectionHeaderBackground";
        
        UIView *view = [[[UIView alloc] init] autorelease];
        [view setTag: section];
        
        UIImageView *imageView = [[[UIImageView alloc] initWithImage: [UIImage imageNamed: imageName]] autorelease];
        
        [view addSubview: imageView];
        
        UILabel *columnLabel = [[UILabel alloc] init];
        [columnLabel setText: [[subColumns objectAtIndex: section] name]];
        [columnLabel setBackgroundColor: [UIColor clearColor]];
        [columnLabel setTextColor: [UIColor whiteColor]];
        [columnLabel setFont: [UIFont fontWithName: @"Helvetica" size: 17]];
        CGSize size = [[columnLabel text] sizeWithFont: [columnLabel font]];
        CGRect frame;
        frame.size = size;
        frame.origin = CGPointMake(12, 8);
        [columnLabel setFrame: frame];
        
        [view addSubview: columnLabel];
        [columnLabel release];
        
        
        UIButton *moreButton = [[[UIButton alloc] init] autorelease];
        [moreButton setImage: [UIImage imageNamed: @"BoCPressNewsContentViewSectionHeaderMoreArrow"] 
                    forState: UIControlStateNormal];
        
        [moreButton setFrame: CGRectMake(295, 11.5, 15, 14)];
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget: self 
                                                                                     action: @selector(handleSectionMoreButtonTapGesture:)];
        
        [view addGestureRecognizer: recognizer];
        
        [recognizer release];
        
        [view addSubview: moreButton];
        
        return view;
        
    }else
    {
        return nil;
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSArray *subColumns = [_page currentSubcolumns];

        BoCPressNewsTagColumn *column = [subColumns objectAtIndex: section];
        
        NSArray *newsOfColumn = [_news objectForKey: [column identity]];
        
        //specialize for `newest` column
        //
        if (1 == [subColumns count]
            && row == [newsOfColumn count])
        {
            return 41;
        }
        
        CGFloat height = [_page preferHeightForCellAtIndex: indexPath];
        return height;
        
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    NSArray *subColumns = [_page currentSubcolumns];

    if ([subColumns count] == 1)
    {
        return 0;
    }
    
    return 37;
}

#pragma mark - Data source callback

- (void)callbackForAction: (id)action
                 withData: (id)data
{
    if (_callbackFlag) 
    {
        if ([kCallbackAction_listOrderedNewsTags isEqualToString: action])
        {
            [_page updateColumns: data];
            
        }else if([kCallbackAction_reloadColumnsWithTag isEqualToString:action])
        {
            [_page reloadColumnsWithData:data];
            
        }else if ([kCallbackAction_listOrderedNewsWithTag isEqualToString: action])
        {
            [_page updateNewsArraySlice: data];
            
        }else if ([kCallbackAction_tryWithPreviousCallbackActionAgainAfterServerError isEqualToString: action])
        {
            NSString *previousCallbackAction = [data objectForKey: kNetwork_CallbackStoredCallbackInfo];
            if ([previousCallbackAction isEqualToString: kCallbackAction_listOrderedNewsWithTag])
            {
                [_page didUpdateData];
                [_page wantToForceRefreshCurrentContentWithInfo: nil];
            }
        }else if ([kCallbackAction_didCancelledHandleErrorOfServer isEqualToString: action])
        {
            [_page didCancelledHandleErrorOfServerWithData: data];
        }
    }
    
}

#pragma mark - Column delegate

- (void)didColumnSwitchTo: (id<BoCPressColumn>)column
{
    _currentColumnIsMoreColumn = YES;

    [_page wantToUpdateContentDataWithInfo:[NSDictionary dictionaryWithObjectsAndKeys:kBoCPress_View_AnimationTypeTopToBottom, kBoCPress_Global_AnimationType,
                                            nil]];
}

- (void)didMoreColumnsSelected
{
    
}



#pragma mark - More button handle

- (void)handleSectionMoreButtonTapGesture: (UIGestureRecognizer *)recognizer
{
    NSUInteger columnIndex = [[recognizer view] tag];
    NSArray *subColumns = [_page currentSubcolumns];
    BoCPressNewsTagColumn *column = [subColumns objectAtIndex: columnIndex];
    
    [_page wantToShowContentOfColumn: column];
}

@end
