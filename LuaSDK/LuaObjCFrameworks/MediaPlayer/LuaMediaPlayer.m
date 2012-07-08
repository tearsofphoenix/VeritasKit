//
//  LuaMediaPlayer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMediaPlayer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MediaPlayerDefines(lua_State *L)
{
    MediaPlayerDefines(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMediaPlayerAPIs[] = {
    {"MediaPlayerDefines", lua_MediaPlayerDefines},
    {NULL, NULL},
};

int LuaOpenMediaPlayer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMediaPlayerAPIs);
    return 0;
}
