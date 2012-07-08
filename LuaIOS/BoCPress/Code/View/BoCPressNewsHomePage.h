#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

#import "BoCPressUpdateArrowTableView.h"

@protocol BoCPressColumn;
@protocol BoCPressNewsHomeDataSource;

@class BoCPressColumnBarView;
@class BoCPressNewsArraySlice;
@class BoCPressNewsHomePagePrivateHandler;
@class BoCPressNewsTagColumn;
@class BoCPressNewsHomeContentView;

@interface BoCPressNewsHomePage: BoCPressMetaPage<BoCPressShowUpdateTimePage>
{
    
    id<BoCPressNewsHomeDataSource> _newsHomeDataSource;
        
    NSMutableArray* _orderedSuperColumns;
    
    NSMutableDictionary *_columns;
    
    NSMutableDictionary *_news;
    
    BoCPressColumnBarView *_columnBar;
    
    BoCPressUpdateArrowTableView *_contentView;
    
    UIView *_headerView;

    id _animationInfo;        
    id _userInfo;
    
    NSUInteger _indexOfSelectedCell;

    NSUInteger _dataUpdateCounter;
    
    NSMutableDictionary *_heightsOfCells;

}

- (id)initWithDataSource: (id<BoCPressNewsHomeDataSource>)listDataSource;

- (void)wantToUpdateContentDataWithInfo: (id)userInfo;

- (void)updateColumns:(NSDictionary *)data;

- (BoCPressNewsTagColumn *)currentColumn;

- (void)wantToReloadColumns;

- (void)reloadColumnsWithData: (id)data;

- (NSArray *)currentSubcolumns;

- (void)updateNewsArraySlice:(BoCPressNewsArraySlice *)slice;

- (CGFloat)preferHeightForCellAtIndex: (NSIndexPath *)indexPath;

- (void)wantToShowContentOfNewsAtIndex: (NSIndexPath *)indexPath;

- (void)wantToUpdateMoreDataWithInfo: (id)info;

- (void)wantToShowContentOfColumn: (BoCPressNewsTagColumn *)column;

@end
