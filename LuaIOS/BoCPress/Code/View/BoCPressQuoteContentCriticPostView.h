//
//  BoCPressQuoteContentCriticPostView.h
//  BoCPress
//
//  Created by Leix Snake on 11/5/11.
//  Copyright 2011 SJTU. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BoCPressUpdateDataControllableView.h"

@protocol BoCPressSecurity;
@protocol BoCPressQuoteContentDatasource;

@class BoCPressQuoteContentCriticPostViewPrivateHandler;
@class BoCPressQuoteContentChartLoadingindicator;
@class BoCPressMetaPage;

@interface BoCPressQuoteContentCriticPostView : UIView<BoCPressUpdateDataControllableView>
{
    UITableView *_contentView;
    BoCPressQuoteContentCriticPostViewPrivateHandler *_handler;
    id<BoCPressSecurity> _security;
    NSMutableArray *_criticPosts;
    id<BoCPressQuoteContentDatasource> _quoteContentDataSource;
    
    BOOL _dataLoading;
    BoCPressQuoteContentChartLoadingindicator *_loadingIndicator;
    NSInteger _currentIndex;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *pageTitle;
@property (nonatomic, assign) BoCPressMetaPage *superPage;

- (id)initWithSecurity: (id<BoCPressSecurity>)security
            dataSource: (id<BoCPressQuoteContentDatasource>)dataSource
                 title: (NSString *)title;

- (void)didUpdateData;

- (void)wantToUpdateData;

- (void)didBeenBackwardToWithInfo: (NSDictionary *)info;

- (void)updateContentWithData: (NSArray *)data;

- (void)wantToReadContentOfCriticPostAtIndex: (NSUInteger)index;

- (void)clearSelectedCell;

@end
