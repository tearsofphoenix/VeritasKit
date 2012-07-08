#import "BoCPressCriticPostPage.h"

#import "BoCPressCriticPostPagePrivateHandler.h"

#import "BoCPressCriticView.h"

#import "BoCPressNews.h"

#import "BoCPressNewsView.h"

#import "BoCPressCriticDataSource.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressConstant.h"

#import "BoCPressNewsInfoView.h"

#import "BoCPressAuthor.h"
#import "BoCPressMetaService.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressCriticPostPage

static void BoCPressCriticPostPage_UpdateCriticPost(id<BoCPressNews> news, 
                                                    id<BoCPressNews> *_news,
                                                    BoCPressNewsView **_newsView,
                                                    id direction,
                                                    BoCPressCriticView **_criticView,
                                                    BoCPressCriticPostPage* newsPage,
                                                    UIView *_loadingIndicator)
{
    
    *_news = news;
    id<BoCPressAuthor> _author = [news author];
    
    if(!direction
       ||[direction isEqual:kBoCPressNewsPage_pageSlideDirectionNone])
    {
        
        [*_newsView setCritcPost:news];
        [*_criticView setCritic:_author];
        
    }else
    {
        // move newsPage out of sight
        //
        CGRect originFrame = [newsPage frame];
        CGRect updateFrame = CGRectMake(originFrame.origin.x, originFrame.origin.y, originFrame.size.width, originFrame.size.height);
        //        float origin_X = originFrame.origin.x;
        float pageWidth = originFrame.size.width;
        
        //prepare hideFrame for old page
        CGRect hideFrame = CGRectMake(originFrame.origin.x, originFrame.origin.y, originFrame.size.width, originFrame.size.height);
        
        if ([direction isEqual:kBoCPressNewsPage_pageSlideDirectionPrevious])
        {
            hideFrame.origin.x = pageWidth;
            
        }else if([direction isEqual:kBoCPressNewsPage_pageSlideDirectionNext])
        {
            hideFrame.origin.x = -pageWidth;
        }
        
        //prepare frame for updated page
        //
        if ([direction isEqual:kBoCPressNewsPage_pageSlideDirectionPrevious])
        {
            updateFrame.origin.x = -pageWidth;
            
        }else if([direction isEqual:kBoCPressNewsPage_pageSlideDirectionNext])
        {
            updateFrame.origin.x = pageWidth;
        }
        
        
        UIGraphicsBeginImageContext(newsPage.bounds.size);
        [[newsPage layer] renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        //UIImage *image = [newsPage imageFromView];
        
        UIImageView *snapshotOfCurrentNewsPage = [[[UIImageView alloc] initWithImage:viewImage] autorelease];
        //UIView *snapshotOfCurrentNewsPage = [[UIView alloc] init];
        
        [snapshotOfCurrentNewsPage setBackgroundColor:[UIColor redColor]];
        
        [[newsPage superview] addSubview: snapshotOfCurrentNewsPage];
        
        [snapshotOfCurrentNewsPage setFrame:originFrame];
        
        //bring the snapshot to front, update the newsPage background
        //
        [[newsPage superview] bringSubviewToFront:snapshotOfCurrentNewsPage];
        
        [*_newsView setCritcPost:news];
        [*_criticView setCritic:_author];
        //set the newsPage a proper frame, prepare for animation
        //
        [newsPage setFrame:updateFrame];
        [snapshotOfCurrentNewsPage setFrame:originFrame];
        
        [[newsPage superview] addSubview: _loadingIndicator];
        [[newsPage superview] bringSubviewToFront: _loadingIndicator];

        //start update animation
        //
        [UIView animateWithDuration: 0.5
                         animations: (^{                                                        
                                            [newsPage setFrame:originFrame];
                                            [snapshotOfCurrentNewsPage setFrame:hideFrame];
                                    })
         ];
    }
}


- (id)initWithLastPage: (id<BoCPressPage>)lastPage
            criticPost: (id<BoCPressNews>)criticPost
            inPostList: (NSArray *)postList
            dataSource: (id<BoCPressCriticDataSource>)dataSource
              pageFlag: (id)pageFlag
{
    
    self = [super init];
    if (self) 
    {
        
        [self setLastPage: lastPage];
        _dataSource = [dataSource retain];
        _criticPost = criticPost;
        _postList = postList;
        _pageFlag = pageFlag;
        
        _handler = [[BoCPressCriticPostPagePrivateHandler alloc] initWithCriticPostPage: self
                                                                             criticPost: _criticPost];
        [self setPageTitle: @"分析师观点"];
        
        if ([_pageFlag isEqual:kCriticPost_HasDeeper])
        {            
            _criticView = [[BoCPressCriticView alloc] initWithPageFlag:kCriticView_ShowTriangleNavigateLogo];
            
        }else if([_pageFlag isEqual:kCriticPost_NoDeeper])
        {
            _criticView = [[BoCPressCriticView alloc] initWithPageFlag:kCriticView_HideTriangleNavigateLogo];
        }
        
        [_criticView setCritic: [criticPost author]];

        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self 
                                                                                               action: @selector(handleCriticViewTapEvent:)];
        
        [_criticView addGestureRecognizer:tapGestureRecognizer];
        
        [tapGestureRecognizer release];
        
        [self addSubview: _criticView];
        
        
        _newsView = [[BoCPressNewsView alloc] init];
        
        [_newsView setCritcPost:criticPost];
        
        [self addSubview: _newsView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(wantToShowFeedBackView:) 
                                                     name:kBoCPressNewsPage_wantToShowFeedBackView 
                                                   object:nil];
        _animationInfo = nil;
        _couldHideLoadingIndicator = NO;
    }
    
    return self;
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_dataSource release];
    
    [_handler release];
    
    [_criticView release];
    
    [_newsView release];
    [_animationInfo release];
    
    [super dealloc];
}


#pragma mark - page parametes

- (BOOL)couldNavigate
{
    return YES;
}

- (BOOL)couldReadNextPage
{
    return ([_postList count] > 0
            && [_postList indexOfObject: _criticPost] < [_postList count] - 1);
}

- (BOOL)couldReadPreviousPage
{
    return [_postList indexOfObject: _criticPost] > 0;
}

- (void)readNextPage
{
    
    NSUInteger index = [_postList indexOfObject: _criticPost] + 1;
    if (index < [_postList count])
    {
        id<BoCPressNews> nextPost = [_postList objectAtIndex: index];
        
        NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
        [userInfo setObject: nextPost
                     forKey: @"criticPost"];
        [userInfo setObject: _postList 
                     forKey: @"postList"];
        [userInfo setObject: kBoCPressNewsPage_pageSlideDirectionNext
                     forKey: kBoCPressNewsPage_pageSlideDirection];
        [userInfo setObject: _pageFlag
                     forKey: kCriticPost_CriticPostPageFlag];
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadCriticPost_inPostList_pageFlag_ 
                                                            object: self 
                                                          userInfo: userInfo];
        
        [userInfo release];
        
        [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: YES];
    }    
}

- (void)readPreviousPage
{
    
    NSUInteger index = [_postList indexOfObject: _criticPost];
    if (index > 0)
    {
        id<BoCPressNews> nextPost = [_postList objectAtIndex: index - 1];
        
        NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
        [userInfo setObject: nextPost
                     forKey: @"criticPost"];
        [userInfo setObject: _postList 
                     forKey: @"postList"];
        [userInfo setObject: kBoCPressNewsPage_pageSlideDirectionPrevious
                     forKey: kBoCPressNewsPage_pageSlideDirection];
        [userInfo setObject: _pageFlag
                     forKey: kCriticPost_CriticPostPageFlag];
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadCriticPost_inPostList_pageFlag_ 
                                                            object: self 
                                                          userInfo: userInfo];
        
        [userInfo release];
        
        [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: YES];
    }    
}

- (BOOL)needNavigationBar
{
    return YES;
}

- (BOOL)needTabBar
{
    return NO;
}

#pragma mark - Data updating

- (void)updateData: (id<BoCPressNews>)criticPost 
     withDirection: (id)direction
{
    
    BoCPressCriticPostPage_UpdateCriticPost(criticPost, &_criticPost, &_newsView, direction, &_criticView, self, _loadingIndicator);
    [self wantToFinishDataUpdate];
    
}

- (void)layoutSubviews
{
    
    CGRect bounds = [self bounds];
    
    [_criticView setFrame: CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, 85)];
    
    CGFloat criticViewFrameHeight = [_criticView frame].size.height;
    
    [_newsView setFrame: CGRectMake(bounds.origin.x, bounds.origin.y + criticViewFrameHeight, bounds.size.width, bounds.size.height - criticViewFrameHeight )];
    
}

- (void) wantToShowFeedBackView: (NSNotification*) notification
{
    id<BoCPressNews> news = [[notification userInfo] objectForKey:kBoCPress_Global_NewsType];
    
    [_dataSource getCommentSummaryContentOfNews: news 
                                   withCallback: _handler];
}

- (void)stepToShowFeedBackViewWithData: (id)data
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kBoCPressViewControllerPrivateHandler_notificationForShowFeedBackView
                                                        object:self 
                                                      userInfo:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                _handler, @"callbackObject",
                                                                [data objectForKey:kNetwork_NewsTag], kBoCPress_Global_NewsType, 
                                                                _dataSource, @"dataSource",
                                                                kBoCPressIsNews, kBoCPress_View_MediaType,
                                                                [data objectForKey:kCommentSummary_PostAverageRateing], kCommentSummary_PostAverageRateing,
                                                                [data objectForKey:kCommentSummary_PostRateCount], kCommentSummary_PostRateCount,
                                                                [data objectForKey:kSoapXMLParser_NewsCommentRepeatRatingFlag], kSoapXMLParser_NewsCommentRepeatRatingFlag,
                                                                nil]];
    
}

- (void)removeFeedBackViewWithData: (id)data
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kBoCPressViewControllerPrivateHandler_notificationForRemoveFeedBackView
                                                        object:self 
                                                      userInfo:[NSDictionary dictionaryWithObjectsAndKeys:data, @"feedBackReturnedData", nil]];
}

- (void) handleCriticViewTapEvent: (id) sender
{
    [_criticView setSelected:YES];
    
    if ([_pageFlag isEqual:kCriticPost_HasDeeper])
    {
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToReadListOfCriticPost 
                                                            object: self
                                                          userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [_criticPost author], kCriticPost_CriticIdentity,
                                                                     kCriticPost_NoDeeper, kCriticPost_CriticPostPageFlag,
                                                                     nil]];
    }
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [_handler activeAllCallback];
}

- (void)didBeenSlideToWithInfo:(NSDictionary *)info
{
    
}

@end
