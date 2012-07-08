#import "BoCPressCriticPostListPage.h"

#import "BoCPressCriticDataSource.h"

#import "UIView+LoadingIndicatorView.h"

#import "NSMutableArray+UniqueSliceSupported.h"

#import "BoCPressCriticPostListPagePrivateHandler.h"

#import "BoCPressCriticView.h"

#import "BoCPressNews.h"

#import "BoCPressImageView.h"

#import "BoCPressConstant.h"

#import "NSArraySlice.h"

#import "BoCPressUpdateArrowTableView.h"

#import "BoCPressViewConstants.h"
#import "BoCPressAuthor.h"

@implementation BoCPressCriticPostListPage

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
                critic: (id<BoCPressAuthor>)critic
            dataSource: (id<BoCPressCriticDataSource>)dataSource
              pageFlag: (id) pageFlag
{
    
    self = [super init];
    if (self) 
    {
        _pageFlag = pageFlag;
        [self setLastPage: lastPage];
        [self setPageTitle: @"分析师观点"];
        _critic = [critic retain];
        _dataSource = [dataSource retain];
        
        _posts = [[NSMutableArray alloc] init];
        
        _handler = [[BoCPressCriticPostListPagePrivateHandler alloc] initWithCriticPostListPage: self
                                                                                          posts: _posts];
        
        _postTableView = [[BoCPressUpdateArrowTableView alloc] initWithSuperPage:self];
        [_postTableView setDataSource: (BoCPressCriticPostListPagePrivateHandler*)_handler];
        [_postTableView setDelegate: (BoCPressCriticPostListPagePrivateHandler*)_handler];
        [_postTableView setBackgroundColor: [UIColor clearColor]];
        [_postTableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
        [_postTableView setFrame: CGRectMake(0,  85, 320,  480 - 85)];
        
        [self addSubview: _postTableView];
        if ([_pageFlag isEqual:kCriticPost_NoDeeper])
        {            
            _criticView = [[BoCPressCriticView alloc] initWithPageFlag:kCriticView_HideTriangleNavigateLogo];
            
        }else 
        {
            _criticView = [[BoCPressCriticView alloc] initWithPageFlag:kCriticView_ShowTriangleNavigateLogo];
        }
        [_criticView setCritic: _critic];
        
        [self addSubview: _criticView];
        
        
        _animationInfo = nil;
        _hasSetOriginFrame = NO;
        _userInfo = nil;
    }
    
    return self;
    
}

- (void)dealloc
{
    [_posts release];
    [_postTableView setSuperPage:nil];
    [_postTableView release];
    [_criticView release];
    [_dataSource release];
    
    
    [_handler release];
    
    [_animationInfo release];
    
    [super dealloc];
}

#pragma mark - page parameters


- (BOOL)needNavigationBar
{
    return YES;
}

#pragma mark - Data updating

- (void)hideContentView
{
    CGRect frame = [_postTableView frame];
    if (_hasSetOriginFrame)
    {
        ;
    }else
    {
        _originFrameOfContentView = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        _hasSetOriginFrame = YES;
    }
    frame.origin.y = - frame.size.height;
    [_postTableView setFrame:frame];
}

- (void)showContentView
{
    [UIView animateWithDuration: 0.5
                     animations: (^{
        
        _originFrameOfContentView.size.height = [self bounds].size.height - [_criticView frame].size.height;    
        [_postTableView setFrame:_originFrameOfContentView];
    })
     ];
    
}

- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    if(!_dataLoading)
    {
        [self setUserInteractionEnabled: YES];
        
        [self didUpdateData];
        
        [_animationInfo release];
        _animationInfo = [animationInfo retain];
        if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
        {
            [self hideContentView];
        }
        
        [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: NO];
        [_dataSource listOrderedPostsOfCritic: _critic
                                    rangeFrom: 0
                                       rangeTo:[_posts count]
                                  withCallback:_handler];
    }
    
}

- (void)wantToUpdateDataWithInfo:(id)animationInfo
{
    [self setUserInteractionEnabled: YES];
    
    [_animationInfo release];
    _animationInfo = [animationInfo retain];
    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
    {
        [self hideContentView];
    }
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
    
    [_dataSource contentOfCritic: _critic
                    withUserInfo:[NSDictionary 
                                              dictionaryWithObjectsAndKeys:kCallbackAction_listOrderedPostsFromCritic, kNetwork_CallbackAction, 
                                              nil] 
                                 callback:_handler];
    
    
    
}

- (void)updateCriticInfoWithData:(id<BoCPressAuthor>) newCritic
{
    //update info of critic, then get its posts
    //
    [_criticView setCritic:newCritic];
    
    [_dataSource listOrderedPostsOfCritic: _critic
                                rangeFrom: 0
                                  rangeTo: [_dataSource countOfCriticPostsOnRequestedAtTheFirstTime]
                              withCallback: _handler];
}

- (void)updateData: (NSArraySlice *)slice
{
    if ([slice countInSlice] > 0)
    {
        [_posts updateWithArraySlice: slice];
        [_postTableView reloadData];
        
    }
    
    [self wantToFinishDataUpdate];
    
    if ([[_animationInfo objectForKey:kBoCPress_Global_AnimationType] isEqual:kBoCPress_View_AnimationTypeTopToBottom])
    {
        [self showContentView];
    }
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    CGRect bounds = [self bounds];
    bounds.size.height = 85;
    [_criticView setFrame: bounds];
    
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [self setUserInteractionEnabled: YES];
    
    [_handler activeAllCallback];
    [_postTableView reloadData];
}

- (void)wantToUpdateMoreData
{
    [self didUpdateData];
    
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                    onsuperView: NO];
    
    [_dataSource listOrderedPostsOfCritic: _critic
                                rangeFrom: [_posts count]
                                  rangeTo: [_posts count] + [_dataSource countOfCriticPostsOnRequestedAtTheFirstTime]
                              withCallback: _handler];
}


- (NSTimeInterval)lastUpdateTimeInterval
{
    return  [_dataSource lastUpdateTimeIntervalWithColumnID: nil];
}

- (void)wantToReadCriticPostAtIndex: (NSIndexPath *)indexPath
{
    [self setUserInteractionEnabled: NO];
    [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault
                                    onsuperView: NO];
    
    id<BoCPressNews> criticPost = [_posts objectAtIndex: [indexPath row]];
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject: criticPost
                 forKey: @"criticPost"];
    [userInfo setObject: _posts
                 forKey: @"postList"];
    [userInfo setObject: kCriticPost_NoDeeper 
                 forKey: kCriticPost_CriticPostPageFlag];
    
    
    //may ask for fee for each critic
    //
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadCriticPost_inPostList_pageFlag_
                                                        object: self
                                                      userInfo: userInfo];
    

}

- (void)didCancelledHandleErrorOfServerWithData:(NSDictionary *)info
{
    [[_postTableView cellForRowAtIndexPath: [_postTableView indexPathForSelectedRow]] setSelected: NO];
    [_postTableView reloadData];
}

@end
