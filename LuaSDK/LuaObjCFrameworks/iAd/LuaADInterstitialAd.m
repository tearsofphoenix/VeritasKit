//
//  LuaADInterstitialAd.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaADInterstitialAd.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ADInterstitialAdDelegate(lua_State *L)
{
    ADInterstitialAdDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_ADInterstitialAdDelegate(lua_State *L)
{
    ADInterstitialAdDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_ADInterstitialAdDelegate(lua_State *L)
{
    ADInterstitialAdDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaADInterstitialAdAPIs[] = {
    {"ADInterstitialAdDelegate", lua_ADInterstitialAdDelegate},
    {"ADInterstitialAdDelegate", lua_ADInterstitialAdDelegate},
    {"ADInterstitialAdDelegate", lua_ADInterstitialAdDelegate},
    {NULL, NULL},
};

int LuaOpenADInterstitialAd(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaADInterstitialAdAPIs);
    return 0;
}
