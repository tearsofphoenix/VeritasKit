#import <Foundation/Foundation.h>

#import "BoCPressMetaPage.h"

#import "BoCPressUpdateArrowTableView.h"

@protocol BoCPressNewsListDataSource;

@class BoCPressNewsArraySlice;

@interface BoCPressNewsListPage : BoCPressMetaPage<BoCPressShowUpdateTimePage>
{
    id<BoCPressNewsListDataSource> _newsListDataSource;
        
    NSMutableArray *_news;
    
    NSMutableArray *_heightsOfCells;
    
    BoCPressUpdateArrowTableView *_contentView;
    
    id _superColumn;
    id _animationInfo;
    
    BOOL _hasSetOriginFrame;
    CGRect _originFrameOfContentView;

    NSUInteger _indexOfSelectedCell;
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
            dataSource: (id<BoCPressNewsListDataSource>)newsListDataSource
                superColumn: (id)column;

- (void)updateContentForColumn: (BoCPressNewsArraySlice *)slice;

- (void)wantToUpdateMoreData;

- (id)superColumn;

- (id)column;

- (void)wantToShowContentOfNewsAtIndex: (NSUInteger)index;

- (void)showContentOfNewsWithData: (NSDictionary *)data;

- (CGFloat)preferHeightForCellAtIndex: (NSIndexPath *)indexPath;

@end
