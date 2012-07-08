#import "BoCPressViewController.h"

#import "BoCPressViewControllerPrivateHandler.h"

#import "BoCPressTabBarView.h"

#import "BoCPressTab.h"

#import "BoCPressViewState.h"

#import "BoCPressPage.h"

#import "BoCPressNavigationBarView.h"

#import "BoCPressAuthor.h"

#import "BoCPressFeedBackView.h"

#import "BoCPressConstant.h"

#import "BoCPressColumn.h"

#import "BoCPressProtocolView.h"

#import "BoCPressVIPAuthorizeSuccessView.h"

#import "BoCPressMediaPlayerViewController.h"

#import "BoCPressAdvertisementView.h"

#import "BoCPressSplashAdvertisementView.h"

#import "BoCPressNotificationDefines.h"

#import "BoCPressViewConstants.h"

#import "BoCPressAlertView.h"

#import <QuartzCore/QuartzCore.h>

#import <AVFoundation/AVFoundation.h>

#import <objc/message.h>

@implementation BoCPressViewController

static void BoCPressViewController_UpdateFrameworkViewForPage(BoCPressViewController *self, 
                                                                BoCPressNavigationBarView *_navigationBarView,
                                                                BoCPressTabBarView *_tabBarView,
                                                                id<BoCPressPage> page,
                                                                void (^beginBlock)(CGRect rest),
                                                                void (^animationBlock)(CGRect rest),
                                                                void (^completionBlock)(void)
                                                                )
{
    
    CGRect bounds = [[self view] bounds];
    
    CGRect rest = bounds;
    CGRect frameOfNavigationBar = rest;
    frameOfNavigationBar.size.height = 44;

    if ([page needNavigationBar])
    {
        rest.origin.y += 44;
        rest.size.height -= 44;
    }else
    {
        frameOfNavigationBar.origin.y -= 44;
    }
    
    CGRect frameOfTabBarView = rest;
    frameOfTabBarView.origin.y += frameOfTabBarView.size.height;
    frameOfTabBarView.size.height = 51.5;
    if ([page needTabBar]) 
    {
        rest.size.height -= frameOfTabBarView.size.height;
        frameOfTabBarView.origin.y -= frameOfTabBarView.size.height;
    }
    if (beginBlock)
    {
        beginBlock(rest);
    }
    [_tabBarView setUserInteractionEnabled: NO];
    [_navigationBarView setUserInteractionEnabled: NO];
    [(UIView*)page setUserInteractionEnabled: NO];
    
    [UIView animateWithDuration: 0.5
                     animations: (^{
                                    [_tabBarView setFrame: frameOfTabBarView];
                                    [_navigationBarView setFrame: frameOfNavigationBar];

                                    [_navigationBarView setCouldBackward: ([page lastPage] != nil)];
                                    
                                    BOOL couldNavigate = [page couldNavigate];
                                    if (couldNavigate)
                                    {
                                        [_navigationBarView setCouldReadNextPage: [page couldReadNextPage]];
                                        [_navigationBarView setCouldReadPreviousPage: [page couldReadPreviousPage]];
                                    }
                                    [_navigationBarView setCouldNavigate: couldNavigate];
                                    [_navigationBarView setPageTitle: [page pageTitle]];
                                
                                    if (animationBlock)
                                    {
                                        animationBlock(rest);
                                    }

                             })
                     completion: (^(BOOL finished) {
                                    [_tabBarView setUserInteractionEnabled: YES];
                                    [_navigationBarView setUserInteractionEnabled: YES];
                                    [(UIView*)page setUserInteractionEnabled: YES];

                                    if (completionBlock)
                                    {
                                        completionBlock();
                                    }
                                 })
     ];

}

static void BoCPressViewController_navigateToRemoteNotificationPage(BoCPressViewController * self)
{

    [self wantToSwitchToTabAtIndex: 4 
                        completion: (^{
                                        NSLog(@"in func:%s, line:%d", __func__, __LINE__);
                                        [self wantToShowRemoteNotificationContentPage: nil];
                                    })
     ];
}

typedef void (* BoCPressViewControllerLaunchCallback)(BoCPressViewController *self);

- (void)updateNavigationBar
{
    
    [_navigationBarView setCouldBackward: ([[_state currentPage] lastPage] != nil)];
    
    BOOL couldNavigate = [[_state currentPage] couldNavigate];
    if (couldNavigate)
    {
        [_navigationBarView setCouldReadNextPage: [[_state currentPage] couldReadNextPage]];
        [_navigationBarView setCouldReadPreviousPage: [[_state currentPage] couldReadPreviousPage]];
    }
    [_navigationBarView setCouldNavigate: couldNavigate];
    [_navigationBarView setPageTitle: [[_state currentPage] pageTitle]];
    
}

#pragma mark - View state

- (void)setViewState: (BoCPressViewState *)state
{
    if (_state != state)
    {
        [_state release];
        _state = [state retain];
        [_tabBarView setShouldShowRemoteNotificationIndicator: [_state numberOfNewRemoteNotification]];
    }
}

#pragma mark - Memory management

- (void)dealloc
{
    [_backgroundView release];
    [_viewToDisableUserInteraction release];
    [_handler release];

    [_pageInfo release];
    
    [_onlyAlertViewInApplication release];
    
    [_messageInfo release];
    [_callbackQueueOfLaunch release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"didReceiveMemoryWarning");
    _hasReceivedMemoryWarning = YES;
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    if (_hasReceivedMemoryWarning)
    {   
        _hasReceivedMemoryWarning = NO;
    }
    
    _handler = [[BoCPressViewControllerPrivateHandler alloc] initWithState: _state 
                                                         forViewController: self];
    [[self view] setBackgroundColor: [UIColor clearColor]];
    CGRect frame = [[self view] bounds];
    
    //background view init
    //
    _backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressBackground"]];
    [[self view] addSubview: _backgroundView];
    [[self view] sendSubviewToBack: _backgroundView];
    [_backgroundView setFrame: frame];
    
    //interface view init
    //
    _interfaceView = [[UIView alloc] init];
    [_interfaceView setFrame: frame];
    [_interfaceView setBackgroundColor: [UIColor clearColor]];

    _pageView = [[UIView alloc] init];
    [_pageView setFrame: CGRectMake(0, 44, 320, 349)];
    [_pageView setBackgroundColor: [UIColor clearColor]];
    [_interfaceView addSubview: _pageView];

    _navigationBarView = [[BoCPressNavigationBarView alloc] init];
    [_navigationBarView setFrame: CGRectMake(0, 0, 320, 44)];
    [_navigationBarView setNavigationDelegate: _handler];
    [_interfaceView addSubview: _navigationBarView];

    // Initialize tab bar view
    //
    _tabBarView = [[BoCPressTabBarView alloc] init];
    [_tabBarView setFrame: CGRectMake(0, 409, 320, 52)];
    [_tabBarView setTabDelegate: _handler];
    
    id<BoCPressTab> homeTab = [[[BoCPressTab alloc] initWithImage: [UIImage imageNamed: @"BoCPressQuoteTabButton"] 
                                                 andSelectedImage: [UIImage imageNamed: @"BoCPressQuoteTabButtonSelected"]
                                                   forTabIdentity: @"quote"] autorelease];
    [homeTab setIdentity:@"30"];
    [_tabBarView addTab: homeTab];
    
    id<BoCPressTab> tabLooper = [[BoCPressTab alloc] initWithImage: [UIImage imageNamed: @"BoCPressNewsTabButton"] 
                                                  andSelectedImage: [UIImage imageNamed: @"BoCPressNewsTabButtonSelected"]
                                                    forTabIdentity: kBoCPress_Global_NewsType];
    [tabLooper setIdentity:@"20"];
    [_tabBarView addTab: tabLooper];
    [tabLooper release];
    
    tabLooper = [[BoCPressTab alloc] initWithImage: [UIImage imageNamed: @"BoCPressMediaTabButton"] 
                                  andSelectedImage: [UIImage imageNamed: @"BoCPressMediaTabButtonSelected"]
                                    forTabIdentity: kType_Global_MediaObject];
    [tabLooper setIdentity:@"10"];
    [_tabBarView addTab:  tabLooper];
    [tabLooper release];
    
    tabLooper = [[BoCPressTab alloc] initWithImage: [UIImage imageNamed: @"BoCPressCriticTabButton"] 
                                  andSelectedImage: [UIImage imageNamed: @"BoCPressCriticTabButtonSelected"]
                                    forTabIdentity: @"critic"];
    [tabLooper setIdentity:@"40"];
    [_tabBarView addTab: tabLooper];
    [tabLooper release];
    
    tabLooper = [[BoCPressTab alloc] initWithImage: [UIImage imageNamed: @"BoCPressMoreTabButton"] 
                                  andSelectedImage: [UIImage imageNamed: @"BoCPressMoreTabButtonSelected"]
                                    forTabIdentity: @"more"];
    [tabLooper setIdentity:@"90"];
    [_tabBarView addTab: tabLooper];
    [tabLooper release];

    [_interfaceView addSubview: _tabBarView];
    
    [[self view] addSubview: _interfaceView];
    
    _couldFinishSplash = YES;
    _splashView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"BoCPressSplashImage"]];
    [_splashView setUserInteractionEnabled: YES];
    [_splashView setFrame: frame];
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhite];
    [activityIndicatorView setFrame: CGRectMake(150, 290, 20, 20)];
    [activityIndicatorView startAnimating];
    [_splashView addSubview: activityIndicatorView];
    [activityIndicatorView release];
    
    [[self view] addSubview: _splashView];
    
    _viewToDisableUserInteraction = [[UIView alloc] init];
    
    
    _notificationView = [[UIView alloc] init];
    [_notificationView setFrame: frame];
    [[self view] addSubview: _notificationView];
    
    [_notificationView setBackgroundColor: [UIColor clearColor]];

    UITapGestureRecognizer *tapGestureRecognizerForCancelFeedBack = [[UITapGestureRecognizer alloc] initWithTarget:self 
                                                                                                             action:@selector(notificationForWantToCancelFeedBackView:)] ;
    [_notificationView addGestureRecognizer:tapGestureRecognizerForCancelFeedBack];
    
    [tapGestureRecognizerForCancelFeedBack release];
    
    // Hide notification view
    //
    [self notificationsFinished];
    
    _hasReceivedMemoryWarning = NO;
    
    [super viewDidLoad];
        
}
- (void)viewDidUnload
{
    [_pageInfo release];
    
    AudioServicesDisposeSystemSoundID(_audioEffect);

    [super viewDidUnload];
}

#pragma mark - View autorotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return [_state shouldAutorotateToInterfaceOrientation: interfaceOrientation];
}

#pragma mark - Splash play

- (void)recordReadMessageInfo
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kBoCPressHasReadMessage 
                                                        object: self 
                                                      userInfo: _messageInfo];    
}


- (void)splashFinished
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [UIView animateWithDuration: 0.5
                     animations: (^{        
                                     [_splashView setAlpha: 0.0];
                                 })
     ];
    
    NSString *messageTitle = [_messageInfo objectForKey:@"messageTitle"];
    NSString *messageContent = [_messageInfo objectForKey:@"messageContent"];
    NSString *messageFlag = [_messageInfo objectForKey:@"messageFlag"];
    
    //IGNORE: 直接忽略，不做任何处理。
    //    空(<flag></flag>)：普通消息框，显示并记录该消息ID。
    //    ALWAYS_SHOW：普通消息框，显示并记录该消息ID。
    //REDIRECT: 普通重定向消息框，显示并记录该消息ID。
    //    REDIRECT|ALWAYS_SHOW：普通重定向消息框，显示并记录该消息ID。
    //    FORCE_REDIRECT|ALWAYS_SHOW：强制重定向消息框(可用于强制升级)，显示并记录该消息ID。
    //    SHOW_AND_EXIT|ALWAYS_SHOW：通知并退出消息框，显示并记录该消息ID。
    
    if ([messageFlag isEqualToString: @" "]
        || [messageFlag isEqualToString: @"ALWAYS_SHOW"])
    {
        [self recordReadMessageInfo];
        
        BoCPressAlertView *normalAlertView = [[BoCPressAlertView alloc] initWithTitle: messageTitle
                                                                              message: messageContent
                                                                             delegate: self
                                                                    cancelButtonTitle: @"确定"
                                                                    otherButtonTitles: nil];
        [normalAlertView show];
        [normalAlertView release];
        
    }else if([messageFlag isEqualToString: @"REDIRECT"]
             || [messageFlag isEqualToString: @"REDIRECT|ALWAYS_SHOW"])
    {
        [self recordReadMessageInfo];
        
       BoCPressAlertView *_redirectAlertView = [[BoCPressAlertView alloc] initWithTitle: messageTitle
                                                                                message: messageContent
                                                                               delegate: self 
                                                                      cancelButtonTitle: @"确定" 
                                                                      otherButtonTitles: @"取消", nil];

        if ([_redirectAlertView show] == 0) 
        {
            NSString *itemURL = [_messageInfo objectForKey:@"itemURL"];
            if (itemURL)
            {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:itemURL]];
            }
        }
        
        [_redirectAlertView release];
        
    }else if([messageFlag isEqualToString: @"FORCE_REDIRECT|ALWAYS_SHOW"])        
    {
        [self recordReadMessageInfo];
        
        BoCPressAlertView *_forceRedirectAlertView = [[BoCPressAlertView alloc] initWithTitle: messageTitle
                                                                                      message: messageContent
                                                                                     delegate: self 
                                                                            cancelButtonTitle: @"确定" 
                                                                            otherButtonTitles: @"取消",nil];
        if ([_forceRedirectAlertView show] == 0) 
        {
            NSString *itemURL = [_messageInfo objectForKey:@"itemURL"];
            if (itemURL)
            {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:itemURL]];
            }
            
        }
        
        [_forceRedirectAlertView release];
        
        exit(0);
        
    }else if([messageFlag isEqualToString: @"SHOW_AND_EXIT|ALWAYS_SHOW"])
    {
        [self recordReadMessageInfo];
        
        BoCPressAlertView *_exitAlertView = [[BoCPressAlertView alloc] initWithTitle: messageTitle
                                                                             message: messageContent
                                                                            delegate: self 
                                                                   cancelButtonTitle: @"确定" 
                                                                   otherButtonTitles: nil];
        [_exitAlertView show];
        [_exitAlertView release];
        
        exit(0);
    }
}

- (void)wantToFinishSplash
{
    if (_couldFinishSplash)
    {
        [self splashFinished];
        
    }else        
    {
        _couldFinishSplash = YES;
    }
}

#pragma mark - Notifications play

- (void)notificationsFinished
{
    for(id subViewLooper in [_notificationView subviews])
    {
        [subViewLooper removeFromSuperview];
    }
    [UIView animateWithDuration: 0.5
                     animations: (^{        
                                    [_notificationView setAlpha: 0.0];
                                })
     ];    
}
- (void)notificationForWantToCancelFeedBackView: (id)sender
{    
    [self notificationsFinished];
}
- (void)showFeedBackView:(NSNotification *)notification
{
    [_notificationView setBackgroundColor:[UIColor colorWithRed: 0 
                                                          green: 0
                                                           blue: 0
                                                          alpha: 0.5]];
    NSDictionary* userInfo = [notification userInfo];
    
    BoCPressFeedBackView *feedBackView = [[[BoCPressFeedBackView alloc] initWithNews:[userInfo objectForKey:kBoCPress_Global_NewsType] 
                                                                            callback:[userInfo objectForKey:@"callbackObject"] 
                                                                         averageRate:[userInfo objectForKey:kCommentSummary_PostAverageRateing]
                                                                           rateCount:[userInfo objectForKey:kCommentSummary_PostRateCount]
                                                                          dataSource:[userInfo objectForKey:@"dataSource"]
                                                                          repeatFlag:[userInfo objectForKey:kSoapXMLParser_NewsCommentRepeatRatingFlag]
                                           
                                           ] autorelease];
    
    [_notificationView addSubview:feedBackView];
    [_notificationView bringSubviewToFront:feedBackView];

    [UIView animateWithDuration: 0.5
                     animations: (^{
                                    [_notificationView setAlpha:1.0];
                                 })
     ];
}


- (void)removeFeedBackView: (NSNotification *)notification
{
    [self notificationsFinished]; 
}

#pragma mark - Tab switching

- (void)wantToSwitchToTab: (id<BoCPressTab>)tab
{
    [_tabBarView wantToSwitchToTab: tab];
}

- (void)wantToSwitchToTabAtIndex: (NSUInteger)tabIndex
                      completion: (void (^)(void))block
{
    if ([_tabBarView indexOfCurrentTab] == tabIndex
        && block)
    {
        block();
    }else 
    {
        [_tabBarView wantToSwitchToTabAtIndex: tabIndex 
                               completion: block];
    }
}
- (void)currentTab: (id<BoCPressTab>)currentTab 
   willSwitchToTab: (id<BoCPressTab>)tab
        completion: (void (^)(void))block
{
    NSLog(@"in func:%s, line:%d", __func__, __LINE__);
    
    [_state currentTab: currentTab 
           switchToTab: tab
            completion: block];
}

- (void)switchToTab: (id<BoCPressTab>)tab
         completion: (void (^)(void))block
{
    
    NSLog(@"in func:%s, line:%d", __func__, __LINE__);

    NSDictionary *animationInfo = [[NSDictionary alloc] initWithObjectsAndKeys:kBoCPress_View_AnimationTypeTopToBottom, kBoCPress_Global_AnimationType, nil];
    
    [self slideToPage: [_state currentPage] 
         withPageInfo: animationInfo
           completion: block];
    [animationInfo release];
    
}

- (void)refreshToTab:(id<BoCPressTab>)tab
          completion: (void (^)(void))block
{
    NSLog(@"in func:%s, line:%d", __func__, __LINE__);

    [self wantToRedisplayCurrentPageStart: nil
                               completion: (^(void){
                                                id<BoCPressPage> page = [_state currentPage];
                                                
                                                if ([page respondsToSelector:@selector(didBeenSwitchToFromOtherTabCompletion:)]) 
                                                {
                                                    [page didBeenSwitchToFromOtherTabCompletion: block];
                                                }
                                            })
     ];
}
#pragma mark - Navigation

- (void)wantToBrowseBackward
{
    [_state willBrowseBackward];
}

- (void)couldBrowseBackwardWithUserInfo: (NSDictionary *)userInfo
{
    [_state browseBackwardWithUserInfo: userInfo];
}


- (void)wantToReadPreviousPage
{
    [_state readPreviousPage];
}

- (void)wantToReadNextPage
{
    [_state readNextPage];
}

#pragma mark - Media processing

- (void)wantToPlayMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state tryToPlayMediaWithInfo: info];
    
}
- (void)wantToReadMediaListOfType: (id<BoCPressMediaType>)mediaType
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state readMediaListOfType: mediaType];
}

#pragma mark - News processing


- (void)wantToReadNewsListWithInfo: (id)userInfo
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state readNewsListWithInfo: userInfo];
}

- (void)wantToReadNewsInNewsListWithInfo: (NSDictionary *)info
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state tryToReadNewsInNewsListWithInfo: info];
}

#pragma mark - Security processing

- (void)wantToReadListOfSecurityInFamilyWithInfo:(NSDictionary *)info
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state tryToReadListOfSecurityInFamilyWithInfo: info];
}

- (void)wantToReadLongTermListOfSecurityInFamilyWithInfo: (NSDictionary *)info
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state tryToReadLongTermListOfSecurityInFamilyWithInfo: info];
}


#pragma mark - Critic processing

- (void)wantToReadListOfCriticPostWithInfo:(id)info
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state readListOfCriticPost: info];
}

- (void)wantToReadCriticPostInPostListWithInfo: (id)info
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state tryToReadCriticPostInPostListWithInfo: info];
}

#pragma mark - More page processing

- (void)wantToReadHelpPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state readHelpPage];
}

- (void)wantToReadAboutPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state readAboutPage];
}

- (void)wantToShowUserFeedbackPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state showUserFeedbackPage];
}

#pragma mark - Page processing

- (void)wantToRedisplayCurrentPageStart: (void (^)(CGRect rest))startBlock
                             completion: (void (^)(void))completionBlock
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    UIView<BoCPressPage> *page = [_state currentPage];

    CGRect bounds = [[self view] bounds];                                                                                                                        
    [_pageView addSubview: page];
    [_pageView setFrame: bounds];

    BoCPressViewController_UpdateFrameworkViewForPage(self, _navigationBarView, _tabBarView, page,
                                                      startBlock,
                                                      (^(CGRect rest)
                                                      {                                                            
                                                            [page setFrame: rest];                                                            
                                                            
                                                            NSMutableDictionary *animationInfo = [[NSMutableDictionary alloc] initWithObjectsAndKeys:kBoCPress_View_AnimationTypeTopToBottom, kBoCPress_Global_AnimationType, nil];
                                                                                                            
                                                            [page wantToForceRefreshCurrentContentWithInfo: animationInfo];
                                                            
                                                            [animationInfo release];
                                                          
                                                      }), 
                                                      completionBlock);
    
    
}

- (void)slideToPage: (id<BoCPressPage>)page 
       withPageInfo: (id)info
         completion: (void (^)(void))block
{    
    [_pageInfo release];
    _pageInfo = [info retain];
    
    if ([page respondsToSelector:@selector(shouldAutorotateToInterfaceOrientation:)])
    {   
        UIInterfaceOrientation currentInterfaceOrientation = [self interfaceOrientation];
        NSArray *pageSupportedInterfaceOrientations = [page supportedInterfaceOrientations];
        if ([pageSupportedInterfaceOrientations indexOfObject: [NSNumber numberWithInt: currentInterfaceOrientation]] == NSNotFound)
        {
            currentInterfaceOrientation = [[pageSupportedInterfaceOrientations objectAtIndex: 0] intValue];
        }
        if (currentInterfaceOrientation == UIInterfaceOrientationPortrait)
        {
            [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationPortrait animated: NO];
            [UIView animateWithDuration: 0.3
                             animations: (^{
                                            [[self view] setTransform: CGAffineTransformMakeRotation(0)];
                                            [[self view] setFrame: [[UIScreen mainScreen] applicationFrame]];
                                         })
             ];
            
            [_navigationBarView autoFitForPageSupportedInterfaceOrientation: UIInterfaceOrientationPortrait];
            
        }else if (currentInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        {
            
            [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationLandscapeLeft animated: NO];
            [UIView animateWithDuration: 0.3
                             animations: (^{
                                            [[self view] setTransform: CGAffineTransformMakeRotation(-M_PI_2)];
                                            [[self view] setFrame: [[UIScreen mainScreen] applicationFrame]];
                                        })
             ];
            
            [_navigationBarView autoFitForPageSupportedInterfaceOrientation: UIInterfaceOrientationLandscapeLeft];
            
            
        }else if(currentInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationPortraitUpsideDown animated: NO];
            [UIView animateWithDuration: 0.3
                             animations: (^{
                                                [[self view] setTransform: CGAffineTransformMakeRotation(M_PI)];
                                                [[self view] setFrame: [[UIScreen mainScreen] applicationFrame]];
                                        })
             ];
            
            [_navigationBarView autoFitForPageSupportedInterfaceOrientation: UIInterfaceOrientationPortraitUpsideDown];
            
        }
        else if (currentInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationLandscapeRight animated: NO];

            [UIView animateWithDuration: 0.3
                             animations: (^{
                                            [[self view] setTransform: CGAffineTransformMakeRotation(M_PI_2)];
                                            [[self view] setFrame: [[UIScreen mainScreen] applicationFrame]];
                                        })
             ];

            [_navigationBarView autoFitForPageSupportedInterfaceOrientation: UIInterfaceOrientationLandscapeRight];
            
        }
        
    }
    
    

    CGRect bounds = [[self view] bounds];
    
    UIView *view = (UIView*)page;
    [view setBackgroundColor: [UIColor clearColor]];
    
    UIView *lastView = [_state lastViewInCurrentViewStack];
    
    [_pageView addSubview: view];
    [_pageView setFrame: bounds];
    [_state addViewToCurrentStack:view];

    if ([lastView respondsToSelector: @selector(willBeSlidedToOtherPage)])
    {
        [(id<BoCPressPage>)lastView willBeSlidedToOtherPage];
    }  

    CGFloat heightOfLastView = [lastView frame].size.height;

    
    BoCPressViewController_UpdateFrameworkViewForPage(self, _navigationBarView, _tabBarView, page,
                                                      ^(CGRect rest)
                                                      {

                                                          if (lastView)
                                                          {
                                                              CGRect startFrame =rest;

                                                              startFrame.origin.x += startFrame.size.width;
                                                              
                                                              [view setFrame: startFrame];
                                                              
                                                          }else 
                                                          {
                                                              [view setAlpha: 0.0];
                                                              [view setFrame: rest];                                                              

                                                          }
                                                      },
                                                      ^(CGRect rest)
                                                        {
                                                        
                                                            if (lastView) 
                                                            {

                                                                [view setFrame: rest];
                                                                                                
                                                                CGRect endFrame = rest;
                                                                endFrame.size.height = heightOfLastView;
                                                                endFrame.origin.x -= endFrame.size.width;
                                                                
                                                                [lastView setFrame: endFrame];
                                                            }else
                                                            {

                                                                
                                                                [view setAlpha: 1.0];
                                                            }
                                                        }   
                                                        ,                           
                                                      (^(void) {
        
                                                        if ([page respondsToSelector: @selector(wantToUpdateDataWithInfo:completion:)])
                                                        {
                                                            objc_msgSend(page, @selector(wantToUpdateDataWithInfo:completion:), _pageInfo, block);
                                                        }else
                                                        {
                                                            //[page wantToUpdateDataWithInfo: _pageInfo];
                                                            [page didBeenSlideToWithInfo: _pageInfo];
                                                        }
                                                    })
                                                      );
    
}


- (void)browseBackwardToPage: (id<BoCPressPage>)page withInfo: (id)info
{    
    if ([page respondsToSelector:@selector(shouldAutorotateToInterfaceOrientation:)])
    {
        UIInterfaceOrientation currentInterfaceOrientation = [self interfaceOrientation];
        
        NSArray *pageSupportedInterfaceOrientations = [page supportedInterfaceOrientations];
        
        if ([pageSupportedInterfaceOrientations indexOfObject: [NSNumber numberWithInt: currentInterfaceOrientation]] == NSNotFound)
        {
            currentInterfaceOrientation = [[pageSupportedInterfaceOrientations objectAtIndex: 0] intValue];
        }
        
        if (currentInterfaceOrientation == UIInterfaceOrientationPortrait)
        {
            [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationPortrait animated: NO];

            [UIView animateWithDuration: 0.3
                             animations: (^{
                                            [[self view] setTransform: CGAffineTransformMakeRotation(0)];
                                            [[self view] setFrame: [[UIScreen mainScreen] applicationFrame]];
                                        })
             ];
            [_navigationBarView autoFitForPageSupportedInterfaceOrientation: UIInterfaceOrientationPortrait];
            
        }
        else if (currentInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        {
            [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationLandscapeLeft animated: NO];
            [UIView animateWithDuration: 0.3
                             animations: (^{
                                            [[self view] setTransform: CGAffineTransformMakeRotation(-M_PI / 2)];
                                            [[self view] setFrame: [[UIScreen mainScreen] applicationFrame]];
                                        })
             ];
            [_navigationBarView autoFitForPageSupportedInterfaceOrientation: UIInterfaceOrientationLandscapeLeft];
            
            
        }else if(currentInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationPortraitUpsideDown animated: NO];
            [UIView animateWithDuration: 0.3
                             animations: (^{                
                                            [[self view] setTransform: CGAffineTransformMakeRotation(M_PI)];
                                            [[self view] setFrame: [[UIScreen mainScreen] applicationFrame]];
                                        })
             ];
            [_navigationBarView autoFitForPageSupportedInterfaceOrientation: UIInterfaceOrientationPortraitUpsideDown];
            
        }
        else if (currentInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationLandscapeRight animated: NO];
            [UIView animateWithDuration: 0.3
                             animations: (^{
                                            [[self view] setTransform: CGAffineTransformMakeRotation(M_PI / 2)];
                                            [[self view] setFrame: [[UIScreen mainScreen] applicationFrame]];
                                        })
             ];
            [_navigationBarView autoFitForPageSupportedInterfaceOrientation: UIInterfaceOrientationLandscapeRight];
            
        }
        
    }

    CGRect bounds = [[self view] bounds];
    
    UIView *view = (UIView*)page;
    
    [view setBackgroundColor: [UIColor clearColor]];
    
    
    UIView *lastView = [_state lastViewInCurrentViewStack];
    [_pageView addSubview: view];
    [_pageView setFrame: bounds];
    

    BoCPressViewController_UpdateFrameworkViewForPage(self, _navigationBarView, _tabBarView, page, 
                                                      nil, 
                                                      (^(CGRect rest)
                                                      {
    
                                                            float heightOfLastView = [lastView frame].size.height; 

                                                            [view setFrame: rest];

                                                            [lastView setFrame: CGRectMake(rest.origin.x + rest.size.width, 
                                                                               rest.origin.y, 
                                                                               rest.size.width, 
                                                                               heightOfLastView)];
                                                            [lastView setAlpha:0];

                                                      }), 
                                                      
                                                      (^(void) 
                                                        {                                                              
                                                              [lastView removeFromSuperview];
                                                              
                                                              id<BoCPressPage> page = [_state currentPage];
                                                              if ([page respondsToSelector:@selector(didBeenBackwardToWithInfo:)])
                                                              {
                                                                  [page didBeenBackwardToWithInfo: info];
                                                              }
                                                              
                                                              
                                                              [_state removeLastViewOfCurrentTab];
                                                              
                                                      })

                                                      );
}

#pragma mark - Application become active processing

- (void)wantToUpdateCurrentPage
{
    [_state updateCurrentPage];
}

- (void)handleNetworkTimeOut: (id)userInfo
{

    NSError *error = [userInfo objectForKey: kNetwork_ConnectionError];
    UIAlertView *_timeOutAlertView = [[UIAlertView alloc] initWithTitle: nil
                                                                message: @"网络连接超时" 
                                                               delegate: self 
                                                      cancelButtonTitle: @"确定" 
                                                      otherButtonTitles: nil];
    switch ([error code]) 
    {
        case NSURLErrorNotConnectedToInternet:
        {
            [_timeOutAlertView setMessage: @"网络连接错误，请检查网络环境。"];
            break;
        }
        default:
        {
            break;
        }
    }
    
    if ([_state currentPage])
    {
        if([[_state currentPage] couldShowTimeOutAlertWithInfo: userInfo])
        {
            [_timeOutAlertView show];
        }
        NSDictionary *callbackInfo = [userInfo objectForKey: kNetwork_CallbackObject];
        
        [_state clearCurrentPageAfterNetworkTimeOutWithInfo: callbackInfo];
    }else
    {
        [_timeOutAlertView show];
        [[NSNotificationCenter defaultCenter] postNotificationName: kSoapDataSource_loadConfigurationWhenTimeOut
                                                            object: self
                                                          userInfo: nil];
    }
    [_timeOutAlertView release];
}

- (void)didLoadGUIConfigurationWhenTimeOut
{
    [self splashFinished];
    [self wantToNavigateToFirstColumnOfHomeTab];    
}

- (void)setUserInteractionState:(BOOL)state
{
    if (state)
    {
        [_viewToDisableUserInteraction setAlpha: 0];
        [_viewToDisableUserInteraction setUserInteractionEnabled: YES];
    }else
    {
        [[self view] addSubview: _viewToDisableUserInteraction];
        [[self view] bringSubviewToFront: _viewToDisableUserInteraction];
        CGRect frame = [[self view] bounds];
        [_viewToDisableUserInteraction setFrame: frame];
        [_viewToDisableUserInteraction setAlpha: 1];
        [_viewToDisableUserInteraction setBackgroundColor: [UIColor clearColor]];        
        [_viewToDisableUserInteraction setUserInteractionEnabled: NO];
    }
}

- (void)wantToRefetchConfiguration
{
    [_state willRefetchConfiguration];
}

- (void)didUpdateDataOfCurrentPage
{
    [_tabBarView enableUserInteraction];
}

#pragma mark - account login page
- (void)wantToShowAccountLoginPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    [_state showAccountLoginPage];
}

- (void)wantToShowVIPAccountRegisterPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    [_state showVIPAccountRegisterPage];
}

- (void)wantToShowNormalAccountRegisterPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state showNormalAccountRegisterPage];
}

- (void)wantToShowFindPasswordPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state showFindPasswordPage];
}

- (void)wantToShowChangePasswordPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state showChangePasswordPage];
}

- (void)wantToShowActivateCodePage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state showActivateCodePage];
}

- (void)wantToReadProtocolPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state showProtocolPage];
}

- (void)wantToShowVIPActivateCodePage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state showVIPActivateCodePage];
}

- (void) wantToShowBuyCardPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state showBuyCardPage];
}

- (void)showProtocolViewWithProtocolContent: (NSString *)protocolContent
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_notificationView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    
    BoCPressProtocolView * protocolView = [[BoCPressProtocolView alloc] initWithProtocolContent:protocolContent];
    [_notificationView addSubview:protocolView];
    [protocolView release];
    
    [UIView animateWithDuration: 0.5
                     animations: (^{
                                    [_notificationView setAlpha:1.0];
                                    [_notificationView bringSubviewToFront:protocolView];
                                })
     ];
}

- (void)finishedShowProtocolViewWithFlag:(BOOL)agreeFlag
{
    [self notificationsFinished];
    
    if (agreeFlag)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNormalAccountRegister_stepToRegisterNormalAccount object:self];
    }
}

- (void)showAuthorizeSuccessViewWithInfo: (id)userInfo
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_notificationView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    
    NSString *title = [userInfo objectForKey:kBoCPressVIPAuthorizeView_Title];
    NSString *content = [userInfo objectForKey:kBoCPressVIPAuthorizeView_Content];
    
    BoCPressVIPAuthorizeSuccessView *successView = [[BoCPressVIPAuthorizeSuccessView alloc] initWithTitle:title contentString:content];
    [_notificationView addSubview:successView];
    [successView release];
    
    [UIView animateWithDuration: 0.5
                     animations: (^{
                                    [_notificationView setAlpha:1.0];
                                    [_notificationView bringSubviewToFront:successView];
                                })
     ];
}

- (void)finishedShowVIPAuthorizeView
{
    [self notificationsFinished];
    [_state finishedShowVIPAuthorizeView];
}

- (void)wantToShowQuoteContentPageWithInfo: (id)userInfo
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state tryToShowQuoteContentPageWithInfo:userInfo];
}

- (void)wantToStepToRefreshCurrentPage
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    [_state stepToRefreshCurrentPage];
}

#pragma mark -  for demo

- (void)recoveryNavigationBarForQuoteContentPage
{
    [_navigationBarView recoveryForQuoteContentPage];
}

- (void)updateNavigationBarWithQuoteData: (id)data
{
    [_navigationBarView updateWithQuoteData:data];
}

- (void)updatePageTitle
{
    [_navigationBarView setPageTitle:[[_state currentPage] pageTitle]];
}

- (void)wantToShowLandscapeQuoteContentPage: (id)userInfo
{
    [_navigationBarView storeUseInfoForQuoteContentPage: userInfo];
    [_state showLandscapeQuoteContentPage:userInfo];
}

- (void)showMediaPlayer:(NSDictionary *)userInfo
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    BoCPressMediaPlayerViewController *mediaPlayer = [userInfo objectForKey:@"mediaPlayer"];
    NSDictionary *info = [userInfo objectForKey: @"info"];
    
    [self presentMoviePlayerViewControllerAnimated: mediaPlayer];
    [mediaPlayer updateMediaWithData: info];
}

- (void)willBecomeDeactive
{
    [_state applicationWillBecomeDeactive];
}

- (void)wantToShowAdvertisementView
{
    if (_advertisementView)
    {
        NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
        [_advertisementView wantToUpdateData];
    }else
    {
        if ([_state couldShowAdvertisementInCurrentContext])
        {
            [_state showAdvertisementView];
        }
    }
}

- (void)showAdvertisementViewWithInfo:(id)info
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    BoCPressAdvertisementView *advertisementView = [info objectForKey: @"BoCPressAdvertisementView"];
    _advertisementView = [advertisementView retain];
    [_interfaceView addSubview: _advertisementView];
}

- (void)wantToMakeAdvertisementViewVisuable
{
    if (![_advertisementView isVisuable]) 
    {
        
        [_advertisementView setFrame: CGRectMake(0, 460, 320, 76)];
        CGRect frame = [_advertisementView frame];
        frame.origin.y = 335;
        
        [UIView animateWithDuration: 1.0
                         animations: (^{
                                        [_advertisementView setFrame: frame];                                        
                                     })
                         completion: (^(BOOL finished) {
                                        [_advertisementView setIsVisuable: YES];
                                     })                                      
         ];
    }
}

- (void)wantToCloseAdvertisementView
{
    CGRect frame = [_advertisementView frame];
    frame.origin.y = 460;

    [UIView animateWithDuration: 1.0
                     animations: (^{
                                    [_advertisementView setFrame: frame];
                                 })
                     completion: (^(BOOL finished) {
                                    [_advertisementView removeFromSuperview];   
                                    [_advertisementView release];
                                    _advertisementView = nil;
                                 })
     ];
}

- (void)wantToShowAdvertisementDetailPageWithInfo:(id)info
{
    [_state showAdvertisementDetailPageWithInfo: info];
}

- (void)wantToShowSplashAdvertisementWithData: (id)info;
{
    NSLog(@"In Function:%s at line number:%d", __FUNCTION__, __LINE__);
    
    id<BoCPressNews> news = [info objectForKey: @"ads"];
    if (news)
    {
        _splashAdvertisementView = [[_state splashAdvertisementViewWithNews: news] retain];
        
        [_splashAdvertisementView setFrame: [_splashView bounds]];
        
    }else
    {
        //navigate to quote
        //
        [self wantToFinishSplash];
        
        [self wantToNavigateToFirstColumnOfHomeTab];
    }
}

- (void)wantToMakeSplashAdvertisementVisuable
{
    [_splashView addSubview: _splashAdvertisementView];
    [_splashView bringSubviewToFront: _splashAdvertisementView];
    
    [_splashAdvertisementView setAlpha: 0];
    
    [UIView animateWithDuration: 0.5
                     animations: (^{
                                     [_splashAdvertisementView setAlpha: 1];
                     })
                                  
                     completion: (^(BOOL finished) {
                                    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                                                     target: self
                                                                   selector: @selector(wantToFinishSplash)
                                                                   userInfo: nil
                                                                    repeats: NO];
                                  })
     ];
}

- (void)didSplashAdvertisementViewTaped
{
    [self wantToFinishSplash];
}

- (void)wantToNavigateToFirstColumnOfHomeTab
{
    if ([_callbackQueueOfLaunch count] > 0)
    {
        [self wantToFinishSplash];
        NSLog(@"call launch callback!");
        BoCPressViewControllerLaunchCallback pCallbackFunction = (BoCPressViewControllerLaunchCallback)[[_callbackQueueOfLaunch lastObject] integerValue];
        pCallbackFunction(self);
        [_callbackQueueOfLaunch removeLastObject];
    }else
    {
        [self wantToSwitchToTab: nil];
    }
}

- (void)didQuoteHomeFinishedUpdateData
{
    [[NSNotificationCenter defaultCenter] postNotificationName: kQuoteHomePage_wantToSlideToFirstSecurity
                                                        object: self
                                                      userInfo: nil];
}

- (void)didQuoteListPageFinishedUpdateData
{
    [self wantToFinishSplash];
}

- (void)storeMessageInfo:(NSDictionary *)info
{
    [_messageInfo release];
    _messageInfo = [info retain];
}

#pragma mark - remote notifications

- (void)wantToShowContentOfRemoteNotification: (NSDictionary *)info
{
    [_state showContentOfRemoteNotificationWithInfo: info];
}

- (void)wantToShowRemoteNotificationConfigurationPage: (NSDictionary *)info
{
    [_state showRemoteNotificationConfigurationPageWithData: info];
}

- (void)wantToShowRemoteNotificationContentPage: (NSDictionary *)info
{    
    [_state showRemoteNotificationContentPage];
}

#pragma mark >------------------- received remote notification

- (void)updateRemoteNotificationIndicatorOnNavigationBar
{
    NSUInteger numberOfNewRemoteNotification = [_state numberOfNewRemoteNotification];
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: numberOfNewRemoteNotification];
    [_tabBarView setShouldShowRemoteNotificationIndicator: numberOfNewRemoteNotification];
}

- (void)didReceiveRemoteNotification: (NSDictionary *)info
{
    NSLog(@"In Function: %s line: %d, info: %@", __FUNCTION__, __LINE__, info);
    [self updateRemoteNotificationIndicatorOnNavigationBar];
    
    if ([_state respondsToRemoteNotification: info])
    {        
        NSString *path  = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"beep.aiff"];
        if ([[NSFileManager defaultManager] fileExistsAtPath : path])
        {
            NSURL *pathURL = [NSURL fileURLWithPath : path];
            
            AudioServicesCreateSystemSoundID((CFURLRef) pathURL, &_audioEffect);
            AudioServicesPlaySystemSound(_audioEffect);
            
        }
        else
        {
            NSLog(@"error, file not found: %@", path);
        }
    }

}

- (void)didBeenLauchedWithRemoteNotification: (NSDictionary *)remoteNotification
{
    NSLog(@"In launch!, remote notification! This happens rarely.");
    if([_state respondsToRemoteNotification: remoteNotification])
    {
        [_callbackQueueOfLaunch addObject: [NSNumber numberWithInteger: (NSInteger)BoCPressViewController_navigateToRemoteNotificationPage]];
    }
}

- (void)didReceiveRemoteNotificationFromBackground: (NSDictionary *)remoteNotification
{
    NSLog(@"In Function: %s line: %d, info: %@", __FUNCTION__, __LINE__, remoteNotification);

    [self updateRemoteNotificationIndicatorOnNavigationBar];

    BoCPressViewController_navigateToRemoteNotificationPage(self);
}

#pragma mark - account

- (void)wantToShowAccountLoginPageWithCallbackInfo: (NSDictionary *)callbackInfo
{
    [_state showAccountLoginPageWithCallbackInfo: callbackInfo];
}

- (void)wantToShowVIPAccountRegisterPageWithCallbackInfo: (NSDictionary *)callbackInfo
{
    [_state showVIPAccountRegisterPageWithCallbackInfo: callbackInfo];
}

- (void)didUpdateDataOfCurrentPageWhenServerError: (NSDictionary *)userInfo
{
    [_state didUpdateDataOfCurrentPageWhenServerError: userInfo];
}

- (void)wantToNavigateToServerPushNotificationCenter: (NSDictionary *)userInfo
{
    [self updateRemoteNotificationIndicatorOnNavigationBar];

    if ([_tabBarView indexOfCurrentTab] == 4)
    {
        [self wantToShowRemoteNotificationContentPage: nil];

    }else
    {
        BoCPressViewController_navigateToRemoteNotificationPage(self);
    }
}

- (void)didReceiveDeviceToken: (NSData *)deviceToken
{
    [_state didReceiveDeviceToken: deviceToken];
}

- (void)wantToNavigateToNewsInNewsList: (NSDictionary *)info
{
    [_state tryToReadNewsInNewsListWithInfo: info];
}
@end
