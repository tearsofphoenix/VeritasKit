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
    NSString *principalClassName = luaObjC_checkNSObject(L, 3);
    NSString *delegateClassName = luaObjC_checkNSObject(L, 4);
    return UIApplicationMain(0, NULL, principalClassName, delegateClassName);
}

static const luaL_Reg __LuaUIKitFunctions[] =
{
    {"UIApplicationMain", lua_UIApplicationMain},
    {NULL, NULL}
};

int LuaOpenUIKit(struct lua_State *L)
{
    //load CoreGraphics
    //
    luaObjC_loadGlobalFunctions(L, __LuaUIKitFunctions);
    LuaOpenCGAffineTransform(L);
    LuaOpenCGGeometry(L);
        
    LuaOpenUIAccessibility(L);
    LuaOpenUIGeometry(L);
    LuaOpenUIGraphics(L);

    LuaOpenUIView(L);

    return 0;
}
