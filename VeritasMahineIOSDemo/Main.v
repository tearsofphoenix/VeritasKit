NS = #import "Foundation"
UI = #import("UIKit")
GL = #import("OpenGLES")

#import "BoCPressViewController"
#import("os")


@implementation TestGC : NSObject
--[[
- (id)init
{
    self = [super init]
    
    printf("ok")

    return self
}
--]]
--[[
- (void)dealloc
{
    printf("in dealloc")
    
    [super dealloc]
}
--]]
@end

@implementation AppDelegate : NSObject

- (id)init
{
    self = [super init]
    return self
}

- (BOOL)application: (id)application didFinishLaunchingWithOptions: (id)launchOptions
{
    local bounds = [[UIScreen mainScreen] bounds]
    
    window = [[UIWindow alloc] initWithFrame: bounds]
    [window setBackgroundColor: [UIColor whiteColor]]
    [window makeKeyAndVisible]
    
    local rootViewController = [[UIViewController alloc] init]
    [window setRootViewController: rootViewController]
    [rootViewController release]

    local t = [[TestGC alloc] init]
    
    [t release]
    return true
}

@end


main = function()
            return UIApplicationMain(0, nil, nil, NSStringFromClass([AppDelegate class]))
        end
