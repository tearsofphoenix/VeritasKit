//
//  BoCPressQuoteContentChartView.h
//  BoCPress
//
//  Created by Leix Snake on 11/5/11.
//  Copyright 2011 SJTU. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BoCPressUpdateDataControllableView.h"

@protocol BoCPressQuoteContentDatasource;

@class BoCPressQuoteContentChartView;

@protocol BoCPressQuoteContentChartViewDelegate <NSObject>

- (void)didChartImageTapedInChartView:(BoCPressQuoteContentChartView *)chartView;

@end

@class BoCPressQuoteContentChartViewPrivateHandler;

@interface BoCPressQuoteContentChartView : UIView<BoCPressUpdateDataControllableView>
{
    NSArray *_entries;
    
    BoCPressQuoteContentChartViewPrivateHandler *_handler;
    NSUInteger _currentEntryIndex;
    
    NSMutableArray *_entryButtons;
    UIView *_entriesView;
    UIImageView *_chartView;
    
    NSMutableArray *_thumbnailImages;
    
    BOOL _dataLoading;
    UIView *_loadingIndicator;
    id<BoCPressQuoteContentDatasource> _dataSource;

    NSTimer *_timerToUpdateData;
}

@property (nonatomic, retain) NSString *title;

@property (nonatomic, retain) id<BoCPressQuoteContentChartViewDelegate> delegate;

- (id)initWithDataSource: (id<BoCPressQuoteContentDatasource>)dataSource 
                   title: (NSString *)title;

- (id)currentEntry;

- (NSUInteger)currentEntryIndex;

- (void)wantToSwitchToEntryAtIndex: (NSUInteger)index;

- (void)updateThumbnailImageWithData: (id)data;

- (void)didChartImageTaped;

- (void)didUpdateData;

- (NSMutableArray *)images;

- (void)wantToUpdateData;

- (void)wantToUpdateDataByTimer: (NSTimer *)timer;

- (void)updateImageConfigurationWithData: (id)data;

- (void)reloadView;

@end
