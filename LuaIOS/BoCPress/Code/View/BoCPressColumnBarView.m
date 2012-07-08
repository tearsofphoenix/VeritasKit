#import "BoCPressColumnBarView.h"

#import "BoCPressColumn.h"

#import "BoCPressColumnBarViewPrivateHandler.h"

@implementation BoCPressColumnBarView

@synthesize columnDelegate = _columnDelegate;

- (id)init
{
    
    self = [super init];
    if (self)
    {
        
        _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"BoCPressColumnBarBackground"]];
        [self addSubview: _backgroundView];
        
        _currentColumnIndex = NSNotFound;
        
        _columns = [[NSMutableArray alloc] init];
        
        _indicator = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressColumnBarIndicator"]];
        [_indicator setAlpha: 0.0];
        [_indicator setFrame: CGRectMake(-13, 29, 13, 6)];
        [self addSubview: _indicator];
        
        _columnViews = [[NSMutableArray alloc] init];
        
        _handler = [[BoCPressColumnBarViewPrivateHandler alloc] initWithColumnBarView: self 
                                                                              columns: _columns
                                                                          columnViews: _columnViews];

        _leftArrowIndicator = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressNewsHomePageLeftTipIndicator"]];
        [_leftArrowIndicator setAlpha: 0];
        
        [self addSubview: _leftArrowIndicator];
        _rightArrowIndicator = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressNewsHomePageRightTipIndicator"]];
        [_rightArrowIndicator setAlpha: 0];
        [self addSubview: _rightArrowIndicator];
         
                                 
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        [self setDelegate: _handler];
    }
    
    return self;
    
}

- (void)dealloc
{
    
    [_handler release];
    
    [_columns release];
    [_columnDelegate release];
    
    [_indicator release];
    
    [_columnViews release];
    
    
    [super dealloc];
    
}
- (void)addColumn: (id<BoCPressColumn>)column
{
    [_columns addObject:column];
    static const float columnDistance = 25.0;
    static const float maxColumnDistance = 10.0;
    
    CGFloat left = -9;
    if ([_columnViews count] > 0)
    {
        CGRect frame = [[_columnViews lastObject] frame];
        left = frame.origin.x + frame.size.width;
    }
    
    UILabel *label = [[UILabel alloc] init];
    [label setText: [column name]];
    [label setFrame: CGRectMake(left + columnDistance, 0, [column columnWidth], 35)];
    
    [label setTextColor: [UIColor whiteColor]];
    [label setBackgroundColor: [UIColor clearColor]];
    [label setFont: [UIFont fontWithName: @"Helvetica" size: 15]];
    [label setUserInteractionEnabled: YES];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget: _handler 
                                                                                 action: @selector(handleColumnTapGesture:)];
    [label addGestureRecognizer: recognizer];
    [recognizer release];
    
    [self addSubview: label];
    [_columnViews addObject: label];
    [label release];
    
    CGRect frame = [[_columnViews lastObject] frame];
    //    [self setContentSize: CGSizeMake(frame.origin.x + frame.size.width + 30, 35)];
    
    CGFloat allColumnWidth = frame.origin.x + frame.size.width;
    
    if (allColumnWidth < 320)
    {
        [self setContentSize:CGSizeMake(allColumnWidth, 35)];
        
    }else
    {
        
        //try to find the right columnDistance
        //
        if ([_columnViews count] >= 4)
        {
            
            CGRect frameOfForthColumn = [[_columnViews objectAtIndex:3] frame];
            CGFloat shownColumnWidth = frameOfForthColumn.origin.x + frameOfForthColumn.size.width;
            CGFloat distanceOffset = 0;
            CGFloat mutableAllColumnWidth = shownColumnWidth;
            while (mutableAllColumnWidth > 320)
            {
                //  mutableColumnDistance -= 3;
                //  distanceOffset = columnDistance - mutableColumnDistance;
                distanceOffset += 1;
                mutableAllColumnWidth = shownColumnWidth - distanceOffset * ([_columnViews count] - 1);
            }
            
            
            
            //if the distance that will be judged is too small, then do nothing
            //
            if (distanceOffset >= maxColumnDistance)
            {
                distanceOffset = maxColumnDistance;
            }
            
            //                NSLog(@"cl:%@", [column name]);
            
            for (int columnIndexLooper = 0; columnIndexLooper < [_columnViews count]; ++columnIndexLooper) 
            {
                UILabel* columnLooper = [_columnViews objectAtIndex:columnIndexLooper];
                
                CGRect columnFrame = [columnLooper frame];
                
                [columnLooper setFrame:CGRectMake(columnFrame.origin.x - distanceOffset * (columnIndexLooper + 1), columnFrame.origin.y, columnFrame.size.width, columnFrame.size.
                                                  height)];
            }
            
            [self setContentSize: CGSizeMake(frame.origin.x + frame.size.width + 30, 35)];
            
        }
    }
    
    [self wantToShowArrowIndicator];

}

- (void)clearColumns
{
    
    [_columns removeAllObjects];
    
    UIView *column = nil;
    for (column in _columnViews)
    {
        [column removeFromSuperview];
    }
    [_columnViews removeAllObjects];
}

- (void)switchToColumn: (id<BoCPressColumn>)column
{
    
    NSUInteger index = [_columns indexOfObject: column];
    if (index < [_columnViews count])
    {
        for (id columnViewLooper in _columnViews) 
        {
            [(UILabel*)columnViewLooper setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
        }
        //        [_moreColumn setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
        
        UILabel* selectedColumnView = [_columnViews objectAtIndex:index];
        [selectedColumnView setTextColor:[UIColor whiteColor]];
        
        [UIView animateWithDuration: 0.5
                         animations: (^{
            
                                        CGRect frame = [[_columnViews objectAtIndex: index] frame];
                                        
                                        [_indicator setFrame: CGRectMake(frame.origin.x + frame.size.width / 2 - 6.5, 29, 13, 6)];
                                        [_indicator setAlpha: 1.0];
                                    })
         ];        
    }
    
    _currentColumnIndex = index;
    
    [_columnDelegate didColumnSwitchTo: column];
    
    
}

- (NSUInteger)currentColumnIndex
{
    return _currentColumnIndex;
}

- (void)setCurrentColumnIndex: (NSUInteger)index
{
    if (index < [_columns count])
    {
        for (id columnViewLooper in _columnViews) 
        {
            [(UILabel*)columnViewLooper setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
        }
        //        [_moreColumn setTextColor:[UIColor colorWithWhite:1.0 alpha:0.5]];
        
        UILabel* selectedColumnView = [_columnViews objectAtIndex:index];
        [selectedColumnView setTextColor:[UIColor whiteColor]];
        

        CGRect frame = [[_columnViews objectAtIndex: index] frame];
        
        [_indicator setFrame: CGRectMake(frame.origin.x + frame.size.width / 2 - 6.5, 29, 13, 6)];
        [_indicator setAlpha: 1.0];
                
        _currentColumnIndex = index;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGPoint contentOffset = [self contentOffset];
    CGRect bounds = [self bounds];
    CGFloat yOffset = bounds.origin.y + (bounds.size.height - 22.5) / 2.0;
    [_leftArrowIndicator setFrame: CGRectMake(contentOffset.x, yOffset, 15, 22.5)];
    [_rightArrowIndicator setFrame: CGRectMake(320 - 15 + contentOffset.x, yOffset, 15, 22.5)];

    [_backgroundView setFrame: CGRectMake([self contentOffset].x, 0, 320, 35)];
    
}

- (void)cancelAllCallback
{
    ;
}
- (void)activeAllCallback
{
    ;
}

- (void)wantToShowArrowIndicator
{
    CGFloat xOffset = [self contentOffset].x;
    CGFloat originXOfFirstColumn = [[_columnViews objectAtIndex: 0] frame].origin.x;
    CGRect frameOfLastColumn = [[_columnViews lastObject] frame];
    CGFloat maxXofLastColumn = frameOfLastColumn.origin.x + frameOfLastColumn.size.width - [self contentOffset].x;
    CGRect frameOfSelf = [self frame];
    CGFloat maxXOfSelf = frameOfSelf.origin.x + frameOfSelf.size.width;
    
    if (xOffset > originXOfFirstColumn)
    {
        //show left arrow;
        [_leftArrowIndicator setAlpha: 1];
    }else
    {
        [_leftArrowIndicator setAlpha: 0];
    }
    
    if (maxXofLastColumn > maxXOfSelf)
    {
        //show right arrow;
        [_rightArrowIndicator setAlpha: 1];
    }else 
    {
        [_rightArrowIndicator setAlpha: 0];
    }
}

@end
