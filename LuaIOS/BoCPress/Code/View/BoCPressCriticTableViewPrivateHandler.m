#import "BoCPressCriticTableViewPrivateHandler.h"

#import "BoCPressCriticTableView.h"

#import "BoCPressAuthor.h"

#import "BoCPressConstant.h"

#import "BoCPressCriticHomePagePrivateHandler.h"

@implementation BoCPressCriticTableViewPrivateHandler

- (id)initWithCriticTableView: (BoCPressCriticTableView *)tableView
                        critics: (NSArray *)critics
{
    
    self = [super init];
    if (self)
    {
        _tableView = tableView;
        _critics = critics;
    }
    
    return self;
    
}

- (void)handleCriticItemTapedGesture: (UIGestureRecognizer *)recognizer
{
    
    CGPoint location = [recognizer locationInView: _tableView];
    
    NSUInteger row = (location.y - 22) / 45;
    NSUInteger column = (location.x - 28) / 99;
    
    NSUInteger criticIndex = row * 3 + column;
    if (criticIndex < [_critics count])
    {
        
        id<BoCPressAuthor> critic = [_critics objectAtIndex: row * 3 + column];
    
        [[_tableView superHandler] wantToReadListOfCritic:critic];
    }
    
}

- (void)handleMoreCellTapedEvent:(UIGestureRecognizer *)recognizer
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kBocPress_View_wantToGetMoreCritic object:_tableView];
}

@end
