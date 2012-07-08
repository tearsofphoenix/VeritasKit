#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>


@class BoCPressViewControllerPrivateHandler;
@class BoCPressNavigationBarView;
@class BoCPressTabBarView;
@protocol BoCPressTab;
@protocol BoCPressPage;
@class BoCPressViewState;
@class BoCPressColumnBarView;
@class BoCPressAdvertisementView;
@protocol BoCPressMediaType;

@protocol BoCPressNewsTag;
@protocol BoCPressNews;
@protocol BoCPressAuthor;

@class BoCPressSplashAdvertisementView;

@interface BoCPressViewController : UIViewController
{
    UIImageView *_backgroundView;
    
    UIView *_interfaceView;
    BoCPressNavigationBarView *_navigationBarView;
    UIView *_pageView;
    BoCPressTabBarView *_tabBarView;
    
    UIView *_splashView;
    UIView *_notificationView;
    
    BoCPressAdvertisementView *_advertisementView;
    BoCPressSplashAdvertisementView *_splashAdvertisementView;

    BoCPressViewState *_state;
    
    BoCPressViewControllerPrivateHandler *_handler;
        
    BOOL _hasReceivedMemoryWarning;
     
    UIAlertView *_onlyAlertViewInApplication;

    NSMutableDictionary *_pageInfo;
    
    //for buy-card page
    //
    UIView *_viewToDisableUserInteraction;
    
    
    BOOL _couldFinishSplash;
    
    id _messageInfo;

    NSMutableArray *_callbackQueueOfLaunch;
    SystemSoundID _audioEffect;

}

#pragma mark - View state

- (void)setViewState: (BoCPressViewState *)state;

#pragma mark - Splash play

- (void)splashFinished;

#pragma mark - Notification play

- (void)notificationsFinished;

- (void)showFeedBackView: (NSNotification*) notification;

- (void)removeFeedBackView:(NSNotification*)notification;

#pragma mark - Tab switching

- (void)wantToSwitchToTab: (id<BoCPressTab>)tab;

- (void)wantToSwitchToTabAtIndex: (NSUInteger)tabIndex
                      completion: ( void(^)(void) )block;

- (void)currentTab: (id<BoCPressTab>)currentTab 
   willSwitchToTab: (id<BoCPressTab>)tab
        completion: (void (^)(void))block;

- (void)switchToTab: (id<BoCPressTab>)tab 
         completion: ( void(^)(void) )block;

- (void)refreshToTab:(id<BoCPressTab>)tab
          completion: (void (^)(void))block;

#pragma mark - Page browsing

- (void)browseBackwardToPage: (id<BoCPressPage>)page 
                    withInfo: (id)info;

#pragma mark - Navigation

- (void)wantToBrowseBackward;

- (void)couldBrowseBackwardWithUserInfo: (NSDictionary *)userInfo;

- (void)wantToReadPreviousPage;

- (void)wantToReadNextPage;

#pragma mark - Media processing

- (void)wantToPlayMediaWithInfo:(NSDictionary *)info;

- (void)wantToReadMediaListOfType: (id<BoCPressMediaType>)mediaType;

- (void)showMediaPlayer: (NSDictionary *)userInfo;

#pragma mark - News processing

- (void)wantToReadNewsInNewsListWithInfo: (NSDictionary *)info;

- (void)wantToReadNewsListWithInfo: (id)userInfo;

#pragma mark - Security processing

- (void)wantToReadListOfSecurityInFamilyWithInfo: (NSDictionary *)info;

- (void)wantToReadLongTermListOfSecurityInFamilyWithInfo: (NSDictionary *)info;

- (void)wantToReadListOfCriticPostWithInfo: (id)info;

- (void)wantToReadCriticPostInPostListWithInfo: (id)info;

#pragma mark - Page processing

- (void)slideToPage: (id<BoCPressPage>)page 
       withPageInfo: (id)info
         completion: (void (^)(void))block;

- (void)updateNavigationBar;

- (void)wantToRedisplayCurrentPageStart: (void (^)(CGRect rest))startBlock
                             completion: (void (^)(void))completionBlock;

#pragma mark - More Page processing

- (void)wantToReadHelpPage;

- (void)wantToReadAboutPage;

- (void)wantToShowUserFeedbackPage;

#pragma mark - Application become active processing

- (void)wantToUpdateCurrentPage;

- (void)handleNetworkTimeOut: (id)userInfo;

- (void)setUserInteractionState: (BOOL)state;

- (void)wantToRefetchConfiguration;

- (void)didUpdateDataOfCurrentPage;

#pragma mark - account login
- (void)wantToShowAccountLoginPage;

- (void)wantToShowVIPAccountRegisterPage;

- (void)wantToShowNormalAccountRegisterPage;

#pragma mark - change password
- (void)wantToShowFindPasswordPage;

- (void)wantToShowChangePasswordPage;

- (void)wantToShowActivateCodePage;

- (void)wantToReadProtocolPage;

- (void)wantToShowVIPActivateCodePage;

- (void) wantToShowBuyCardPage;

- (void)showProtocolViewWithProtocolContent: (NSString *)protocolContent;

- (void)finishedShowProtocolViewWithFlag: (BOOL) flag;

- (void)showAuthorizeSuccessViewWithInfo: (id)userInfo;

- (void)finishedShowVIPAuthorizeView;

- (void)wantToShowQuoteContentPageWithInfo: (id)userInfo;

- (void)wantToStepToRefreshCurrentPage;

- (void)wantToShowLandscapeQuoteContentPage: (id)userInfo;

#pragma mark - for demo

- (void)recoveryNavigationBarForQuoteContentPage;

- (void)updateNavigationBarWithQuoteData: (id)data;

- (void)updatePageTitle;

- (void)willBecomeDeactive;

- (void)wantToShowAdvertisementView;

- (void)showAdvertisementViewWithInfo: (id)info;

- (void)wantToCloseAdvertisementView;

- (void)wantToMakeAdvertisementViewVisuable;

- (void)wantToShowAdvertisementDetailPageWithInfo: (id)info;

- (void)wantToShowSplashAdvertisementWithData: (id)info;

- (void)wantToMakeSplashAdvertisementVisuable;

- (void)didSplashAdvertisementViewTaped;

- (void)wantToNavigateToFirstColumnOfHomeTab;

- (void)didQuoteHomeFinishedUpdateData;

- (void)didQuoteListPageFinishedUpdateData;

- (void)storeMessageInfo: (NSDictionary *)info;

- (void)didLoadGUIConfigurationWhenTimeOut;

- (void)wantToShowContentOfRemoteNotification: (NSDictionary *)info;

- (void)wantToShowRemoteNotificationConfigurationPage: (NSDictionary *)info;

- (void)didReceiveRemoteNotification: (NSDictionary *)info;

- (void)wantToShowRemoteNotificationContentPage: (NSDictionary *)info;

- (void)didBeenLauchedWithRemoteNotification: (NSDictionary *)remoteNotification;

- (void)didReceiveRemoteNotificationFromBackground: (NSDictionary *)remoteNotification;

- (void)wantToShowAccountLoginPageWithCallbackInfo: (NSDictionary *)callbackInfo;

- (void)wantToShowVIPAccountRegisterPageWithCallbackInfo: (NSDictionary *)callbackInfo;

- (void)didUpdateDataOfCurrentPageWhenServerError: (NSDictionary *)userInfo;

- (void)wantToNavigateToServerPushNotificationCenter: (NSDictionary *)userInfo;

- (void)didReceiveDeviceToken: (NSData *)deviceToken;

- (void)updateRemoteNotificationIndicatorOnNavigationBar;

- (void)wantToNavigateToNewsInNewsList: (NSDictionary *)info;

@end
