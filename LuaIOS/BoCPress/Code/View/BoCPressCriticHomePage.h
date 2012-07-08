#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

#import "NSArraySlice.h"

#import "BoCPressUpdateArrowTableView.h"

@protocol BoCPressCriticDataSource;
@protocol BoCPressColumn;
@protocol BoCPressAuthor;

@class BoCPressColumnBarView;
@class BoCPressCriticTableView;
@class BoCPressCriticHomePagePrivateHandler;

@interface BoCPressCriticHomePage: BoCPressMetaPage<BoCPressShowUpdateTimePage>
{
    id<BoCPressCriticDataSource> _dataSource;
    
    NSMutableArray *_columns;
    NSMutableDictionary *_data;
    
    NSMutableArray *_critics;
    
    BoCPressColumnBarView *_columnBar;
    BoCPressUpdateArrowTableView *_contentView;
    
    BoCPressCriticTableView *_criticView;
    
    id _pageFlag;
    
    id _animationInfo;
    
    CGRect _originFrameOfContentView;
        
    BOOL _hasSetOriginFrame;
    
    NSUInteger _indexOfSelectedCell;
    
    id _currentCritic;
}

- (id)initWithDataSource: (id<BoCPressCriticDataSource>)dataSource;

- (void)updateData: (NSArray *)columns;

- (void)updateLatestCriticPost: (NSArraySlice *)slice;

- (void)updateOrderedFavoriteCritics: (NSArraySlice *)slice;

- (void)updateOrderedCritics: (NSArraySlice *)slice;

- (void)wantToUpdateContentDataWithInfo: (id)userInfo;

- (void)wantToUpdateMoreContentData;

- (id<BoCPressColumn>)currentColumn;

- (id)pageFlag;

- (id<BoCPressCriticDataSource>)dataSource;

- (void)stepToReadPostsOfCriticWithData: (id)data;

- (void)willReadPostsOfCriticWithData: (NSDictionary *)data;

- (void)playAnimationOfCriticsColumn;

- (void)wantToReloadColumns;

- (void)reloadColumnsWithData: (id)data;

- (BOOL)moreCellFlagOfCriticView;

- (void)wantToReadListOfCritic: (id<BoCPressAuthor>) critic;

- (void)wantToShowContentOfCriticPostAtIndex: (NSUInteger)index;

- (void)wantToReadPostsOfCritic: (id<BoCPressAuthor>) critic;

- (void)willShowContentOfCriticPostWithData: (NSDictionary *)data;

@end
