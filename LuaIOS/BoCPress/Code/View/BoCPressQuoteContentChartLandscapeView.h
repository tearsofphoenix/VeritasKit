//
//  BoCPressQuoteContentChartLandscapeView.h
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

#import "BoCPressUpdateDataControllableView.h"

@protocol BoCPressQuoteContentDatasource;

@class BoCPressQuoteContentChartLandscapeViewPrivateHandler;


@interface BoCPressQuoteContentChartLandscapeView : UIView<BoCPressUpdateDataControllableView>
{
    NSArray *_entries;
    
    BoCPressQuoteContentChartLandscapeViewPrivateHandler *_handler;
    NSUInteger _currentEntryIndex;
    
    NSMutableArray *_entryButtons;
    UIImageView *_entriesView;
    UIImageView *_chartView;
    
    NSMutableArray *_thumbnailImages;
    
    BOOL _dataLoading;
    UIView *_loadingIndicator;
    
//    NSTimer *_timerForLoadingIndicator;
//    BOOL _couldHideLoadingIndicator;    

    id<BoCPressQuoteContentDatasource> _dataSource;
    
    NSTimer *_timerForUpdateData;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic) BOOL couldGetChartImage;

- (id)initWithImages: (NSMutableArray *)images
          dataSource: (id<BoCPressQuoteContentDatasource>)dataSource;

- (id)currentEntry;

- (void)wantToSwitchToEntryAtIndex: (NSUInteger)index;

- (void)wantToShowDetailImageOfCurrentEntry;

- (void)updateThumbnailImageWithData: (id)data;

- (void)didUpdateData;

- (void)updateImageConfigurationWithData: (id)data;

- (void)wantToUpdateData;

- (void)foreceUpdateData;

@end
