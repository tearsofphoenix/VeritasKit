#import "BoCPressNewsView.h"

#import "MessageUI/MFMailComposeViewController.h"

#import "BoCPressNews.h"

#import "UIWebView+RemoveBackgroundShadow.h"

#import "BoCPressNewsViewPrivateHandler.h"

#import "BoCPressNews.h"

#import "BoCPressApplicationDelegate.h"

#import "BoCPressConstant.h"

#import "BoCPressFeedBackView.h"

#import "EGOPhotoViewController.h"

#import "BoCPressSingleImageViewController.h"

#import "UIViewController+PresentModalView.h"

@implementation BoCPressNewsView

@synthesize news = _news;

@synthesize newsViewDelegate = _newsViewDelegate;

@synthesize couldFeedBack = _couldFeedBack;

- (void)setCouldFeedBack:(BOOL)couldFeedBack
{
    if (_couldFeedBack != couldFeedBack)
    {
        _couldFeedBack = couldFeedBack;
        [_feedbackButton setEnabled: _couldFeedBack];
    }
}

- (void)setNews:(id<BoCPressNews>)news
{
    [_news release];    
    _news = [news retain];
    
    if ([news articleContent])
    {
        
        _newsContent = [NSString stringWithFormat:_newsContentFormatterString , [news articleContent]];
    }else
    {
        _newsContent = @"<html><body></body></html>";
    }

    NSURL *newsURL = [NSURL URLWithString: [NSString stringWithFormat: @"http://bocpress.project.eintsoft.com/%@", [news identity]]];
    [_contentView loadHTMLString: _newsContent
                         baseURL: newsURL];
            
    [_urlStringDict setObject: _newsContent
                       forKey: newsURL];    
    
    [_enlargeTextSizeButton setEnabled:YES];
    [_reduceTextSizeButton setEnabled:YES];
    _textSize = kDefaultFontSize;
}

- (void)setCritcPost:(id<BoCPressNews>)news
{
    
    [_news release];    
    _news = [news retain];
    
    if ([news articleContent])
    {
        _newsContentFormatterString = @"<html><meta name=\"viewport\" content=\"width=320, height=460\"/><body><center><span style=\"color:#F80A37;font-size:17px;font-family:Helvetica\">%@</span></center><center><span style=\"font-size:12px;font-family:Helvetica\">%@</span><br/></center>%@</body></html>";
        
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        [formatter setDateFormat: @"发布时间：yyyy-MM-dd HH:mm"];        
        NSString *time = [formatter stringFromDate: [news postTime]];
        
        _newsContent = [NSString stringWithFormat:_newsContentFormatterString , [news name], time, [news articleContent]];
        
    }else
    {
        _newsContent =  @"<html><body></body></html>";
    }

    NSURL *newsURL = [NSURL URLWithString: [NSString stringWithFormat: @"http://bocpress.project.eintsoft.com/%@", [news identity]]];
    [_contentView loadHTMLString: _newsContent
                         baseURL: newsURL];
    
    [_urlStringDict setObject: _newsContent 
                       forKey: newsURL];
    
    [_enlargeTextSizeButton setEnabled:YES];
    [_reduceTextSizeButton setEnabled:YES];
    _textSize = kDefaultFontSize;
}

#pragma mark - init

- (id)init
{
    
    self = [super init];
    if (self)
    {
        
        _handler = [[BoCPressNewsViewPrivateHandler alloc] initWithNewsView: self];
        
        _textSize = kDefaultFontSize;
        
        _contentView = [[UIWebView alloc] init];
        [_contentView removeBackgroundShadow];
        [_contentView setDelegate:self];
        [_contentView setDataDetectorTypes:UIDataDetectorTypeLink];
        
        [self addSubview: _contentView];
        
        _barBackgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressNewsViewToolBarBackground"]];
        [self addSubview: _barBackgroundView];
        
        _feedbackButton = [[UIButton alloc] init];
        [_feedbackButton setImage: [UIImage imageNamed: @"BoCPressNewsViewToolBarFeedbackButton"] 
                         forState: UIControlStateNormal];
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget: _handler 
                                                                                     action: @selector(handleTapGestureOfFeedbackButton:)];
        [_feedbackButton addGestureRecognizer: recognizer];
        [recognizer release];
        
        [self addSubview: _feedbackButton];
        
        _forwardButton = [[UIButton alloc] init];
        [_forwardButton setImage: [UIImage imageNamed: @"BoCPressNewsViewToolBarForwardButton"] 
                        forState: UIControlStateNormal];
        
        recognizer = [[UITapGestureRecognizer alloc] initWithTarget: _handler 
                                                             action: @selector(handleTapGestureOfForwardButton:)];
        [_forwardButton addGestureRecognizer: recognizer];
        [recognizer release];
        
        [self addSubview: _forwardButton];
        
        _enlargeTextSizeButton = [[UIButton alloc] init];
        [_enlargeTextSizeButton setImage: [UIImage imageNamed: @"BoCPressNewsViewToolBarEnlargeTextSizeButton"] 
                                forState: UIControlStateNormal];
        
        recognizer = [[UITapGestureRecognizer alloc] initWithTarget: _handler 
                                                             action: @selector(handleTapGestureOfEnlargeTextSizeButton:)];
        [_enlargeTextSizeButton addGestureRecognizer: recognizer];
        [recognizer release];
        
        [self addSubview: _enlargeTextSizeButton];
        
        _reduceTextSizeButton = [[UIButton alloc] init];
        [_reduceTextSizeButton setImage: [UIImage imageNamed: @"BoCPressNewsViewToolBarReduceTextSizeButton"] 
                               forState: UIControlStateNormal];
        
        recognizer = [[UITapGestureRecognizer alloc] initWithTarget: _handler 
                                                             action: @selector(handleTapGestureOfReduceTextSizeButton:)];
        [_reduceTextSizeButton addGestureRecognizer: recognizer];
        [recognizer release];
        
        [self addSubview: _reduceTextSizeButton];
            
        _urlRequestStack = [[NSMutableArray alloc] init];
        _urlStringDict = [[NSMutableDictionary alloc] init];
        _newsContentFormatterString = @"<html><meta name=\"viewport\" content=\"width=320, height=460\"/><body>%@</body></html>";
        _couldFeedBack = YES;
                        
    }
    
    return self;
    
}

- (void)dealloc
{
    
    [_handler release];
    
    [_contentView release];
    
    [_barBackgroundView release];
    [_feedbackButton release];
    
    [_forwardButton release];
    
    [_enlargeTextSizeButton release];
    
    [_reduceTextSizeButton release];
    
    [_urlRequestStack release];
    [_urlStringDict release];
    
    [_news release];

    [super dealloc];
}

- (void)layoutSubviews
{
    
    CGRect bounds = [self bounds];
    
    [_contentView setFrame: CGRectMake(bounds.origin.x, bounds.origin.y, 
                                       bounds.size.width, bounds.size.height - 44)];
    
    CGFloat toolBarTop = bounds.origin.y + bounds.size.height - 44;
    [_barBackgroundView setFrame: CGRectMake(bounds.origin.x, 
                                             toolBarTop, 
                                             bounds.size.width, 
                                             44)];
    
    [_feedbackButton setFrame: CGRectMake(bounds.origin.x, 
                                          toolBarTop, 88, 44)];
    
    [_forwardButton setFrame: CGRectMake(bounds.origin.x + 88, toolBarTop, 89, 44)];
    
    [_enlargeTextSizeButton setFrame: CGRectMake(bounds.origin.x + 177, toolBarTop, 74, 44)];
    
    [_reduceTextSizeButton setFrame: CGRectMake(bounds.origin.x + 251, toolBarTop, 69, 44)];
    
}

- (void)enlargeTextSize
{
    if (_textSize < kMaxTextFontSize)
    {
        [_reduceTextSizeButton setEnabled:YES];
        _textSize *= kTextFontSizeMultiple;
        
        NSString *script = [NSString stringWithFormat: @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%d%%'", 
                            (NSUInteger)_textSize];
        [_contentView stringByEvaluatingJavaScriptFromString: script];
    }else
    {
        [_enlargeTextSizeButton setEnabled:NO];
    }
}

- (void)reduceTextSize
{
    if (_textSize > kMinTextFontSize)
    {
        [_enlargeTextSizeButton setEnabled:YES];
        _textSize /= kTextFontSizeMultiple;
        
        NSString *script = [NSString stringWithFormat: @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%d%%'", 
                            (NSUInteger)_textSize];
        [_contentView stringByEvaluatingJavaScriptFromString: script];
    }else
    {
        [_reduceTextSizeButton setEnabled:NO];
    }
    
}

- (void)forwardMail
{
    
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = _handler;
    [controller setSubject: [NSString stringWithFormat: @"FW: %@", [_news name]]];
    [controller setMessageBody: _newsContent isHTML: YES]; 
    if (controller)
    {
        [[[(BoCPressApplicationDelegate *)[[UIApplication sharedApplication] delegate] window] rootViewController] presentModalViewController: controller animated: YES];
        [controller release];
    }else
    {
        //the system will prompt
        ;
    }
    
    
}

- (void)feedBack
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kBoCPressNewsPage_wantToShowFeedBackView object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:_news, kBoCPress_Global_NewsType, nil]];
}

- (void)backwardWebview
{
    [_urlRequestStack removeLastObject];
    
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] dismissModalViewControllerAnimated:YES];
    
//    NSURL *lastURL = [[_urlRequestStack lastObject] URL];
//    
//    NSString *lastContent = [_urlStringDict objectForKey:lastURL];
//    
//    [_contentView loadHTMLString: lastContent 
//                         baseURL: lastURL];
    
}
#pragma mark - backward button

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *requestURLString = [[request URL] absoluteString];
    NSLog(@"current is:%@", requestURLString);

    
    if (navigationType == UIWebViewNavigationTypeLinkClicked )
    {
        if ([requestURLString hasSuffix: @".png"]
            ||[requestURLString hasSuffix: @".jpg"]
            || [requestURLString hasSuffix: @".jpeg"]
            || [requestURLString hasSuffix: @".gif"])
        {
            
            if (![request isEqual:[_urlRequestStack lastObject]])
            {
                [_urlRequestStack addObject:request];
            }


            NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                      [request URL], kBoCPress_Global_NSURLObject, 
                                      kBoCPress_View_updateThumbnailImage, kNetwork_CallbackAction,
                                      _handler, kNetwork_CallbackObject,
                                      nil];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:kSoapDataSource_notificationForGetImage 
                                                                object:self
                                                              userInfo:userInfo];
            
            [userInfo release];
            return NO;
        }else 
        {
            [[UIApplication sharedApplication] openURL: [request URL]];
            return NO;
        }
    }else
    {
        return YES;
    }
}

- (void)updateWebviewImage:(id)data
{
    if (data)
    {
        UIImage *image = [UIImage imageWithData: [data objectForKey: @"data"]];
        
        UIViewController *rootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
                    
        EGOPhotoViewController *_zoomableViewController = [[EGOPhotoViewController alloc] initWithImage: image];
//        BoCPressSingleImageViewController *_zoomableViewController = [[BoCPressSingleImageViewController alloc] initWithImage: image];
        
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:_zoomableViewController];
		[navController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];        
		[navController setModalPresentationStyle: UIModalPresentationFullScreen];
        
        [rootViewController presentModalViewController:navController animated:YES];
        
        [navController release];
        
        [_zoomableViewController release];                
    }
}

@end
