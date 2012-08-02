NS = #import "Foundation"
UI = #import("UIKit")
GL = #import("OpenGLES")

#import "BoCPressViewController"
#import("os")

@class Test

@implementation TableViewDelegate : NSObject

- (CGFloat)tableView: (UITableView )tableView heightForRowAtIndexPath: (NSInteger)section
{
    return 50
}

@end

@implementation TableViewDataSource : NSObject

- (NSInteger)tableView: (UITableView )tableView numberOfRowsInSection: (int)section
{
    return 5
}

- (id)tableView: (id)tableView cellForRowAtIndexPath: (id)indexPath
{
    cell = [[UITableViewCell alloc] init]
    [[cell textLabel] setText: "Veritas"]
    [[cell textLabel] setBackgroundColor: [UIColor clearColor]]
    [cell setBackgroundColor: [UIColor clearColor]]
    return [cell autorelease]
}

@end

@implementation AppDelegate : NSObject

@property (nonatomic, retain) UIWindow window

+ (id)name
{
    print("call name")
    return "hello"
}

- (void)voidArgument
{
    print("void argument")
}

- (id)init
{
    self = [super init]
    [self voidArgument]
    return self
}

- (void)handleTapEvent: (id)sender
{
    print("handle event")
    print("start", os.clock())

    print([self window])
    
   alert = [[UIAlertView alloc] initWithTitle: @"te测"
                                      message: @"te"
                                     delegate: nil
                            cancelButtonTitle: @'dd'
                            otherButtonTitles: nil]
   [alert show]
   [alert release]
    print("end", os.clock())
   --return nil
}

- (BOOL)application: (id)application didFinishLaunchingWithOptions: (id)launchOptions
{
    print("_cmd is", _cmd)
    bounds = [[UIScreen mainScreen] bounds]
    
    local window = [[UIWindow alloc] initWithFrame: bounds]
    //[window setUserInteractionEnabled: NO]
    [self setWindow: window]    
    print([self window])
    print(self.window)
    local backgroundColor = [UIColor whiteColor]

    
    [window setBackgroundColor: backgroundColor];
    rootViewController = [[UIViewController alloc] init]
        
    local mainView = [rootViewController view]
    [mainView setFrame: bounds]
    --[mainView setUserInteractionEnabled: NO]
    
    tableView = [[UITableView alloc] init]
    [tableView setFrame: bounds]
    [mainView addSubview: tableView]
    
    dataSource = [[TableViewDataSource alloc] init]
    delegate = [[TableViewDelegate alloc] init]
    
    [tableView setDataSource: dataSource]
    [tableView setDelegate: delegate]
    [tableView setUserInteractionEnabled: YES]
    [tableView setBackgroundColor: backgroundColor]
    [tableView setAlpha: 0.5]
    [window setRootViewController: rootViewController]
    [rootViewController release]
    [window makeKeyAndVisible]
        
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget: self 
                                                         action: @selector(handleTapEvent:)]
    //protocol = @protocol(pr)
    //print(tapGesture)
    [window addGestureRecognizer: tapGesture]
    [tapGesture release]
            
    print("end", os.clock())

    return true
}

@end

 
main = function()
            return UIApplicationMain(0, nil, nil, NSStringFromClass([AppDelegate class]))
        end
