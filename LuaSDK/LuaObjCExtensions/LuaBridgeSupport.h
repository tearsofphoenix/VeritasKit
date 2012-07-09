//
//  LuaBridgeSupport.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

struct lua_State;

@interface LuaBridgeSupport : NSObject

+ (void)importFramework: (NSString *)frameworkName
  withBridgeFileContent: (NSString *)bridgeFileContent;

+ (void)tryToResolveName: (NSString *)name
            intoLuaState: (struct lua_State *)state;

@end
