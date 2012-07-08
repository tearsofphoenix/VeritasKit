//
//  BoCPressQuoteContentPage.m
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

#import "BoCPressQuoteContentPage.h"

#import "BoCPressQuoteContentDatasource.h"

#import "BoCPressQuoteContentPagePrivateHandler.h"

#import "BoCPressSecurity.h"

#import "BoCPressConstant.h"

#import "EGOPhotoViewController.h"

#import "BoCPressQuoteContentChartView.h"

#import "BoCPressQuoteContentCriticPostView.h"

#import "BoCPressViewController.h"

#import "NSDate+getStringOfYearMonthDay.h"

#import "BoCPressChartImageConfiguration.h"

#import "BoCPressEntry.h"

#import "BoCPressQuoteContentNewsView.h"

#import "BoCPressUpdateDataControllableView.h"

@implementation BoCPressQuoteContentPage

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
          inSecurities: (NSArray *)securities
           initialInfo: (NSDictionary *)info
            dataSource: (id<BoCPressQuoteContentDatasource>)dataSource
{
    if ((self = [super init])) 
    {
        [self setLastPage: lastPage];
        
        _securities = [securities retain];
        _quoteContentDatasource = [dataSource retain];
        _handler = [[BoCPressQuoteContentPagePrivateHandler alloc] initWithPage:self];
        id<BoCPressSecurity> security = [_quoteContentDatasource security];
        
#pragma mark - data configuration
        
#pragma mark - view
        _backgroundView = [[UIImageView alloc] init];
        [_backgroundView setFrame:CGRectMake(0, 0, 320, 417)];

        
        [self addSubview:_backgroundView];
        
#pragma mark - Landscape views
        _shadowView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressContentShadow"]];
        [self addSubview:_shadowView];
        
        if ([[security isTradebleFlag] isEqualToString: kQuoteListPage_IsTradableString])
        {            
            [_backgroundView setImage: [UIImage imageNamed:@"BoCPressQuoteContentPagePortraitBackground"]];
            
            _singleTitleView = nil;
            
            _buyView = [[UIView alloc] init];
            [_buyView setFrame:CGRectMake(8, 8, 150, 65)];
            [_buyView setBackgroundColor:[UIColor clearColor]];
            
            UILabel *buyViewTitleLabel = [[UILabel alloc] init];
            [buyViewTitleLabel setText:@"买入"];
            [buyViewTitleLabel setTextColor:[UIColor colorWithRed:93.0 / 255
                                                            green:93.0 / 255
                                                             blue:93.0 / 255
                                                            alpha:1.0]];    
            
            [buyViewTitleLabel setBackgroundColor:[UIColor clearColor]];
            [buyViewTitleLabel setFont:[UIFont fontWithName:@"Helvetica" size:21]];
            [buyViewTitleLabel setFrame:CGRectMake(50, 10, 45, 20)];
            
            [_buyView addSubview:buyViewTitleLabel];
            [buyViewTitleLabel release];
            
            _bidPriceIndicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BoCPressQuoteContentPageBuyArrow"]];
            [_bidPriceIndicator setFrame:CGRectMake(5, 40, 20, 15)];        
            
            [_buyView addSubview: _bidPriceIndicator];
            
            CGRect frame = [buyViewTitleLabel frame];
            
            CGFloat originXOfBuyLabel = [_bidPriceIndicator frame].origin.x + [_bidPriceIndicator frame].size.width;
            
            _buyLabel = [[UILabel alloc] init];
            [_buyLabel setTextColor:[UIColor grayColor]];
            [_buyLabel setFont:[UIFont fontWithName:@"Helvetica" size:28]];
            [_buyLabel setBackgroundColor:[UIColor clearColor]];
            [_buyLabel setFrame:CGRectMake(originXOfBuyLabel + 5, frame.origin.y + frame.size.height - 3, 110, 40)];
            [_buyLabel setText:@"0"];
            
            [_buyView addSubview:_buyLabel];
            
            [self addSubview:_buyView];
            
            _sellView = [[UIView alloc] init];
            [_sellView setFrame:CGRectMake(165, 8, 150, 65)];
            [_sellView setBackgroundColor:[UIColor clearColor]];
            
            UILabel *sellViewTitleLabel = [[UILabel alloc] init];
            [sellViewTitleLabel setText:@"卖出"];
            [sellViewTitleLabel setTextColor:[UIColor colorWithRed:93.0 / 255
                                                             green:93.0 / 255
                                                              blue:93.0 / 255
                                                             alpha:1.0]];    
            
            [sellViewTitleLabel setBackgroundColor:[UIColor clearColor]];
            [sellViewTitleLabel setFont:[UIFont fontWithName:@"Helvetica" size:21]];
            [sellViewTitleLabel setFrame:CGRectMake(50, 10, 45, 20)];
            
            [_sellView addSubview:sellViewTitleLabel];
            [sellViewTitleLabel release];
            
            _sellPriceIndicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BoCPressQuoteContentPageSellArrow"]];
            [_sellPriceIndicator setFrame:CGRectMake(5, 40, 20, 15)];        
            
            [_sellView addSubview: _sellPriceIndicator];
            
            _sellLabel = [[UILabel alloc] init];
            [_sellLabel setTextColor:[UIColor grayColor]];
            [_sellLabel setFont:[UIFont fontWithName:@"Helvetica" size:28]];
            [_sellLabel setFrame:[_buyLabel frame]];
            [_sellLabel setBackgroundColor:[UIColor clearColor]];
            [_sellLabel setText:@"0"];
            
            [_sellView addSubview:_sellLabel];
            
            [self addSubview:_sellView];
        }else
        {
            [_backgroundView setImage:[UIImage imageNamed:@"BoCPressQuoteContentPageSingleTitleBackground"]];            
            
            _singleTitleView = [[UIView alloc] init];
            [_singleTitleView setFrame:CGRectMake(8, 8, 320 - 8 * 2, 64)];
            
            [self addSubview:_singleTitleView];
            
            UILabel *titleLabel = [[UILabel alloc] init];
            [titleLabel setText:@"最新："];
            [titleLabel setBackgroundColor:[UIColor clearColor]];
            [titleLabel setTextColor:[UIColor colorWithRed:93.0 / 255
                                                     green:93.0 / 255
                                                      blue:93.0 / 255
                                                     alpha:1.0]];    
            [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:19]];
            
            CGSize size = [[titleLabel text] sizeWithFont:[titleLabel font]];
            CGRect frame = [_singleTitleView frame];
            frame.origin.x = 8;
            frame.origin.y = (frame.size.height - size.height) / 2.0;
            frame.size = size;
            [titleLabel setFrame:frame];
            
            [_singleTitleView addSubview:titleLabel];
            [titleLabel release];
            
            frame = [titleLabel frame];
            
            _singleCurrencyIndicator = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressQuoteContentPageBuyArrow"]];
            [_singleCurrencyIndicator setFrame:CGRectMake(frame.origin.x + frame.size.width + 10, frame.origin.y + 5, 20, 15)];
            
            [_singleTitleView addSubview: _singleCurrencyIndicator];
            
            _singleTitleLabel = [[UILabel alloc] init];
            [_singleTitleLabel setFont:[UIFont fontWithName:@"Helvetica" size:30]];
            [_singleTitleLabel setTextColor:[UIColor grayColor]];
            [_singleTitleLabel setText:@"0"];
            [_singleTitleLabel setBackgroundColor:[UIColor clearColor]];
            
            size = [[_singleTitleLabel text] sizeWithFont:[_singleTitleLabel font]];
            
            frame.origin.x += frame.size.width + 40;
            frame.origin.y = ([_singleTitleView frame].size.height - size.height) / 2.0;
            frame.size = size;
            [_singleTitleLabel setFrame:frame];
            
            [_singleTitleView addSubview:_singleTitleLabel];
        }
        
        _detailView = [[UIView alloc] init];
        [_detailView setFrame:CGRectMake(8, 78, 320 - 8 * 2, 85)];
        
        _openLabel = [[UILabel alloc] init];
        [_openLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.4]];
        [_openLabel setText:@"开盘：0"];
        [_openLabel setFrame:CGRectMake(8, 8, 130, 20)];
        [_openLabel setTextColor:[UIColor colorWithRed:93.0 / 255
                                                 green:93.0 / 255
                                                  blue:93.0 / 255
                                                 alpha:1.0]];        
        [_detailView addSubview:_openLabel];
        
        CGRect frame = [_openLabel frame];
        
        _hightLabel = [[UILabel alloc] init];
        [_hightLabel setBackgroundColor:[UIColor clearColor]];
        [_hightLabel setFont:[_openLabel font]];
        [_hightLabel setText:@"最高：0"];
        [_hightLabel setTextColor:[UIColor colorWithRed:93.0 / 255
                                                  green:93.0 / 255
                                                   blue:93.0 / 255
                                                  alpha:1.0]];
        [_hightLabel setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 4, frame.size.width, frame.size.height)];
        
        [_detailView addSubview:_hightLabel];
        
        frame = [_hightLabel frame];
        
        _lowLabel = [[UILabel alloc] init];
        [_lowLabel setBackgroundColor:[UIColor clearColor]];
        [_lowLabel setFont:[_openLabel font]];
        [_lowLabel setFrame:CGRectMake(frame.origin.x + frame.size.width + 23, frame.origin.y, frame.size.width, frame.size.height)];
        [_lowLabel setText:@"最低：0"];
        [_lowLabel setTextColor:[UIColor colorWithRed:93.0 / 255
                                                green:93.0 / 255
                                                 blue:93.0 / 255
                                                alpha:1.0]];    
        [_detailView addSubview:_lowLabel];
        
        NSString *percentString = @"涨跌：";
        UILabel *percentOfHightTitleLabel = [[UILabel alloc] init];
        [percentOfHightTitleLabel setBackgroundColor:[UIColor clearColor]];
        [percentOfHightTitleLabel setText:percentString];
        [percentOfHightTitleLabel setFont:[_openLabel font]];
        [percentOfHightTitleLabel setTextColor:[UIColor colorWithRed:93.0 / 255
                                                               green:93.0 / 255
                                                                blue:93.0 / 255
                                                               alpha:1.0]];    
        CGSize size = [percentString sizeWithFont:[percentOfHightTitleLabel font]];
        
        [percentOfHightTitleLabel setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 4, size.width, size.height)];
        
        [_detailView addSubview:percentOfHightTitleLabel];
        [percentOfHightTitleLabel release];
        
        frame = [percentOfHightTitleLabel frame];
        _changeLabel = [[UILabel alloc] init];
        [_changeLabel setBackgroundColor:[UIColor clearColor]];
        [_changeLabel setFont:[_openLabel font]];
        
        NSString *hightPercentString = @"0";
        size = [hightPercentString sizeWithFont:[_changeLabel font]];
        
        [_changeLabel setFrame:CGRectMake(frame.origin.x + frame.size.width, frame.origin.y, size.width, size.height)];
        [_changeLabel setText:hightPercentString];
        [_changeLabel setTextColor:[UIColor redColor]];
        
        [_detailView addSubview:_changeLabel];
        
        frame = [_lowLabel frame];
        
        NSString *percentLowString = @"涨跌幅：";
        
        UILabel *percentOfLowTitleLabel = [[UILabel alloc] init];
        [percentOfLowTitleLabel setBackgroundColor:[UIColor clearColor]];
        [percentOfLowTitleLabel setTextColor:[UIColor colorWithRed:93.0 / 255
                                                             green:93.0 / 255
                                                              blue:93.0 / 255
                                                             alpha:1.0]];    
        
        [percentOfLowTitleLabel setText:percentLowString];
        [percentOfLowTitleLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        
        size = [percentLowString sizeWithFont:[percentOfLowTitleLabel font]];
        
        [percentOfLowTitleLabel setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 4, size.width, size.height)];
        
        [_detailView addSubview:percentOfLowTitleLabel];
        [percentOfLowTitleLabel release];
        
        frame = [percentOfLowTitleLabel frame];
        
        NSString *lowPercentString = @"0.0%";
        
        _changePercentLabel = [[UILabel alloc] init];
        [_changePercentLabel setBackgroundColor:[UIColor clearColor]];
        [_changePercentLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        
        size = [lowPercentString sizeWithFont:[_changePercentLabel font]];
        
        [_changePercentLabel setFrame:CGRectMake(frame.origin.x + frame.size.width, frame.origin.y, size.width, size.height)];
        [_changePercentLabel setText:lowPercentString];
        
        [_changePercentLabel setTextColor:[UIColor redColor]];
        
        [_detailView addSubview:_changePercentLabel];
        
        [self addSubview:_detailView];
        
        UIView *pageControlView = [[UIView alloc] init];
        [pageControlView setFrame:CGRectMake(8, 350, 320 - 8 * 2, 40)];
        [pageControlView setBackgroundColor:[UIColor clearColor]];
        
        [self addSubview:pageControlView];
        [pageControlView release];
        
        _numberOfPages = 3;
        
        NSString *pageViewTitleString = @"图表";
        
        _pageViewTitleLabel = [[UILabel alloc] init];
        [_pageViewTitleLabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [_pageViewTitleLabel setText:pageViewTitleString];
        [_pageViewTitleLabel setTextColor:[UIColor whiteColor]];
        [_pageViewTitleLabel setBackgroundColor:[UIColor clearColor]];
        
        size = [pageViewTitleString sizeWithFont:[_pageViewTitleLabel font]];
        [_pageViewTitleLabel setFrame:CGRectMake(([pageControlView frame].size.width - size.width) / 2, 2, size.width, size.height)];
        
        [pageControlView addSubview:_pageViewTitleLabel];
        
        frame = [_pageViewTitleLabel frame];
        
        _pageControl = [[UIPageControl alloc] init];
        [_pageControl addTarget:self action:@selector(handlePageControlPageChangedEvent:) forControlEvents:UIControlEventValueChanged];
        [_pageControl setFrame:CGRectMake(0, frame.origin.y + frame.size.height, [pageControlView frame].size.width, 10)];
        [_pageControl setNumberOfPages: _numberOfPages];
        [_pageControl setCurrentPage: 0];    
        
        [pageControlView addSubview:_pageControl];
        
        _contentView = [[UIScrollView alloc] init];
        [_contentView setFrame:CGRectMake(10, 174, 320 - 10 * 2, 176)];
        [_contentView setPagingEnabled:YES];
        [_contentView setClipsToBounds:YES];
        
        [_contentView setContentSize:CGSizeMake(_contentView.frame.size.width * _numberOfPages, _contentView.frame.size.height)];
        [[_contentView layer] setCornerRadius:3.0];
        
        [_contentView setShowsVerticalScrollIndicator:NO];
        [_contentView setShowsHorizontalScrollIndicator: NO];
        [_contentView setScrollsToTop: NO];
        [_contentView setDelegate: self];
        
        frame = [_contentView frame];
        
        _contentViewDataSource = [[NSMutableArray alloc] initWithCapacity:_numberOfPages];
        
        _chartView = [[BoCPressQuoteContentChartView alloc] initWithDataSource: _quoteContentDatasource 
                                                                         title:@"图表"];
        [_chartView setDelegate: (BoCPressQuoteContentPagePrivateHandler*)_handler];
        
        [_chartView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        [_contentViewDataSource addObject:_chartView];
        [_contentView addSubview:_chartView];
        
        
        frame = [_chartView frame];
        
        _newsView = [[BoCPressQuoteContentNewsView alloc] initWithSecurity: security
                                                                dataSource: _quoteContentDatasource
                                                                     title: @"相关资讯"];
        [_newsView setSuperPage: self];
        frame.origin.x += frame.size.width;
        [_newsView setFrame: frame];
        
        [_contentViewDataSource addObject:_newsView];
        [_contentView addSubview:_newsView];        
        
        frame = [_newsView frame];
        
        _criticPostView = [[BoCPressQuoteContentCriticPostView alloc] initWithSecurity: security 
                                                                            dataSource: _quoteContentDatasource
                                                                                 title: @"相关评论"];        
        [_criticPostView setSuperPage: self];
        frame.origin.x += frame.size.width;
        [_criticPostView setFrame: frame];
        
        [_contentViewDataSource addObject:_criticPostView];
        [_contentView addSubview:_criticPostView];
        
        [self addSubview:_contentView];
        
        _updateTimeLabel = [[UILabel alloc] init];
        [_updateTimeLabel setFrame:CGRectMake(0, 397, 329, 20)];
        [_updateTimeLabel setBackgroundColor:[UIColor clearColor]];
        [_updateTimeLabel setTextColor:[UIColor whiteColor]];
        [_updateTimeLabel setTextAlignment:UITextAlignmentCenter];
        [_updateTimeLabel setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        
        [self addSubview:_updateTimeLabel];
        
        _cacheOfLastSecurity = nil;
        
        _timerForUpdateData = [[NSTimer scheduledTimerWithTimeInterval:10 
                                                                target:_handler
                                                              selector:@selector(wantToUpdateDataRaisedByTimer:) 
                                                              userInfo:nil
                                                               repeats:YES] retain];
    }
    
    [self updateContentWithData: info];
    return self;
}

- (void)dealloc
{
    
    
    [_quoteContentDatasource release];
    _quoteContentDatasource = nil;
    [_handler release];
    [_securities release];
    
    [_backgroundView release];
    [_shadowView release];
    
    [_singleTitleView release];
    [_singleTitleLabel release];
    //buy and sell labels
    //
    [_buyView release];
    [_buyLabel release];
    [_sellView release];
    [_sellLabel release];
    
    [_detailView release];
    //detail labels
    //
    [_openLabel release];
    [_hightLabel release];
    [_lowLabel release];
    [_changeLabel release];
    [_changePercentLabel release];
    
    //Page and Title Label
    //
    [_pageViewTitleLabel release];
    [_pageControl release];
    
    //ChartView and CriticPost, News Views
    //
    [_contentView release];
    [_chartView release];
    [_newsView release];
    [_criticPostView release];
    [_contentViewDataSource release];
    
    //Update time label
    [_updateTimeLabel release];
    [_cacheOfLastSecurity release];
    [_bidPriceIndicator release];
    [_sellPriceIndicator release];
    [_singleCurrencyIndicator release];
    
    [_timerForUpdateData invalidate];
    [_timerForUpdateData release];
    _timerForUpdateData = nil;
    
    [super dealloc];
}

#pragma mark - BoCPressPage protocol

- (void)willSwitchToOtherTab
{
    for (id<BoCPressUpdateDataControllableView> iLooper in _contentViewDataSource) 
    {
        [iLooper stopUpdatingData];
    }
    
    [self didUpdateData];
    [_handler cancelAllCallback];
}

- (void)willBrowseBackward
{
    for (id<BoCPressUpdateDataControllableView> iLooper in _contentViewDataSource) 
    {
        [iLooper stopUpdatingData];
    }
    
    [self didUpdateData];
    
    [_handler cancelAllCallback];
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewController_couldBrowseBackward 
                                                        object:self 
                                                      userInfo:nil];
}

- (NSString *)pageTitle
{
    return [[_quoteContentDatasource security] name];
}

- (BOOL)needNavigationBar
{
    return YES;
}
- (BOOL)needTabBar
{
    return NO;
}


- (void)wantToUpdateDataWithInfo: (id)info
{
    [_quoteContentDatasource contentOfQuoteWithCallback:_handler];        
}

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info
{    
    [super didUpdateData];

    [_handler activeAllCallback];   
    NSInteger pageIndex = [_pageControl currentPage];
    
    if ([_pageControl currentPage] == 0)
    {        
        [_chartView reloadView];
        
    }
    [_criticPostView didBeenBackwardToWithInfo: info];
    [_newsView didBeenBackwardToWithInfo: info];
    
    for (id<BoCPressUpdateDataControllableView> iLooper in _contentViewDataSource) 
    {
        if ([_contentViewDataSource indexOfObject: iLooper] != pageIndex)
        {
            [iLooper stopUpdatingData];
        }
    }
    
    if (![_timerForUpdateData isValid]) 
    {
        [_timerForUpdateData release];
        _timerForUpdateData = [[NSTimer scheduledTimerWithTimeInterval: 10
                                                                target: _handler
                                                              selector: @selector(wantToUpdateDataRaisedByTimer:)
                                                              userInfo: nil
                                                               repeats: NO] retain];
    }
    
    [_timerForUpdateData fire];
}

- (BOOL)couldShowTimeOutAlertWithInfo:(NSDictionary *)info
{
    NSDictionary *callbackObject = [info objectForKey: kNetwork_CallbackObject];
    NSString *triggerFlag = [callbackObject objectForKey: kString_QuoteContentPage_TriggerFlag];
    if ([triggerFlag isEqualToString: kString_Global_UpdateTriggerFlagByUser])
    {
        return YES;
    }
    return NO;
}

- (void)updateContentWithData:(id)data
{    
    BoCPressSecurity *security = [data objectForKey:kType_GLobal_SecurityObject];
    
    NSString *currency = [security currentPrice];
    CGSize size = [currency sizeWithFont:[_singleTitleLabel font]];
    CGRect frame = [_singleTitleLabel frame];
    frame.size = size;
    [_singleTitleLabel setFrame:frame];
    [_singleTitleLabel setText: currency];
    
    CGFloat lastCurrency = [[_cacheOfLastSecurity currentPrice] floatValue];
    if (![currency isEqualToString: [_cacheOfLastSecurity currentPrice]])
    {
        
        if([currency floatValue] > lastCurrency)
        {
            [_singleCurrencyIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageBuyArrow"]];
        }else
        {
            [_singleCurrencyIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageSellArrow"]];
        }
        
    }
    NSString *bidPrice = [security bidPrice];
    
    size = [bidPrice sizeWithFont:[_buyLabel font]];
    frame = [_buyLabel frame];
    frame.size = size;
    [_buyLabel setFrame:frame];
    
    [_buyLabel setText:bidPrice];
    
    
    CGFloat lastBidPrice = [[_cacheOfLastSecurity bidPrice] floatValue];
    
    [UIView animateWithDuration: 0.3
                     animations: (^{
                                    if (![[_cacheOfLastSecurity bidPrice] isEqualToString: bidPrice])
                                    {
                                        
                                        if ([bidPrice floatValue] > lastBidPrice) 
                                        {
                                            [_bidPriceIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageBuyArrow"]];
                                        }else
                                        {
                                            [_bidPriceIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageSellArrow"]];
                                        }
                                        
                                    }
                                })
     ];
    
    NSString *askPrice = [security askPrice];
    
    size = [askPrice sizeWithFont:[_sellLabel font]];
    frame = [_sellLabel frame];
    frame.size = size;
    [_sellLabel setFrame:frame];
    
    [_sellLabel setText:askPrice];
    
    CGFloat lastSellPrice = [[_cacheOfLastSecurity askPrice] floatValue];
    
    [UIView animateWithDuration: 0.3
                     animations: (^{
    
                                    if (![[_cacheOfLastSecurity askPrice] isEqualToString: askPrice]) 
                                    {
                                        
                                        if ([askPrice floatValue] > lastSellPrice)
                                        {
                                            [_sellPriceIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageBuyArrow"]];
                                        }else
                                        {
                                            [_sellPriceIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageSellArrow"]];
                                        }
                                    }
                                })
     ];
    
    NSString *contentString = [NSString stringWithFormat:@"开盘：%@",[security openingPrice]];
    size = [contentString sizeWithFont:[_openLabel font]];
    frame = [_openLabel frame];
    frame.size = size;
    [_openLabel setFrame:frame];
    
    [_openLabel setText:contentString];
    
    contentString = [NSString stringWithFormat:@"最高：%@",[security dailyHigh]];
    size = [contentString sizeWithFont:[_hightLabel font]];
    frame = [_hightLabel frame];
    frame.size = size;
    [_hightLabel setFrame:frame];
    
    [_hightLabel setText:contentString];
    
    contentString = [NSString stringWithFormat:@"最低：%@",[security dailyLow]];
    size = [contentString sizeWithFont:[_lowLabel font]];
    frame = [_lowLabel frame];
    frame.size = size;
    [_lowLabel setFrame:frame];
    
    [_lowLabel setText:contentString];
    
    contentString = [security change];
    
    size = [contentString sizeWithFont:[_changeLabel font]];
    frame = [_changeLabel frame];
    frame.size = size;
    [_changeLabel setFrame:frame];
    
    [_changeLabel setText:contentString];
    
    if ([contentString floatValue] < 0)
    {
        [_changeLabel setTextColor: [UIColor colorWithRed: 51.0 / 255 
                                                    green: 153.0 / 255
                                                     blue: 0
                                                    alpha: 1]];
    }else
    {
        [_changeLabel setTextColor: [UIColor colorWithRed: 217.0 / 255 
                                                    green: 63.0 / 255
                                                     blue: 63.0 / 255
                                                    alpha: 1]];        
    }
    
    
    contentString = [security changePercent];
    
    if ([contentString floatValue] < 0)
    {
        [_changePercentLabel setTextColor: [UIColor colorWithRed: 51.0 / 255 
                                                           green: 153.0 / 255
                                                            blue: 0
                                                           alpha: 1]];
    }else
    {
        [_changePercentLabel setTextColor: [UIColor colorWithRed: 217.0 / 255 
                                                           green: 63.0 / 255
                                                            blue: 63.0 / 255
                                                           alpha: 1]];        
    }
    
    if (![contentString hasSuffix:@"%"])
    {
        contentString = [contentString stringByAppendingString:@"%"];
    }
    
    size = [contentString sizeWithFont:[_changePercentLabel font]];
    frame = [_changePercentLabel frame];
    frame.size = size;
    [_changePercentLabel setFrame:frame];
    
    [_changePercentLabel setText: contentString];
    
    contentString = [NSString stringWithFormat:@"最后更新：%@", [security tradeDateTime]];
    [_updateTimeLabel setText:contentString];
    
    [_cacheOfLastSecurity release];
    _cacheOfLastSecurity = [security retain];

}




- (void)wantToForceRefreshCurrentContentWithInfo: (id)animationInfo
{   
    [self wantToUpdateDataWithInfo: nil];
}


- (void)didBeenSwitchToFromOtherTabCompletion: (void (^)(void))block
{
    
    [_handler activeAllCallback];
    
    [_criticPostView didBeenBackwardToWithInfo: nil];
    [_newsView didBeenBackwardToWithInfo: nil];
    
    NSInteger pageIndex = [_pageControl currentPage];
    
    for (id<BoCPressUpdateDataControllableView> iLooper in _contentViewDataSource) 
    {
        if ([_contentViewDataSource indexOfObject: iLooper] != pageIndex)
        {
            [iLooper stopUpdatingData];
            
        }else
        {
            [iLooper startToUpdateData];
        }
    }
    
    if (![_timerForUpdateData isValid]) 
    {
        [_timerForUpdateData release];
        _timerForUpdateData = [[NSTimer scheduledTimerWithTimeInterval: 10
                                                                target: _handler
                                                              selector: @selector(wantToUpdateDataRaisedByTimer:)
                                                              userInfo: nil
                                                               repeats: NO] retain];
    }
    
    [_timerForUpdateData fire];
    
}

#pragma mark - handle page control taped event
- (void)handlePageControlPageChangedEvent: (id)sender
{
    NSInteger pageIndex = [_pageControl currentPage];
    
    CGRect frame = [_contentView frame];
    frame.origin.x = frame.size.width * pageIndex;
    frame.origin.y = 0;
    
    [_contentView scrollRectToVisible:frame animated:YES];
    
    for (id<BoCPressUpdateDataControllableView> iLooper in _contentViewDataSource) 
    {
        if([_contentViewDataSource indexOfObject: iLooper] != pageIndex)
        {
            [iLooper stopUpdatingData];
        }else
        {
            [iLooper startToUpdateData];
        }
    }
    
}

#pragma mark - UIScroll View delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int pageIndex = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    if (pageIndex != [_pageControl currentPage])
    {
        [_pageControl setCurrentPage: pageIndex];
        
        id view = [_contentViewDataSource objectAtIndex:pageIndex];
        
        for (id<BoCPressUpdateDataControllableView> iLooper in _contentViewDataSource) 
        {
            if([_contentViewDataSource indexOfObject: iLooper] != pageIndex)
            {
                [iLooper stopUpdatingData];
            }else
            {
                [iLooper startToUpdateData];
            }
        }
        
        NSString *title = [view title];
        
        CGSize size = [title sizeWithFont:[_pageViewTitleLabel font]];
        CGRect frame = [_pageViewTitleLabel frame];
        frame.size = size;
        frame.origin.x = ([[_pageViewTitleLabel superview] frame].size.width - size.width) / 2.0;
        [_pageViewTitleLabel setFrame:frame];
        
        [_pageViewTitleLabel setText:title];
    }
    
}

- (void)reloadConfiguration
{
    [_quoteContentDatasource storeChartImageConfiguration];
    
    [self wantToUpdateDataWithInfo:nil];
}

- (void)didChartImageTaped
{
    for (id<BoCPressUpdateDataControllableView> iLooper in _contentViewDataSource) 
    {
        [iLooper stopUpdatingData];
    }
    
    [self didUpdateData];
    [_handler cancelAllCallback];
    
    NSUInteger currentTimeEntryIndex = [_chartView currentEntryIndex];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              _quoteContentDatasource, kBoCPress_Data_Datasource,
                              _securities, kType_Global_NSArray,
                              [NSNumber numberWithInteger:currentTimeEntryIndex], kBoCPress_Global_Index,
                              [_chartView images], kQuoteContentPage_ChartViewImages,
                              nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToShowLandscapeQuoteContentPage
                                                        object: self 
                                                      userInfo: userInfo];
    
    [userInfo release];
}

- (void)attachCallbackInfo: (NSDictionary *)callbackInfo
                   forType: (NSString *)type
{
    
}

- (void)wantToUpdateDataByTimer
{
    [_quoteContentDatasource contentOfQuoteWithCallbackByTimer:_handler];        
}

- (void)didUpdateData
{    
    for (UIView *view in _contentViewDataSource)
    {
        [view setUserInteractionEnabled: YES];
    }
    [super didUpdateData];
}

- (void)didCancelledHandleErrorOfServerWithData:(NSDictionary *)info
{
    [_criticPostView clearSelectedCell];
    [_newsView clearSelectedCell];
    [self didUpdateData];
}

- (void)didBeenSlideToWithInfo:(NSDictionary *)info
{
    
}

@end
