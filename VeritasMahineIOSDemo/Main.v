NS = #import "Foundation"
UI = #import("UIKit")
GL = #import("OpenGLES")

#import "BoCPressViewController"
#import("os")

@implementation AppDelegate : NSObject

- (id)init
{
    self = [super init]
    return self
}

- (BOOL)application: (id)application didFinishLaunchingWithOptions: (id)launchOptions
{
    print("ok")
    local bounds = [[UIScreen mainScreen] bounds]
    
    window = [[UIWindow alloc] initWithFrame: bounds]
    [window setBackgroundColor: [UIColor whiteColor]]
    [window makeKeyAndVisible]
    print("window:", window)
    return true
}

@end


main = function()
            return UIApplicationMain(0, nil, nil, NSStringFromClass([AppDelegate class]))
        end
