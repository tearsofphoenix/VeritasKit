#import "BoCPressNavigationBarView.h"

#import "BoCPressNavigationBarViewPrivateHandler.h"

#import "BoCPressNavigationDelegate.h"

#import "BoCPressConstant.h"

#import "BoCPressSecurity.h"

#import "BoCPressQuoteContentPageConfigurationViewController.h"

#import "BoCPressQuoteContentDatasource.h"

#import "BoCPressSecurity.h"

#import "BoCPressNotificationDefines.h"

@implementation BoCPressNavigationBarView

@synthesize couldBackward = _couldBackward;
@synthesize couldNavigate = _couldNavigate;
@synthesize couldReadNextPage = _couldReadNextPage;
@synthesize couldReadPreviousPage = _couldReadPreviousPage;


- (WEPopoverContainerViewProperties *)improvedContainerViewProperties 
{
	
	WEPopoverContainerViewProperties *props = [[WEPopoverContainerViewProperties alloc] autorelease];
	NSString *bgImageName = nil;
	CGFloat bgMargin = 0.0;
	CGFloat bgCapSize = 0.0;
	CGFloat contentMargin = 4.0;
	
	bgImageName = @"popoverBg.png";
	
	// These constants are determined by the popoverBg.png image file and are image dependent
	bgMargin = 13; // margin width of 13 pixels on all sides popoverBg.png (62 pixels wide - 36 pixel background) / 2 == 26 / 2 == 13 
	bgCapSize = 31; // ImageSize/2  == 62 / 2 == 31 pixels
	
	props.leftBgMargin = bgMargin;
	props.rightBgMargin = bgMargin;
	props.topBgMargin = bgMargin;
	props.bottomBgMargin = bgMargin;
	props.leftBgCapSize = bgCapSize;
	props.topBgCapSize = bgCapSize;
	props.bgImageName = bgImageName;
	props.leftContentMargin = contentMargin;
	props.rightContentMargin = contentMargin - 1; // Need to shift one pixel for border to look correct
	props.topContentMargin = contentMargin; 
	props.bottomContentMargin = contentMargin;
	
	props.arrowMargin = 4.0;
	
	props.upArrowImageName = @"popoverArrowUp.png";
	props.downArrowImageName = @"popoverArrowDown.png";
	props.leftArrowImageName = @"popoverArrowLeft.png";
	props.rightArrowImageName = @"popoverArrowRight.png";
	return props;	
}


- (void)setCouldBackward: (BOOL)couldBackward
{
    
    if (couldBackward != _couldBackward)
    {
            
        if (couldBackward)
        {
            [_backwardButton setAlpha: 1.0];
        }
        else
        {
            [_backwardButton setAlpha: 0.0];
        }
        
    }
    
    _couldBackward = couldBackward;
    
}

- (void)setCouldNavigate: (BOOL)couldNavigate
{
    
    if (couldNavigate != _couldNavigate)
    {
        if (couldNavigate)
        {
            
            [_previousPageButton setAlpha: 1.0];
            [_previousPageButton setEnabled: _couldReadPreviousPage];
            [_nextPageButton setAlpha: 1.0];
            [_nextPageButton setEnabled: _couldReadNextPage];
            
        }
        else
        {
            [_previousPageButton setAlpha: 0.0];
            [_nextPageButton setAlpha: 0.0];
        }
        
    }
    
    _couldNavigate = couldNavigate;
    
}

- (void)setCouldReadNextPage:(BOOL)couldReadNextPage
{
    
    if (_couldNavigate && (couldReadNextPage != _couldReadNextPage))
    {
        [_nextPageButton setAlpha: 1.0];
        [_nextPageButton setEnabled: couldReadNextPage];
    }
    
    _couldReadNextPage = couldReadNextPage;
    
}

- (void)setCouldReadPreviousPage:(BOOL)couldReadPreviousPage
{
    
    
    if (_couldNavigate && (couldReadPreviousPage != _couldReadPreviousPage))
    {        
        [_previousPageButton setAlpha: 1.0];
        [_previousPageButton setEnabled: couldReadPreviousPage];
        
    }
    
    _couldReadPreviousPage = couldReadPreviousPage;
    
}

@synthesize navigationDelegate = _navigationDelegate;

- (NSString *)pageTitle
{
    return [_pageTitleLabel text];
}

- (void)setPageTitle:(NSString *)pageTitle
{
    CGSize titleSize = [pageTitle sizeWithFont:[UIFont boldSystemFontOfSize:kBoCPress_NavigationBarView_FontSize]];
    
    //    NSLog(@"page_title_width is:%f", titleSize.width);
    CGFloat realFontSize = kBoCPress_NavigationBarView_FontSize;
    
    CGFloat titleLabelWidth = [_pageTitleLabel frame].size.width;
    
    while (titleSize.width > titleLabelWidth) 
    {
        realFontSize -= 0.5;
        
        titleSize = [pageTitle sizeWithFont:[UIFont boldSystemFontOfSize:realFontSize]];
        
    }
    
    [_pageTitleLabel setFont:[UIFont boldSystemFontOfSize:realFontSize]];
    
    [_pageTitleLabel setText: pageTitle];
}

// TODO: Update the font settings for page title.
//
- (id)init
{
    
    self = [super init];
    if (self)
    {
        
        _handler = [[BoCPressNavigationBarViewPrivateHandler alloc] initWithNavigationBarView: self];
        
        _backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressNavigationBarBackground"]];
        [_backgroundView setFrame:CGRectMake(0, 0, 320, 45)];
        [self addSubview: _backgroundView];
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget: _handler
                                                                                     action: @selector(handleTapGestureOfBackwardButton:)];
        
        _backwardButton = [[UIButton alloc] init];
        [_backwardButton setImage: [UIImage imageNamed:@"BoCPressNavigationBarBackwardButton"] 
                         forState: UIControlStateNormal];
        [_backwardButton setFrame: CGRectMake(6, 8, 52, 28)];
        [_backwardButton setAlpha: 0.0];
        [_backwardButton addGestureRecognizer: recognizer];
        [self insertSubview: _backwardButton aboveSubview: _backgroundView];
        
        [recognizer release];
        
        recognizer = [[UITapGestureRecognizer alloc] initWithTarget: _handler action: @selector(handleTapGestureOfPreviousPageButton:)];
        
        _previousPageButton = [[UIButton alloc] init];
        [_previousPageButton setImage: [UIImage imageNamed: @"BoCPressNavigationBarPreviousButton"] 
                             forState: UIControlStateNormal];
        [_previousPageButton setFrame: CGRectMake(260, 9.5, 26, 25)];
        [_previousPageButton addGestureRecognizer: recognizer];
        [self insertSubview: _previousPageButton aboveSubview: _backgroundView];
        [_previousPageButton setAlpha: 0.0];
        
        [recognizer release];
        
        recognizer = [[UITapGestureRecognizer alloc] initWithTarget: _handler action: @selector(handleTapGestureOfNextPageButton:)];
        
        _nextPageButton = [[UIButton alloc] init];
        [_nextPageButton setImage: [UIImage imageNamed: @"BoCPressNavigationBarNextButton"] 
                         forState: UIControlStateNormal];
        [_nextPageButton setFrame: CGRectMake(286, 9.5, 25, 25)];
        [_nextPageButton addGestureRecognizer: recognizer];
        [_nextPageButton setAlpha: 0.0];
        [self insertSubview: _nextPageButton aboveSubview: _backgroundView];
        
        [recognizer release];
        
        _pageTitleLabel = [[UILabel alloc] init];
        
        
        [_pageTitleLabel setFont:[UIFont boldSystemFontOfSize:kBoCPress_NavigationBarView_FontSize]];
        [_pageTitleLabel setTextColor: [UIColor whiteColor]];
        [_pageTitleLabel setBackgroundColor: [UIColor clearColor]];
        [_pageTitleLabel setFrame: CGRectMake(69, 0, 180, 44)];
        [_pageTitleLabel setTextAlignment: UITextAlignmentCenter];
        [self insertSubview: _pageTitleLabel aboveSubview: _backgroundView];
        
        [self setCouldBackward: NO];
        [self setCouldReadNextPage: NO];
        [self setCouldReadPreviousPage: NO];
        [self setCouldNavigate: NO];
        
        
        
        _quoteContentTitleButton = [[UIButton alloc] init];
        [_quoteContentTitleButton setFrame:CGRectMake(75, 8, 105, 27)];
        [_quoteContentTitleButton setBackgroundImage:[UIImage imageNamed:@"BoCPressViewControllerQuoteTitleBackgound"] forState:UIControlStateNormal];
        [[_quoteContentTitleButton titleLabel] setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [_quoteContentTitleButton addTarget:_handler 
                                     action:@selector(handleQuoteContentTitleButtonPressedEvent:) 
                           forControlEvents:UIControlEventTouchDown];
        
        CGRect frame = [_quoteContentTitleButton frame];
        
        _quoteBuyBackgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressViewControllerQuoteBuyLabel"]];
        [_quoteBuyBackgroundView setFrame:CGRectMake(frame.origin.x + frame.size.width + 8, frame.origin.y, 122, 28)];
        
        _quoteContentBuyLabel = [[UILabel alloc] init];
        [_quoteContentBuyLabel setBackgroundColor:[UIColor clearColor]];
        [_quoteContentBuyLabel setFrame: [_quoteBuyBackgroundView bounds]];
        [_quoteContentBuyLabel setTextColor:[UIColor whiteColor]];
        [_quoteContentBuyLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];        
        
        _bidPriceIndicator = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressQuoteContentPageBuyArrow"]];
        [_bidPriceIndicator setFrame: CGRectMake(33, 5, 20, 15)];
        [_quoteContentBuyLabel addSubview: _bidPriceIndicator];
        
        [_quoteBuyBackgroundView addSubview: _quoteContentBuyLabel];
        
        frame = [_quoteBuyBackgroundView frame];
        
        _quoteSellBackgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"BoCPressViewControllerQuoteSellLabel"]];
        [_quoteSellBackgroundView setFrame: CGRectMake(frame.origin.x + frame.size.width + 8, frame.origin.y, frame.size.width, frame.size.height)];
        
        _quoteContentSellLabel = [[UILabel alloc] init];
        [_quoteContentSellLabel setBackgroundColor:[UIColor clearColor]];
        [_quoteContentSellLabel setFrame: [_quoteSellBackgroundView bounds]];
        [_quoteContentSellLabel setTextColor:[UIColor whiteColor]];
        [_quoteContentSellLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        
        _sellPriceIndicator = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressQuoteContentPageSellArrow"]];
        [_sellPriceIndicator setFrame: [_bidPriceIndicator frame]];
        [_quoteContentSellLabel addSubview: _sellPriceIndicator];
        
        [_quoteSellBackgroundView addSubview: _quoteContentSellLabel];
        
        frame = [_quoteSellBackgroundView frame];
        
        _quoteContentConfigurationButton = [[UIButton alloc] init];
        [_quoteContentConfigurationButton setBackgroundImage:[UIImage imageNamed:@"BoCPressViewControllerQuoteContentPageCongfigurationButton"] forState:UIControlStateNormal];
        [_quoteContentConfigurationButton setFrame:CGRectMake(frame.origin.x + frame.size.width + 5, frame.origin.y, 31, 28)];
        [_quoteContentConfigurationButton addTarget:_handler 
                                             action:@selector(handleQuoteContentConfigurationButtonPressedEvent:) 
                                   forControlEvents:UIControlEventTouchDown];
        
        _quoteContentLatestLabel = [[UILabel alloc] init];
        [_quoteContentLatestLabel setFrame: [_quoteContentBuyLabel frame]];
        [_quoteContentLatestLabel setBackgroundColor: [UIColor clearColor]];
        [_quoteContentLatestLabel setTextColor: [UIColor whiteColor]];
        [_quoteContentLatestLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];        
        
        _singleCurrencyIndicator = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressQuoteContentPageBuyArrow"]];
        [_singleCurrencyIndicator setFrame: CGRectMake(33, 5, 20, 15)];
        [_quoteContentLatestLabel addSubview: _singleCurrencyIndicator];
        
        [_quoteBuyBackgroundView addSubview: _quoteContentLatestLabel];
        
        [_quoteContentTitleButton setAlpha:0];
        [_quoteBuyBackgroundView setAlpha:0];
        [_quoteSellBackgroundView setAlpha:0];
        [_quoteContentConfigurationButton setAlpha:0];
        
        [self addSubview:_quoteContentTitleButton];
        [self addSubview: _quoteBuyBackgroundView];
        [self addSubview: _quoteSellBackgroundView];
        
        [self addSubview:_quoteContentConfigurationButton];
        
        Class glassButton = NSClassFromString(@"UIButton");
        _editNotificationButton = [[glassButton alloc] init];
        [_editNotificationButton setTintColor: [UIColor colorWithRed: 71 / 255.0
                                                               green: 136 / 255.0
                                                                blue: 239 / 255.0
                                                               alpha: 1.0]];
        
        [_editNotificationButton setFrame: CGRectMake(250, 8, 52, 28)];
        [_editNotificationButton setBackgroundImage: [UIImage imageNamed: @"BoCPressRemoteNotificationContentEditButton"]
                                           forState: UIControlStateNormal];

        
        [_editNotificationButton addTarget: self
                                    action: @selector(handleEditRemoteNotificationButtonTapedEvent:)
                          forControlEvents: UIControlEventTouchDown];
        [self addSubview: _editNotificationButton];
        [_editNotificationButton setHidden: YES];
    }
    
    return self;
    
}

- (void)dealloc
{
    
    
    [_handler release];
    
    [_nextPageButton release];
    [_previousPageButton release];
    [_pageTitleLabel release];
    [_backwardButton release];
    [_backgroundView release];
    
    [_quoteContentTitleButton release];
    [_quoteContentBuyLabel release];
    [_quoteContentSellLabel release];
    [_quoteContentConfigurationButton release];
    
    [_quoteContentBuyLabel release];
    [_quoteContentSellLabel release];
    [_cachedSecurity release];
    [_quoteBuyBackgroundView release];
    [_quoteSellBackgroundView release];
    [_quoteContentLatestLabel release];
    [_bidPriceIndicator release];
    [_sellPriceIndicator release];
    [_singleCurrencyIndicator release];
    [_userInfo release];
    [_editNotificationButton release];
    
    [super dealloc];
    
}

- (void)autoFitForPageSupportedInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft
        || interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        [_backgroundView setFrame:CGRectMake(0, 0, 480, 45)];
        [self setFrame:CGRectMake(0, 0, 480, 44)];
        [_quoteContentTitleButton setAlpha:1];
        
        id<BoCPressSecurity> security = [[_userInfo objectForKey: kBoCPress_Data_Datasource] security];
        if ([[security isTradebleFlag] isEqualToString: kQuoteListPage_IsTradableString]) 
        {
            [_quoteBuyBackgroundView setAlpha:1];
            [_quoteSellBackgroundView setAlpha:1];
            [_quoteContentLatestLabel setAlpha: 0];
            [_quoteContentBuyLabel setAlpha: 1];
        }else
        {
            [_quoteBuyBackgroundView setAlpha:1];
            [_quoteSellBackgroundView setAlpha:0];
            [_quoteContentLatestLabel setAlpha: 1];
            [_quoteContentBuyLabel setAlpha: 0];
        }
        [_quoteContentConfigurationButton setAlpha:1];
        [_pageTitleLabel setAlpha:0];
        
    }else if(interfaceOrientation == UIInterfaceOrientationPortrait
             ||interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        [_popoverControllerForConfiguration dismissPopoverAnimated:NO];
        [_popoverControllerForTitle dismissPopoverAnimated:NO];
        [_quoteContentTitleButton setAlpha:0];
        [_quoteBuyBackgroundView setAlpha:0];
        [_quoteSellBackgroundView setAlpha:0];
        [_quoteContentLatestLabel setAlpha: 0];
        [_quoteContentConfigurationButton setAlpha:0];
        [_pageTitleLabel setAlpha:1];
        
        [_backgroundView setFrame:CGRectMake(0, 0, 320, 45)];
        [self setFrame:CGRectMake(0, 0, 320, 44)];
    }
}
- (void)recoveryForQuoteContentPage
{
    [_quoteContentTitleButton setAlpha:0];
    [_quoteBuyBackgroundView setAlpha:0];
    [_quoteSellBackgroundView setAlpha:0];
    
    [_quoteContentConfigurationButton setAlpha:0];
    [_pageTitleLabel setAlpha:1];
    [_popoverControllerForConfiguration dismissPopoverAnimated:NO];
    [_popoverControllerForTitle dismissPopoverAnimated:NO];
    [_backgroundView setFrame:CGRectMake(0, 0, 320, 45)];
    [self setFrame:CGRectMake(0, 0, 320, 44)];
}

- (void)updateWithQuoteData: (id)userInfo
{
    BoCPressSecurity* security = [userInfo objectForKey: kType_GLobal_SecurityObject];
    
    NSString *currency = [security currentPrice];
    
    [_quoteContentLatestLabel setText: [NSString stringWithFormat: @" 最新     %@", currency]];
    
    CGFloat lastCurrency = [[_cachedSecurity currentPrice] floatValue];
    if (![currency isEqualToString: [_cachedSecurity currentPrice]])
    {
        
        if([currency floatValue] > lastCurrency)
        {
            [_singleCurrencyIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageBuyArrow"]];
        }else
        {
            [_singleCurrencyIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageSellArrow"]];
        }
        
    }
    
    NSString *buyPrice = [security bidPrice];
    [_quoteContentBuyLabel setText:[NSString stringWithFormat:@" 买入     %@", buyPrice]];
    
    CGFloat lastBuyPrice = [[_cachedSecurity bidPrice] floatValue];
    
    if (![[_cachedSecurity bidPrice] isEqualToString: buyPrice]) 
    {
        
        if ([buyPrice floatValue] > lastBuyPrice) 
        {
            [_bidPriceIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageBuyArrow"]];
        }else
        {
            [_bidPriceIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageSellArrow"]];
        }
    }
    
    NSString *sellPrice = [security askPrice];
    [_quoteContentSellLabel setText:[NSString stringWithFormat:@" 卖出     %@", sellPrice]];
    
    CGFloat lastSellPrice = [[_cachedSecurity askPrice] floatValue];
    
    if (![[_cachedSecurity askPrice] isEqualToString: sellPrice]) 
    {
        
        if ([sellPrice floatValue] > lastSellPrice) 
        {
            [_sellPriceIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageBuyArrow"]];
        }else
        {
            [_sellPriceIndicator setImage: [UIImage imageNamed: @"BoCPressQuoteContentPageSellArrow"]];
        }
    }
    
    NSString *securityName = [security name];
    
    [_quoteContentTitleButton setTitle:securityName forState:UIControlStateNormal];
    
    [_cachedSecurity release];
    _cachedSecurity = [security retain];
}
- (void)showSecurityChooseView: (UIViewController *)securityChooseViewController
{
    
    
    CGRect frame = [_quoteContentTitleButton frame];
    CGRect rect = frame;
    
    
    [_popoverControllerForTitle release];
    
    _popoverControllerForTitle = [[WEPopoverController alloc] initWithContentViewController:securityChooseViewController];
    if ([_popoverControllerForTitle respondsToSelector:@selector(setContainerViewProperties:)])
    {
        [_popoverControllerForTitle setContainerViewProperties:[self improvedContainerViewProperties]];
    }
    
    [_popoverControllerForTitle setDelegate: self];
    
    //Uncomment the line below to allow the table view to handle events while the popover is displayed.
    //Otherwise the popover is dismissed automatically if a user touches anywhere outside of its view.
    
    [_popoverControllerForTitle setPassthroughViews:[NSArray arrayWithObject:self]];
    
    [_popoverControllerForTitle presentPopoverFromRect:rect  
                                                inView:self
                              permittedArrowDirections:(UIPopoverArrowDirectionUp|UIPopoverArrowDirectionDown|
                                                        UIPopoverArrowDirectionLeft|UIPopoverArrowDirectionRight)
                                              animated:YES];
    
}

- (void)showConfigurationView:(UIViewController *)configurationViewController
{
    [_popoverControllerForConfiguration release];
    
    CGRect frame = [_quoteContentConfigurationButton frame];
    CGRect rect = frame;
    
    
    [_popoverControllerForTitle release];
    
    _popoverControllerForTitle = [[WEPopoverController alloc] initWithContentViewController:configurationViewController];
    
    if ([_popoverControllerForTitle respondsToSelector:@selector(setContainerViewProperties:)])
    {
        [_popoverControllerForTitle setContainerViewProperties:[self improvedContainerViewProperties]];
    }
    
    [_popoverControllerForTitle setDelegate: self];
    
    //Uncomment the line below to allow the table view to handle events while the popover is displayed.
    //Otherwise the popover is dismissed automatically if a user touches anywhere outside of its view.
    
    [_popoverControllerForTitle setPassthroughViews:[NSArray arrayWithObject:self]];
    
    [_popoverControllerForTitle presentPopoverFromRect:rect  
                                                inView:self
                              permittedArrowDirections:(UIPopoverArrowDirectionUp|UIPopoverArrowDirectionDown|
                                                        UIPopoverArrowDirectionLeft|UIPopoverArrowDirectionRight)
                                              animated:YES];
    
}


- (void)popoverControllerDidDismissPopover:(WEPopoverController *)thePopoverController 
{
	//Safe to release the popover here
    //	self.popoverController = nil;
}

- (BOOL)popoverControllerShouldDismissPopover:(WEPopoverController *)thePopoverController 
{
	//The popover is automatically dismissed if you click outside it, unless you return NO here
    
    if (thePopoverController == _popoverControllerForConfiguration) 
    {        
        [[NSNotificationCenter defaultCenter] postNotificationName:kQuoteContentPage_didFinishedConfiguration
                                                            object:self 
                                                          userInfo:nil];
    }else if(thePopoverController == _popoverControllerForTitle)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kQuoteContentPage_didFinishedConfiguration
                                                            object:self 
                                                          userInfo:nil];
    }
	return YES;
}

- (void)storeUseInfoForQuoteContentPage:(id)userInfo
{
    if (_userInfo != userInfo) 
    {
        [_userInfo release];
        _userInfo = [userInfo retain];
    }
}

- (void)setRemoteNotificationEditButtonHidden: (NSDictionary *)userInfo
{    
    BOOL isHidden = [[userInfo objectForKey: @"hide"] boolValue];

    [_editNotificationButton setHidden: isHidden];
}

- (void)handleEditRemoteNotificationButtonTapedEvent: (id)sender
{
    NSInteger tag = [_editNotificationButton tag];
    if (tag == 0)
    {
        [_editNotificationButton setTag: 1];
        [_editNotificationButton setBackgroundImage: [UIImage imageNamed: @"BoCPressRemoteNotificationContentDoneButton"]
                                           forState: UIControlStateNormal];
    }else 
    {
        [_editNotificationButton setTag: 0];
        [_editNotificationButton setBackgroundImage: [UIImage imageNamed: @"BoCPressRemoteNotificationContentEditButton"]
                                           forState: UIControlStateNormal];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_ViewController_didRemoteNotificationButtonTaped
                                                        object: self
                                                      userInfo: nil];
}
@end
