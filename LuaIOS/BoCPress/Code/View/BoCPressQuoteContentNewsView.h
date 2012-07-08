//
//  BoCPressQuoteContentNewsView.h
//  BoCPress
//
//  Created by E-Reach Administrator on 12/6/11.
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

#import "BoCPressUpdateDataControllableView.h"

@protocol BoCPressSecurity;
@protocol BoCPressQuoteContentDatasource;

@class BoCPressQuoteContentNewsViewPrivateHandler;
@class BoCPressQuoteContentChartLoadingindicator;
@class BoCPressMetaPage;

@interface BoCPressQuoteContentNewsView : UIView<BoCPressUpdateDataControllableView>
{
    UITableView *_contentView;
    BoCPressQuoteContentNewsViewPrivateHandler *_handler;
    id<BoCPressSecurity> _security;
    NSMutableArray *_news;
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

- (void)wantToReadContentOfNewsAtIndex: (NSUInteger)index;

- (void)clearSelectedCell;

@end
