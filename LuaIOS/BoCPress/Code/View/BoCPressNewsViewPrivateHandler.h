#import <Foundation/Foundation.h>

#import "MessageUI/MessageUI.h"

#import "BoCPressCallback.h"

@class BoCPressNewsView;

@interface BoCPressNewsViewPrivateHandler: NSObject<BoCPressCallback, MFMailComposeViewControllerDelegate>
{
    BoCPressNewsView *_newsView;
}

- (id)initWithNewsView: (BoCPressNewsView *)newsView;

- (void)handleTapGestureOfFeedbackButton: (UIGestureRecognizer *)recognizer;
- (void)handleTapGestureOfForwardButton: (UIGestureRecognizer *)recognizer;
- (void)handleTapGestureOfEnlargeTextSizeButton: (UIGestureRecognizer *)recognizer;
- (void)handleTapGestureOfReduceTextSizeButton: (UIGestureRecognizer *)recognizer;

@end
