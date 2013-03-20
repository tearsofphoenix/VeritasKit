NS = #import "Foundation"
UI = #import("UIKit")
GL = #import("OpenGLES")
#import("os")


@implementation AppDelegate : NSObject

---[[
@property (nonatomic, assign) int number
@property (nonatomic, retain) id name
@property (nonatomic) CGFloat floatValue
--]]

- (BOOL)application: (id)application didFinishLaunchingWithOptions: (id)launchOptions
{
--[[
    local bounds = [ [UIScreen mainScreen] bounds]
    
    _window = [ [UIWindow alloc] initWithFrame: bounds]

    local viewController = [ [UIViewController alloc] init]
    [_window setRootViewController: viewController]
    [ [viewController view] setBackgroundColor: [UIColor whiteColor] ]
    [viewController release]
    
    [_window makeKeyAndVisible]
    [self setNumber: 100]
    print([self number])
    
    local name = @"hello"
    
    print([name retainCount])

    [self setName: name]
    
    print([name retainCount])
    [NSThread detachNewThreadSelector: @selector(log:)
                             toTarget: self
                           withObject: self]
--]]
        
    [NSTimer scheduledTimerWithTimeInterval: 10.0
                                     target: self
                                   selector: @selector(log:)
                                   userInfo: nil
                                    repeats: false];
    [self setFloatValue: 100.2];
    print([self floatValue])
    
    return true
}

- (void)log: (id)obj
{
    print("ok: ", self, [obj timeInterval])
}

@end


main = function()
            return UIApplicationMain(0, nil, nil, NSStringFromClass([AppDelegate class]))
        end
