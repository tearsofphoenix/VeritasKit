#import <Foundation/Foundation.h>

@class BoCPressCriticTableViewPrivateHandler;
@class BoCPressMoreCell;
@class BoCPressCriticHomePage;

@interface BoCPressCriticTableView : UIScrollView
{
    
    UIImageView *_backgroundView;
    
    NSArray *_critics;
    
    NSMutableArray *_criticViews;
    
    BoCPressCriticTableViewPrivateHandler *_handler;
    
    id _superHandler;
        
    BoCPressMoreCell *_moreCell;
    
    BOOL _hasMoreCell;
}

//- (id)initWithCritics: (NSArray *)critics;
//- (id)initWithCritics: (NSArray *)critics andHandler: (id)superHandler;
- (id)initWithCritics: (NSArray *)critics andHandler: (BoCPressCriticHomePage*)superHandler;

- (void)updateView;

- (id)superHandler;

@end
