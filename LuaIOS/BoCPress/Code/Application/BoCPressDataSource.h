#import <Foundation/Foundation.h>

#import "BoCPressData.h"

@protocol BoCPressConfigurationService;
@protocol BoCPressCallback;
@protocol BoCPressColumn;
@protocol BoCPressProduct;
@protocol BoCPressChartImageConfiguration;
@protocol BoCPressServerPushNotification;

@protocol BoCPressDataSource<NSObject>

#pragma mark - Application configurations
@required

- (id<BoCPressConfigurationService>)configuration;

- (id)currentVersionInfo;

#pragma mark - Media content

- (void)listOrderedMediaTypesWithCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedMediaOfType: (id<BoCPressMediaType>)type 
                     rangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                  withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedMediaTagsInType: (id<BoCPressMediaType>)type
                      withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedMediaWithTag: (BoCPressMediaTagColumn* )tag
                      rangeFrom: (NSUInteger)rangeFrom
                        rangeTo: (NSUInteger)rangeTo
                       callback: (id<BoCPressCallback>)callback;

- (void)contentOfMedia: (id<BoCPressMedia>)media
             mediaType: (id<BoCPressMediaType>)mediaType
          withCallback: (id<BoCPressCallback>)callback;


#pragma mark - Broad Cast

- (void)listOrderedBroadCastForcastWithCallback: (id<BoCPressCallback>)callback;

- (void)contentOfBroadCast: (id<BoCPressMedia>) media
              withCallback: (id<BoCPressCallback>)callback;

- (void)currentBroadCastWithCallback: (id<BoCPressCallback>) callback;

#pragma mark - News content

- (void)listOrderedNewsTagsWithCallback: (id<BoCPressCallback>) callback;

- (void)listOrderedNewsWithTag: (id<BoCPressNewsTag>)tag 
                     rangeFrom: (NSUInteger)rangeFrom
                       rangeTo: (NSUInteger)rangeTo
                      callback: (id<BoCPressCallback>)callback;

- (void)contentOfNews: (id<BoCPressNews>)news 
                 info: (NSDictionary *)info
         withCallback: (id<BoCPressCallback>)callback;

- (void)submitFeedback: (id<BoCPressFeedback>)feedback 
                toNews: (id<BoCPressNews>)news 
          withCallback: (id<BoCPressCallback>)callback;

#pragma mark - Securities and their quotes

- (void)listOrderedSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                       withCallback: (id<BoCPressCallback>)callback
                        triggerFlag: (NSString *)flag;

- (void)listOrderedLongTermSecurityInFamily: (id<BoCPressSecurityFamily>)family 
                               withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedSecurityFamiliesWithCallback: (id<BoCPressCallback>)callback;

- (NSDate *)lastUpdateSecuritiesTime;

- (void)contentOfQuote: (id<BoCPressSecurity>)security
          inSecurities: (NSArray *)securities
          withCallback: (id<BoCPressCallback>)callback;

- (void)contentOfQuoteByTimer: (id<BoCPressSecurity>)security
                 inSecurities: (NSArray *)securities
                 withCallback: (id<BoCPressCallback>)callback;

- (void)downloadChartImageWith: (id)info 
                      callback: (id<BoCPressCallback>)callback;

- (void)getChartImage: (id<BoCPressChartImageConfiguration>)chartImageConfiguration
         withCallback: (id<BoCPressCallback>)callback;

- (void)getChartImage: (id<BoCPressChartImageConfiguration>)chartImageConfiguration
  withCallbackByTimer: (id<BoCPressCallback>)callback;

- (void)listOrderedRelatedCriticPostsOfSecurity: (id<BoCPressSecurity>)security
                                   withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedRelatedNewsOfSecurity: (id<BoCPressSecurity>)security
                            withCallback: (id<BoCPressCallback>)callback;

- (void)storeQuoteContentPageChartConfiguration: (id)chartImageConfiguration;

- (id)quoteContentPageChartConfiguration;

#pragma mark - Critics and their posts

- (void)listOrderedCriticColumnsWithCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedCriticsRangeFrom: (NSUInteger)rangeFrom
                            rangeTo: (NSUInteger)rangeTo 
                       withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedFavoriteCriticsRangeFrom: (NSUInteger)rangeFrom
                                    rangeTo: (NSUInteger)rangeTo
                               withCallback: (id<BoCPressCallback>)callback;

- (void)listLatestCriticPostRangeFrom: (NSUInteger)rangeFrom
                              rangeTo: (NSUInteger)rangeTo
                         withCallback: (id<BoCPressCallback>)callback;

- (void)listOrderedPostsFromCritic: (id<BoCPressAuthor>)critic 
                         rangeFrom: (NSUInteger)rangeFrom
                           rangeTo: (NSUInteger)rangeTo 
                      withCallback: (id<BoCPressCallback>)callback;

- (void)contentOfCriticPost: (id<BoCPressNews>)criticPost 
                       info: (id)logInfo
               withCallback: (id<BoCPressCallback>)callback;


- (void)contentOfCritic: (id<BoCPressAuthor>)critic
               userInfo: (id)userInfo
           withCallback: (id<BoCPressCallback>)callback;

- (NSTimeInterval) lastUpdateTimeIntervalWithColumnID: (id) columnID;

- (void) getCommentSummaryContentOfNews: (id<BoCPressNews>)news
                           withCallback:(id<BoCPressCallback>)callback;

#pragma mark - get avatar

- (UIImage*) getAvatarWithURL: (NSString*) imageURLString;

- (UIImage*)getAvatarWithImageInfo: (id)imageInfo 
                      withCallback: (id<BoCPressCallback>)callback;

- (NSString *)cacheImageDirectoryPath;

#pragma mark - reload columns

- (void)reloadColumnsWithTag: (id)tag 
                 andCallback: (id<BoCPressCallback>)callback;

#pragma mark - configure Data Source

- (void)setConfigurationValue: (id)value forTag: (id)tag;

#pragma mark - login

- (void)loginWithUserName:(NSString *)userName
                 password: (NSString *)password
                 callback:(id<BoCPressCallback>)callback;

- (void)registerNormalAccountWithEmail:(NSString *)accountName 
                              password:(NSString *)password 
                              callback:(id<BoCPressCallback>)callback;

- (void)storeUserInfo:(id)userInfo;

- (void)wantToLogoutCurrentUserWithCallback: (id<BoCPressCallback>) callback;

- (void)didLogoutCurrentUser;

#pragma mark - find password

- (void) wantToResetPasswordWithEmail:(NSString *)email
                             callback: (id<BoCPressCallback>)callback;

- (void)didResetPasswordWithCallback:(id<BoCPressCallback>)callback;

#pragma mark -  get user info

- (id)getUserInfo;

- (void)getRemoteNotificationConfigurationWithCallback: (id<BoCPressCallback>)callback;

- (void)getUserInfoFromServerWithInfo: (NSDictionary *)info 
                             callback: (id<BoCPressCallback>)callback;

- (BOOL)getUserLoginStatus;

- (BOOL)isEnableEmailAsAccountName;

- (void)getPromptMessageWithArgument: (NSString *)argument 
                            callback: (id<BoCPressCallback>)callback;

#pragma mark - change password
- (void)changeOldPassword:(NSString *)oldPassword 
            toNewPassword:(NSString *)newPassword
                 callback: (id<BoCPressCallback>)callback;

- (void)didChangedToNewPassword: (NSString *)newPassword
                       callback: (id<BoCPressCallback>)callback;

#pragma mark - activate code
- (void)wantToActivateCode:(NSString *)code
              withCallback:(id<BoCPressCallback>)callback;

#pragma mark - purchase

- (void)wantToPurchaseProduct: (id<BoCPressProduct>)product 
                 withCallback: (id<BoCPressCallback>)callback;

- (void)cancelAllPurchase;

- (void)listOrderedProductIDsRangeFrom: (NSUInteger)rangeFrom
                               rangeTo: (NSUInteger)rangeTo
                              callback: (id<BoCPressCallback>) callback;

- (void)verifyReceiptWithInfo: (NSDictionary *)userInfo
                     callback: (id<BoCPressCallback>)callback;

- (void)didFinishedVerifyReceipt: (id)data;

- (void)listOrderedContentInfoOfProducts: (NSArray*)productIDs 
                                callback: (id<BoCPressCallback>)callback;

- (void)createPurchaseOrderWithCallback:(id<BoCPressCallback>)callback;

- (void)requestPurchaseWithOrderCode: (NSString *)orderCode 
                         productCode: (NSString *)productCode 
                            callback: (id<BoCPressCallback>)callback;

- (void)updatePurchaseInfo:(id)data;

#pragma mark - ads

- (BOOL)enableCoupon;

- (BOOL)couldShowAdvertisementInCurrentContext;

- (BOOL)couldShowAdvertisement: (id<BoCPressNews>)news;

#pragma mark - remote notification configuration

- (NSDictionary *)loadRemoteNotificationConfiguration;

- (void)storeRemoteNotificationConfiguration:(NSDictionary *)remoteNotificationConfiguration;

- (void)setColumn: (id)tag notificationEnable: (BOOL)enable;

- (void)restoreDeadLineOfConfigurationWithValue: (id)oldValue;

- (NSString *)getRemoteNotificationDeadLine;

- (void)setRemoteNotificationDeadLine: (id)deadLine
                         withCallback: (id<BoCPressCallback>)callback;

- (NSArray *)queryRemoteNotification;

- (void)applicationWillBecomeDeactive;

- (void)resetBadgeNumber;

- (void)didReceiveDeviceToken: (NSData *)deviceToken 
                 withCallback: (id<BoCPressCallback>)callback;

- (void)requestRemoteNotificationForNotification: (NSDictionary *)info
                                        callback: (id<BoCPressCallback>)callback;

- (void)uploadRemoteNotificationConfigurationOfColumn: (id)column
                                               enable: (BOOL)enable
                                         withCallback: (id<BoCPressCallback>)callback;

- (void)uploadRemoteNotificationConfigurationOfDeadline: (id)oldDeadLine
                                            newDeadLine: (id)newDeadLine
                                           withCallback: (id<BoCPressCallback>)callback;

#pragma mark - origin

- (NSString *)getBaseStringWithRequireType: (NSString *)requireType 
                         andArgumentString: (NSString *)argString;

- (void)postRequestString: (id)requestString 
          andCallbackInfo: (id)callbackInfo;

- (NSUInteger)numberOfNewRemoteNotification;

- (void)deleteOldRemoteNotificationBeforeDeadLine: (NSString *)deadLine;

- (void)scheduleToDeleteLocalStorageOfRemoteNotification;


- (id)serviceByIdentity: (id)identity;

@end