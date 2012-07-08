#import "BoCPressNewsPage.h"

#import "BoCPressNews.h"

#import "BoCPressNewsView.h"

#import "UIView+LoadingIndicatorView.h"

#import "BoCPressNewsPagePrivateHandler.h"

#import "BoCPressNewsDataSource.h"

#import "BoCPressConstant.h"

#import "BoCPressConstant.h"

#import "BoCPressNotificationDefines.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressNewsPage

@synthesize couldNavigate =_couldNavigate;

static const CGFloat kDefaultTitleFontSize = 20;

static void BoCPressNewsPage_adaptFontSizeOfTitleLabelWithTitle(UILabel *_titleLabel, NSString *title)
{
    static const CGFloat kMinTitleFontSize = 15;
    
    CGFloat titleWidth = [title sizeWithFont:[UIFont fontWithName:@"Helvetica" size:kDefaultTitleFontSize]].width;
    CGFloat targetFontSize = kDefaultTitleFontSize;
    
    while (titleWidth > [_titleLabel frame].size.width) 
    {
        targetFontSize -= 0.5;
        titleWidth = [title sizeWithFont:[UIFont fontWithName:@"Helvetica" size:targetFontSize]].width;
    }
    
    if (targetFontSize < kMinTitleFontSize)
    {
        targetFontSize = kMinTitleFontSize;
    }
    [_titleLabel setNumberOfLines: 2];
    [_titleLabel setFont:[[_titleLabel font] fontWithSize:targetFontSize]];
    [_titleLabel setText:title];
}

static void BoCPressNewsPage_UpdateNews(id<BoCPressNews> news, 
                                        id<BoCPressNews> *_news,
                                        UILabel *_titleLabel,
                                        UILabel *_postTimeLabel,
                                        BoCPressNewsView *_newsView,
                                        id direction,
                                        BoCPressNewsPage* newsPage,
                                        UIView *_loadingIndicator
                                        )
{
    
    *_news = news;
    
    if(!direction
       ||[direction isEqual:kBoCPressNewsPage_pageSlideDirectionNone])
    {
        
        BoCPressNewsPage_adaptFontSizeOfTitleLabelWithTitle(_titleLabel, [news name]);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat: @"发布时间：yyyy-MM-dd HH:mm"];        
        NSString *time = [formatter stringFromDate: [news postTime]];
        [formatter release];
        
        [_postTimeLabel setText: time];
        
        [_newsView setNews:news];
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
        
        //create an UIImageView as current newsPage's snapshot
        
        UIGraphicsBeginImageContext(newsPage.bounds.size);
        
        [[newsPage layer] renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
                
        UIImageView *snapshotOfCurrentNewsPage = [[[UIImageView alloc] initWithImage:viewImage] autorelease];
        
        [snapshotOfCurrentNewsPage setBackgroundColor:[UIColor redColor]];
        
        [[newsPage superview] addSubview: snapshotOfCurrentNewsPage];
        
        [snapshotOfCurrentNewsPage setFrame:originFrame];
        
        //bring the snapshot to front, update the newsPage background
        //
        [[newsPage superview] addSubview: _loadingIndicator];
        [[newsPage superview] bringSubviewToFront: _loadingIndicator];
        
        BoCPressNewsPage_adaptFontSizeOfTitleLabelWithTitle(_titleLabel, [news name]);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat: @"发布时间：yyyy-MM-dd HH:mm"];        
        NSString *time = [formatter stringFromDate: [news postTime]];
        [formatter release];
        
        [_postTimeLabel setText: time];
        
        [_newsView setNews:news];
        
        //set the newsPage a proper frame, prepare for animation
        //
        [newsPage setFrame:updateFrame];
        [snapshotOfCurrentNewsPage setFrame:originFrame];

        [UIView animateWithDuration: 1.0
                         animations: (^{
                                        [newsPage setFrame:originFrame];
                                        [snapshotOfCurrentNewsPage setFrame:hideFrame];
                                    })
         ];
        
    }
}

@synthesize pageTitle = _pageTitle;

@synthesize  couldFeedBack = _couldFeedBack;

- (BOOL)couldFeedBack
{
    return [_newsView couldFeedBack];
}

- (void)setCouldFeedBack:(BOOL)couldFeedBack
{
    [_newsView setCouldFeedBack: couldFeedBack];
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
               forNews: (id<BoCPressNews>)news
            inNewsList: (NSArray *)newsList
        fromDataSource: (id<BoCPressNewsDataSource>)dataSource
{
    
    self = [super init];
    if (self)
    {
        
        _handler = [[BoCPressNewsPagePrivateHandler alloc] initWithListPage: self];
        
        [self setLastPage: lastPage];
        _newsList = newsList;
        [self setPageTitle: [lastPage pageTitle]];
        
        _newsTitleBackgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressNewsTabTitleBackground"]];
        
        [self addSubview: _newsTitleBackgroundView];
        
        _newsView = [[BoCPressNewsView alloc] init];
        [_newsView setNews: _news];
        
        [self addSubview: _newsView];
        
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setBackgroundColor: [UIColor clearColor]];
        [_titleLabel setTextColor: [UIColor colorWithRed: 93.0 / 255
                                                   green: 93.0 / 255
                                                    blue: 93.0 / 255
                                                   alpha: 1]];
        [_titleLabel setFont: [UIFont fontWithName: @"Helvetica" size: kDefaultTitleFontSize]];
        [_titleLabel setFrame: CGRectMake(8, 14, 320 - 8, 18)];
        [self addSubview: _titleLabel];
        
        _postTimeLabel = [[UILabel alloc] init];
        [_postTimeLabel setTextColor: [UIColor colorWithRed: 93.0 / 255
                                                      green: 93.0 / 255
                                                       blue: 93.0 / 255
                                                      alpha: 1]];
        [_postTimeLabel setBackgroundColor: [UIColor clearColor]];
        [_postTimeLabel setFont: [UIFont fontWithName: @"Helvetica" size: 10]];
        [self addSubview: _postTimeLabel];
        
        BoCPressNewsPage_UpdateNews(news, &_news, _titleLabel, _postTimeLabel,
                                    _newsView, kBoCPressNewsPage_pageSlideDirectionNone, 
                                    self, _loadingIndicator);
        
        _dataSource = [dataSource retain];
        
        _commentedNews = [[NSMutableDictionary alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(wantToShowFeedBackView:)
                                                     name:kBoCPressNewsPage_wantToShowFeedBackView 
                                                   object:nil];
        
        _animationDirection = nil;
        _couldHideLoadingIndicator = NO;

        _couldNavigate = YES;
    }
    
    return self;
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_dataSource release];
    [_handler release];
    [_newsTitleBackgroundView release];
    [_newsView release];
    [_titleLabel release];
    [_postTimeLabel release];
    [_commentedNews release];
    [_animationDirection release];
    [_pageTitle release];
    
    [super dealloc];
}

#pragma mark - page parameter

- (BOOL)couldReadNextPage
{
    return ([_newsList count] > 0
            && [_newsList indexOfObject: _news] < [_newsList count] - 1);
}

- (BOOL)couldReadPreviousPage
{
    return [_newsList indexOfObject: _news] > 0;
}

- (void)readNextPage
{
    NSUInteger index = [_newsList indexOfObject: _news] + 1;
    if (index < [_newsList count])
    {
        id<BoCPressNews> nextNews = [_newsList objectAtIndex: index];

        NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
        [userInfo setObject: nextNews
                     forKey: kBoCPress_Global_NewsType];
        [userInfo setObject: _newsList 
                     forKey: @"newsList"];
        [userInfo setObject: kBoCPressNewsPage_pageSlideDirectionNext
                     forKey: kBoCPressNewsPage_pageSlideDirection];
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_ViewController_wantToNavigateToNewsInNewsList 
                                                            object: self 
                                                          userInfo: userInfo];
        
        [userInfo release];

        [self wantToShowLoadingIndicatorWithMessage: kString_Global_LoadingIndicatorMessageDefault 
                                        onsuperView: YES];

    }
        
}

- (void)readPreviousPage
{
    NSUInteger index = [_newsList indexOfObject: _news];
    if (index > 0 && index < [_newsList count])
    {

       id<BoCPressNews> previousNews = [_newsList objectAtIndex: index - 1];
        
        NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
        [userInfo setObject: previousNews
                     forKey: kBoCPress_Global_NewsType];
        [userInfo setObject: _newsList
                     forKey: @"newsList"];
        [userInfo setObject: kBoCPressNewsPage_pageSlideDirectionPrevious
                     forKey: kBoCPressNewsPage_pageSlideDirection];
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_ViewController_wantToNavigateToNewsInNewsList 
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



#pragma mark - view

- (void)wantToUpdateDataWithInfo:(id)info
{
    if (_animationDirection != info)
    {
        [_animationDirection release];
        _animationDirection = [info retain];
    }
    
    

    [self wantToFinishDataUpdate];
        
}

- (void)layoutSubviews
{
    
    CGRect frame = [self bounds];

    frame.size.height = 80;
    
    [_newsTitleBackgroundView setFrame: frame];
    
    CGRect bounds = [self bounds];
    bounds.origin.y = frame.origin.y + frame.size.height;
    bounds.size.height -= frame.size.height;
    [_newsView setFrame: bounds];
    
    [_titleLabel setFrame: CGRectMake(8, 14, 320 - 8, 36)];
    
    frame = [_titleLabel frame];
    frame.origin.y += frame.size.height + 10;
    frame.size = CGSizeMake(290, 10);
    [_postTimeLabel setFrame: frame];
    
}

- (void)didUpdateData
{
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_updateNavigationBar 
                                                        object: self 
                                                      userInfo: nil];
        
    [super didUpdateData];
}

- (void)updateContentOfNews: (id<BoCPressNews>)news 
              withDirection: (id)direction
{
    
    BoCPressNewsPage_UpdateNews(news, &_news, _titleLabel, _postTimeLabel, _newsView, direction, self, _loadingIndicator);
    
    [self wantToFinishDataUpdate];    

}


- (void) wantToShowFeedBackView: (NSNotification*) notification
{
    
    id<BoCPressNews> news = [[notification userInfo] objectForKey:kBoCPress_Global_NewsType];
    
    [_dataSource getCommentSummaryContentOfNews: news withCallback: _handler];
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

- (void)removeFeedBackViewWithData:(id)data
{
    [_commentedNews setObject:[data objectForKey:kSoapXMLParser_NewsCommentRepeatRatingFlag] forKey:[data objectForKey:@"postId"]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kBoCPressViewControllerPrivateHandler_notificationForRemoveFeedBackView
                                                        object:self 
                                                      userInfo:[NSDictionary dictionaryWithObjectsAndKeys:data, @"feedBackReturnedData", nil]];
}

- (void)wantToForceRefreshCurrentContentWithInfo:(id)animationInfo
{
    if(!_dataLoading)
    {
        [self didUpdateData];
        [self wantToUpdateDataWithInfo:nil];
    }
}

#pragma mark - animation

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{
    [_handler activeAllCallback];
}

- (void)didBeenSlideToWithInfo:(NSDictionary *)info
{
    
}
@end
