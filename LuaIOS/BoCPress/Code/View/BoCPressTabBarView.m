#import "BoCPressTabBarView.h"

#import "BoCPressTab.h"

#import "BoCPressTabDelegate.h"

#import "BoCPressTabButtonPrivateHandler.h"

@implementation BoCPressTabBarView

#pragma mark - Tab parameters

@synthesize tabDelegate = _tabDelegate;
@synthesize shouldShowRemoteNotificationIndicator = _shouldShowRemoteNotificationIndicator;

#pragma mark - Instance initialization

- (id)init
{
    
    self = [super init];
    if (self)
    {
        
        _backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressTabBarBackground"]];
        [self addSubview: _backgroundView];
        
        _tabs = [[NSMutableArray alloc] init];
        _handlers = [[NSMutableArray alloc] init];
        _currentTabIndex = NSNotFound;
        _remoteNotificationIndicator = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressRemoteNotificationNewIndicatorOnTab"]];
        [_remoteNotificationIndicator setAlpha: 0];
        [self addSubview: _remoteNotificationIndicator];
    }
    
    return self;
    
}

#pragma mark - Memory management

- (void)dealloc
{
    
    [_backgroundView release];
    [_tabs release];
    [_handlers release];
    [_remoteNotificationIndicator release];
    
    [super dealloc];
}

#pragma mark - Tab management

- (void)addTab: (id<BoCPressTab>)tab
{
    
    UIButton *button = [tab tabButton];
    
    [self insertSubview: button aboveSubview: _backgroundView];
    
    BoCPressTabButtonPrivateHandler *handler = [[BoCPressTabButtonPrivateHandler alloc] initWithTab: tab
                                                                                      forTabBarView: self];
    [_handlers addObject: handler];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget: handler
                                                                                 action: @selector(handleTapGesture:)];
    
    [button addGestureRecognizer: recognizer];
    
    [recognizer release];
    
    [handler release];
    
    [_tabs addObject: tab];
    
}

- (id<BoCPressTab>)currentTab
{
    
    if ((_currentTabIndex != NSNotFound) && 
        (_currentTabIndex < [_tabs count]))
    {
        return [_tabs objectAtIndex: _currentTabIndex];
    }
    else
    {
        return nil;
    }
    
}

- (void)wantToSwitchToTab: (id<BoCPressTab>)tab
{
    
    id<BoCPressTab> targetTab =  tab;
    
    if (targetTab)
    {
        ;
    }else
    {
        targetTab = [_tabs objectAtIndex:0];
    }
    
    
    if ([_tabDelegate respondsToSelector: @selector(currentTab:willSwitchToTab:)])
    {
        [_tabDelegate currentTab: [self currentTab] 
                 willSwitchToTab: targetTab];
    }
    
    [self switchToTab: targetTab 
           completion: nil];
    
    
}

- (void)wantToSwitchToTabAtIndex: (NSUInteger)tabIndex
                      completion: ( void(^)(void) )block
{
    if (tabIndex == [_tabs indexOfObject: [self currentTab]])
    {
        return;
    }
    
    id<BoCPressTab> tab = nil;
    
    if (tabIndex < [_tabs count])
    {
        tab = [_tabs objectAtIndex:tabIndex];
    }   
    
    [self switchToTab: tab 
           completion: block];
}

- (void)switchToTab: (id<BoCPressTab>)tab
         completion: ( void(^)(void) )block
{
    
    NSUInteger currentTabIndex = [_tabs indexOfObject: tab];
    
    id<BoCPressTab> currentTab = nil;
    
    if (currentTabIndex != NSNotFound)
    {
        
        
        if (_currentTabIndex < [_tabs count])
        {
            currentTab = [_tabs objectAtIndex: _currentTabIndex];
            
            [[currentTab tabButton] setSelected: NO];
        }
        
        
        [[tab tabButton] setSelected: YES];
        
        _currentTabIndex = currentTabIndex;
        
        [_tabDelegate currentTab: currentTab 
                  didSwitchToTab: tab
                      completion: block];
        
        
    }
    
}

#pragma mark - Subviews layout

- (void)layoutSubviews
{
    
    CGRect bounds = [self bounds];
    
    NSUInteger count = [_tabs count];
    
    CGFloat width = bounds.size.width / count;
    
    NSUInteger looper = 0;
    id<BoCPressTab> tab = nil;
    for (tab in _tabs)
    {
        
        UIButton *button = [tab tabButton];
        
        [button setFrame: CGRectMake(bounds.origin.x + looper * width, 
                                     bounds.origin.y, 
                                     width, 
                                     bounds.size.height)];
        
        ++looper;
    }
    
    CGRect frame = [[_tabs lastObject] frame];
    frame.origin.x += frame.size.width - 22 - 10;
    frame.origin.y += 7;
    frame.size = CGSizeMake(22, 22);
    [_remoteNotificationIndicator setFrame: frame];
}

- (void)enableUserInteraction
{
    [[_tabs objectAtIndex:_currentTabIndex] setEnabled:YES];
}

- (void)setShouldShowRemoteNotificationIndicator:(BOOL)shouldShowRemoteNotificationIndicator
{
    if (_shouldShowRemoteNotificationIndicator != shouldShowRemoteNotificationIndicator)
    {
        _shouldShowRemoteNotificationIndicator = shouldShowRemoteNotificationIndicator;
        if (_shouldShowRemoteNotificationIndicator)
        {
            [_remoteNotificationIndicator setAlpha: 1];
        }else 
        {
            [_remoteNotificationIndicator setAlpha: 0];
        }
    }
}

- (NSInteger)indexOfCurrentTab
{
    return _currentTabIndex;
}
@end
