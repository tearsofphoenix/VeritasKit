#import <UIKit/UIKit.h>


@protocol BoCPressNews;
@protocol BoCPressNewsViewDelegate;

@class BoCPressNewsViewPrivateHandler;

@interface BoCPressNewsView: UIView<UIWebViewDelegate>
{
    
    id<BoCPressNews> _news;
    
    UIWebView *_contentView;
    
    UIImageView *_barBackgroundView;
    
    UIButton *_feedbackButton;
    UIButton *_forwardButton;
    UIButton *_enlargeTextSizeButton;
    UIButton *_reduceTextSizeButton;
    
    BoCPressNewsViewPrivateHandler *_handler;
    
    id<BoCPressNewsViewDelegate> _newsViewDelegate;
    
    CGFloat _textSize;
    CGFloat _textSizeMultiple;
    
    NSString *_newsContentFormatterString;
    NSString *_newsContent;
            
    NSMutableArray *_urlRequestStack;
    
    NSMutableDictionary *_urlStringDict;
    
}

@property (nonatomic, retain) id<BoCPressNews> news;

@property (nonatomic, retain) id<BoCPressNewsViewDelegate> newsViewDelegate;

@property (nonatomic) BOOL couldFeedBack;

- (void)enlargeTextSize;

- (void)reduceTextSize;

- (void)forwardMail;

- (void)feedBack;

- (void)backwardWebview;

- (void)setCritcPost:(id<BoCPressNews>)news;

- (void)updateWebviewImage: (id)data;

@end
