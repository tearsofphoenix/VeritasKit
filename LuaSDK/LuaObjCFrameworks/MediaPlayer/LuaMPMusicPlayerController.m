//
//  LuaMPMusicPlayerController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMPMusicPlayerController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MPMusicPlayerControllerInternal(lua_State *L)
{
    MPMusicPlayerControllerInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMusicPlayerControllerInternal(lua_State *L)
{
    MPMusicPlayerControllerInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMusicPlayerControllerPlaybackStateDidChangeNotification(lua_State *L)
{
    MPMusicPlayerControllerPlaybackStateDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMusicPlayerControllerNowPlayingItemDidChangeNotification(lua_State *L)
{
    MPMusicPlayerControllerNowPlayingItemDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMusicPlayerControllerVolumeDidChangeNotification(lua_State *L)
{
    MPMusicPlayerControllerVolumeDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMPMusicPlayerControllerAPIs[] = {
    {"MPMusicPlayerControllerInternal", lua_MPMusicPlayerControllerInternal},
    {"MPMusicPlayerControllerInternal", lua_MPMusicPlayerControllerInternal},
    {"MPMusicPlayerControllerPlaybackStateDidChangeNotification", lua_MPMusicPlayerControllerPlaybackStateDidChangeNotification},
    {"MPMusicPlayerControllerNowPlayingItemDidChangeNotification", lua_MPMusicPlayerControllerNowPlayingItemDidChangeNotification},
    {"MPMusicPlayerControllerVolumeDidChangeNotification", lua_MPMusicPlayerControllerVolumeDidChangeNotification},
    {NULL, NULL},
};

int LuaOpenMPMusicPlayerController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMPMusicPlayerControllerAPIs);
    return 0;
}
