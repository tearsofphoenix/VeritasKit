#import "BoCPressTabButtonPrivateHandler.h"

#import "BoCPressTab.h"

#import "BoCPressTabBarView.h"

#import "BoCPressTabDelegate.h"

@implementation BoCPressTabButtonPrivateHandler

- (id)initWithTab: (id<BoCPressTab>)tab 
    forTabBarView: (BoCPressTabBarView *)tabBarView
{
    
    self = [super init];
    if (self)
    {
        _tabBarView = tabBarView;
        _tab = tab;
        
    }
    
    return self;
    
}

- (void)handleTapGesture: (UIGestureRecognizer *)recognizer
{
    [_tabBarView wantToSwitchToTab: _tab];
}

@end
