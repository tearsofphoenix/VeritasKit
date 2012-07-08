#import "BoCPressNavigationBarViewPrivateHandler.h"

#import "BoCPressNavigationBarView.h"
#import "BoCPressNavigationDelegate.h"

#import "BoCPressConstant.h"

#import "BoCPressNotificationDefines.h"

@implementation BoCPressNavigationBarViewPrivateHandler

#pragma mark - Instance initialization

- (id)initWithNavigationBarView: (BoCPressNavigationBarView *)navigationBarView
{
    
    self = [super init];
    if (self)
    {
        _navigationBarView = navigationBarView;
                
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notificationForShowConfigurationView:)
                                                     name:kNavigationBarView_showConfigurationView
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notificationForShowSecurityChooseView:) 
                                                     name:kNavigationBarView_showSecurityChooseView
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(notificationForSetRemoteNotificationButtonHidden:)
                                                     name: kNotification_NavigationBar_setRemoteNotificationButtonHidden
                                                   object: nil];
    }
    
    return self;
    
}
- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}
#pragma mark - Tap gestures handle

- (void)handleTapGestureOfBackwardButton: (UIGestureRecognizer *)recognizer
{
    [[_navigationBarView navigationDelegate] didBrowseBackward];
}


- (void)handleTapGestureOfNextPageButton: (UIGestureRecognizer *)recognizer
{
    [[_navigationBarView navigationDelegate] didReadNextPage];
}

- (void)handleTapGestureOfPreviousPageButton: (UIGestureRecognizer *)recognizer
{
    [[_navigationBarView navigationDelegate] didReadPreviousPage];
}

- (void)handleQuoteContentTitleButtonPressedEvent: (id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kQuoteContentPage_showSecurityChooseView
                                                        object:self 
                                                      userInfo:nil];
    
}
- (void)handleQuoteContentConfigurationButtonPressedEvent: (id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kQuoteContentPage_showConfigurationView
                                                        object:self 
                                                      userInfo:nil];
}

- (void)notificationForShowConfigurationView: (NSNotification *)notification
{
    UIViewController *configurationView = [[notification userInfo] objectForKey:@"contentViewController"];
    [_navigationBarView showConfigurationView:configurationView];
}

- (void)notificationForShowSecurityChooseView: (NSNotification *)notification
{
    UIViewController *configurationView = [[notification userInfo] objectForKey:@"contentViewController"];
    [_navigationBarView showSecurityChooseView:configurationView];
}

- (void)notificationForSetRemoteNotificationButtonHidden: (NSNotification *)notification
{
    [_navigationBarView setRemoteNotificationEditButtonHidden: [notification userInfo]];
}
@end
