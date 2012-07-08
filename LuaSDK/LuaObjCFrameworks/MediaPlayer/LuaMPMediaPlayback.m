//
//  LuaMPMediaPlayback.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMPMediaPlayback.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MPMediaPlaybackIsPreparedToPlayDidChangeNotification(lua_State *L)
{
    MPMediaPlaybackIsPreparedToPlayDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMPMediaPlaybackAPIs[] = {
    {"MPMediaPlaybackIsPreparedToPlayDidChangeNotification", lua_MPMediaPlaybackIsPreparedToPlayDidChangeNotification},
    {NULL, NULL},
};

int LuaOpenMPMediaPlayback(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMPMediaPlaybackAPIs);
    return 0;
}
