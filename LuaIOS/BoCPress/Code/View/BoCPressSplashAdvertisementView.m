//
//  BoCPressSplashAdvertisementView.m
//  BoCPress
//
//  Created by E-Reach Administrator on 12/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BoCPressSplashAdvertisementView.h"

#import "BoCPressNews.h"

#import "UIWebView+RemoveBackgroundShadow.h"

#import "BoCPressSplashAdvertisementViewPrivateHandler.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressSplashAdvertisementDataSource.h"

#import "BoCPressConstant.h"

#import "NSString+MD5.h"

@implementation BoCPressSplashAdvertisementView

- (id)initWithNews:(id<BoCPressNews>)news splashAdvertisementDataSource:(id<BoCPressSplashAdvertisementDataSource>)splashAdvertisementDataSource
{
    if ((self = [super init]))
    {
        _handler = [[BoCPressSplashAdvertisementViewPrivateHandler alloc] initWithSplashAdvertisementView: self];
        _splashAdvertisementDataSource = [splashAdvertisementDataSource retain];
        
        [[[self subviews] lastObject] setScrollEnabled: NO];        
        [self setDelegate: _handler];
        
        [self removeBackgroundShadow];
        
        NSString *cacheImageDirectoryPath = [_splashAdvertisementDataSource cacheImageDirectoryPath];
        NSURL *baseURL = [NSURL fileURLWithPath: cacheImageDirectoryPath];
        
        NSString *newsContent = [news articleContent] ;
        NSRange imageTagRange = [newsContent rangeOfString: @"<img.*src\\s*=\\s*\".*\"" 
                                                   options: NSRegularExpressionSearch];
        if (imageTagRange.location != NSNotFound)
        {
            NSString *imageTagString = [newsContent substringWithRange: imageTagRange];
            NSRange imageURLRange = [imageTagString rangeOfString: @"src=\"[^\"\\s]*\"" 
                                                          options: NSRegularExpressionSearch];
            
            NSString *imageSourceString = [imageTagString substringWithRange: imageURLRange];
            
            NSString *imageURL = [imageSourceString substringWithRange: [imageSourceString rangeOfString: @"http[^\"\\s]*"
                                                                                                 options: NSRegularExpressionSearch]];
            
            NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                      [NSURL URLWithString: imageURL], kBoCPress_Global_NSURLObject, 
                                      kBoCPress_View_updateThumbnailImage, kNetwork_CallbackAction,
                                      _handler, kNetwork_CallbackObject,
                                      nil];
            
            if ([_splashAdvertisementDataSource imageWithImageInfo: userInfo
                                                          callback: _handler])
            {
                NSRange imageSourceRange = [newsContent rangeOfString: imageSourceString];
                
                newsContent = [newsContent stringByReplacingCharactersInRange: imageSourceRange 
                                                                   withString: [NSString stringWithFormat:@" src=\"%@\"", [imageURL MD5]]
                               ];
            }
            
            [userInfo release];
        }
                              
        NSString *newsContentFormatterString = @"<html style=\"padding:0px;margin:0px\"><meta name=\"viewport\" content=\"width=320, height=460, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0\"/><body style=\"padding:0px;margin:0px\">%@</body></html>";
        
        [self loadHTMLString: [NSString stringWithFormat: newsContentFormatterString, newsContent]
                     baseURL: baseURL];
    }
    return self;
}

- (void)dealloc
{
    [_handler cancelAllCallback];
    [_handler release];
    [_splashAdvertisementDataSource release];
    
    [super dealloc];
}

- (void)didTapedWithURLRequest:(NSURLRequest *)request
{
    [[UIApplication sharedApplication] openURL: [request URL]];
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_didSplashAdvertisementViewTaped
                                                        object: self
                                                      userInfo: nil];
}
@end
