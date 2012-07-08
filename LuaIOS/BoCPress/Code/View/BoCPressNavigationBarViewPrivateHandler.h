#import <Foundation/Foundation.h>

@class BoCPressNavigationBarView;

@interface BoCPressNavigationBarViewPrivateHandler: NSObject 
{
    BoCPressNavigationBarView *_navigationBarView;
}

#pragma mark - Instance initialization

- (id)initWithNavigationBarView: (BoCPressNavigationBarView *)navigationBarView;

#pragma mark - Tap gestures handle

- (void)handleTapGestureOfBackwardButton: (UIGestureRecognizer *)recognizer;

- (void)handleTapGestureOfNextPageButton: (UIGestureRecognizer *)recognizer;

- (void)handleTapGestureOfPreviousPageButton: (UIGestureRecognizer *)recognizer;

@end
