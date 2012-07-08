//
//  BocPressNetworkDataSource.h
//  BoCPress
//
//  Created by LeixSnake on 6/7/11.
/*************************************************************************

*

* EREACH CONFIDENTIAL

* ____________________

*

* [2011] eReach Mobile Software Technology Co., Ltd.

* All Rights Reserved.

*

* NOTICE: All information contained herein is, and remains the

* property of eReach Mobile Software Technology and its suppliers,

* if any. The intellectual and technical concepts contained herein

* are proprietary to eReach Mobile Software Technology and its

* suppliers and may be covered by U.S. and Foreign Patents, patents

* in process, and are protected by trade secret or copyright law.

* Dissemination of this information or reproduction of this material

* is strictly forbidden unless prior written permission is obtained

* from eReach Mobile Software Technology Co., Ltd.

*/

#import <Foundation/Foundation.h>

#import "BoCPressDataSource.h"

#import "BoCPressSoapXMLParser.h"

@protocol BoCPressConfiguration;
@protocol BoCPressNetworkService;
@protocol BoCPressCacheService;
@protocol BoCPressUserInfoService;
@protocol BoCPressPurchaseService;

@protocol BoCPressQuoteService;
@protocol BoCPressMediaService;
@protocol BoCPressNewsService;
@protocol BoCPressCriticService;
@protocol BoCPressRequestStringFormatService;
@protocol BoCPressAccountService;

@class BoCPressSoapDataSourcePrivateHandler;
@class BoCPressAlertView;

@interface BoCPressSoapDataSource : NSObject<BoCPressDataSource, BoCPressSoapXMLParserDelegate, UIAlertViewDelegate> 
{
    
    NSMutableDictionary *_lastUpdateTimeForCallbackAction;
    
    NSMutableDictionary *_dataSourceConfiguration;
    NSMutableDictionary *_soapCallbackFunctions;
    
    id<BoCPressConfigurationService> _configurationService;
    id<BoCPressPurchaseService>  _purchaseService;

    id<BoCPressNetworkService> _networkService;
    
    id<BoCPressCacheService> _cacheService;
    id<BoCPressRequestStringFormatService> _requestFormatService;
    id<BoCPressQuoteService> _quoteService;
    id<BoCPressMediaService> _mediaService;
    id<BoCPressNewsService> _newsService;
    id<BoCPressCriticService> _criticService;
    
    id<BoCPressUserInfoService> _userPrivateInfoService;
    id<BoCPressAccountService> _accountService;
    
    id _storedCallbackInfo;
    
    NSMutableDictionary *_remoteNotificationConfiguration;
    
    BoCPressAlertView *_alertView;
    BoCPressSoapDataSourcePrivateHandler *_handler;

    NSMutableDictionary *_supportedServices;
}


- (void)postRequestString: (id)requestString 
          andCallbackInfo: (id)callbakInfo;


#pragma mark - get configuration xml from network

- (void)refechGUIConfigurationWithCallbackInfo: (id)callbackInfo;

- (void)reloadConfigurationWithConfigurationString: (NSString *)configurationString 
                             andStoredCallbackInfo: (id)storedCallbackInfo;

- (void)getGUIConfiguration;

- (void)loadConfigurationWithConfigurationString: (NSString *)configurationString;

#pragma mark - Author avatar cache

- (UIImage*)getAvatarWithImageInfo:(id)imageInfo 
                      withCallback:(id<BoCPressCallback>)callback;

- (void)storeAuthorAvatar: (id)data;

- (void)handleDownloadReturnedData: (id)data;

#pragma mark - store column update time info

- (void)storeColumnUpdateTimeInfoWithColumnID:(id)columnID;

- (void)storeInfoOfReadMessage: (id)messageID;

- (void)useCacheWhenTimeOutWithInfo: (id)callbackInfo;

- (void)handleServerErrorWithData: (id)data;

- (void)recordAdvertisementWithData: (id)data;

- (void)wantToGetSplashAdvertisement;

- (void)loadConfigurationWhenTimeOut;

@end
