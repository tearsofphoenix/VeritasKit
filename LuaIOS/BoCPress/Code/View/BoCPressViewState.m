#import "BoCPressViewState.h"

#import "BoCPressTab.h"
#import "BoCPressMedia.h"
#import "BoCPressMediaHomePage.h"

#import "BoCPressMediaHomeDataSource.h"

#import "BoCPressDataSource.h"
#import "BoCPressMediaListDataSource.h"

#import "BoCPressMediaListPage.h"
#import "BoCPressNewsHomePage.h"
#import "BoCPressNewsHomeDataSource.h"

#import "BoCPressNewsListPage.h"
#import "BoCPressNewsPage.h"

#import "BoCPressNewsDataSource.h"
#import "BoCPressNewsListDataSource.h"

#import "BoCPressQuoteHomePage.h"

#import "BoCPressQuoteHomeDataSource.h"

#import "BoCPressQuoteListPage.h"

#import "BoCPressQuoteListDataSource.h"

#import "BoCPressCriticHomePage.h"

#import "BoCPressCriticDataSource.h"

#import "BoCPressCriticPostListPage.h"

#import "BoCPressCriticPostPage.h"

#import "BoCPressMoreHomePage.h"

#import "BoCPressConstant.h"

#import "BoCPressHelpPage.h"

#import "BoCPressUserFeedBackPage.h"

#import "BoCPressUserFeedBackDataSource.h"

#import "BoCPressHelpDataSource.h"

#import "BoCPressMediaDataSource.h"

#import "BoCPressLongTermQuoteListPage.h"

#import "BoCPressAccountLoginPage.h"

#import "BoCPressAccountDataSource.h"

#import "BoCPressVIPServicePage.h"

#import "BoCPressNormalAccountRegisterPage.h"

#import "BoCPressNormalAccountRegisterDataSource.h"

#import "BoCPressFindPasswordPage.h"

#import "BoCPressChangeUserPasswordPage.h"

#import "BoCPressActivateCodePage.h"

#import "BoCPressActivateCodeDataSource.h"

#import "BoCPressMoreHomeDataSource.h"

#import "BoCPressBuyCardPage.h"

#import "BoCPressBuyCardDataSource.h"

#import "BoCPressQuoteContentDatasource.h"

#import "BoCPressQuoteContentPage.h"

#import "BoCPressEntry.h"

#import "BoCPressQuoteContentLandscapePage.h"

#import "BoCPressMediaPlayerViewController.h"

#import "BoCPressVIPServiceDataSource.h"

#import "BoCPressAdvertisementView.h"

#import "BoCPressAdvertisementDataSource.h"

#import "BoCPressAdvertisementDetailPage.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressSplashAdvertisementView.h"

#import "BoCPressSplashAdvertisementDataSource.h"

#import "BoCPressRemoteNotificationConfigurationPage.h"

#import "BoCPressRemoteNotificationDataSource.h"

#import "BoCPressRemoteNotificationListPage.h"

#import "BoCPressServerPushNotification.h"

#import "BoCPressViewStatePrivateHandler.h"

#import "BoCPressRemoteNotificationPage.h"

#import "BoCPressViewConstants.h"

#import "BoCPressConfigurationService.h"
#import "BoCPressNetworkService.h"
#import "BoCPressRequestStringFormatService.h"
#import "BoCPressCacheService.h"
#import "BoCPressUserInfoService.h"

#import "BoCPressAccountService.h"
#import "BoCPressNewsService.h"
#import "BoCPressQuoteService.h"
#import "BoCPressCriticService.h"
#import "BoCPressMediaService.h"

@implementation BoCPressViewState

- (id)initWithDataSource: (id<BoCPressDataSource>)dataSource
{
    
    self = [super init];
    if (self)
    {
        _dataSource = [dataSource retain];
        
        _storedTabState = [[NSMutableDictionary alloc] init];
        
        _tabStacks = [[NSMutableDictionary alloc] init ];
        
        _currentStacks = [[NSMutableArray alloc] init ];
        
        _currentPage = nil;
        _handler = [[BoCPressViewStatePrivateHandler alloc] initWithViewState: self];
    }
    
    return self;
    
}

- (void)dealloc
{
    [_dataSource release];
    [_storedTabState release];
    
    [_tabStacks release];
    [_currentPage release];
    [_handler release];
    
    [super dealloc];
    
}

- (UIView<BoCPressPage> *)currentPage
{
    return _currentPage;
}

- (void)currentTab: (id<BoCPressTab>) currentTab
       switchToTab: (id<BoCPressTab>)tab
        completion: (void (^)(void))block
{
    //switch to self, just refresh
    //
    id currentTabIdentity = [currentTab tabIdentity];
    id targetTabIdentity = [tab tabIdentity];
    id identity = [tab identity];
    [_dataSource setConfigurationValue:identity forTag:kViewState_currentTabIdentity];
    
    if ([currentTabIdentity isEqual:targetTabIdentity])
    {        
        [_currentPage wantToForceRefreshCurrentContentWithInfo: nil];
        
    }else
    {
        
        if ([_currentPage respondsToSelector:@selector(willSwitchToOtherTab)])
        {
            //stop the timer
            //
            [_currentPage willSwitchToOtherTab];
        }
        
        
        //store "previous" page state
        //
        [self storeCurrentTabState:currentTabIdentity];
        
        
        //remove viewStack of currentTab
        //
        [ [_tabStacks objectForKey:currentTabIdentity] removeAllObjects];
        //[currentViewStack release];
        
        //copy stack in current Tab
        //
        NSMutableArray *currentViewStack = [[NSMutableArray alloc] init];
        
        
        if ([_currentStacks count] > 0)
        {
            [currentViewStack setArray:_currentStacks];
        }
        
        
        //        
        if (currentTabIdentity)
        {
            
            [_tabStacks setObject:currentViewStack forKey:currentTabIdentity];
        }
        
        [currentViewStack release];
        //clear each view in _currentStack
        //
        for (id viewLooper in _currentStacks) 
        {
            if ([viewLooper conformsToProtocol:@protocol(BoCPressPage)])
            {
                
                [(UIView*)viewLooper removeFromSuperview];
                
            }
            
            
        }
        
        [_currentStacks removeAllObjects];
        
        NSArray* viewStackOfTargetTab = [_tabStacks objectForKey:targetTabIdentity];
        
        if ([viewStackOfTargetTab count] > 0)
        {
            for (id arrayLooper in viewStackOfTargetTab)
            {
                [_currentStacks addObject:arrayLooper];
            }
            
            _currentPage = [_storedTabState objectForKey:targetTabIdentity];
            
            NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
            [userInfo setObject: tab
                         forKey: @"tab"];

            if (block)
            {
                [userInfo setObject: Block_copy(block)
                             forKey: kBoCPress_Global_NSMallocBlockObject];
                Block_release(block);
            }
            
            [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didRefreshToTab 
                                                                object: self
                                                              userInfo: userInfo];
            [userInfo release];
        }
        else
        {
            //not found, alloc new page, no need to release previous page because 
            // we need to store it
            //            NSString *tabIdentity = [tab tabIdentity];
            //            
            
            
            if ([targetTabIdentity isEqualToString: kType_Global_MediaObject])
            {                
                _currentPage = [[BoCPressMediaHomePage alloc] initWithDataSource: [[[BoCPressMediaHomeDataSource alloc] initWithService: _dataSource] autorelease]];
                
            }
            else if ([targetTabIdentity isEqualToString: kBoCPress_Global_NewsType])
            {                
                _currentPage = [[BoCPressNewsHomePage alloc] initWithDataSource: [[[BoCPressNewsHomeDataSource alloc] initWithService: _dataSource] autorelease]];                
                
            }
            else if ([targetTabIdentity isEqualToString: @"quote"])
            {
                _currentPage = [[BoCPressQuoteHomePage alloc] initWithDataSource: [[[BoCPressQuoteHomeDataSource alloc] initWithService: _dataSource] autorelease]];
                
            }
            else if ([targetTabIdentity isEqualToString: @"critic"])
            {
                id<BoCPressCriticDataSource> dataSource = [[BoCPressCriticDataSource alloc] initWithService: [_dataSource serviceByIdentity: BoCPressCriticServiceID]
                                                                                       configurationService: [_dataSource serviceByIdentity: BoCPressConfigurationServiceID]];
                _currentPage = [[BoCPressCriticHomePage alloc] initWithDataSource: dataSource];
                [dataSource release];
                
            }
            else if ([targetTabIdentity isEqualToString: @"more"])
            {
                _currentPage = [[BoCPressMoreHomePage alloc] initWithDataSource:[[[BoCPressMoreHomeDataSource alloc] initWithService:_dataSource] autorelease]];
                
            }
            
            
            NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
            [userInfo setObject: tab
                         forKey: @"tab"];
            
            if (block)
            {
                [userInfo setObject: Block_copy(block)
                             forKey: kBoCPress_Global_NSMallocBlockObject];
                Block_release(block);
            }
            
            [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSwitchToTab 
                                                                object: self
                                                              userInfo: userInfo];
            [userInfo release];
        }
    }
    
    _currentTab = tab;
    
}

- (void)willBrowseBackward
{
    if ([_currentPage respondsToSelector:@selector(willBrowseBackward)])
    {
        
        [_currentPage willBrowseBackward];
    }
}

- (void)browseBackwardWithUserInfo:(NSDictionary *)userInfo
{
    UIView<BoCPressPage> *page = [_currentPage lastPage];
    if (page)
    {
        
        //_currentPage must not be the home page of each tab, so we need to release them
        //
        [_currentPage release];
        
        _currentPage = page;
        
        UIView *lastViewOfCurrentPage = [_currentStacks lastObject];
        if (lastViewOfCurrentPage)
        {
            
            NSMutableDictionary *info = [[NSMutableDictionary alloc] initWithDictionary: userInfo];
            
            [info setObject: page
                     forKey: @"page"];
            
            [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didBrowseBackwardToPage 
                                                                object: self
                                                              userInfo: info];
            [info release];
            
        }else
        {
            NSLog(@"Notice: this will never happen!!!");
            //
            [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didBrowseBackwardToPage 
                                                                object: self
                                                              userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                         page, @"page",
                                                                         nil ]]; 
        }
        
    }
    
}


- (void)readPreviousPage
{
    if ([_currentPage respondsToSelector:@selector(readPreviousPage)]) 
    {        
        [_currentPage readPreviousPage];
    }
}

- (void)readNextPage
{
    if ([_currentPage respondsToSelector:@selector(readNextPage)]) 
    {
        [_currentPage readNextPage];
    }
}

#pragma mark - Media processing
- (void)playMediaWithInfo: (NSDictionary *)info
{
    id<BoCPressMedia> media = [info objectForKey: kType_Global_MediaObject];
    id<BoCPressMediaType> mediaType = [info objectForKey: kType_Global_MediaTypeObject];
    
    BoCPressMediaDataSource *dataSource = [[BoCPressMediaDataSource alloc] initWithService:_dataSource];
    
    BoCPressMediaPlayerViewController *mediaPlayer = [[BoCPressMediaPlayerViewController alloc] initWithMedia: media
                                                                                                   dataSource: dataSource 
                                                                                                    mediaType: mediaType];
    
    [dataSource release];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              mediaPlayer, @"mediaPlayer", 
                              info, @"info",
                              nil];
    
    [mediaPlayer release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_showMediaPlayer 
                                                        object:self 
                                                      userInfo:userInfo];
    
    [userInfo release];
    
}

- (void)readMediaListOfType: (id<BoCPressMediaType>)mediaType
{
    
    //may browse backward, so not release _currentPage
    //
    id<BoCPressPage> lastPage = _currentPage;
    _currentPage = [[BoCPressMediaListPage alloc] initWithLastPage: lastPage 
                                                        dataSource: [[[BoCPressMediaListDataSource alloc] initWithService: _dataSource 
                                                                                                                    forMediaType: mediaType] autorelease]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                 _currentPage, @"page", 
                                                                 nil]];    
}

#pragma mark - News processing
- (void)readNewsListWithTag: (id<BoCPressNewsTag>)newsTag andSuperColumn: (id<BoCPressColumn>)superColumn
{
    //may browse backward, so not release _currentPage
    //
    id<BoCPressPage> lastPage = _currentPage;
    _currentPage = [[BoCPressNewsListPage alloc] initWithLastPage: lastPage 
                                                       dataSource: [[[BoCPressNewsListDataSource alloc] initWithService: _dataSource 
                                                                                                                    forNewsTag: newsTag] autorelease]
                                                      superColumn:superColumn];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                 _currentPage, @"page", 
                                                                 nil]];    
    
}

- (void)readNewsListWithInfo: (id )userInfo
{
    id superColumn = [userInfo objectForKey:@"currentColumn"];
    
    id newsTag = [userInfo objectForKey:@"newsTag"];
    
    [self readNewsListWithTag: newsTag 
               andSuperColumn: superColumn];
    
}

- (void)readNewsInNewsListWithInfo:(NSDictionary *)info
{
    id direction = [info objectForKey:kBoCPressNewsPage_pageSlideDirection];
    BoCPressNews* news = [info objectForKey: kBoCPress_Global_NewsType];
    
    if ([_currentPage class] == [BoCPressNewsPage class])
    {
        BoCPressNewsPage *newsPage = (BoCPressNewsPage *)_currentPage;
        [newsPage updateContentOfNews: news 
                        withDirection: direction];    
        
    }else
    {
        NSArray *newsList = [info objectForKey: @"newsList"];

        id<BoCPressNewsTag> newsTag = [news newsTag];
        NSString *pageTitle = [newsTag name];
        
        id<BoCPressPage> lastPage = _currentPage;
        
        _currentPage = [[BoCPressNewsPage alloc] initWithLastPage: lastPage 
                                                          forNews: news
                                                       inNewsList: newsList
                                                   fromDataSource: [[[BoCPressNewsDataSource alloc] initWithService: _dataSource] autorelease]];
        if (pageTitle)
        {
            [(BoCPressNewsPage*)_currentPage setPageTitle: pageTitle];
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                            object: self
                                                          userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                     _currentPage, @"page",
                                                                     nil]];
    }

}

#pragma mark - quote processing

- (void)readListOfSecurityInFamilyWithInfo:(NSDictionary *)info
{
    id<BoCPressSecurityFamily> family = [info objectForKey: kType_Global_SecurityFamily];
    //may browse backward, so not release _currentPage
    //
    id<BoCPressPage> lastPage = _currentPage;
    NSArray *securities = [info objectForKey: kType_Global_NSArray];
    _currentPage = [[BoCPressQuoteListPage alloc] initWithLastPage: lastPage 
                                                 forSecurityFamily: family
                                                        securities: securities
                                                    fromDataSource: [[[BoCPressQuoteListDataSource alloc] initWithService: _dataSource] autorelease]];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              _currentPage, @"page",
                              nil];
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
    
}

- (void)readLongTermListOfSecurityInFamilyWithInfo: (NSDictionary *)info
{
    id<BoCPressPage> lastPage = _currentPage;
    id<BoCPressSecurityFamily> family = [info objectForKey: kType_Global_SecurityFamily];
    
    _currentPage = [[BoCPressLongTermQuoteListPage alloc] initWithLastPage:lastPage
                                                         forSecurityFamily:family 
                                                            fromDataSource:[[[BoCPressQuoteListDataSource alloc] initWithService:_dataSource] autorelease]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                 _currentPage, @"page",
                                                                 nil]];
}

- (void)showQuoteContentPageWithInfo:(id)info
{
    id<BoCPressSecurity> security = [info objectForKey:kType_GLobal_SecurityObject];
    NSArray *securities = [info objectForKey:kType_Global_NSArray];
    
    id<BoCPressPage> lastPage = _currentPage;
    
    _currentPage = [[BoCPressQuoteContentPage alloc] initWithLastPage:lastPage 
                                                         inSecurities: securities
                                                          initialInfo: info
                                                           dataSource: [[[BoCPressQuoteContentDatasource alloc] initWithService:_dataSource
                                                                                                                              security:security
                                                                         securities: securities] autorelease]
                    ];
    
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
}

#pragma mark - read critic
- (void)readListOfCriticPost: (id) userInfo
{
    
    //may browse backward, so not release _currentPage
    //
    
    id<BoCPressPage> lastPage = _currentPage;
    id<BoCPressCriticDataSource> dataSource = [[BoCPressCriticDataSource alloc] initWithService: [_dataSource serviceByIdentity: BoCPressCriticServiceID]
                                                                           configurationService: [_dataSource serviceByIdentity: BoCPressConfigurationServiceID]];

    _currentPage = [[BoCPressCriticPostListPage alloc] initWithLastPage: lastPage 
                                                                 critic: [userInfo objectForKey:kCriticPost_CriticIdentity]
                                                             dataSource: dataSource
                                                               pageFlag: [userInfo objectForKey:kCriticPost_CriticPostPageFlag]];
    [dataSource release];
    
    NSDictionary *pageInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              _currentPage, @"page",
                              kBoCPress_View_AnimationTypeTopToBottom, kBoCPress_Global_AnimationType,
                              nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: pageInfo];
    
    [pageInfo release];
    
    
}

- (void)readCriticPostInPostListWithInfo: (id)data
{ 
    id<BoCPressNews> criticPost = [data objectForKey: @"criticPost"];
    id pageDirection = [data objectForKey: kBoCPressNewsPage_pageSlideDirection];
    
    if (pageDirection)
    {
        [(BoCPressCriticPostPage*)_currentPage updateData: criticPost 
                                            withDirection: pageDirection];        
    }else 
    {
        NSArray *postList = [data objectForKey: @"postList"];
        id pageFlag = [data objectForKey: kCriticPost_CriticPostPageFlag];

        id<BoCPressPage> lastPage = _currentPage;
    
        id<BoCPressCriticDataSource> dataSource = [[BoCPressCriticDataSource alloc] initWithService: [_dataSource serviceByIdentity: BoCPressCriticServiceID]
                                                                               configurationService: [_dataSource serviceByIdentity: BoCPressConfigurationServiceID]];

        _currentPage = [[BoCPressCriticPostPage alloc] initWithLastPage: lastPage 
                                                             criticPost: criticPost
                                                             inPostList: postList
                                                             dataSource: dataSource
                                                               pageFlag: pageFlag];
        [dataSource release];
        NSDictionary *pageInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  _currentPage, @"page",nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                            object: self
                                                          userInfo: pageInfo];
        [pageInfo release];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([_currentPage respondsToSelector:@selector(shouldAutorotateToInterfaceOrientation:)])
    {        
        return [_currentPage shouldAutorotateToInterfaceOrientation: interfaceOrientation];
    }else
    {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
}

#pragma mark - More page judge

- (void)readHelpPage
{
    
    //may browse backward, so not release _currentPage
    //
    id<BoCPressPage> lastPage = _currentPage;
    
    _currentPage = [[BoCPressHelpPage alloc] initWithLastPage:lastPage
                                                    pageTitle:@"帮助" 
                                                     identity:kBoCPress_Global_HelpPageColumnID 
                                                   dataSource:[[[BoCPressHelpDataSource alloc] initWithService:_dataSource] autorelease]
                    ];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
}

- (void)readAboutPage
{
    
    //may browse backward, so not release _currentPage
    //
    id<BoCPressPage> lastPage = _currentPage;
    
    _currentPage = [[BoCPressHelpPage alloc] initWithLastPage:lastPage 
                                                    pageTitle:@"关于"
                                                     identity:kBoCPress_Global_AboutPageColumnID 
                                                   dataSource:[[[BoCPressHelpDataSource alloc] initWithService:_dataSource] autorelease]
                    ];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                 _currentPage, @"page",
                                                                 nil]];
}

- (void)showUserFeedbackPage
{
    
    //may browse backward, so not release _currentPage
    //
    id<BoCPressPage> lastPage = _currentPage;
    
    _currentPage = [[BoCPressUserFeedBackPage alloc] initWithLastPage:lastPage 
                                                        andDataSource:[[[BoCPressUserFeedBackDataSource alloc] initWithService:_dataSource] autorelease]] ;
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                 _currentPage, @"page",
                                                                 nil]];
}

#pragma mark - Application become active processing
- (void)updateCurrentPage
{    
    [_currentPage wantToForceRefreshCurrentContentWithInfo: nil];
}

#pragma mark - store tab state
- (void)storeCurrentTabState: (id) currentTabIdentity
{
    if (_currentPage && currentTabIdentity)
    {        
        [_storedTabState setObject:_currentPage forKey:currentTabIdentity];
    }
}

- (void)removeLastViewOfCurrentTab
{
    if ([_currentStacks count] > 0)
    {        
        [_currentStacks removeLastObject];
    }
}

- (void)addViewToCurrentStack:(UIView *)view
{
    [_currentStacks addObject:view];
}

- (UIView *)lastViewInCurrentViewStack
{
    return [_currentStacks lastObject];
}

- (void)clearCurrentPageAfterNetworkTimeOutWithInfo:(NSDictionary *)info
{
    if ([_currentPage respondsToSelector:@selector(clearCurrentPageAfterNetworkTimeOutWithInfo:)])
    {
        [_currentPage clearCurrentPageAfterNetworkTimeOutWithInfo: info];
    }
}

- (void)willRefetchConfiguration
{
    
    BOOL shouldRefetchConfigurationAtCurrentContext = YES;
    if ([_currentPage respondsToSelector:@selector(shouldRefetchConfigurationAtCurrentContext)])
    {
        shouldRefetchConfigurationAtCurrentContext = [_currentPage shouldRefetchConfigurationAtCurrentContext];
    }
    
    if (shouldRefetchConfigurationAtCurrentContext)
    {            
        [[NSNotificationCenter defaultCenter] postNotificationName: kBoCPress_Global_startToFetchGUIConfiguration
                                                            object: self
                                                          userInfo: nil];
    }
}

#pragma mark - show account login page
- (void)showAccountLoginPage
{
    [self showAccountLoginPageWithCallbackInfo: nil];
}

- (void)showVIPAccountRegisterPage
{
    id<BoCPressPage> lastPage = _currentPage;
    
    _currentPage = [[BoCPressVIPServicePage alloc] initWithLastPage:lastPage 
                                                         dataSource:[[[BoCPressVIPServiceDataSource alloc] initWithService:_dataSource] autorelease]];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
    
}

- (void)showNormalAccountRegisterPage
{
    id<BoCPressPage> lastPage = _currentPage;
    _currentPage = [[BoCPressNormalAccountRegisterPage alloc] initWithLastPage:lastPage 
                                                                    dataSource:[[[BoCPressNormalAccountRegisterDataSource alloc] 
                                                                                 initWithService:_dataSource] autorelease]
                    ];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
}


- (void)showFindPasswordPage
{
    id<BoCPressPage> lastPage = _currentPage;
    
    id<BoCPressAccountDataSource> dataSource = [[BoCPressAccountDataSource alloc] initWithService: [_dataSource serviceByIdentity: BoCPressAccountServiceID]
                                                                                  userInfoService: [_dataSource serviceByIdentity: BoCPressUserInfoServiceID]
                                                                             configurationService: [_dataSource serviceByIdentity: BoCPressConfigurationServiceID]];

    _currentPage = [[BoCPressFindPasswordPage alloc] initWithLastPage: lastPage 
                                                           dataSource: dataSource];
    [dataSource release];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
}


- (void)showChangePasswordPage
{
    id<BoCPressPage> lastPage = _currentPage;
    
    id<BoCPressAccountDataSource> dataSource = [[BoCPressAccountDataSource alloc] initWithService: [_dataSource serviceByIdentity: BoCPressAccountServiceID]
                                                                                  userInfoService: [_dataSource serviceByIdentity: BoCPressUserInfoServiceID]
                                                                             configurationService: [_dataSource serviceByIdentity: BoCPressConfigurationServiceID]];

    _currentPage = [[BoCPressChangeUserPasswordPage alloc] initWithLastPage:lastPage
                                                                 dataSource: dataSource];
    [dataSource release];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
    
}

- (void)showActivateCodePage
{
    id<BoCPressPage> lastPage = _currentPage;
    
    _currentPage = [[BoCPressActivateCodePage alloc] initWithLastPage:lastPage
                                                           dataSource:[[[BoCPressActivateCodeDataSource alloc] 
                                                                        initWithService:_dataSource] autorelease]];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
}

- (void)showProtocolPage
{
    id<BoCPressPage> lastPage = _currentPage;
    
    _currentPage = [[BoCPressHelpPage alloc] initWithLastPage:lastPage
                                                    pageTitle:@"免责声明" 
                                                     identity:kBoCPress_Global_ProtocolPageColumnID
                                                   dataSource:[[[BoCPressHelpDataSource alloc] initWithService:_dataSource] autorelease]
                    ];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
}

- (void)showVIPActivateCodePage
{
    id<BoCPressPage> lastPage = _currentPage;
    
    _currentPage = [[BoCPressActivateCodePage alloc] initWithLastPage:lastPage dataSource:[[[BoCPressActivateCodeDataSource alloc] initWithService:_dataSource] autorelease]];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
    
}

- (void)showBuyCardPage
{
    id<BoCPressPage> lastPage = _currentPage;
    
    _currentPage = [[BoCPressBuyCardPage alloc] initWithLastPage:lastPage dataSource:[[[BoCPressBuyCardDataSource alloc] initWithService:_dataSource] autorelease]];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
}


- (void)stepToRefreshCurrentPage
{
    if ([_currentPage respondsToSelector:@selector(didUpdateData)])
    {        
        [_currentPage didUpdateData];
    }
    
    [_currentPage wantToForceRefreshCurrentContentWithInfo:nil];
}

- (void)finishedShowVIPAuthorizeView
{
    if ([_currentPage respondsToSelector:@selector(finishedShowVIPAuthorizeView)])
    {
        [_currentPage finishedShowVIPAuthorizeView];
        [_currentStacks removeLastObject];
        [_currentStacks removeLastObject];
        [_currentStacks addObject:_currentPage];
    }
}

- (void)updateApplicationState: (id)applicationState
{
    [_applicationState release];
    _applicationState = [applicationState retain];
}
- (id)applicationState
{
    return _applicationState;
}

- (void)showLandscapeQuoteContentPage:(id)info
{
    NSArray *securities = [info objectForKey:kType_Global_NSArray];
    BoCPressQuoteContentDatasource *quoteContentDatasource = [info objectForKey:kBoCPress_Data_Datasource];
    
    id<BoCPressPage> lastPage = _currentPage;
    NSUInteger currentTimeEntryIndex = [[info objectForKey:kBoCPress_Global_Index] integerValue];
    NSMutableArray *currentImages = [info objectForKey:kQuoteContentPage_ChartViewImages];
    
    _currentPage = [[BoCPressQuoteContentLandscapePage alloc] initWithLastPage:lastPage 
                                                                  inSecurities: securities
                                                         currentTimeEntryIndex:currentTimeEntryIndex
                                                                 currentImages:currentImages 
                                                                    dataSource:quoteContentDatasource];
    
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
}

#pragma mark - advertisement

- (void)showAdvertisementView
{
    BoCPressAdvertisementView *advertisementView = [[BoCPressAdvertisementView alloc] initWithDataSource: 
                                                    [[[BoCPressAdvertisementDataSource alloc] initWithService:_dataSource] autorelease]];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                              advertisementView, @"BoCPressAdvertisementView", 
                              nil];
    
    [advertisementView release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_showAdvertisementView
                                                        object: self
                                                      userInfo: userInfo];
    
    [userInfo release];    
}

- (BOOL)couldShowAdvertisementInCurrentContext
{
    return [_dataSource couldShowAdvertisementInCurrentContext];
}

- (void)showAdvertisementDetailPageWithInfo: (id)info
{
    NSURLRequest *request = [info objectForKey: @"NSURLRequest"];
    NSString *pageTitle = [info objectForKey: @"pageTitle"];
    
    id<BoCPressPage> lastPage = _currentPage;
    _currentPage = [[BoCPressAdvertisementDetailPage alloc] initWithLastPage: lastPage
                                                                   pageTitle: pageTitle
                                                                  URLRequest: request];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
    
}

- (BoCPressSplashAdvertisementView *)splashAdvertisementViewWithNews: (id<BoCPressNews>)news
{
    BoCPressSplashAdvertisementView *splashAdvertisementView = [[BoCPressSplashAdvertisementView alloc] initWithNews: news
                                                                                       splashAdvertisementDataSource: 
                                                                [[[BoCPressSplashAdvertisementDataSource alloc] initWithService: _dataSource] autorelease]];
    return [splashAdvertisementView autorelease];
}

#pragma mark - remote notification actions


- (void)navigateToCertainCriticListWithInfo: (id)info
{
    NSString *criticID = [info objectForKey: @"arg"];
    id<BoCPressAuthor> critic = [[BoCPressAuthor alloc] initWithIdentity: criticID
                                                                    name: @"Test"
                                                            authorAvatar: nil
                                                       briefIntroduction: nil] ;
    
    id<BoCPressPage> lastPage = _currentPage;
    id<BoCPressCriticDataSource> dataSource = [[BoCPressCriticDataSource alloc] initWithService: [_dataSource serviceByIdentity: BoCPressCriticServiceID]
                                                                           configurationService: [_dataSource serviceByIdentity: BoCPressConfigurationServiceID]];

    _currentPage = [[BoCPressCriticPostListPage alloc] initWithLastPage: lastPage 
                                                                 critic: critic
                                                             dataSource: dataSource                                                               
                                                               pageFlag: kCriticPost_NoDeeper];
    
    [critic release];
    
    NSDictionary *pageInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              _currentPage, @"page",
                              kBoCPress_View_AnimationTypeTopToBottom, kBoCPress_Global_AnimationType,
                              nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: pageInfo];
    
    [pageInfo release];
}

- (void)navigateToCertainCriticPostOfServerNotificationWithInfo: (NSDictionary *)info
{
    id<BoCPressServerPushNotification> serverNotification = [info objectForKey: @"notification"];

    NSString *postID = [serverNotification actionArgument];
                        
    id<BoCPressPage> lastPage = _currentPage;
    id<BoCPressNews> news = [[BoCPressNews alloc] initWithIdentity: postID
                                                              name: @"TestPost"
                                                          postTime: nil
                                                   articleAbstract: nil
                                                    articleContent: nil
                                                            author: nil];
    
    id<BoCPressCriticDataSource> dataSource = [[BoCPressCriticDataSource alloc] initWithService: [_dataSource serviceByIdentity: BoCPressCriticServiceID]
                                                                           configurationService: [_dataSource serviceByIdentity: BoCPressConfigurationServiceID]];

    _currentPage = [[BoCPressCriticPostPage alloc] initWithLastPage: lastPage 
                                                         criticPost: news
                                                         inPostList: nil
                                                         dataSource: dataSource
                                                           pageFlag: kCriticPost_NoDeeper];
    [news release];
    [dataSource release];
    
    NSDictionary *pageInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: pageInfo];
    [pageInfo release];
}

- (void)navigateToCertainQuotePageOfServerNotificationWithInfo: (NSDictionary *)info
{
    id<BoCPressServerPushNotification> serverNotification = [info objectForKey: @"notification"];
    NSString *securityID = [serverNotification  actionArgument];
    id<BoCPressSecurity> security = [[BoCPressSecurity alloc] initWithIdentity: securityID
                                                                          name: @"name"
                                                                     lastValue: nil 
                                                                lastPercentage: nil
                                                                      inFamily: nil];
    
    NSArray *securities = nil;
    
    id<BoCPressPage> lastPage = _currentPage;
    
    _currentPage = [[BoCPressQuoteContentPage alloc] initWithLastPage:lastPage 
                                                         inSecurities: securities
                                                          initialInfo: nil
                                                           dataSource: [[[BoCPressQuoteContentDatasource alloc] initWithService: _dataSource 
                                                                                                                              security: security
                                                                                                                            securities: nil] autorelease]
                    ];
    
    [security release];
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];
}

- (void)navigateToCertainNewsOfServerNotificationWithInfo: (NSDictionary *)info
{
    id<BoCPressServerPushNotification> serverNotification = [info objectForKey: @"notification"];

    NSString *newsID = [serverNotification actionArgument];
    
    id<BoCPressNews> news = [[BoCPressNews alloc] initWithIdentity: newsID
                                                              name: @"资讯"
                                                          postTime: nil
                                                   articleAbstract: nil
                                                    articleContent: nil
                                                            author: nil];

    NSDictionary *logInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              kBoCPressNewsPage_pageSlideDirectionNext, kBoCPressNewsPage_pageSlideDirection,
                              @"info!pninfo", @"actionType", 
                              nil];
    
    [_dataSource contentOfNews: news
                          info: logInfo
                  withCallback: _handler];
    
    [logInfo release];
    [news release];
}

#pragma mark - remote notification

- (void)showRemoteNotificationConfigurationPageWithData: (NSDictionary *)config
{
    id<BoCPressPage> lastPage = _currentPage;
    id<BoCPressRemoteNotificationDataSource> remoteNotificationConfigurationDataSource = [[BoCPressRemoteNotificationDataSource alloc] initWithService: _dataSource];
    _currentPage = [[BoCPressRemoteNotificationConfigurationPage alloc] initWithLastPage: lastPage 
                                                                 configurationFromServer: config
                                                                              dataSource: remoteNotificationConfigurationDataSource];
    [remoteNotificationConfigurationDataSource release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                 _currentPage, @"page",
                                                                 nil]];

    
}

- (BOOL)respondsToRemoteNotification: (NSDictionary *)info
{
    [_currentPage respondsToRemoteNotification: info];

    return YES;
    
}

- (void)showRemoteNotificationContentPage
{
    [_dataSource scheduleToDeleteLocalStorageOfRemoteNotification];
    
    if ([[_currentPage identity] isEqual: [BoCPressRemoteNotificationListPage identity]])
    {
        return;
    }
    
    id<BoCPressPage> lastPage = _currentPage;
    id<BoCPressRemoteNotificationDataSource> remoteNotificationConfigurationDataSource = [[BoCPressRemoteNotificationDataSource alloc] initWithService: _dataSource];
    _currentPage = [[BoCPressRemoteNotificationListPage alloc] initWithLastPage: lastPage 
                                                                        dataSource: remoteNotificationConfigurationDataSource];
    [remoteNotificationConfigurationDataSource release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                 _currentPage, @"page",
                                                                 nil]];

}

- (void)showAccountLoginPageWithCallbackInfo: (NSDictionary *)callbackInfo
{
    id<BoCPressPage> lastPage = _currentPage;
    id<BoCPressAccountDataSource> dataSource = [[BoCPressAccountDataSource alloc] initWithService: [_dataSource serviceByIdentity: BoCPressAccountServiceID]
                                                                                            userInfoService: [_dataSource serviceByIdentity: BoCPressUserInfoServiceID]
                                                                                       configurationService: [_dataSource serviceByIdentity: BoCPressConfigurationServiceID]];
    
    _currentPage = [[BoCPressAccountLoginPage alloc] initWithLastPage:lastPage
                                                           dataSource: dataSource];
    [dataSource release];
    
    [lastPage attachCallbackInfo: callbackInfo
                         forType: kBoCPress_AttachedCallbackInfoTypeExecuteWhenDidBeenBackwardFromLastPage];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];

}

- (void)showVIPAccountRegisterPageWithCallbackInfo: (NSDictionary *)callbackInfo
{

    id<BoCPressPage> lastPage = _currentPage;
    [_currentPage attachCallbackInfo: callbackInfo
                             forType: kBoCPress_AttachedCallbackInfoTypeExecuteWhenDidBeenBackwardFromLastPage];
    
    _currentPage = [[BoCPressVIPServicePage alloc] initWithLastPage:lastPage 
                                                         dataSource:[[[BoCPressVIPServiceDataSource alloc] initWithService:_dataSource] autorelease]];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:_currentPage, @"page",nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: userInfo];
    [userInfo release];

}

- (void)didUpdateDataOfCurrentPageWhenServerError: (NSDictionary *)userInfo
{    
    if ([_currentPage respondsToSelector: @selector(didReceivedErrorFromServerWithInfo:)])
    {
        [_currentPage didReceivedErrorFromServerWithInfo: userInfo];
    }
}

- (void)handleRemoteNotificationForNotificationWithInfo: (NSDictionary *)info
{
    [_dataSource requestRemoteNotificationForNotification: info
                                                 callback: _handler];
}

- (void)applicationWillBecomeDeactive
{
    [_dataSource applicationWillBecomeDeactive];
}

- (void)showContentOfRemoteNotificationWithInfo:(NSDictionary *)info
{
    id<BoCPressServerPushNotification> notification = [info objectForKey: @"notification"];
    
    NSString *action = [notification action];
    NSString *argument = [notification actionArgument];
    
    if ([action isEqualToString: @"url"])
    {
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString: argument]];
    }
    if ([action isEqualToString: @"quote"])
    {
        [self navigateToCertainQuotePageOfServerNotificationWithInfo: info];
    }
    if([action isEqualToString: @"opinion"])
    {
        [self navigateToCertainCriticPostOfServerNotificationWithInfo: info];
    }
    if ([action isEqualToString: @"post"])
    {
        [self navigateToCertainNewsOfServerNotificationWithInfo: info];
    }
    if ([action isEqualToString: @"notification"])
    {
        [self handleRemoteNotificationForNotificationWithInfo: info];
    }
}

- (NSUInteger)numberOfNewRemoteNotification
{
    return [_dataSource numberOfNewRemoteNotification];
}

- (void)didReceiveDeviceToken: (NSData *)deviceToken
{
    [_dataSource didReceiveDeviceToken: deviceToken 
                          withCallback: _handler];
}

- (void)navigateToRemoteNotificationPageWithInfo: (id)data
{
    id argument = [data objectForKey: kNetwork_getPushNotificationArgument];
    id<BoCPressNews> news = [data objectForKey: argument];

    id<BoCPressPage> lastPage = _currentPage;
    BoCPressRemoteNotificationPage *newsPageOfRemoteNotification = [[BoCPressRemoteNotificationPage alloc] initWithLastPage: lastPage
                                                                                                                  forNews: news
                                                                                                               inNewsList: nil
                                                                                                           fromDataSource: [[[BoCPressNewsDataSource alloc] initWithService:  _dataSource] autorelease]];
    [newsPageOfRemoteNotification updateContentOfNews: news 
                                        withDirection: kBoCPressNewsPage_pageSlideDirectionNone];
    [newsPageOfRemoteNotification setCouldNavigate: NO];
    [newsPageOfRemoteNotification setCouldFeedBack: NO];
    
    _currentPage = newsPageOfRemoteNotification;
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSlideToPage 
                                                        object: self
                                                      userInfo: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                 _currentPage, @"page",
                                                                 nil]];
    
   
}

- (void)currentPageDidCancelledHandleErrorOfServerWithData: (NSDictionary *)data
{
    if ([_currentPage respondsToSelector: @selector(didCancelledHandleErrorOfServerWithData:)])
    {
        [_currentPage didCancelledHandleErrorOfServerWithData: data];
    }
}

#pragma mark - new api 

- (void)tryToReadNewsInNewsListWithInfo: (NSDictionary *)info
{
    BoCPressNews* news = [info objectForKey: kBoCPress_Global_NewsType];

    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] initWithDictionary: info];
    
    NSDictionary *logInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                             kBoCPressNewsPage_pageSlideDirectionNext, kBoCPressNewsPage_pageSlideDirection,
                             @"info!pninfo", @"actionType", 
                             nil];
    
    [userInfo setObject: logInfo
                 forKey: @"logInfo"];
    
    [logInfo release];

    [_dataSource contentOfNews: news
                          info: userInfo
                  withCallback: _handler];
    
    [userInfo release];
}

- (void)tryToReadCriticPostInPostListWithInfo: (NSDictionary *)userInfo
{ 
    id<BoCPressNews> criticPost = [userInfo objectForKey: @"criticPost"];
    
    NSMutableDictionary *info = [[NSMutableDictionary alloc] initWithDictionary: userInfo];
    
    NSDictionary *logInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                             kBoCPressNewsPage_pageSlideDirectionNext, kBoCPressNewsPage_pageSlideDirection,
                             @"info!pninfo", @"actionType", 
                             nil];
    
    [info setObject: logInfo
             forKey: @"logInfo"];
    
    [logInfo release];
    
    [_dataSource contentOfCriticPost: criticPost
                                info: info
                        withCallback: _handler];
    [info release];
    
}

- (void)tryToReadLongTermListOfSecurityInFamilyWithInfo: (NSDictionary *)info
{
    id<BoCPressSecurityFamily> family = [info objectForKey: kType_Global_SecurityFamily];
    [_dataSource listOrderedLongTermSecurityInFamily: family
                                        withCallback: _handler];
}

- (void)tryToReadListOfSecurityInFamilyWithInfo: (NSDictionary *)info
{
    id<BoCPressSecurityFamily> family = [info objectForKey: kType_Global_SecurityFamily];
    [_dataSource listOrderedSecurityInFamily: family
                                withCallback: _handler
                                 triggerFlag: kString_Global_UpdateTriggerFlagByUser];
}

- (void)tryToShowQuoteContentPageWithInfo: (NSDictionary *)info
{
    id<BoCPressSecurity> security = [info objectForKey: kType_GLobal_SecurityObject];
    NSArray *securities = [info objectForKey: kType_Global_NSArray];
    
    [_dataSource contentOfQuote: security
                   inSecurities: securities
                   withCallback: _handler];
}

- (void)tryToPlayMediaWithInfo: (NSDictionary *)info
{
    id<BoCPressMedia> media = [info objectForKey: kType_Global_MediaObject];
    id<BoCPressMediaType> mediaType = [info objectForKey: kType_Global_MediaTypeObject];
    
    [_dataSource contentOfMedia: media
                      mediaType: mediaType
                   withCallback: _handler];
}

- (void)willHandleErrorOfServerWithInfo: (NSDictionary *)info
{
    if ([_currentPage respondsToSelector: @selector(willHandleErrorOfServerWithData:)])
    {
        [_currentPage willHandleErrorOfServerWithData: info];
    }
}
@end
