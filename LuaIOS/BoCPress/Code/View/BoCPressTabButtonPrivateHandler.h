#import <Foundation/Foundation.h>

@class BoCPressTabBarView;
@protocol BoCPressTab;

@interface BoCPressTabButtonPrivateHandler : NSObject 
{
    BoCPressTabBarView *_tabBarView;
    id<BoCPressTab> _tab;
}

- (id)initWithTab: (id<BoCPressTab>)tab 
    forTabBarView: (BoCPressTabBarView *)tabBarView;

- (void)handleTapGesture: (UIGestureRecognizer *)recognizer;

@end
