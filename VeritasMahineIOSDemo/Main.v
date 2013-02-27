NS = #import "Foundation"
UI = #import("UIKit")
GL = #import("OpenGLES")

#import "BoCPressViewController"
#import("os")


@implementation TestGC : NSObject
---[[
- (id)init
{
    print("ok1")
    self = [super init]
    return self
}
--]]
---[[
- (void)dealloc
{
    print("in dealloc")
    
    [super dealloc]
}
--]]
@end

@implementation AppDelegate : NSObject

---[[
- (id)init
{
    self = [super init]
    return self
}
--]]

- (BOOL)application: (id)application didFinishLaunchingWithOptions: (id)launchOptions
{

    local bounds = [[UIScreen mainScreen] bounds]
    
    _window = [[UIWindow alloc] initWithFrame: bounds]

    local viewController = [[UIViewController alloc] init]
    [_window setRootViewController: viewController]
    [[viewController view] setBackgroundColor: [UIColor whiteColor]]
    [viewController release]
    
    [_window makeKeyAndVisible]

---[[
    @autoreleasepool
    {
        local t = [[TestGC alloc] init]
    
        [t release]
        
        print("alloc-release-dealloc tested!")
        
        local dict = @{};
        local array = @[ dict ];
        local a = @12;
    }
--]]
    return true
}

@end


main = function()
            return UIApplicationMain(0, nil, nil, NSStringFromClass([AppDelegate class]))
        end
