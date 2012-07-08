#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

#import "BoCPressUpdateArrowTableView.h"

@protocol BoCPressColumn;
@protocol BoCPressMediaListDataSource;
@protocol BoCPressMediaTagColumn;
@protocol BoCPressMediaType;

@class BoCPressColumnBarView;
@class BoCPressMediaArraySlice;
@class BoCPressMediaTagColumn;

@interface BoCPressMediaListPage: BoCPressMetaPage<BoCPressShowUpdateTimePage>
{
        
    id<BoCPressMediaListDataSource> _listDataSource;
        
    NSMutableArray *_columns;
    NSMutableDictionary *_medias;
    
    BoCPressColumnBarView *_columnBar;
    
    BoCPressUpdateArrowTableView *_contentView;
    
    UIView *_broadcastLivingView;
    UIImageView *_broadcastMenuImageView;
    
    UIView *_broadcastView;
    UIImageView *_broadcastThumbnailView;
    UILabel *_broadcastTitleView;
        
    id _animationInfo;
    
    BOOL _hasSetOriginFrame;
    CGRect _originFrameOfContentView;
        
    id _userInfo;
    
    NSUInteger _indexOfSelectedCell;
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
            dataSource: (id<BoCPressMediaListDataSource>)listDataSource;

- (void)wantToUpdateMoreDataOfColumn:(BoCPressMediaTagColumn* )column;

- (void)wantToUpdateContentDataWithInfo: (id)animationInfo;

- (void)updateContentForColumn: (BoCPressMediaArraySlice *)slice;

- (void)updateBroadCastColumn: (BoCPressMediaArraySlice *)slice;

- (void)updateColumns: (NSArray *)columns;

- (BoCPressMediaTagColumn *)currentColumn;

- (void)updateCurrentBroadCast:(id)data;

- (void)updateBroadCastThumbnailImage: (id)data;

- (id<BoCPressMediaListDataSource>)dataSource;

- (id<BoCPressMediaType>)mediaType;

- (void)wantToReloadColumns;

- (void)reloadColumnsWithData: (id)data;

- (NSTimeInterval)lastUpdateTimeInterval;

- (void)wantToShowContentOfMediaAtIndex: (NSUInteger)index;

@end
