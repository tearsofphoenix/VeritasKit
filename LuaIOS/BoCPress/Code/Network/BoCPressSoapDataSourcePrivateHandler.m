//
//  BoCPressSoapDataSourcePrivateHandler.m
//  BoCPress
//
//  Created by E-Reach Administrator on 7/6/11.
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

#import "BoCPressSoapDataSourcePrivateHandler.h"

#import "BoCPressSoapDataSource.h"

#import "BoCPressCallback.h"

#import "BoCPressConstant.h"

#import "BoCPressNotificationDefines.h"

@implementation BoCPressSoapDataSourcePrivateHandler

- (id)initWithDataSource:(BoCPressSoapDataSource *)dataSource
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
        
        _dataSource = dataSource;
        
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForStoreAuthorAvatar:)
                              name: kBoCPressSoapDataSourcePrivateHandler_storeAuthorAvatar 
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForHandleDownloadReturnedData:) 
                              name: kBoCPressSoapDataSourcePrivateHandler_handleDownloadReturnedData 
                            object: nil];
        
        [defaultCenter addObserver: self 
                          selector: @selector(notificationForStartToRefetchConfiguration:) 
                              name: kBoCPress_Global_startToFetchGUIConfiguration 
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForStoreReadMessage:) 
                              name: kBoCPressHasReadMessage 
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForGetImage:) 
                              name: kSoapDataSource_notificationForGetImage
                            object: nil];        
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForGetGUIConfiguration:) 
                              name: kDataSource_getGUIConfiguration 
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForRecordAdvertisement:)
                              name: kAdvertisement_recordReadAdvertisement
                            object: nil];
        
        [defaultCenter addObserver: self
                          selector: @selector(notificationForWantToGetSplashAdvertisement:)
                              name: kSoapDataSource_wantToGetSplashAdvertisement
                            object: nil];
        [defaultCenter addObserver: self
                          selector: @selector(notificationForLoadConfigurationWhenTimeOut:)
                              name: kSoapDataSource_loadConfigurationWhenTimeOut
                            object: nil];
        _callbackFlag = YES;
    }
    
    return self;
}

- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}

- (void)callbackForAction:(id)action withData:(id)data
{
    if (_callbackFlag)
    {
        
        if([kCallbackAction_handleServerError isEqualToString:action])
        {
            NSLog(@"error:%@", data);
            [_dataSource handleServerErrorWithData: data];
            
        }else if([kSoapDataSource_getGUIConfigurationXMLFromURL isEqualToString:action])
        {
            NSString *configurationString = [data objectForKey:kNetwork_XMLConfigurationString];
            [_dataSource loadConfigurationWithConfigurationString:configurationString];
            
        }else if([kSoapDataSource_refetchGUIConfiguration isEqualToString:action])
        {
            NSLog(@"error!");

        }else if([kCallbackAction_verifyreceipt isEqualToString: action])
        {
            [_dataSource didFinishedVerifyReceipt:data];
        }else if([kCallbackAction_getSplashAds isEqualToString: action])
        {
            [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didGetSplashAdvertisement
                                                                object: self
                                                              userInfo: data];
        }else if([kCallbackAction_updateUserInfo isEqualToString: action])
        {

        }else if([kCallbackAction_setPushBadge isEqualToString: action])
        {
            NSLog(@"In func:%s, callbackAction:%@", __PRETTY_FUNCTION__, action);
        }
    }
}

- (void)notificationForStoreAuthorAvatar: (NSNotification *)notification
{
    [_dataSource storeAuthorAvatar:[notification userInfo]];
}

- (void)notificationForHandleDownloadReturnedData: (NSNotification *)notification
{
    [_dataSource handleDownloadReturnedData: [notification userInfo]];
    
}

- (void)notificationForStartToRefetchConfiguration: (NSNotification *)notification
{
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  self, kNetwork_CallbackObject,
                                  kSoapDataSource_refetchGUIConfiguration, kNetwork_CallbackAction,
                                  kNetwork_getConfigurationResponse, kNetwork_SoapResponseType,
                                  nil];
    
    [_dataSource refechGUIConfigurationWithCallbackInfo:callbackInfo];
    
    [callbackInfo release];
}

- (void)notificationForStoreReadMessage: (NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    
    id messageID = [userInfo objectForKey:@"messageID"];
    
    [_dataSource storeInfoOfReadMessage:messageID];
}


- (void)notificationForGetImage: (NSNotification *)notification
{
    id<BoCPressCallback> callback = [[notification userInfo] objectForKey:kNetwork_CallbackObject];
    
    [_dataSource getAvatarWithImageInfo:[notification userInfo] withCallback: callback];
}

- (void)notificationForGetGUIConfiguration: (NSNotification *)notification
{
    [_dataSource getGUIConfiguration];
}

- (void)notificationForTimeOutEventWithInfo: (NSNotification *)notification
{
    id callbackInfo = [[notification userInfo] objectForKey:kNetwork_CallbackObject];
    [_dataSource useCacheWhenTimeOutWithInfo:callbackInfo];
}

- (void)notificationForRecordAdvertisement: (NSNotification *)notification
{
    [_dataSource recordAdvertisementWithData: [notification userInfo]];
}

- (void)notificationForWantToGetSplashAdvertisement: (NSNotification *)notification
{
    [_dataSource wantToGetSplashAdvertisement];
}

- (void)notificationForLoadConfigurationWhenTimeOut: (NSNotification *)notification
{
    [_dataSource loadConfigurationWhenTimeOut];
}

@end
