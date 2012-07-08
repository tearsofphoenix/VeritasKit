#import "BoCPressCriticTableView.h"

#import "BoCPressCriticTableViewPrivateHandler.h"

#import "BoCPressAuthor.h"

#import "BoCPressMoreCell.h"

#import "BoCPressConstant.h"

#import "BoCPressCriticHomePage.h"

@implementation BoCPressCriticTableView

- (id)initWithCritics: (NSArray *)critics andHandler: (BoCPressCriticHomePage*)superHandler
{
    
    self = [super init];
    if (self) 
    {
        
        [self setAlwaysBounceVertical: YES];
        _superHandler = superHandler;
        _critics = critics;
        _criticViews = [[NSMutableArray alloc] init];
        
        _handler = [[BoCPressCriticTableViewPrivateHandler alloc] initWithCriticTableView: self critics: _critics];
        
        _backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressCriticTabColumnBackground"]];
        [self addSubview: _backgroundView];

        _moreCell = [[BoCPressMoreCell alloc] init];
                
        UITapGestureRecognizer *tapForGetMoreCritic = [[UITapGestureRecognizer alloc] initWithTarget:_handler action:@selector(handleMoreCellTapedEvent:)] ;
        [_moreCell addGestureRecognizer:tapForGetMoreCritic];
        
        [tapForGetMoreCritic release];
        
        [self addSubview:_moreCell];
        
        _hasMoreCell = NO;
    }
    
    return self;
    
}

- (void)dealloc
{
    [_criticViews release];
    
    [_backgroundView release];
    [_handler release];
    
    [super dealloc];
}

- (void)updateView
{

    _hasMoreCell = [_superHandler moreCellFlagOfCriticView];
    
    UIView *view = nil;
    for (view in _criticViews)
    {
        [view removeFromSuperview];
    }
    
    [_criticViews removeAllObjects];
    
    NSUInteger looper = 0;
    
    id<BoCPressAuthor> author = nil;
    for (author in _critics)
    {
        
        NSUInteger row = looper / 3;
        NSUInteger column = looper % 3;
        
        UIView *view = [[[UIView alloc] initWithFrame: CGRectMake(column * 99 + 28, 22 + 45 * row, 70, 16)] autorelease];
        
        UIImageView *portraitView = [[[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressCriticTabPortrait"]] autorelease];
        [portraitView setFrame: CGRectMake(0, 1.5, 12, 12)];
        [view addSubview: portraitView];
        
        UILabel *label = [[[UILabel alloc] initWithFrame: CGRectMake(15, 0, 65, 16)] autorelease] ;
        [label setFont: [UIFont fontWithName: @"Helvetica" size: 14]];
        [label setBackgroundColor: [UIColor clearColor]];
        [label setText: [author name]];
        [view addSubview: label];
        
        [_criticViews addObject: view];
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget: _handler action: @selector(handleCriticItemTapedGesture:)];
        
        [view addGestureRecognizer: recognizer];
        
        [recognizer release];
        
        [self addSubview: view];
        
        ++looper;
    }
        
    NSUInteger size = looper / 3;
    if (looper % 3 != 0)
    {        
        size += 1;
    }
    
    [self setContentSize: CGSizeMake(320, 22 + 45 * size )];
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    CGRect bounds = [self bounds];
    [_backgroundView setFrame: bounds];
    
    if (_hasMoreCell)
    {
        [_moreCell setHidden:NO];
        [_moreCell setFrame:CGRectMake(bounds.origin.x, bounds.size.height, 320, 41)];

    }else
    {
        [_moreCell setHidden:YES];
    }
    
}

- (id)superHandler
{
    return _superHandler;
}

//- (void)handleMoreCellTapedEvent
//{
//    [_handler wantToGetMoreCritic];
//}
@end
