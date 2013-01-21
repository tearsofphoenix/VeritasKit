//
//  LuaUIKit.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIKit.h"

//CoreGraphics
//
#import "LuaCGAffineTransform.h"
#import "LuaCGGeometry.h"

#import "LuaUIAccessibility.h"
#import "LuaUIGeometry.h"
#import "LuaUIGraphics.h"
#import "LuaUIView.h"
#import "VMKFrameworkFunctions.h"
#import "VMKAuxiliary.h"

static int lua_UIApplicationMain(lua_State *L)
{
    NSString *principalClassName = VMKCheckObject(L, 3);
    NSString *delegateClassName = VMKCheckObject(L, 4);
    return UIApplicationMain(0, NULL, principalClassName, delegateClassName);
}

static const luaL_Reg __LuaUIKitFunctions[] =
{
    {"UIApplicationMain", lua_UIApplicationMain},
    {NULL, NULL}
};

int VMKOpenUIKit(struct lua_State *L)
{
    //load CoreGraphics
    //
    VMKLoadGlobalFunctions(L, __LuaUIKitFunctions);
    VMKOpenCGAffineTransform(L);
    VMKOpenCGGeometry(L);
        
    VMKOpenUIAccessibility(L);
    VMKOpenUIGeometry(L);
    VMKOpenUIGraphics(L);

    VMKOpenUIView(L);

    return 0;
}
