#import <UIKit/UIKit.h>

#import "BoCPressMetaPage.h"

#import "BoCPressUpdateArrowTableView.h"

@class NSArraySlice;

@protocol BoCPressCriticDataSource;
@protocol BoCPressAuthor;
@class BoCPressCriticView;

@interface BoCPressCriticPostListPage: BoCPressMetaPage< BoCPressShowUpdateTimePage>
{
    id<BoCPressCriticDataSource> _dataSource;
    
    NSMutableArray *_posts;
        
    BoCPressUpdateArrowTableView *_postTableView;
    
    BoCPressCriticView *_criticView;
    
    id _pageFlag;
    
    id _animationInfo;
    
    BOOL _hasSetOriginFrame;
    CGRect _originFrameOfContentView;
    
    id _userInfo;
    
    NSUInteger _indexOfSelectedCell;
    id<BoCPressAuthor> _critic;
}

- (id)initWithLastPage: (id<BoCPressPage>)lastPage
                critic: (id<BoCPressAuthor>)critic
            dataSource: (id<BoCPressCriticDataSource>)dataSource
              pageFlag: (id) pageFlag;

- (void)updateCriticInfoWithData:(id<BoCPressAuthor>) newCritic;

- (void)updateData: (NSArraySlice *)slice;

- (void)wantToUpdateMoreData;

- (void)wantToReadCriticPostAtIndex: (NSIndexPath *)indexPath;

@end
