#import "BoCPressNewsListPage.h"

#import "BoCPressNewsListDataSource.h"

#import "BoCPressColumnBarView.h"

#import "BoCPressColumn.h"

#import "BoCPressNewsListPagePrivateHandler.h"

#import "BoCPressNewsArraySlice.h"
#import "BoCPressNewsTag.h"

#import "NSMutableArray+UniqueSliceSupported.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressNewsTagColumn.h"

#import "BoCPressUpdateArrowTableView.h"

#import "BoCPressConstant.h"

#import "BoCPressNews.h"

#import "BoCPressViewConstants.h"


@implementation BoCPressNewsListPage

#pragma mark - Instance initialization

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
            dataSource: (id<BoCPressNewsListDataSource>)newsListDataSource
           superColumn: (id)column
{
    
    self = [super init];
    if (self)
    {
        _superColumn = column;
        [self setLastPage: lastPage];

        
        _newsListDataSource = [newsListDataSource retain];
        
        _news = [[NSMutableArray alloc] init];
        
        _handler = [[BoCPressNewsListPagePrivateHandler alloc] initWithListPage: self
                                                                         ofNews: _news];
        
        _contentView = [[BoCPressUpdateArrowTableView alloc] initWithSuperPage:self];
        
        [_contentView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [_contentView setBackgroundColor: [UIColor clearColor]];
        [_contentView setDelegate: (BoCPressNewsListPagePrivateHandler*)_handler];
        [_contentView setDataSource: (BoCPressNewsListPagePrivateHandler*)_handler];
        
        [self addSubview:_contentView];
        
        _animationInfo = nil;
        _heightsOfCells = [[NSMutableArray alloc] init];
    }
    
    return self;
}

#pragma mark - Memory management

- (void)dealloc
{
    
    [_heightsOfCells release];
    [_newsListDataSource release];
    
    [_news release];
    
    [_handler release];
    [_contentView setSuperPage:nil];
    [_contentView release];
        
    [super dealloc];
}

- (id)column
{
    return [_newsListDataSource newsTag];
}

- (id)superColumn
{
    return _superColumn;
}

#pragma mark - Page parameters

- (NSString *)pageTitle
{
    return [[_newsListDataSource newsTag] name];
}

- (BOOL)needNavigationBar
{
    return YES;
}

- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    if(!_dataLoading)
    {
        [_handler activeAllCallback];
         [self wantToUpdateDataWithInfo: animationInfo];       
    }
}

#pragma mark - Data updating

- (void)hideContentView
{
    CGRect frame = [_contentView frame];
    if (_hasSetOriginFrame)
    {
        ;
    }else
    {
        _originFrameOfContentView = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        _hasSetOriginFrame = YES;
    }
    frame.origin.y = - frame.size.height;
    [_contentView setFrame:frame];
}

- (void)showContentView
{
    [UIView animateWithDuration: 0.5
                     animations: (^{
                                    [_contentView setFrame:[self bounds]];
                                 })
     ];
}

- (void)wantToUpdateDataWithInfo:(id)animationInfo
{
    [self setUserInteractionEnabled: YES];
    
    [_animationInfo release];
    _animationInfo = [animationInfo retain];
    
    [_contentView reloadData];
    
    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
    {
        [self hideContentView];
    }
    
            [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];

    id<BoCPressColumn> column = [self column];
    [_newsListDataSource listOrderedNewsRangeFrom: 0
                                          rangeTo: [column fetchSize]
                                         callback: _handler];    
}

- (void)couldUpdateMoreData
{
            [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];

    id<BoCPressColumn> column = [self column];
    [_newsListDataSource listOrderedNewsRangeFrom: [_news count]
                                          rangeTo: [_news count] + [column fetchMoreSize]
                                         callback: _handler];
}
- (void)wantToUpdateMoreData
{
    [self couldUpdateMoreData];
}

- (void)updateContentForColumn: (BoCPressNewsArraySlice *)slice
{
    [_news updateWithArraySlice: slice];
    [_heightsOfCells removeAllObjects];
    
    for (id<BoCPressNews> newsLooper in _news)
    {        
        [_heightsOfCells addObject: [NSNumber numberWithDouble: [newsLooper perferHeight]]];
    }
    
    
    [self wantToFinishDataUpdate];
    
    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom]) 
    {
        [self showContentView];
    }else
    {
        [_contentView setFrame:[self bounds]];
        
    }
}

- (void)didUpdateData
{
    [super didUpdateData];
    
    [_contentView performSelector: @selector(reloadData)
                       withObject: nil
                       afterDelay: 0.4];
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];

    [_handler activeAllCallback];
    [[_contentView cellForRowAtIndexPath:[_contentView indexPathForSelectedRow]] setSelected:NO];
    [_contentView reloadData];
}

- (NSTimeInterval)lastUpdateTimeInterval
{
    return [_newsListDataSource lastUpdateTimeIntervalWithColumnID:[(id<NSIdentifiedObject>)_superColumn identity]];
}

- (void)showContentOfNewsWithData:(NSDictionary *)data
{
    NSUInteger indexOfSelectedCell = [[data objectForKey: kBoCPress_Global_Index] unsignedIntegerValue];
    BoCPressNewsTagColumn *pageColumn = [self column];        
    id<BoCPressNews> news = [_news objectAtIndex: indexOfSelectedCell];
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject: news forKey: kBoCPress_Global_NewsType];
    [userInfo setObject: _news forKey: @"newsList"];
    [userInfo setObject: pageColumn forKey: @"pageColumn"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadNews_inNewsList 
                                                        object: self 
                                                      userInfo: userInfo];
    
    [userInfo release];
}

- (void)wantToShowContentOfNewsAtIndex: (NSUInteger)index
{
    [self setUserInteractionEnabled: NO];
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault
                                    onsuperView: NO];
    _indexOfSelectedCell = index;


    BoCPressNewsTagColumn *pageColumn = [self column];        
    id<BoCPressNews> news = [_news objectAtIndex: _indexOfSelectedCell];
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject: news forKey: kBoCPress_Global_NewsType];
    [userInfo setObject: _news forKey: @"newsList"];
    [userInfo setObject: pageColumn forKey: @"pageColumn"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadNews_inNewsList 
                                                        object: self 
                                                      userInfo: userInfo];
    
    [userInfo release];
}

- (CGFloat)preferHeightForCellAtIndex: (NSIndexPath *)path
{
    if ([path row] < [_heightsOfCells count])
    {
        return [[_heightsOfCells objectAtIndex: [path row]] doubleValue];
        
    }else
    {
        return 69;
    }
}

- (void)didCancelledHandleErrorOfServerWithData:(NSDictionary *)info
{
    [[_contentView cellForRowAtIndexPath: [_contentView indexPathForSelectedRow]] setSelected: NO];
    [_contentView reloadData];
}
@end
