#import <UIKit/UIKit.h>

@protocol BoCPressTab;
@protocol BoCPressTabDelegate;

@class BoCPressTabBarViewPrivateHandler;

@interface BoCPressTabBarView : UIView 
{
    
    UIView *_backgroundView;
    
    NSMutableArray *_tabs;
    NSMutableArray *_handlers;
    
    NSUInteger _currentTabIndex;
    
    id<BoCPressTabDelegate> _tabDelegate;
    UIImageView *_remoteNotificationIndicator;
}

#pragma mark - Interface builder outlet

@property (nonatomic, retain) id<BoCPressTabDelegate> tabDelegate;
@property (nonatomic) BOOL shouldShowRemoteNotificationIndicator;

#pragma mark - Tab management

- (void)addTab: (id<BoCPressTab>)tab;

- (id<BoCPressTab>)currentTab;

- (NSInteger)indexOfCurrentTab;

- (void)wantToSwitchToTab: (id<BoCPressTab>)tab;

- (void)wantToSwitchToTabAtIndex: (NSUInteger)tabIndex
                      completion: ( void(^)(void) )block;

- (void)switchToTab: (id<BoCPressTab>)tab
         completion: ( void(^)(void) )block;

- (void)enableUserInteraction;

@end
