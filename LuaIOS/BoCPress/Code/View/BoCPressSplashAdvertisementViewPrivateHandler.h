//
//  BoCPressSplashAdvertisementViewPrivateHandler.h
//  BoCPress
//
//  Created by E-Reach Administrator on 12/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BoCPressCallback.h"

@class BoCPressSplashAdvertisementView;

@interface BoCPressSplashAdvertisementViewPrivateHandler : BoCPressCallback<UIWebViewDelegate>
{
    BoCPressSplashAdvertisementView *_splashAdvertisementView;
}

- (id)initWithSplashAdvertisementView: (BoCPressSplashAdvertisementView *)splashAdvertisementView;

@end
