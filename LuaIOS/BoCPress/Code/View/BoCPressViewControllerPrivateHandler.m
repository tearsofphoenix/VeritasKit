#import "BoCPressViewControllerPrivateHandler.h"

#import "BoCPressViewController.h"

#import "BoCPressConstant.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressViewConstants.h"

@implementation BoCPressViewControllerPrivateHandler

#pragma mark - Instance initialization

- (id)initWithState: (BoCPressViewState *)state 
  forViewController: (BoCPressViewController *)viewController 
{
    
    self = [super init];
    if (self)
    {
        
        _state = state;
        _viewController = viewController;
        
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidSwitchToTab:) 
                              name: kViewController_didSwitchToTab
                            object: _state];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidSlideToPage:) 
                              name: kViewController_didSlideToPage
                            object: _state];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidBrowseBackwardToPage:) 
                              name: kViewController_didBrowseBackwardToPage
                            object: _state];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToPlayMedia:) 
                              name: kViewController_wantToPlayMedia
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToReadListOfMediaOfType:) 
                              name: kViewController_wantToReadListOfMediaType
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToReadListOfNews:) 
                              name: kViewController_wantToReadListOfNews
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantNewsInNewsList:) 
                              name: kViewController_wantToReadNews_inNewsList
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToReadListOfSecurityInFamily:) 
                              name: kViewController_wantToReadListOfSecurityInFamily
                            object: nil];
        [defaultCenter addObserver:self selector:@selector(notificationForWantToReadLongTermListOfSecurityInFamily:) 
                              name:kViewController_wantToReadLongTermListOfSecurityInFamily 
                            object:nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToReadListOfCriticPost:) 
                              name:kViewController_wantToReadListOfCriticPost
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToReadCriticPost:) 
                              name: kViewController_wantToReadCriticPost_inPostList_pageFlag_
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForUpdateNavigationBar:) 
                              name: kViewController_updateNavigationBar
                            object: nil];
                
        [defaultCenter addObserver:self 
                          selector:@selector(notificationForShowFeedBackView:) 
                              name:kBoCPressViewControllerPrivateHandler_notificationForShowFeedBackView
                            object:nil];
        
        [defaultCenter addObserver:self 
                          selector:@selector(notificationForRemoveFeedBackView:) 
                              name:kBoCPressViewControllerPrivateHandler_notificationForRemoveFeedBackView 
                            object:nil];
        
        [defaultCenter addObserver:self 
                          selector:@selector(notificationForReadHelpPage:) 
                              name:kViewController_wantToReadHelpPage 
                            object:nil];
        [defaultCenter addObserver:self 
                          selector:@selector(notificationForReadAboutPage:)
                              name:kViewController_wantToReadAboutPage 
                            object:nil];
        [defaultCenter addObserver:self
                          selector:@selector(notificationForShowUserFeedbackPage:) 
                              name:kViewController_wantoShowUserFeedbackPage
                            object:nil];
        [defaultCenter addObserver:self
                          selector:@selector(notificationForWantToUpdateCurrentPage:) 
                              name:kViewController_wantToUpdateCurrentPage
                            object:nil];
        
        [defaultCenter addObserver:self 
                          selector:@selector(notificationForStepToRefreshCurrentPage:) 
                              name:kViewController_wantToStepToRefreshCurrentPage
                            object:nil];
        
        [defaultCenter addObserver:self 
                          selector:@selector(notificationForDidRefreshToTab:) 
                              name:kViewController_didRefreshToTab 
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForCouldBrowseBackward:) 
                              name:kViewController_couldBrowseBackward 
                            object:nil];
        
        [defaultCenter addObserver: self 
                          selector: @selector(notificationForDidLoadGUIConfiguration:) 
                              name: kViewController_didLoadGUIConfiguration 
                            object: nil];
        
        [defaultCenter addObserver: self 
                          selector: @selector(handleNetworkTimeOutEvent:) 
                              name: kBoCPress_Global_NotificationForNetworkTimeOut 
                            object: nil];
        
        [ defaultCenter addObserver: self 
                           selector: @selector(notificationForRefetchConfiguration:) 
                               name: kNotification_Global_didEnterForeground 
                             object: nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForDidUpdateDataOfCurrentPage:)
                              name:kBoCPress_View_didUpdateDataOfCurrentPage 
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForShowAccountLoginPage:) 
                              name:kViewController_wantoToShowAccountLoginPage 
                            object:nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForShowAccountLoginPageWithCallbackInfo:)
                              name: kViewController_wantoToShowAccountLoginPageWithCallbackInfo
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForShowVIPAccountRegisterPageWithCallbackInfo:)
                              name: kViewController_wantToShowVIPAccountRegisterPageWithCallbackInfo
                            object: nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForShowVIPAccountRegisterPage:) 
                              name:kViewController_wantToShowVIPAccountRegisterPage
                            object:nil];
        [defaultCenter addObserver:self
                          selector:@selector(notificationForShowNormalAccountRegisterPage:)
                              name:kViewController_wantToShowNormalAccountRegisterPage
                            object:nil];
        
        [defaultCenter addObserver:self 
                          selector:@selector(notificationForWantToSlideToTabAtIndex:)
                              name:kViewController_wantToSlideToTabAtIndex
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForWantToShowFindPasswordPage:) 
                              name:kViewcontroller_wantToShowFindPasswordPage 
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForWantToShowChangePasswordPage:) 
                              name:kViewController_wantToShowChangePasswordPage 
                            object:nil];
        
        [defaultCenter addObserver:self selector:@selector(notificationForWantToShowActivateCodePage:) 
                              name:kViewController_wantToShowActivateCodePage 
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForWantToReadProtocolPage:) 
                              name:kViewController_wantToReadProtocolPage 
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForWantToShowVIPActivateCodePage:) 
                              name:kViewController_wantToShowVIPActivateCodePage
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForWantToShowBuyCardPage:) 
                              name:kViewController_wantToShowBuyCardPage 
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForShowProtocolView:) 
                              name:kViewController_wantToShowProtocolView
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForShowAuthorizeSuccessView:) 
                              name:kViewController_wantToShowVIPAuthorizeSuccessView 
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForFinishedShowVIPAuthorizeSuccessView:)
                              name:kViewController_finishedShowVIPAuthorizeSuccessView 
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForWantToShowQuoteContentPage:)
                              name:kNotification_View_wantToShowQuoteContentPage
                            object:nil];
        
        [ defaultCenter addObserver:self
                           selector:@selector(notificationUpdatePageTitle:)
                               name:kNavigationBarView_updatePageTitle
                             object:nil];
        [defaultCenter addObserver:self
                          selector:@selector(notificationForWantToShowLandscapeQuoteContentPage:) 
                              name:kViewController_wantToShowLandscapeQuoteContentPage 
                            object:nil];
        
        [defaultCenter addObserver:self
                          selector:@selector(notificationForShowMediaPlayer:)
                              name:kViewController_showMediaPlayer
                            object:nil];

        [defaultCenter addObserver: self
                          selector: @selector(notificationForSetUserInteraction:) 
                              name: kNotification_Global_seteUserInteraction
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWillBecomeDeactive:)
                              name: kNotification_Global_willBecomeDeactive
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToShowAdvertisementView:)
                              name: kViewController_wantToShowAdvertisementView
                            object: nil];
        [defaultCenter addObserver: self
                          selector: @selector(notificationForShowAdvertisementView:) 
                              name: kViewController_showAdvertisementView
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToCloseAdvertisementView:)
                              name: kViewControler_wantToCloseAdvertisementView
                            object: nil];
         
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidAdvertisementFinishedLoading:)
                              name: kViewController_didAdvertisementFinishedLoad
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToShowAdvertisementDetailPage:)
                              name: kViewController_wantToShowAdvertisementDetailPage
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidGetSplashAdvertisement:)
                              name: kViewController_didGetSplashAdvertisement
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidSplashAdvertisementFinishedLoad:)
                              name: kViewController_didSplashAdvertisementFinishedLoad
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidSplashAdvertisementViewTaped:)
                              name: kViewController_didSplashAdvertisementViewTaped
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidQuoteHomeFinishedUpdateData:)
                              name: kViewController_didQuoteHomeFinishedUpdateData
                            object: nil];
         
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidQuoteListPageFinishedUpdateData:)
                              name: kViewController_didQuoteListPageFinishedUpdateData
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidLoadGUIConfigurationWhenTimeOut:)
                              name: kViewController_didLoadGUIConfigurationWhenTimeOut
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForShowRemoteConfigurationPage:)
                              name: kNotification_ViewController_wantToShowRemoteNotificationConfiguration
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidReceiveRemoteNotification:)
                              name: kNotification_ViewController_didReceiveRemoteNotification
                            object: nil];
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToShowRemoteNotificationContentPage:)
                              name: kNotification_ViewController_wantToShowRemoteNotificationContent
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToShowContentOfRemoteNotification:)
                              name: kNotification_ViewController_wantToShowContentPageOfRemoteNotification
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidBeenLaunchedWithRemoteNotification:)
                              name: kNotification_Global_didBeenLaunchedWithRemoteNotification
                            object: nil];
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidReceiveRemoteNotificationFromBackground:)
                              name: kNotification_Global_didReceiveNotificationFromBackground
                            object: nil];
        [defaultCenter addObserver: self
                          selector: @selector(notificationForDidUpdateDataOfCurrentPageWhenServerError:)
                              name: kViewController_didUpdateDataOfCurrentPageWhenServerError 
                            object: nil];
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToNavigateToServerPushNotificationCenter:)
                              name: kNotification_ViewController_wantToNavigateToServerPushNotificationCenter
                            object: nil];
        [ defaultCenter addObserver: self
                         selector: @selector(notificationForDidReceiveDeviceToken:)
                             name: kNotification_Global_didReceiveDeviceToken
                           object: nil];

        [ defaultCenter addObserver: self
                           selector: @selector(notificationForRemoteNotificationChanged:)
                               name: kNotification_SoapDataSource_remoteNotificationDidChanged
                             object: nil];

        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToNavigateToNewsInNewsList:)
                              name: kNotification_ViewController_wantToNavigateToNewsInNewsList
                            object: nil];
    }
    
    return self;
    
}
- (void)dealloc
{
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
        
    [super dealloc];
}


#pragma mark - Tab delegate

- (void)currentTab: (id<BoCPressTab>)currentTab 
    didSwitchToTab: (id<BoCPressTab>)tab
        completion: (void (^)(void))block
{
    [_viewController currentTab: currentTab 
                willSwitchToTab: tab
                     completion: block];
}

#pragma mark - Navigation delegate


- (void)didBrowseBackward
{
    [_viewController wantToBrowseBackward];
}

- (void)didReadPreviousPage
{
    [_viewController wantToReadPreviousPage];
}

- (void)didReadNextPage
{
    [_viewController wantToReadNextPage];
}

#pragma mark - State notifications handle

- (void)notificationForDidSwitchToTab: (NSNotification *)notification
{
    id tab = [[notification userInfo] objectForKey: @"tab"];
    id block = [[notification userInfo] objectForKey: kBoCPress_Global_NSMallocBlockObject];
    
    [_viewController switchToTab: tab 
                      completion: block];
}

- (void)notificationForDidRefreshToTab: (NSNotification *)notification
{
    id tab = [[notification userInfo] objectForKey: @"tab"];
    id block = [[notification userInfo] objectForKey: kBoCPress_Global_NSMallocBlockObject];

    [_viewController refreshToTab: tab 
                       completion: block];
}

- (void)notificationForDidSlideToPage: (NSNotification *)notification
{
    NSDictionary* userInfo = [notification userInfo];
    
    [_viewController slideToPage: [userInfo objectForKey:@"page"] 
                    withPageInfo: userInfo
                      completion: nil];
    
}

- (void)notificationForCouldBrowseBackward: (NSNotification *)notification
{
    [_viewController couldBrowseBackwardWithUserInfo: [notification userInfo]];
}

- (void)notificationForDidBrowseBackwardToPage: (NSNotification *)notification
{
    NSDictionary* userInfo = [notification userInfo];
    
    [_viewController browseBackwardToPage: [userInfo objectForKey: @"page"] 
                                 withInfo: userInfo];
}

#pragma mark - Controller notifications handle

- (void)notificationForWantToPlayMedia: (NSNotification *)notification
{    
    [_viewController wantToPlayMediaWithInfo: [notification userInfo]];
    
}

- (void)notificationForWantToReadListOfMediaOfType: (NSNotification *)notification
{
    
    id<BoCPressMediaType> type = [[notification userInfo] objectForKey: kType_Global_MediaTypeObject];
    
    [_viewController wantToReadMediaListOfType: type];
    
}
#pragma mark - Broad Cast notification handle

- (void)notificationForPlayBroadCast: (NSNotification *)notification
{
    
}
#pragma mark - Media notification handle

#pragma mark - News notification handle
- (void)notificationForWantNewsInNewsList: (NSNotification *)notification
{
        
    [_viewController wantToReadNewsInNewsListWithInfo: [notification userInfo]];
    
}


- (void)notificationForWantToReadListOfNews: (NSNotification *)notification
{
    [_viewController wantToReadNewsListWithInfo: [notification userInfo]];
}

- (void)notificationForWantToReadListOfSecurityInFamily: (NSNotification *)notification
{    
    [_viewController wantToReadListOfSecurityInFamilyWithInfo: [notification userInfo]];
}

- (void)notificationForWantToReadLongTermListOfSecurityInFamily: (NSNotification *)notification
{    
    
    [_viewController wantToReadLongTermListOfSecurityInFamilyWithInfo: [notification userInfo]];
    
}

- (void)notificationForWantToReadListOfCriticPost: (NSNotification *)notification
{
    
    [_viewController wantToReadListOfCriticPostWithInfo: [notification userInfo]];
    
}

- (void)notificationForWantToReadCriticPost: (NSNotification *)notification
{
    [_viewController wantToReadCriticPostInPostListWithInfo: [notification userInfo]];
    
}

- (void)notificationForUpdateNavigationBar: (NSNotification *)notification
{
    
    [_viewController updateNavigationBar];
    
}

#pragma mark - More view handle

- (void)notificationForReadHelpPage:(NSNotification *)notification
{
    [_viewController wantToReadHelpPage];
}

- (void)notificationForReadAboutPage: (NSNotification*)notification
{
    [_viewController wantToReadAboutPage];
}
- (void)notificationForShowUserFeedbackPage: (NSNotification *)notification
{
    [_viewController wantToShowUserFeedbackPage];
}

#pragma mark - Notification view handle

- (void)notificationForShowFeedBackView: (NSNotification *)notification
{
    //NSLog(@"sdjkajsk");
    
    [_viewController showFeedBackView:notification];
}

- (void)notificationForRemoveFeedBackView: (NSNotification*)notification
{
    [_viewController removeFeedBackView:notification];
}



#pragma mark - Animation

#pragma mark - Application become actice processing
- (void)notificationForWantToUpdateCurrentPage: (NSNotification*)notification
{
    [_viewController wantToUpdateCurrentPage];
}

- (void)notificationForWantToRedisplayCurrentPage: (NSNotification*)notification
{
    [_viewController wantToRedisplayCurrentPageStart: nil
                                          completion: nil];
}

- (void)stepToGetSplashAdvertisement
{    
    [_viewController wantToNavigateToFirstColumnOfHomeTab];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kSoapDataSource_wantToGetSplashAdvertisement
                                                        object: self
                                                      userInfo: nil];
}

- (void)notificationForDidLoadGUIConfiguration: (NSNotification*) notification
{
    NSDictionary *info = [notification userInfo];
    [_viewController storeMessageInfo: info];
        
    [self stepToGetSplashAdvertisement];
    
    return;
    

    
}

- (void)handleNetworkTimeOutEvent: (NSNotification *)notification
{
    [_viewController handleNetworkTimeOut: [notification userInfo]];
}


- (void)notificationForRefetchConfiguration: (NSNotification *)notification
{
    [_viewController wantToRefetchConfiguration];
}

- (void)notificationForDidUpdateDataOfCurrentPage: (NSNotification *)notification
{
    [_viewController didUpdateDataOfCurrentPage];
}

- (void)notificationForWantToSlideToTabAtIndex: (NSNotification *)notification
{
    NSUInteger tabIndex = [[[notification userInfo] objectForKey:kBoCPress_Global_Index] unsignedIntegerValue];
    [_viewController wantToSwitchToTabAtIndex: tabIndex 
                                   completion: nil];
}
#pragma mark - account login page
- (void)notificationForShowAccountLoginPage: (NSNotification *)notification
{
    [_viewController wantToShowAccountLoginPage];
}

//TODO
- (void)notificationForShowAccountLoginPageWithCallbackInfo: (NSNotification *)notification
{
    [_viewController wantToShowAccountLoginPageWithCallbackInfo: [notification userInfo]];
}

- (void)notificationForShowVIPAccountRegisterPageWithCallbackInfo: (NSNotification *)notification
{
    [_viewController wantToShowVIPAccountRegisterPageWithCallbackInfo: [notification userInfo]];
}

- (void)notificationForShowVIPAccountRegisterPage: (NSNotification *)notification
{
    [_viewController wantToShowVIPAccountRegisterPage];
}

- (void)notificationForShowNormalAccountRegisterPage: (NSNotification *)notification
{
    [_viewController wantToShowNormalAccountRegisterPage];
}


#pragma mark - ==
- (void)notificationForWantToShowFindPasswordPage: (NSNotification *)notification
{
    [_viewController  wantToShowFindPasswordPage];
}

- (void)notificationForWantToShowChangePasswordPage:(NSNotification *)notification
{
    [_viewController wantToShowChangePasswordPage];
}

- (void)notificationForWantToShowActivateCodePage: (NSNotification *)notification
{
    [_viewController wantToShowActivateCodePage];
}

- (void)notificationForWantToReadProtocolPage: (NSNotification *)notification
{
    [_viewController wantToReadProtocolPage];
}

- (void)notificationForWantToShowVIPActivateCodePage: (NSNotification *)notification
{
    [_viewController wantToShowVIPActivateCodePage];
}

- (void)notificationForWantToShowBuyCardPage: (NSNotification *)notification
{
    [_viewController wantToShowBuyCardPage];
}

- (void)notificationForShowProtocolView: (NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                      selector:@selector(notificationForFinishedShowProtocolView:) 
                          name:kViewController_finishedShowProtocolView
                        object:nil];
    
    NSString *protocolContent = [[notification userInfo] objectForKey:kGlobal_ProtocolContent];
    [_viewController showProtocolViewWithProtocolContent: protocolContent];
}

- (void)notificationForFinishedShowProtocolView: (NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kViewController_finishedShowProtocolView
                                                  object:nil];
    
    BOOL agreeWithProtocol = [[[notification userInfo] objectForKey:kBoCPress_Global_ObjectID] boolValue];
    
    [_viewController finishedShowProtocolViewWithFlag:agreeWithProtocol];
    
}

- (void)notificationForShowAuthorizeSuccessView: (NSNotification *)notification
{
    [_viewController showAuthorizeSuccessViewWithInfo: [notification userInfo]];
}

- (void)notificationForFinishedShowVIPAuthorizeSuccessView: (NSNotification *)notification
{
    [_viewController finishedShowVIPAuthorizeView];
}

- (void)notificationForWantToShowQuoteContentPage:(NSNotification *)notification
{
    [_viewController wantToShowQuoteContentPageWithInfo: [notification userInfo]];
}

- (void)notificationForStepToRefreshCurrentPage: (NSNotification *)notification
{
    [_viewController wantToStepToRefreshCurrentPage];
}

- (void)notificationUpdatePageTitle: (NSNotification *)notification
{
    [_viewController updatePageTitle];
}

- (void)notificationForWantToShowLandscapeQuoteContentPage: (NSNotification *)notification
{
    [_viewController wantToShowLandscapeQuoteContentPage:[notification userInfo]];
}

- (void)notificationForShowMediaPlayer: (NSNotification *)notification
{
    [_viewController showMediaPlayer:[notification userInfo]];
}

- (void)notificationForSetUserInteraction: (NSNotification *)notification
{
    BOOL userInteractionState = [[[notification userInfo] objectForKey: kBoCPress_Global_UserInteractionState] boolValue];
    [_viewController setUserInteractionState: userInteractionState];
}

- (void)notificationForWillBecomeDeactive: (NSNotification *)notification
{
    [_viewController willBecomeDeactive];
}

- (void)notificationForWantToShowAdvertisementView: (NSNotification *)notification
{
    [_viewController wantToShowAdvertisementView];
}

- (void)notificationForShowAdvertisementView: (NSNotification *)notification
{
    [_viewController showAdvertisementViewWithInfo: [notification userInfo]];
}

- (void)notificationForWantToCloseAdvertisementView: (NSNotification *)notification
{
    [_viewController wantToCloseAdvertisementView];
}

- (void)notificationForDidAdvertisementFinishedLoading: (NSNotification *)notification
{
    [_viewController wantToMakeAdvertisementViewVisuable];
}

- (void)notificationForWantToShowAdvertisementDetailPage: (NSNotification *)notification
{
    [_viewController wantToShowAdvertisementDetailPageWithInfo: [notification userInfo]];
}

- (void)notificationForDidGetSplashAdvertisement: (NSNotification *)notification
{
    [_viewController wantToShowSplashAdvertisementWithData: [notification userInfo]];
}

- (void)notificationForDidSplashAdvertisementFinishedLoad: (NSNotification *)notification
{
    [_viewController wantToMakeSplashAdvertisementVisuable];
}

- (void)notificationForDidSplashAdvertisementViewTaped: (NSNotification *)notification
{
    [_viewController didSplashAdvertisementViewTaped];
}

- (void)notificationForDidQuoteHomeFinishedUpdateData: (NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: [notification name]
                                                  object: nil];
    
    [_viewController didQuoteHomeFinishedUpdateData];
}

- (void)notificationForDidQuoteListPageFinishedUpdateData: (NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: [notification name]
                                                  object: nil];
    
    [_viewController didQuoteListPageFinishedUpdateData];
}

- (void)notificationForDidLoadGUIConfigurationWhenTimeOut: (NSNotification *)notification
{
    [_viewController didLoadGUIConfigurationWhenTimeOut];
}

- (void)notificationForShowRemoteConfigurationPage: (NSNotification *)notification
{
    [_viewController wantToShowRemoteNotificationConfigurationPage: [notification userInfo]];
}

- (void)notificationForDidReceiveRemoteNotification: (NSNotification *)notification
{
    [_viewController performSelector: @selector(didReceiveRemoteNotification:)
                          withObject: [notification userInfo]
                          afterDelay:  kConstant_ViewController_DefaultDelayOfRemoteNotification];
}

- (void)notificationForWantToShowRemoteNotificationContentPage: (NSNotification *)notification
{
    [_viewController wantToShowRemoteNotificationContentPage: [notification userInfo]];
}

- (void)notificationForWantToShowContentOfRemoteNotification: (NSNotification *)notification
{
    [_viewController wantToShowContentOfRemoteNotification: [notification userInfo]];
}

- (void)notificationForDidBeenLaunchedWithRemoteNotification: (NSNotification *)notification
{
    [_viewController didBeenLauchedWithRemoteNotification: [notification userInfo]];
}
- (void)notificationForDidReceiveRemoteNotificationFromBackground: (NSNotification *)notification
{
    [_viewController didReceiveRemoteNotificationFromBackground: [notification userInfo]];
}

- (void)notificationForDidUpdateDataOfCurrentPageWhenServerError: (NSNotification *)notification
{
    [_viewController didUpdateDataOfCurrentPageWhenServerError: [notification userInfo]];
}

- (void)notificationForWantToNavigateToServerPushNotificationCenter: (NSNotification *)notification
{
    [_viewController wantToNavigateToServerPushNotificationCenter: [notification userInfo]];
}

- (void)notificationForDidReceiveDeviceToken: (NSNotification *)notification
{
    NSData *deviceToken = [[notification userInfo] objectForKey: @"deviceToken"];
    
    [_viewController didReceiveDeviceToken: deviceToken];
    
}

- (void)notificationForRemoteNotificationChanged: (NSNotification *)notification
{
    [_viewController updateRemoteNotificationIndicatorOnNavigationBar];
}

- (void)notificationForWantToNavigateToNewsInNewsList: (NSNotification *)notification
{
    [_viewController wantToNavigateToNewsInNewsList: [notification userInfo]];
}

@end
