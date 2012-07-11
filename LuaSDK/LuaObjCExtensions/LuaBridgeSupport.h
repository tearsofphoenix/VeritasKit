//
//  LuaBridgeSupport.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

struct lua_State;

@interface LuaBridgeSupport : NSObject

+ (void)importFramework: (NSString *)frameworkName;

+ (void)tryToResolveName: (NSString *)name
            intoLuaState: (struct lua_State *)state;

@end
