#import "BoCPressColumnBarViewPrivateHandler.h"

#import "BoCPressColumn.h"
#import "BoCPressColumnBarView.h"

@implementation BoCPressColumnBarViewPrivateHandler

- (id)initWithColumnBarView: (BoCPressColumnBarView *)columnBarView 
                    columns: (NSArray *)columns
                columnViews: (NSArray *)columnViews
{
    
    self = [super init];
    if (self)
    {
        _columnBarView = columnBarView;
        _columns = columns;
        _columnViews = columnViews;
    }
    
    return self;
    
}

- (void)handleColumnTapGesture: (UIGestureRecognizer *)recognizer
{
    
    NSUInteger index = [_columnViews indexOfObject: [recognizer view]];
    
    [_columnBarView switchToColumn: [_columns objectAtIndex: index]];

}

- (void)scrollViewDidScroll: (UIScrollView *)scrollView
{
    if (_columnBarView == scrollView)
    {
        [_columnBarView wantToShowArrowIndicator];
    }
}

@end
