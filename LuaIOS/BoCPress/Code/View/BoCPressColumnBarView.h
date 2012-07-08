#import <UIKit/UIKit.h>

@protocol BoCPressColumn;
@protocol BoCPressColumnDelegate;
@class BoCPressColumnBarViewPrivateHandler;

@interface BoCPressColumnBarView: UIScrollView 
{
    
    NSMutableArray *_columns;

    UIImageView *_indicator;
    NSMutableArray *_columnViews;
    
    NSUInteger _currentColumnIndex;
    
    id<BoCPressColumnDelegate> _columnDelegate;
        
    BoCPressColumnBarViewPrivateHandler *_handler;
    
    UIImageView *_backgroundView;
    
    UIImageView *_leftArrowIndicator;
    UIImageView *_rightArrowIndicator;
}

- (void)addColumn: (id<BoCPressColumn>)column;
- (void)clearColumns;

- (void)switchToColumn: (id<BoCPressColumn>)column;

- (NSUInteger)currentColumnIndex;
- (void)setCurrentColumnIndex:(NSUInteger)index;

- (void)cancelAllCallback;

- (void)activeAllCallback;

@property (nonatomic, retain) id<BoCPressColumnDelegate> columnDelegate;

- (void)wantToShowArrowIndicator;

@end
