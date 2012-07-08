//
//  BoCPressAdvertisementDataSource.m
//  BoCPress
//
//  Created by E-Reach Administrator on 12/8/11.
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

#import "BoCPressAdvertisementDataSource.h"

#import "BoCPressDataSource.h"

#import "BoCPressConstant.h"

@implementation BoCPressAdvertisementDataSource

- (id)initWithService:(id<BoCPressDataSource>)rootDataSource
{
    if ((self = [super init]))
    {
        _rootDataSource = rootDataSource;
    }
    return self;
}


- (NSString *)stringToGetAdvertisement
{
    return [_rootDataSource getBaseStringWithRequireType: kNetwork_getAds 
                                       andArgumentString: nil];
}
- (void)getAdvertisementWithCallback:(id<BoCPressCallback>)callback
{
    NSString *stringToGetAdvertisement = [self stringToGetAdvertisement];
    id callbackAction = kCallbackAction_getAds;
    NSDictionary *callbackInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  callbackAction, kNetwork_CallbackAction,
                                  callback, kNetwork_CallbackObject,
                                  kNetwork_getAdsResponse, kNetwork_SoapResponseType,
                                  nil];
    [_rootDataSource postRequestString: stringToGetAdvertisement
                       andCallbackInfo: callbackInfo];
    [callbackInfo release];
}

- (BOOL)couldShowAdvertisement:(id<BoCPressNews>)news
{
    return [_rootDataSource couldShowAdvertisement: news];    
}
@end
