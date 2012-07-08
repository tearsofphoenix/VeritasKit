#import <Foundation/Foundation.h>

@protocol BoCPressTab;

@protocol BoCPressTabDelegate<NSObject>

@optional

- (void)currentTab: (id<BoCPressTab>)currentTab
   willSwitchToTab: (id<BoCPressTab>)tab;

@required

- (void)currentTab: (id<BoCPressTab>)currentTab
    didSwitchToTab: (id<BoCPressTab>)tab
        completion: ( void(^)(void) )block;

@end
