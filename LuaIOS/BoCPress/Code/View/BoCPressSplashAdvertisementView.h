//
//  BoCPressSplashAdvertisementView.h
//  BoCPress
//
//  Created by E-Reach Administrator on 12/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BoCPressNews;
@protocol BoCPressSplashAdvertisementDataSource;

@class BoCPressSplashAdvertisementViewPrivateHandler;

@interface BoCPressSplashAdvertisementView : UIWebView
{
    BoCPressSplashAdvertisementViewPrivateHandler *_handler;
    id<BoCPressSplashAdvertisementDataSource> _splashAdvertisementDataSource;
}

- (id)initWithNews: (id<BoCPressNews>)news splashAdvertisementDataSource: (id<BoCPressSplashAdvertisementDataSource>)splashAdvertisementDataSource;

- (void)didTapedWithURLRequest: (NSURLRequest *)request;

@end
