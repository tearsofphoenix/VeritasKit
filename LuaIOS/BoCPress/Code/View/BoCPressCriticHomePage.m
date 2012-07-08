#import "BoCPressCriticHomePage.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressColumnBarView.h"

#import "BoCPressCriticHomePagePrivateHandler.h"

#import "BoCPressCriticDataSource.h"

#import "BoCPressColumn.h"

#import "NSMutableArray+UniqueSliceSupported.h"

#import "BoCPressCriticTableView.h"

#import "BoCPressConstant.h"

#import "BoCPressAuthor.h"

#import "BoCPressUpdateArrowTableView.h"

#import "BoCPressNews.h"

#import "BoCPressViewConstants.h"

@implementation BoCPressCriticHomePage

- (id)initWithDataSource: (id<BoCPressCriticDataSource>)dataSource
{
    
    self = [super init];
    if (self)
    {        
        [self setLastPage: nil];
        [self setPageTitle:  @"观点"];
        
        _dataSource = [dataSource retain];
        
        _critics = [[NSMutableArray alloc] init];
        _columns = [[NSMutableArray alloc] init];
        
        _data = [[NSMutableDictionary alloc] init];
        
        _columnBar = [[BoCPressColumnBarView alloc] init];
        [_columnBar setFrame: CGRectMake(0, -35, 320, 35)];   
        [self addSubview: _columnBar];
        
        _handler = [[BoCPressCriticHomePagePrivateHandler alloc] initWithHomePage: self
                                                                        inColumns: _columns
                                                                    fromColumnBar: _columnBar
                                                                           ofData: _data];
        
        [_columnBar setColumnDelegate: (BoCPressCriticHomePagePrivateHandler*)_handler];        
        
        _contentView = [[BoCPressUpdateArrowTableView alloc] initWithSuperPage:self];
        
        [_contentView setBackgroundColor: [UIColor clearColor]];
        [_contentView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [_contentView setAlpha: 0.0];
        [_contentView setDelegate: (BoCPressCriticHomePagePrivateHandler*)_handler];
        [_contentView setDataSource: (BoCPressCriticHomePagePrivateHandler*)_handler];
        
        [self addSubview: _contentView];
        
        _criticView = [[BoCPressCriticTableView alloc] initWithCritics: _critics andHandler:self];
        
        [_criticView setBackgroundColor: [UIColor whiteColor]];
        
        
        [self addSubview: _criticView];
        
        [self bringSubviewToFront:_columnBar];
        
        _animationInfo = nil;
        _hasSetOriginFrame = NO;
    }
    
    return self;
    
}

- (void)dealloc
{
    
    
    [_dataSource release];
    [_critics release];
    [_columns release];
    
    [_data release];
    
    [_columnBar release];
    
    [_handler release];      
    [_contentView setSuperPage:nil];
    [_contentView release];
    
    [_criticView release];
    [_animationInfo release];
    [_currentCritic release];
    
    [super dealloc];
}

#pragma mark - page parameters
- (BOOL)needNavigationBar
{
    return YES;
}

- (void)wantToReloadColumns
{
    [_dataSource reloadColumnsWithCallback:_handler];
    
}

- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    if(!_dataLoading)
    {
        NSLog(@"in function:%s line:%d", __func__, __LINE__);
        [_handler activeAllCallback];
        [self didUpdateData];
        [self wantToReloadColumns];
        
        [self wantToUpdateContentDataWithInfo:animationInfo];
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
        
        _originFrameOfContentView.size.height = [self bounds].size.height - [_columnBar frame].size.height;
        [_contentView setFrame:_originFrameOfContentView];
    })
     ];
}

- (void)wantToUpdateDataWithInfo:(id)info
{
    [self setUserInteractionEnabled: YES];
    
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
    [_dataSource listOrderedCriticColumnsWithCallback: _handler];
    
    
}

- (void)wantToUpdateContentDataWithInfo: (id)animationInfo
{
    [self setUserInteractionEnabled: YES];

    [_contentView reloadData];
    
    [_animationInfo release];
    _animationInfo = [animationInfo retain];
    
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
    
    NSUInteger currentColumnIndex = [_columnBar currentColumnIndex];
    
    if (currentColumnIndex < [_columns count])
    {
        id<BoCPressColumn> column = [_columns objectAtIndex: currentColumnIndex];
        id columnID = [column identity];
        NSUInteger fetchSize = [column fetchSize];
        
        if ([columnID isEqualToString: kLatestCriticsID])
        {
            if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
            {
                [self hideContentView];
            }
            [_contentView setAlpha: 1];
            [_criticView setAlpha: 0];
            
            [_dataSource listLatestCriticPostRangeFrom: 0 
                                               rangeTo: fetchSize
                                          withCallback: _handler];
            
            
            
        }
        else if ([columnID isEqualToString: kFavoriteCriticsID])
        {
            if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
            {
                [self hideContentView];
            }
            [_contentView setAlpha: 1];
            [_criticView setAlpha: 0];
            
            
            [_dataSource listOrderedFavoriteCriticsRangeFrom: 0
                                                     rangeTo: fetchSize
                                                withCallback: _handler];
            
            
        }
        else if ([columnID isEqualToString: kOrderedCriticsID])
        {
            if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
            {
                CGRect frame = [_criticView frame];
                frame.origin.y = -frame.size.height;
                [_criticView setFrame:frame];
            }
            [_contentView setAlpha: 0];
            [_criticView setAlpha: 1];
            [_dataSource listOrderedCriticsRangeFrom: 0
                                             rangeTo: fetchSize
                                        withCallback: _handler];
            
        }
    }else
    {
        [self wantToUpdateDataWithInfo:nil];
    }
}

- (void)wantToUpdateMoreContentData
{
    [self setUserInteractionEnabled: YES];

    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];

    id<BoCPressColumn> currentColumn = [self currentColumn];

    id columnID = [currentColumn identity];

    NSUInteger currentCount = [[_data objectForKey: columnID] count];    
    
    
    if ([columnID isEqualToString: kLatestCriticsID])
    {
        
        [_contentView setAlpha: 1];
        [_criticView setAlpha: 0];
        
        [_dataSource listLatestCriticPostRangeFrom: currentCount 
                                           rangeTo: currentCount + [currentColumn fetchMoreSize]  
                                      withCallback: _handler];
        
    }
    else if ([columnID isEqualToString: kFavoriteCriticsID])
    {
        
        [_contentView setAlpha: 1];
        [_criticView setAlpha: 0];
        
        [_dataSource listOrderedFavoriteCriticsRangeFrom: currentCount
                                                 rangeTo: currentCount + [currentColumn fetchMoreSize]  
                                            withCallback: _handler];
        
    }
    else if ([columnID isEqualToString: kOrderedCriticsID])
    {
        
        [_contentView setAlpha: 0];
        [_criticView setAlpha: 1];
        
        [_dataSource listOrderedCriticsRangeFrom: currentCount
                                         rangeTo: currentCount + [currentColumn fetchMoreSize]
                                    withCallback: _handler];
        
    }
    
}

- (void)reloadColumnsWithData:(id)columns
{
    [self setUserInteractionEnabled: YES];

    if (columns)
    {
        NSUInteger currentColumnIndex = [_columnBar currentColumnIndex];
        
        
        [_columnBar clearColumns];
        [_columns removeAllObjects];
        
        id<BoCPressColumn> column = nil;
        for (column in columns)
        {
            [_columnBar addColumn: column];
            [_columns addObject: column];
        }
        
        [_columnBar setCurrentColumnIndex:currentColumnIndex];
        
    }
}

- (void)didUpdateData
{
    id<BoCPressColumn> column = [self currentColumn];
    id columnID = [column identity];

    if ([columnID isEqualToString: kOrderedCriticsID])
    {
        [self playAnimationOfCriticsColumn];
        
    }else
    {
        [self showContentView];
    }
    
    [super didUpdateData];
}

#pragma mark - update data

- (void)updateData: (NSArray *)columns
{
    if (columns)
    {
        
        [_contentView setFrame: [self bounds]];
        
        [UIView animateWithDuration: 0.5
                         animations: (^{
            
            [_columnBar setFrame: CGRectMake(0, 0, 320, 35)];   
            [_contentView setFrame: CGRectMake(0, 35, 320, [self bounds].size.height - 35)];
            [_contentView setAlpha: 1.0];
            [_criticView setFrame: CGRectMake(0, -[self bounds].size.height, 320, [self bounds].size.height - 35)];
        })
         ];
        
        [_columnBar clearColumns];
        [_columns removeAllObjects];
        
        id<BoCPressColumn> column = nil;
        for (column in columns)
        {
            [_columnBar addColumn: column];
            [_columns addObject: column];
        }
        
        if ([_columnBar currentColumnIndex] > [_columns count])
        {
            [_columnBar switchToColumn: [_columns objectAtIndex: 0]];
        }
    }else
    {
        [self didUpdateData];
    }
}


- (void)updateLatestCriticPost: (NSArraySlice *)slice
{

    id identity = nil;
    
    id<BoCPressColumn> column = nil;
    for (column in _columns)
    {
        if ([[column identity] isEqualToString: kLatestCriticsID])
        {
            identity = [column identity];
        }
    }
    
    NSMutableArray *array = [_data objectForKey: identity];
    if (!array)
    {
        array = [[[NSMutableArray alloc] init] autorelease];
        [_data setObject: array forKey: identity];
    }
    
    [array updateWithArraySlice: slice];
    
    [_contentView reloadData];
    
    
    [self wantToFinishDataUpdate];
    
    
    [self showContentView];
    
}

- (void)updateOrderedFavoriteCritics: (NSArraySlice *)slice
{

    id identity = nil;
    
    id<BoCPressColumn> column = nil;
    for (column in _columns)
    {
        if ([[column identity] isEqualToString:kFavoriteCriticsID])
        {
            identity = [column identity];
            break;
        }
    }
    
    NSMutableArray *array = [_data objectForKey: identity];
    if (!array)
    {
        array = [[[NSMutableArray alloc] init] autorelease];
        [_data setObject: array forKey: identity];
    }
    
    [array updateWithArraySlice: slice];
    
    [_contentView reloadData];
    
    
    [self wantToFinishDataUpdate];
    
    [self showContentView];
}

- (void)updateOrderedCritics: (NSArraySlice *)slice
{
    
    id identity = nil;
    
    id<BoCPressColumn> column = nil;
    for (column in _columns)
    {
        if ([[column identity] isEqualToString: kOrderedCriticsID])
        {
            identity = [column identity];
        }
    }
    
    NSMutableArray *array = [_data objectForKey: identity];
    if (!array)
    {
        array = _critics;
        [_data setObject: array forKey: identity];
    }
    
    [array updateWithArraySlice: slice];
    
    [_criticView updateView];
    
    [self wantToFinishDataUpdate];
    
    [self playAnimationOfCriticsColumn];
}

- (id<BoCPressColumn>)currentColumn
{
    if ([_columns count] > 0) 
    {
        return [_columns objectAtIndex: [_columnBar currentColumnIndex]];
    }else
    {
        return nil;
    }
}

- (id)pageFlag
{
    //return _pageFlag;
    id columnID = [(id<NSIdentifiedObject>)[_columns objectAtIndex: [_columnBar currentColumnIndex]] identity];
    
    if ([columnID isEqualToString: kLatestCriticsID]
        || [columnID isEqualToString: kFavoriteCriticsID])
    {
        
        return kCriticPost_HasDeeper;        
    }
    return kCriticPost_NoDeeper;    
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];

    [_handler activeAllCallback];
    [[_contentView cellForRowAtIndexPath:[_contentView indexPathForSelectedRow]] setSelected:NO];
    [_contentView reloadData];
}

- (id<BoCPressCriticDataSource>)dataSource
{
    return _dataSource;
}

- (void)willReadPostsOfCriticWithData: (NSDictionary *)data
{
    id<BoCPressAuthor> critic = [data objectForKey: @"critic"];
    [_dataSource  contentOfCritic: critic 
                         userInfo: nil 
                      andCallback: _handler];
    
}

- (void)wantToReadPostsOfCritic: (id<BoCPressAuthor>) critic
{
    [_currentCritic release];
    _currentCritic = [critic retain];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"wantToReadPostsOfCritic:", kNetwork_CallbackAction,
                              critic, @"critic",
                              _handler, kNetwork_CallbackObject,
                              nil];
    
    [_dataSource contentOfCritic: critic 
                        userInfo: userInfo
                     andCallback: _handler];
    
    [userInfo release];
    
}

- (void)playAnimationOfCriticsColumn
{
    CGRect frame = [_criticView frame];
    
    frame.origin.y = [_columnBar frame].size.height;
    //show the tabView
    //
    [UIView animateWithDuration: 0.5
                     animations: (^{        
                                    [_criticView setFrame:frame];
                                })
     ];
    
}



#pragma mark - for CriticView

- (BOOL)moreCellFlagOfCriticView
{
    NSDictionary *tag = [NSDictionary dictionaryWithObjectsAndKeys:
                         kOrderedCriticsID, kBoCPress_Global_ColumnID,
                         kBoCPress_View_HasMoreTag, kBoCPress_Global_QueryCommand, nil];
    
    return [[(BoCPressCriticHomePagePrivateHandler *)_handler queryInfoWithTag:tag] boolValue];
}

- (void)wantToReadListOfCritic:(id<BoCPressAuthor>)critic
{
    [(BoCPressCriticHomePagePrivateHandler *)_handler wantToReadListOfCritic:critic];
}

- (NSTimeInterval)lastUpdateTimeInterval
{
    NSUInteger currentColumnIndex = [_columnBar currentColumnIndex];
    id columnID = [(id<NSIdentifiedObject>)[_columns objectAtIndex: currentColumnIndex] identity];
    return  [_dataSource lastUpdateTimeIntervalWithColumnID:columnID];
}

- (void)willShowContentOfCriticPostWithData: (NSDictionary *)data
{
    id<BoCPressColumn> currentColumn = [self currentColumn];
    NSUInteger indexOfSelectedCell = [[data objectForKey: kBoCPress_Global_Index] integerValue];
    NSArray *postList = [_data objectForKey: [currentColumn identity]];
    id<BoCPressNews> criticPost = [postList objectAtIndex: indexOfSelectedCell];
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject: criticPost forKey: @"criticPost"];
    [userInfo setObject: postList forKey: @"postList"];
    [userInfo setObject:[self pageFlag] forKey:kCriticPost_CriticPostPageFlag];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadCriticPost_inPostList_pageFlag_ 
                                                        object: self
                                                      userInfo: userInfo];
    
}

- (void)wantToShowContentOfCriticPostAtIndex: (NSUInteger)index
{
    [self setUserInteractionEnabled: NO];     
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault
                                    onsuperView: NO];
    _indexOfSelectedCell = index;
    
    id<BoCPressColumn> currentColumn = [self currentColumn];
    
    NSArray *postList = [_data objectForKey: [currentColumn identity]];
    id<BoCPressNews> criticPost = [postList objectAtIndex: _indexOfSelectedCell];
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject: criticPost forKey: @"criticPost"];
    [userInfo setObject: postList forKey: @"postList"];
    [userInfo setObject:[self pageFlag] forKey:kCriticPost_CriticPostPageFlag];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadCriticPost_inPostList_pageFlag_ 
                                                        object: self
                                                      userInfo: userInfo];
    
}


- (void)stepToReadPostsOfCriticWithData: (id)data
{
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadListOfCriticPost 
                                                        object: self 
                                                      userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                 data,kCriticPost_CriticIdentity,
                                                                 [self currentColumn], kBoCPress_ColumnObject, 
                                                                 kCriticPost_NoDeeper, kCriticPost_CriticPostPageFlag, 
                                                                 nil]];
    
}

- (void)didCancelledHandleErrorOfServerWithData:(NSDictionary *)info
{
    [[_contentView cellForRowAtIndexPath: [_contentView indexPathForSelectedRow]] setSelected: NO];
    [_contentView reloadData];
}

@end
