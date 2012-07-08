//
//  BoCPressAdView.h
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

#import <UIKit/UIKit.h>

@protocol BoCPressNews;
@protocol BoCPressAdvertisementDataSource;

//@class BoCPressNewsView;
@class BoCPressAdvertisementViewPrivateHandler;

@interface BoCPressAdvertisementView : UIView
{
    UIImageView *_backgroundViewOfContent;
    UIWebView *_contentView;
    BoCPressAdvertisementViewPrivateHandler *_handler;
    id<BoCPressAdvertisementDataSource> _dataSource;
    NSString *_newsContentFormatterString;
    
    id<BoCPressNews> _news;
    NSString *_advertisementViewFlag;
}

@property (nonatomic) BOOL isVisuable;

- (id)initWithDataSource: (id<BoCPressAdvertisementDataSource>)dataSource;

- (void)setNewsWithData: (id)data;

- (void)didTapedWithURLRequest: (NSURLRequest *)request;

- (void)didCloseButtonPressed;

- (void)wantToUpdateData;

- (void)handleTimeOutEventOfGetAdsWithData: (id)info;

@end
