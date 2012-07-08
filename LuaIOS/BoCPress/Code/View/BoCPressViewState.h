#import <Foundation/Foundation.h>

@protocol BoCPressTab;
@protocol BoCPressPage;
@protocol BoCPressDataSource;
@protocol BoCPressMediaType;
@protocol BoCPressMedia;
@protocol BoCPressNewsTag;
@protocol BoCPressNews;
@protocol BoCPressAuthor;
@protocol BoCPressColumn;

@class BoCPressSplashAdvertisementView;
@class BoCPressViewStatePrivateHandler;

@interface BoCPressViewState: NSObject
{
    UIView<BoCPressPage> *_currentPage;

    id<BoCPressDataSource> _dataSource;
    
    NSMutableDictionary* _storedTabState;
    
    NSMutableDictionary* _tabStacks;
    
    NSMutableArray*  _currentStacks;
    
    id _applicationState;
    id<BoCPressTab> _currentTab;
    
    BoCPressViewStatePrivateHandler *_handler;
}

- (id)initWithDataSource: (id<BoCPressDataSource>)dataSource;

- (void)currentTab: (id<BoCPressTab>)currentTab
       switchToTab: (id<BoCPressTab>)tab
        completion: (void (^)(void))block;

- (void)willBrowseBackward;

- (void)browseBackwardWithUserInfo: (NSDictionary *)userInfo;

- (void)readPreviousPage;

- (void)readNextPage;

- (UIView<BoCPressPage> *)currentPage;

- (void)playMediaWithInfo: (NSDictionary *)info;

- (void)readMediaListOfType: (id<BoCPressMediaType>)mediaType;

- (void)readNewsListWithTag: (id<BoCPressNewsTag>)newsTag 
             andSuperColumn: (id<BoCPressColumn>)superColumn;

- (void)readNewsInNewsListWithInfo: (NSDictionary *)info;

- (void)readListOfSecurityInFamilyWithInfo: (NSDictionary *)info;

- (void)readLongTermListOfSecurityInFamilyWithInfo: (NSDictionary *)info;

- (void)readListOfCriticPost: (id) userInfo;

- (void)readCriticPostInPostListWithInfo: (id)info;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

#pragma mark - More page judge

- (void)readHelpPage;

- (void)readAboutPage;

- (void)showUserFeedbackPage;

- (void)readNewsListWithInfo: (id )info;

#pragma mark - Application become active processing

- (void)updateCurrentPage;

#pragma mark - store tab state

- (void)storeCurrentTabState: (id) currentTabIdentity;

- (void)removeLastViewOfCurrentTab;

- (void)addViewToCurrentStack: (UIView*)view;

- (UIView *)lastViewInCurrentViewStack;

#pragma mark - time out handle

- (void)clearCurrentPageAfterNetworkTimeOutWithInfo: (NSDictionary *)info;

- (void)willRefetchConfiguration;

#pragma mark - account login page

- (void)showAccountLoginPage;

- (void)showVIPAccountRegisterPage;

- (void)showNormalAccountRegisterPage;

#pragma mark - change password

- (void)showFindPasswordPage;

- (void)showChangePasswordPage;

- (void)showActivateCodePage;

- (void)showProtocolPage;

- (void)showVIPActivateCodePage;

- (void)showBuyCardPage;

- (void)showQuoteContentPageWithInfo: (id)userInfo;

- (void)stepToRefreshCurrentPage;

- (void)finishedShowVIPAuthorizeView;

- (void)updateApplicationState: (id)applicationState;

- (id)applicationState;

- (void)showLandscapeQuoteContentPage: (id)userInfo;

- (void)showAdvertisementView;

- (BOOL)couldShowAdvertisementInCurrentContext;

- (void)showAdvertisementDetailPageWithInfo: (id)info;

- (BoCPressSplashAdvertisementView *)splashAdvertisementViewWithNews: (id<BoCPressNews>)news;

- (NSUInteger)numberOfNewRemoteNotification;

- (void)showRemoteNotificationConfigurationPageWithData: (NSDictionary *)config;

- (BOOL)respondsToRemoteNotification: (NSDictionary *)info;

- (void)showRemoteNotificationContentPage;

- (void)showAccountLoginPageWithCallbackInfo: (NSDictionary *)callbackInfo;

- (void)showVIPAccountRegisterPageWithCallbackInfo: (NSDictionary *)callbackInfo;

- (void)didUpdateDataOfCurrentPageWhenServerError: (NSDictionary *)userInfo;

- (void)applicationWillBecomeDeactive;

- (void)showContentOfRemoteNotificationWithInfo: (NSDictionary *)info;

- (void)didReceiveDeviceToken: (NSData *)deviceToken;

- (void)navigateToRemoteNotificationPageWithInfo: (id)info;

- (void)currentPageDidCancelledHandleErrorOfServerWithData: (NSDictionary *)data;

#pragma mark - new api

- (void)tryToReadNewsInNewsListWithInfo: (NSDictionary *)info;

- (void)tryToReadCriticPostInPostListWithInfo: (NSDictionary *)info; 

- (void)tryToReadLongTermListOfSecurityInFamilyWithInfo: (NSDictionary *)info;

- (void)tryToReadListOfSecurityInFamilyWithInfo: (NSDictionary *)info;

- (void)tryToShowQuoteContentPageWithInfo: (NSDictionary *)info;

- (void)tryToPlayMediaWithInfo: (NSDictionary *)info;

#pragma mark - handle error

- (void)willHandleErrorOfServerWithInfo: (NSDictionary *)info;

@end
