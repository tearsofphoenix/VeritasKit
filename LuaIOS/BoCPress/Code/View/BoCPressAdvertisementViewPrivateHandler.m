//
//  BoCPressAdvertisementViewPrivateHandler.m
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

#import "BoCPressAdvertisementViewPrivateHandler.h"

#import "BoCPressAdvertisementView.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressConstant.h"

@implementation BoCPressAdvertisementViewPrivateHandler

- (id)initWithAdvertisementView:(BoCPressAdvertisementView *)advertisementView
{
    if ((self = [super init]))
    {
        _advertisementView = advertisementView;
    }
    return self;
}

- (void)callbackForAction: (id)action 
                 withData: (id)data
{
    if (_callbackFlag)
    {
        if([kCallbackAction_getAds isEqualToString: action])
        {
            [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_Global_didGetAdvertisementFromServer
                                                                object: self
                                                              userInfo: data];
            [_advertisementView setNewsWithData: data];
        }else if([kCallbackAction_handleTimeOutEventOfGetAds isEqualToString: action])
        {
            [_advertisementView handleTimeOutEventOfGetAdsWithData: data];
        }
    }
}

- (void)handleCloseButtonPressedEvent: (id)sender
{
    [_advertisementView didCloseButtonPressed];
}

#pragma mark - UIWebView delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (_callbackFlag)
    {
        if (navigationType == UIWebViewNavigationTypeLinkClicked)
        {
            [_advertisementView didTapedWithURLRequest: request];
            
            return NO;
        }
    }    
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (_callbackFlag)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didAdvertisementFinishedLoad
                                                            object: self
                                                          userInfo: nil];
    }
}
@end
