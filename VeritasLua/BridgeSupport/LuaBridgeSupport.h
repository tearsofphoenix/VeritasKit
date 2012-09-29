//
//  LuaBridgeSupport.h
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

struct lua_State;

@interface LuaBridgeSupport : NSObject

+ (void)importFramework: (NSString *)frameworkName;

+ (void)tryToResolveName: (NSString *)name
            intoLuaState: (struct lua_State *)state;

@end

#ifdef __arm__

#define LUAOBJC_TARGET_ALIGMENT (4)

#else

#define LUAOBJC_TARGET_ALIGMENT (4)

#endif