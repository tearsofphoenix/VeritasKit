#import <Foundation/Foundation.h>

@class BoCPressCriticTableView;

@interface BoCPressCriticTableViewPrivateHandler : NSObject
{
    BoCPressCriticTableView *_tableView;
    NSArray * _critics;
}

- (id)initWithCriticTableView: (BoCPressCriticTableView *)tableView
                        critics: (NSArray *)critics;

- (void)handleCriticItemTapedGesture: (UIGestureRecognizer *)recognizer;

- (void)handleMoreCellTapedEvent: (UIGestureRecognizer *)recognizer;
@end
