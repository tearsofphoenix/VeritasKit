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
@property (nonatomic, assign, setter=setString:) NSString testString
@property (nonatomic) CGFloat tf
@property (nonatomic) NSInteger ti

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
                            cancelButtonTitle: @'好'
                            otherButtonTitles: nil]
   [alert show]
   [alert release]
    print("end", os.clock())
   --return nil
}

- (BOOL)application: (id)application didFinishLaunchingWithOptions: (id)launchOptions
{
    print("_cmd is", @{ })
    bounds = [[UIScreen mainScreen] bounds]
    
    local window = [[UIWindow alloc] initWithFrame: bounds]
    //[window setUserInteractionEnabled: NO]
    [self setWindow: window]
    print([self window])
    [self setTf: 1919.1]
    print([self tf])
    
    [self setTi: 123213]
    print([self ti])

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
            
    [self setString: @"x-----xx"]
    print([self testString])
    
    return true
}

- (CGFloat)testFloat
{
    return 10.0010
}

- (id)testID
{
    return @"xxx"
}

- (CGRect)testStruct
{
    return CGRectMake(0, 0, 320, 460)
}

@end

 
main = function()
            @try
            {
                @try
                {   
                    print("in lua @try")
                    @throw "ok"
                }
                @catch (value)
                {
                    print("in lua @catch")
                    print(value)
                    @throw "from @catch"
                }
                @finally
                {
                    print("finally")
                    @throw "from inner @finally"
                }

            }@catch(errorMsg)
            {
                print(errorMsg)
            }
            --[[
            local value = [[NSString alloc] initWithUTF8String: "value--string"];

            local block = (^
                            {
                                print(value)
                            })
            [value release];
            
            block();
            --]]
            local dict = [[NSMutableDictionary alloc] init];
            [dict setObject: @"2" forKey: @"two"];

            for( k, v in dict)
            {
                print(k, v);
            }

            dict["sd"] = @"4";

            for( k, v in dict)
            {
                print(k, v);
            }

            return UIApplicationMain(0, nil, nil, NSStringFromClass([AppDelegate class]))
        end
