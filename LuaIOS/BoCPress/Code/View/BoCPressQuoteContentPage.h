//
//  BoCPressQuoteContentPage.h
//  BoCPress
//
//  Created by LeixSnake on 10/27/11.
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

#import "BoCPressMetaPage.h"

@protocol BoCPressQuoteContentDatasource;
@protocol BoCPressEntry;

@class BoCPressChartImageConfiguration;
@class BoCPressQuoteContentChartView;
@class BoCPressQuoteContentCriticPostView;
@class BoCPressQuoteContentPagePrivateHandler;
@class BoCPressSecurity;
@class BoCPressQuoteContentNewsView;

@interface BoCPressQuoteContentPage : BoCPressMetaPage<UIScrollViewDelegate>
{
    id<BoCPressQuoteContentDatasource> _quoteContentDatasource;
    NSArray *_securities;
        
    UIImageView *_backgroundView;
    UIImageView *_shadowView;
    
    UIView *_singleTitleView;
    UILabel *_singleTitleLabel;
    //buy and sell labels
    //
    UIView *_buyView;
    UILabel *_buyLabel;
    UIView *_sellView;
    UILabel *_sellLabel;
    
    UIView *_detailView;
    //detail labels
    //
    UILabel *_openLabel;
    UILabel *_hightLabel;
    UILabel *_lowLabel;
    UILabel *_changeLabel;
    UILabel *_changePercentLabel;
    
    //Page and Title Label
    //
    NSUInteger _numberOfPages;
    UILabel *_pageViewTitleLabel;
    UIPageControl *_pageControl;
    
    //ChartView and CriticPost, News Views
    //
    UIScrollView *_contentView;
    BoCPressQuoteContentChartView *_chartView;
    BoCPressQuoteContentNewsView *_newsView;
    BoCPressQuoteContentCriticPostView *_criticPostView;
    NSMutableArray *_contentViewDataSource;
    
    //Update time label
    UILabel *_updateTimeLabel;
    
    BoCPressSecurity *_cacheOfLastSecurity;
    UIImageView *_bidPriceIndicator;
    UIImageView *_sellPriceIndicator;
    UIImageView *_singleCurrencyIndicator;
    
    NSTimer *_timerForUpdateData;
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
          inSecurities: (NSArray *)securities
           initialInfo: (NSDictionary *)info
            dataSource: (id<BoCPressQuoteContentDatasource>)dataSource;

- (void)updateContentWithData: (id)data;

- (void)reloadConfiguration;

- (void)didChartImageTaped;

- (void)wantToUpdateDataByTimer;

@end
