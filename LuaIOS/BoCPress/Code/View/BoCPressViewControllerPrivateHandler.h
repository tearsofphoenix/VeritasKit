#import <Foundation/Foundation.h>

#import "BoCPressTabDelegate.h"
#import "BoCPressNavigationDelegate.h"

@class BoCPressViewController;
@class BoCPressViewState;

@interface BoCPressViewControllerPrivateHandler: NSObject<BoCPressTabDelegate, BoCPressNavigationDelegate, UIAlertViewDelegate>
{
    BoCPressViewController *_viewController;
    BoCPressViewState *_state;
    
}

#pragma mark - Instance initialization

- (id)initWithState: (BoCPressViewState *)state 
  forViewController: (BoCPressViewController *)viewController;

#pragma mark - State notifications handle

- (void)notificationForDidSwitchToTab: (NSNotification *)notification;



@end
