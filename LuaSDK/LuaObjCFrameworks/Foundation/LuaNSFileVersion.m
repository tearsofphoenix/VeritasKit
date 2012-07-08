//
//  LuaNSFileVersion.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSFileVersion.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"


static const LuaSDKConst __luaNSFileVersionConstants[] = 
{
    {"NSFileVersionAddingByMoving", NSFileVersionAddingByMoving},
    {"NSFileVersionReplacingByMoving", NSFileVersionReplacingByMoving},
    {NULL, 0},
};

int LuaOpenNSFileVersion(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSFileVersionConstants);
    return 0;
}
