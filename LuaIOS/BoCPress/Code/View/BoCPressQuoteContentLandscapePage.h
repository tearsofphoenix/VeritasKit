//
//  BoCPressQuoteContentLandscapePage.h
//  BoCPress
//
//  Created by E-Reach Administrator on 11/21/11.
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

@class BoCPressQuoteContentChartLandscapeView;
@class BoCPressQuoteContentLandscapePagePrivateHandler;
@class BoCPressChartImageConfiguration;
@class BoCPressQuoteContentChartView;

@interface BoCPressQuoteContentLandscapePage : BoCPressMetaPage
{
    id<BoCPressQuoteContentDatasource> _quoteContentDatasource;    

    BoCPressQuoteContentChartLandscapeView *_chartView;

    NSArray *_securities;
    NSUInteger _currentTimeEntryIndex;
    BOOL _isChangingConfiguration;
    NSTimer *_timerToUpdateData;
}

- (id)initWithLastPage:(id<BoCPressPage>)lastPage 
          inSecurities:(NSArray *)securities 
 currentTimeEntryIndex: (NSUInteger)currentTimeEntryIndex
         currentImages: (NSMutableArray *)currentImages
            dataSource:(id<BoCPressQuoteContentDatasource>)dataSource;

- (void)changeTimeIntervalTypeOfChartImageConfigurationTo: (id<BoCPressEntry>)entry;

- (void)updateContentWithData: (id)data;

- (void)reloadConfiguration;

- (void)showConfigurationView;

- (void)showSecurityChooseView;

- (void)didSelectedSecurityAtRow: (NSInteger)index;

- (void)wantToUpdateDataByTimer;

@end
