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
#import "LuaObjCFrameworkFunctions.h"
#import "LuaObjCAuxiliary.h"

static int lua_UIApplicationMain(lua_State *L)
{
    NSString *principalClassName = LuaObjCCheckObject(L, 3);
    NSString *delegateClassName = LuaObjCCheckObject(L, 4);
    return UIApplicationMain(0, NULL, principalClassName, delegateClassName);
}

static const luaL_Reg __LuaUIKitFunctions[] =
{
    {"UIApplicationMain", lua_UIApplicationMain},
    {NULL, NULL}
};

int LuaObjCOpenUIKit(struct lua_State *L)
{
    //load CoreGraphics
    //
    LuaObjCLoadGlobalFunctions(L, __LuaUIKitFunctions);
    LuaObjCOpenCGAffineTransform(L);
    LuaObjCOpenCGGeometry(L);
        
    LuaObjCOpenUIAccessibility(L);
    LuaObjCOpenUIGeometry(L);
    LuaObjCOpenUIGraphics(L);

    LuaObjCOpenUIView(L);

    return 0;
}
