#import "BoCPressNewsHomePage.h"

#import "BoCPressNewsHomeDataSource.h"

#import "BoCPressColumnBarView.h"

#import "BoCPressColumn.h"

#import "BoCPressNewsHomePagePrivateHandler.h"

#import "BoCPressNewsArraySlice.h"
#import "BoCPressNewsTag.h"

#import "NSMutableArray+UniqueSliceSupported.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressNewsTagColumn.h"

#import "BoCPressConstant.h"

//#import "BoCPressNewsHomeContentView.h"
#import "BoCPressNews.h"

#import "BoCPressViewConstants.h"

#import "BoCPressUpdateArrowTableView.h"

@implementation BoCPressNewsHomePage

#pragma mark - Instance initialization

- (id)initWithDataSource: (id<BoCPressNewsHomeDataSource>)newsHomeDataSource
{
    
    self = [super init];
    if (self)
    {
        [self setLastPage: nil];
        [self setPageTitle: @"资讯"];
        
        
        
        _newsHomeDataSource = [newsHomeDataSource retain];
        
        _orderedSuperColumns = [[NSMutableArray alloc] init];
        
        _columns = [[NSMutableDictionary alloc] init];
        
        _news = [[NSMutableDictionary alloc] init];
        
        _columnBar = [[BoCPressColumnBarView alloc] init];
        [_columnBar setFrame: CGRectMake(0, 0, 320, 35)];   
        [self addSubview: _columnBar];
        
        _handler = [[BoCPressNewsHomePagePrivateHandler alloc] initWithHomePage: self
                                                                      inColumns: _columns
                                                                  fromColumnBar: _columnBar
                                                                         ofNews: _news];
        
        [_columnBar setColumnDelegate: (BoCPressNewsHomePagePrivateHandler*)_handler];        
            
        _contentView = [[BoCPressUpdateArrowTableView alloc] initWithSuperPage: self];
        [_contentView setBackgroundColor: [UIColor clearColor]];
        [_contentView setSeparatorStyle: UITableViewCellSeparatorStyleNone];

        [_contentView setDelegate: (BoCPressNewsHomePagePrivateHandler*)_handler];
        [_contentView setDataSource: (BoCPressNewsHomePagePrivateHandler*)_handler];

        [self addSubview: _contentView];
        [self bringSubviewToFront:_columnBar];
        _heightsOfCells = [[NSMutableDictionary alloc] init];

        _animationInfo = nil;
        
        _userInfo = nil;
    }
    
    return self;
    
}

- (void)willSwitchToOtherTab
{
    [self didUpdateData];
}

#pragma mark - Memory management

- (void)dealloc
{
    
    [_orderedSuperColumns release];
    [_columnBar release];
    [_handler release];
    [_news release];
    [_columns release];
    [_newsHomeDataSource release];
    [_contentView release];
    [_animationInfo release];
    [_heightsOfCells release];
    
    [super dealloc];
}

#pragma mark - Page parameters

- (BOOL)needNavigationBar
{
    return YES;
}


#pragma mark - Data updating

- (void)hideContentView
{
    CGRect frame = [self bounds];
    
    frame.origin.y = - frame.size.height;
    [_contentView setFrame:frame];
}

- (void)showContentView
{
    NSLog(@"in func:%s line:%d", __func__, __LINE__);
    
    __block CGRect frame = [self bounds];
    CGRect columnFrame = [_columnBar frame];

    
    [UIView animateWithDuration: 0.3
                     animations: (^{
                                    frame.origin.y = columnFrame.origin.y + columnFrame.size.height;
                                    frame.size.height -= frame.origin.y;
                                    
                                    [_contentView setFrame: frame];
                                })
     ];
}

- (void)willBeSlidedToOtherPage
{
    [super didUpdateData];
    [_handler cancelAllCallback];
}


- (void)didUpdateData
{    
    NSLog(@"in func:%s line:%d", __func__, __LINE__);
    
    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
    {
        [self hideContentView];

        [self showContentView];
    
        [_animationInfo release];
        _animationInfo = nil;
    }
    
    [super didUpdateData];
}

- (void)wantToUpdateDataWithInfo:(id)animationInfo
{
    [_animationInfo release];    
    _animationInfo = [animationInfo retain];
    
    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
    {
        [self hideContentView];
    }

    [_newsHomeDataSource listOrderedNewsTagsWithCallback: _handler];
    
}

- (void)wantToUpdateContentDataWithInfo: (id)animationInfo
{    
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
    
    if (_animationInfo != animationInfo)
    {
        [_animationInfo release];
        _animationInfo = [animationInfo retain];
    }
    
    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
    {
        [self hideContentView];
    }
    
    _dataUpdateCounter = 0;

    BoCPressNewsTagColumn *theTryTag = [[self currentSubcolumns] objectAtIndex: 0];
    
    [_newsHomeDataSource listOrderedNewsWithTag: theTryTag
                                      rangeFrom: 0
                                        rangeTo: [theTryTag fetchSize]
                                       callback: _handler];

}

- (void)updateColumns:(NSDictionary *)data
{
    if ([data count] > 0)
    {
        NSLog(@"in func:%s line:%d", __func__, __LINE__);
        
        NSArray *orderedSuperColumns = [data objectForKey:kBoCPress_Global_OrderedKeyArray];
        
        [_orderedSuperColumns removeAllObjects];
        [_orderedSuperColumns setArray:orderedSuperColumns];
        
        NSDictionary *newsTags = [data objectForKey:@"newsTags"];
        
        [_columnBar clearColumns];
        [_columns removeAllObjects];
        
        for (id<BoCPressColumn> columnLooper in orderedSuperColumns)
        {
            [_columnBar addColumn: columnLooper];
            [_columns setObject: [newsTags objectForKey:[columnLooper identity]]
                         forKey: [columnLooper identity]];
        }
        
        id<BoCPressColumn> currentColumn = [self currentColumn];
        
        if (!currentColumn)
        {
            currentColumn =[orderedSuperColumns objectAtIndex: 0];
        }
        
        [_columnBar switchToColumn: currentColumn];
        
        if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
        {
            [self showContentView];
        }
        [_animationInfo release];
        _animationInfo = nil;

    }
}

#pragma mark - Column settings

- (BoCPressNewsTagColumn *)currentColumn
{    
    NSUInteger currentIndex = [_columnBar currentColumnIndex];

    if (currentIndex >= [_columns count])
    {
        currentIndex = 0;
    }
    
    if (currentIndex < [_orderedSuperColumns count])
    {
        return [_orderedSuperColumns objectAtIndex: currentIndex];
    }else 
    {
        return nil;
    }
}

- (NSArray *)currentSubcolumns
{
    NSArray *ret = [_columns objectForKey: [[self currentColumn] identity]];                             
    if ([ret count] == 0)
    {
        id currentColumn = [self currentColumn];
        if (currentColumn)
        {
            return [NSArray arrayWithObject: [self currentColumn]];
        }else 
        {
            return [NSArray array];
        }
    }
    return ret;
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{   
    [[_contentView cellForRowAtIndexPath: [_contentView indexPathForSelectedRow]] setSelected: NO];
    [_contentView reloadData];
    [_handler activeAllCallback];
    
    BOOL couldExecuteCallbackInfo = [[info objectForKey: kBoCPress_AttachedCallbackInfo_couldExecute] boolValue];
    
    NSDictionary *callbackInfo = [_attachedCallbackInfos objectForKey: kBoCPress_AttachedCallbackInfoTypeExecuteWhenDidBeenBackwardFromLastPage];
    if (callbackInfo && couldExecuteCallbackInfo)
    {
        id<BoCPressCallback> callback = [callbackInfo objectForKey: kNetwork_CallbackObject];
        id callbackAction = [callbackInfo objectForKey: kNetwork_CallbackAction];
        [callback callbackForAction: callbackAction
                           withData: callbackInfo];
    }
}

- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    if(!_dataLoading)
    {
        [self didUpdateData];
        [self wantToReloadColumns];
        
        [self wantToUpdateContentDataWithInfo: animationInfo];
    }
}

- (void)wantToReloadColumns
{
    [_newsHomeDataSource reloadColumnsWithCallback:_handler];
}

- (void)reloadColumnsWithData: (id)data
{
    if (data)
    {
        
        NSUInteger currentColumnIndex = [_columnBar currentColumnIndex];
        
        CGPoint currentContentOffset = [_columnBar contentOffset];
        CGPoint storedContentOffset = CGPointMake(currentContentOffset.x, currentContentOffset.y);
        
        
        
        NSArray *orderedSuperColumns = [data objectForKey:kBoCPress_Global_OrderedKeyArray];
        
        [_orderedSuperColumns setArray:orderedSuperColumns];
        
        NSDictionary *newsTags = [data objectForKey:@"newsTags"];
        
        [_columnBar clearColumns];
        [_columns removeAllObjects];
        
        
        for (id<BoCPressColumn> columnLooper in orderedSuperColumns)
        {
            [_columnBar addColumn: columnLooper];
            [_columns setObject:[newsTags objectForKey:[columnLooper identity]] forKey:[columnLooper identity]];
        }
        
        
        [_columnBar setCurrentColumnIndex:currentColumnIndex];
        [_columnBar setContentOffset:storedContentOffset];
    }
    
}

- (void)didReceivedErrorFromServerWithInfo:(NSDictionary *)info
{
    [super didUpdateData];
}

- (void)didCancelledHandleErrorOfServerWithData:(NSDictionary *)info
{
    [[_contentView cellForRowAtIndexPath: [_contentView indexPathForSelectedRow]] setSelected: NO];
    [_contentView reloadData];
    [_animationInfo release];
    _animationInfo = nil;
}


- (void)updateNewsArraySlice:(BoCPressNewsArraySlice *)slice
{
    
    BoCPressNewsTagColumn* column = (BoCPressNewsTagColumn*)[slice newsTag];

    NSArray *subColumns = [self currentSubcolumns];
    if ([subColumns indexOfObject: column] == NSNotFound)
    {
        //discard data that is belong to not current column
        //
        return;
    }
    
    NSMutableArray *newsList = [_news objectForKey: [column identity]];
    NSMutableArray *heights = [_heightsOfCells objectForKey: [column identity]];
    
    if (!newsList)
    {
        newsList = [NSMutableArray array];
        [_news setObject: newsList
                  forKey: [column identity]];        
    }
    
    if (!heights)
    {
        heights = [[NSMutableArray alloc] init];
        [_heightsOfCells setObject: heights
                            forKey: [column identity]];
        [heights release];
    }
    
    [newsList updateWithArraySlice: slice];
    [heights removeAllObjects];
    
    for (id<BoCPressNews> newsLooper in newsList)
    {
        [heights addObject: [NSNumber numberWithDouble: [newsLooper perferHeight]]];
    }
    
    
    ++_dataUpdateCounter;
    
    if (_dataUpdateCounter == [subColumns count])
    {        
        NSLog(@"updated!");
        _dataUpdateCounter = 0;
        [_contentView reloadData];
        [self wantToFinishDataUpdate];        
        
    }else if(1 == _dataUpdateCounter)
    {
        //the try is ok, so update the reset 
        //
        //ok, so try to get the rest columns
        //
        for (NSUInteger iLooper = 1; iLooper < [subColumns count]; ++iLooper)
        {
            
            BoCPressNewsTagColumn *theTryTag = [subColumns objectAtIndex: iLooper];
            
            [_newsHomeDataSource listOrderedNewsWithTag: theTryTag
                                              rangeFrom: 0
                                                rangeTo: [theTryTag fetchSize]
                                               callback: _handler];
        }
    }
}


- (CGFloat)preferHeightForCellAtIndex: (NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSArray *subColumns = [self currentSubcolumns];
    if (section < [subColumns count])
    {
        id<BoCPressNewsTag> subColumn = [subColumns objectAtIndex: section];
        
        NSArray *heights = [_heightsOfCells objectForKey: [subColumn identity]];
        if (row < [heights count])
        {        
            return [[heights objectAtIndex: [indexPath row]] doubleValue];        
        }
    }
    
    return 69;
    
}

- (void)wantToShowContentOfNewsAtIndex: (NSIndexPath *)indexPath
{
    [self setUserInteractionEnabled: NO];
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault
                                         onsuperView: NO];
        
    NSArray *subColumns = [self currentSubcolumns];
    BoCPressNewsTagColumn* subColumn = [subColumns objectAtIndex: [indexPath section]];
    
    id<BoCPressNews> news = [[_news objectForKey: [subColumn identity]] objectAtIndex: [indexPath row]];
    NSArray *newsList = [_news objectForKey: [subColumn identity]];
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject: news forKey: kBoCPress_Global_NewsType];
    [userInfo setObject: newsList forKey: @"newsList"];
    [userInfo setObject: subColumn forKey: @"pageColumn"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadNews_inNewsList 
                                                        object: self 
                                                      userInfo: userInfo];
    
    [userInfo release];
}

- (void)wantToUpdateMoreDataWithInfo: (id)info
{
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                         onsuperView: NO];
    
    NSArray *subColumns = [self currentSubcolumns];
    BoCPressNewsTagColumn* column = [subColumns objectAtIndex:0];    
    NSArray *news = [_news objectForKey: [column identity]];
    
    [_newsHomeDataSource listOrderedNewsWithTag: column
                                      rangeFrom: 0
                                        rangeTo: [news count] + [column fetchSize]
                                       callback: _handler];        
    
}

- (NSTimeInterval) lastUpdateTimeInterval
{
    return [_newsHomeDataSource lastUpdateTimeIntervalWithColumnID: [[self currentColumn] identity]];;
}


- (void)wantToShowContentOfColumn: (BoCPressNewsTagColumn *)column
{    
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                  column, @"newsTag",
                                  _handler, kNetwork_CallbackObject,
                                  @"wantToShowContentOfColumn", kNetwork_CallbackAction,
                                  nil];
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadListOfNews 
                                                        object: self 
                                                      userInfo: callbackInfo];
    
    [callbackInfo release];
}

- (void)willHandleErrorOfServerWithData:(NSDictionary *)info
{
    [_animationInfo release];
    _animationInfo = nil;
}

@end
