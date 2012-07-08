#import <Foundation/Foundation.h>

@protocol BoCPressColumn;
@protocol NSIdentifiedObject;

@protocol BoCPressPage<NSIdentifiedObject>

@optional

- (BOOL)couldReadNextPage;
- (BOOL)couldReadPreviousPage;

- (void)readNextPage;
- (void)readPreviousPage;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration;

- (void)willSwitchToOtherTab;

- (void)willBrowseBackward;

@required

- (void)willHandleErrorOfServerWithData: (NSDictionary *)info;

- (void)didCancelledHandleErrorOfServerWithData: (NSDictionary *)info;

- (void)didReceivedErrorFromServerWithInfo: (NSDictionary *)info;

- (BOOL)respondsToRemoteNotification: (NSDictionary *)info;

- (BOOL)shouldRefetchConfigurationAtCurrentContext;

- (UIView<BoCPressPage> *)lastPage;

- (BOOL)couldNavigate;

- (NSString *)pageTitle;

- (BOOL)needNavigationBar;

- (BOOL)needTabBar;

- (void)attachCallbackInfo: (NSDictionary *)callbackInfo
                   forType: (NSString *)type;

- (void)wantToUpdateDataWithInfo: (id)info;

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info;

- (BOOL)couldShowTimeOutAlertWithInfo: (NSDictionary *)info;

- (void)wantToForceRefreshCurrentContentWithInfo: (id)animationInfo;

- (void)beforeRefetchConfiguration;

- (void)clearCurrentPageAfterNetworkTimeOutWithInfo: (NSDictionary *)info;

#pragma mark - handle server error

- (NSArray *)supportedInterfaceOrientations;

- (void)didBeenSlideToWithInfo: (NSDictionary *)info;

@optional
- (void)willBeSlidedToOtherPage;

- (void)didBeenSwitchToFromOtherTabCompletion: (void (^)(void))block;

- (void)didUpdateData;

- (void)autoFitToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation;

- (void)finishedShowVIPAuthorizeView;

@end
