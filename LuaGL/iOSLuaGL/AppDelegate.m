//
//  AppDelegate.m
//  iOSLuaGL
//
//  Created by Mac003 on 14/11/19.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "AppDelegate.h"
#import "GameViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    _window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    
    GameViewController *vc = [[GameViewController alloc] init];
    [_window setRootViewController: vc];
    
    [_window makeKeyAndVisible];
    return YES;
}

@end
