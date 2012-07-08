//
//  BoCPressAdView.m
//  BoCPress
//
//  Created by E-Reach Administrator on 11/29/11.
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

#import "BoCPressAdvertisementView.h"

//#import "BoCPressNewsView.h"

#import "BoCPressNews.h"

#import "BoCPressAdvertisementViewPrivateHandler.h"

#import "BoCPressAdvertisementDataSource.h"

#import "UIWebView+RemoveBackgroundShadow.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressConstant.h"

#import <QuartzCore/QuartzCore.h>

@implementation BoCPressAdvertisementView

@synthesize isVisuable = _isVisuable;

- (id)initWithDataSource:(id<BoCPressAdvertisementDataSource>)dataSource
{
    if ((self = [super init]))
    {
        _dataSource = [dataSource retain];
        
        _handler = [[BoCPressAdvertisementViewPrivateHandler alloc] initWithAdvertisementView: self];
        
        [self setBackgroundColor: [UIColor clearColor]]; 
        [self setFrame: CGRectMake(0, 460, 320, 76)];
        
        _backgroundViewOfContent = [[UIImageView alloc] init];
        [_backgroundViewOfContent setImage: [UIImage imageNamed: @"BoCPressAdvertisementViewBackground"]];
        [[_backgroundViewOfContent layer] setCornerRadius: 5.0];
        [_backgroundViewOfContent setUserInteractionEnabled: YES];
        
        _contentView = [[UIWebView alloc] init];
        
        [_contentView removeBackgroundShadow];        
        [_contentView setDelegate: _handler];
        [_contentView setAutoresizesSubviews: YES];
        [_contentView setContentStretch: [_contentView frame]];
        [[[_contentView subviews] lastObject] setScrollEnabled:NO];
        [_contentView setContentMode: UIViewContentModeScaleToFill];
        
        [_backgroundViewOfContent addSubview: _contentView];            
        
        [self addSubview: _backgroundViewOfContent];
        
        UIButton *closeButton = [[UIButton alloc] init];
        [closeButton setBackgroundImage: [UIImage imageNamed: @"BoCPressAdvertisementViewCloseButton"] 
                               forState: UIControlStateNormal];
        [closeButton addTarget: _handler
                        action: @selector(handleCloseButtonPressedEvent:)
              forControlEvents: UIControlEventTouchDown];
        [closeButton setFrame: CGRectMake(300 - 2, 5, 20, 20)];
        
        [self addSubview: closeButton];
        [self bringSubviewToFront: closeButton];
        
        [closeButton release];
        
        _newsContentFormatterString = @"<html style=\"padding:0px;margin:0px\"><meta name=\"viewport\" content=\"width=300, height=66, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0\"/><body style=\"padding:0px;margin:0px\">%@</body></html>";
        
        
        [_dataSource getAdvertisementWithCallback: _handler];
        
    }
    
    return self;
}

- (void)dealloc
{
    
    [_dataSource release];
    [_contentView release];
    [_handler cancelAllCallback];
    [_handler release];
    _handler = nil;
    [_news release];
    
    [super dealloc];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = [self bounds];
    [_backgroundViewOfContent setFrame: CGRectMake( 10, 10, 300, frame.size.height - 10)];
    frame = [_backgroundViewOfContent bounds];
    frame.origin.x += 3;
    frame.origin.y += 3;
    frame.size.width -= 3 * 2;
    frame.size.height -= 8;
    
    [_contentView setFrame: frame];
    
}

- (void)setNewsWithData:(id)data
{
    id<BoCPressNews> news = [data objectForKey: @"ads"];
    if (news)
    {
        
        [_advertisementViewFlag release];
        _advertisementViewFlag = [[data objectForKey: @"advertisementViewFlag"] retain];
        
        if ([_dataSource couldShowAdvertisement: news])
        {
            
            [_news release];
            _news = [news retain];
            
            [_contentView loadHTMLString: [NSString stringWithFormat: _newsContentFormatterString, [news articleContent]]
                                 baseURL: nil];
        }else
        {
            [[NSNotificationCenter defaultCenter] postNotificationName: kViewControler_wantToCloseAdvertisementView
                                                                object: self
                                                              userInfo: nil];
        }
    }
}

- (void)recordAdvertisementWithTag: (NSString *)tag
{
    NSDictionary *userInfo = [[NSDictionary alloc ] initWithObjectsAndKeys: 
                              _news, kBoCPress_Global_NewsType, 
                              tag, @"tag",
                              nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kAdvertisement_recordReadAdvertisement
                                                        object: self
                                                      userInfo: userInfo];
    
    [userInfo release];
    
}

- (void)didTapedWithURLRequest:(NSURLRequest *)request
{
    [self recordAdvertisementWithTag: kAdvertisementInteraction];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewControler_wantToCloseAdvertisementView
                                                        object: self
                                                      userInfo: nil];
    
    if ([_advertisementViewFlag isEqualToString: @"INTERNAL"])
    {
        NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys: 
                              request, @"NSURLRequest", 
                              [_news name], @"pageTitle",
                              nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToShowAdvertisementDetailPage
                                                            object: self
                                                          userInfo: info];
        
        [info release];
        
    }else
    {

        NSURL *url = [request URL];
        [[UIApplication sharedApplication] openURL: url];
    }
}

- (void)didCloseButtonPressed
{ 
    [self recordAdvertisementWithTag: kAdvertisementClose];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewControler_wantToCloseAdvertisementView
                                                        object: self
                                                      userInfo: nil];
    
}

- (void)wantToUpdateData
{
    [_dataSource getAdvertisementWithCallback: _handler];
}

- (void)handleTimeOutEventOfGetAdsWithData: (id)info
{
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_Global_didTimeOutWhenGetAdvertisementFromServer
                                                        object: self
                                                      userInfo: nil];
}
@end
