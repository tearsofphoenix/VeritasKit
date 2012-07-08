#import <Foundation/Foundation.h>

#import "BoCPressColumnDelegate.h"

@class BoCPressColumnBarView;

@interface BoCPressColumnBarViewPrivateHandler: NSObject<UIScrollViewDelegate>
{
    BoCPressColumnBarView *_columnBarView;
    NSArray *_columns;
    NSArray *_columnViews;
}

- (id)initWithColumnBarView: (BoCPressColumnBarView *)columnBarView 
                    columns: (NSArray *)columns
                columnViews: (NSArray *)columnViews;

- (void)handleColumnTapGesture: (UIGestureRecognizer *)recognizer;

@end
