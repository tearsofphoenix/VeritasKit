#import "BoCPressNewsViewPrivateHandler.h"

#import "BoCPressApplicationDelegate.h"

#import "BoCPressNewsView.h"

#import "BoCPressCallback.h"

#import "BoCPressConstant.h"

@implementation BoCPressNewsViewPrivateHandler

- (id)initWithNewsView: (BoCPressNewsView *)newsView
{
    
    self = [super init];
    if (self) 
    {
        _newsView = newsView;
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(backwardWebview) 
                                                     name:kNetwork_backwardSignleImageView
                                                   object:nil];
    }
    
    return self;
}
- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}
- (void)handleTapGestureOfFeedbackButton: (UIGestureRecognizer *)recognizer
{
    NSLog(@"feedback");
    [_newsView feedBack];
    
}

- (void)handleTapGestureOfForwardButton: (UIGestureRecognizer *)recognizer
{
    [_newsView forwardMail];
}

- (void)handleTapGestureOfEnlargeTextSizeButton: (UIGestureRecognizer *)recognizer
{
    [_newsView enlargeTextSize];
}

- (void)handleTapGestureOfReduceTextSizeButton: (UIGestureRecognizer *)recognizer
{
    [_newsView reduceTextSize];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller  
          didFinishWithResult:(MFMailComposeResult)result 
                        error:(NSError*)error
{
    [[[(BoCPressApplicationDelegate *)[[UIApplication sharedApplication] delegate] window] rootViewController] dismissModalViewControllerAnimated:YES];
}

#pragma mark - callback protocol

- (void)callbackForAction:(id)action withData:(id)data
{
    if ([action isEqual:kBoCPress_View_updateThumbnailImage])
    {
        [_newsView updateWebviewImage:data];
    }
}

- (void)activeAllCallback
{
    ;
}

- (void)cancelAllCallback
{
    ;
}

- (void)backwardWebview
{
    [_newsView backwardWebview];
}
@end
