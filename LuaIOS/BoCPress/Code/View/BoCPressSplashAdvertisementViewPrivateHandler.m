//
//  BoCPressSplashAdvertisementViewPrivateHandler.m
//  BoCPress
//
//  Created by E-Reach Administrator on 12/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BoCPressSplashAdvertisementViewPrivateHandler.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressSplashAdvertisementView.h"

@implementation BoCPressSplashAdvertisementViewPrivateHandler

- (id)initWithSplashAdvertisementView:(BoCPressSplashAdvertisementView *)splashAdvertisementView
{
    if ((self = [super init]))
    {
        _splashAdvertisementView = splashAdvertisementView;
    }
    
    return self;
}

#pragma mark - UIWebView delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (_callbackFlag)
    {
        if (navigationType == UIWebViewNavigationTypeLinkClicked)
        {
            [_splashAdvertisementView didTapedWithURLRequest: request];
            
            return NO;
        }
    }    
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (_callbackFlag)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSplashAdvertisementFinishedLoad
                                                            object: self
                                                          userInfo: nil];
    }
}
@end
