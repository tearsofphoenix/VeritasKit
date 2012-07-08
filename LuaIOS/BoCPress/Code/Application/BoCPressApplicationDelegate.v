@import "BoCPressApplicationDelegate.v"

@import "BoCPressApplication.v"

@import "BoCPressViewController.v"

@import "BoCPressConstant.v"

@import "BoCPressNotificationDefines.v"

@import "BoCPressApplicationConstant.v"

@import "BoCPressViewController.v"

@import 'AVFoundation'

@implementation BoCPressApplicationDelegate

@property (nonatomic, retain) UIWindow window

- (id)init
{
    if ((self = [super init])) then
    
        _hasBeenDeactive = NO;
        _window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
        BoCPressViewController rootViewController = [[BoCPressViewController alloc] init];
        [_window setRootViewController: rootViewController];
        [rootViewController release];
        
        [[AVAudioSession sharedInstance] setDelegate: self];
        [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback 
                                               error: NULL];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(notificationForDidGetAdvertisement:)
                                                     name: kNotification_Global_didGetAdvertisementFromServer
                                                   object: nil];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(notificationForDidTimeOutWhenGetAdvertisement:)
                                                     name: kNotification_Global_didTimeOutWhenGetAdvertisementFromServer
                                                   object: nil];
    end
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
    
    [_state release];
    
    [_window release];
    
    [super dealloc];
    
}

#pragma mark - Notifications

- (void)notificationForDidGetAdvertisement: (NSNotification )notification
{
    [_timerForAdvertisement invalidate];
    _timerForAdvertisement = nil;
}

- (void)notificationForDidTimeOutWhenGetAdvertisement: (NSNotification )notification
{
    _timerForAdvertisement = [NSTimer scheduledTimerWithTimeInterval: kConstant_Application_TimeIntervalOfShowAdvertisement 
                                                              target: self
                                                            selector: @selector(wantToShowAdvertisementView:)
                                                            userInfo: nil
                                                             repeats: NO];
}

#pragma mark - Application event processing

- (BOOL)application: (UIApplication )application didFinishLaunchingWithOptions: (NSDictionary )launchOptions
{
 
    _state = [[BoCPressApplicationState alloc] init];
    [[self window] makeKeyAndVisible];
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes: UIRemoteNotificationTypeAlert
                                                                         | UIRemoteNotificationTypeBadge
                                                                         | UIRemoteNotificationTypeSound];
    
    [NSTimer scheduledTimerWithTimeInterval: kConstant_Application_TimeIntervalOfShowAdvertisement 
                                     target: self
                                   selector: @selector(wantToShowAdvertisementView:)
                                   userInfo: nil
                                    repeats: NO];    
    
    NSDictionary remoteNotification = [launchOptions objectForKey: UIApplicationLaunchOptionsRemoteNotificationKey];
    if ([remoteNotification count] > 0)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_Global_didBeenLaunchedWithRemoteNotification
                                                            object: self
                                                          userInfo: remoteNotification];
    }

    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication )application
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_Global_willBecomeDeactive
                                                        object: self
                                                      userInfo: nil];
}

- (void)applicationDidBecomeActive:(UIApplication )application
{
    if (_hasBeenDeactive)
    {
        
        [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_Global_didEnterForeground
                                                            object: self 
                                                          userInfo: nil];
    }else
    {
        _hasBeenDeactive = YES;
    }
}

- (void)applicationWillEnterForeground:(UIApplication )application
{
    
    
    _timerForAdvertisement = [NSTimer scheduledTimerWithTimeInterval: kConstant_Application_TimeIntervalOfShowAdvertisement 
                                                               target: self
                                                             selector: @selector(wantToShowAdvertisementView:)
                                                             userInfo: nil
                                                              repeats: NO];
}

- (void)wantToShowAdvertisementView: (NSTimer )timer
{
    
    
    [_timerForAdvertisement invalidate];
    _timerForAdvertisement = nil;
    [[NSNotificationCenter defaultCenter] postNotificationName: kViewController_wantToShowAdvertisementView
                                                        object: self
                                                      userInfo: nil];
}

- (void)applicationDidEnterBackground:(UIApplication )application
{
    
 
    [_state resetBadgeNumber];
    
    [_timerForAdvertisement invalidate];
    _timerForAdvertisement = nil;
    
    UIApplication app = [UIApplication sharedApplication];
    
    __block UIBackgroundTaskIdentifier backgroundTaskIdentifier;
    
    if ([app respondsToSelector:@selector(beginBackgroundTaskWithExpirationHandler:)]) 
    {
        NSLog(@"playing in background!");
        backgroundTaskIdentifier = [app beginBackgroundTaskWithExpirationHandler:^{
            // Synchronize the cleanup call on the main thread in case
            // the task actually finishes at around the same time.
            dispatch_async(dispatch_get_main_queue(), ^{
                if (backgroundTaskIdentifier != UIBackgroundTaskInvalid)
                {
                    [app endBackgroundTask: backgroundTaskIdentifier];
                    backgroundTaskIdentifier = UIBackgroundTaskInvalid;
                }
            });
        }];
        
        dispatch_async(dispatch_get_main_queue(), ^{

        });
        
        [application endBackgroundTask: backgroundTaskIdentifier];
        backgroundTaskIdentifier = UIBackgroundTaskInvalid;
        
    }
    
}

#pragma mark - push notification

- (void)application:(UIApplication )application didRegisterForRemoteNotificationsWithDeviceToken:(NSData )deviceToken 
{
    NSDictionary userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:deviceToken, @"deviceToken", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_Global_didReceiveDeviceToken
                                                        object: self 
                                                      userInfo: userInfo];
    [userInfo release];
}

- (void)application:(UIApplication )application didFailToRegisterForRemoteNotificationsWithError:(NSError )error 
{
}

- (void)application:(UIApplication )application didReceiveRemoteNotification:(NSDictionary )userInfo
{
    UIApplicationState applicationState = [[UIApplication sharedApplication] applicationState];
    
    //From background
    //
    if (applicationState == UIApplicationStateInactive)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_Global_didReceiveNotificationFromBackground
                                                            object: self
                                                          userInfo: userInfo];
    }else
    {
    
        [[NSNotificationCenter defaultCenter] postNotificationName: kNotification_ViewController_didReceiveRemoteNotification
                                                            object: self
                                                          userInfo: userInfo];
    }
}

- (void)application: (UIApplication )application didReceiveLocalNotification:(UILocalNotification )notification
{
}

@end
