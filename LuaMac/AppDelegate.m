//
//  AppDelegate.m
//  LuaMac
//
//  Created by LeixSnake on 10/25/12.
//
//

#import "AppDelegate.h"
#import <VeritasMachine/VeritasMachine.h>

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    LuaCall(@"Test.v", @"test", nil, 0, 0, nil);
}

@end
