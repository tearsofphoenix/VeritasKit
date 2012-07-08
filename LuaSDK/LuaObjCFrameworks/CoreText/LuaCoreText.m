//
//  LuaCoreText.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCoreText.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CoreTextVersion(lua_State *L)
{
    CoreTextVersion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CoreTextVersion(lua_State *L)
{
    CoreTextVersion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CoreTextVersion(lua_State *L)
{
    CoreTextVersion(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCoreTextAPIs[] = {
    {"CoreTextVersion", lua_CoreTextVersion},
    {"CoreTextVersion", lua_CoreTextVersion},
    {"CoreTextVersion", lua_CoreTextVersion},
    {NULL, NULL},
};

int LuaOpenCoreText(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCoreTextAPIs);
    return 0;
}
