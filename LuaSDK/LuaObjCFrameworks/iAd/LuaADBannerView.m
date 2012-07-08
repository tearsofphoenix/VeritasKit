//
//  LuaADBannerView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaADBannerView.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ADBannerViewDelegate(lua_State *L)
{
    ADBannerViewDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_ADBannerViewDelegate(lua_State *L)
{
    ADBannerViewDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_ADBannerViewDelegate(lua_State *L)
{
    ADBannerViewDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaADBannerViewAPIs[] = {
    {"ADBannerViewDelegate", lua_ADBannerViewDelegate},
    {"ADBannerViewDelegate", lua_ADBannerViewDelegate},
    {"ADBannerViewDelegate", lua_ADBannerViewDelegate},
    {NULL, NULL},
};

int LuaOpenADBannerView(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaADBannerViewAPIs);
    return 0;
}
