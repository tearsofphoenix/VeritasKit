//
//  LuaExtendedAudioFile.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaExtendedAudioFile.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ExtendedAudioFile_h__(lua_State *L)
{
    ExtendedAudioFile_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_ExtendedAudioFile_h__(lua_State *L)
{
    ExtendedAudioFile_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_ExtendedAudioFile_h__(lua_State *L)
{
    ExtendedAudioFile_h__(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaExtendedAudioFileAPIs[] = {
    {"ExtendedAudioFile_h__", lua_ExtendedAudioFile_h__},
    {"ExtendedAudioFile_h__", lua_ExtendedAudioFile_h__},
    {"ExtendedAudioFile_h__", lua_ExtendedAudioFile_h__},
    {NULL, NULL},
};

int LuaOpenExtendedAudioFile(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaExtendedAudioFileAPIs);
    return 0;
}
