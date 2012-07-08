//
//  BoCPressAdvertisementDetailPage.m
//  BoCPress
//
//  Created by E-Reach Administrator on 12/9/11.
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

#import "BoCPressAdvertisementDetailPage.h"

#import "UIWebView+RemoveBackgroundShadow.h"

@implementation BoCPressAdvertisementDetailPage

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
             pageTitle:(NSString *)pageTitle
            URLRequest:(NSURLRequest *)request
{
    if ((self = [super init]))
    {
        [self setLastPage: lastPage];
        _contentView = [[UIWebView alloc] init];
        [_contentView removeBackgroundShadow];
        
        [_contentView loadRequest: request];
        
        [self addSubview: _contentView];
        
        [self setPageTitle: pageTitle];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_contentView setFrame: [self bounds]];
}

- (void)dealloc
{
    [_contentView release];
    
    [super dealloc];
}

- (BOOL)couldNavigate
{
    return NO;
}


- (BOOL)needNavigationBar
{
    return YES;
}

- (BOOL)needTabBar
{
    return NO;
}


@end
