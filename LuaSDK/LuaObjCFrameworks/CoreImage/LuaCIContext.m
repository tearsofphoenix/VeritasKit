//
//  LuaCIContext.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCIContext.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CIContextInternal(lua_State *L)
{
    CIContextInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIContextInternal(lua_State *L)
{
    CIContextInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIContextOutputColorSpace(lua_State *L)
{
    CIContextOutputColorSpace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIContextWorkingColorSpace(lua_State *L)
{
    CIContextWorkingColorSpace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIContextUseSoftwareRenderer(lua_State *L)
{
    CIContextUseSoftwareRenderer(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCIContextAPIs[] = {
    {"CIContextInternal", lua_CIContextInternal},
    {"CIContextInternal", lua_CIContextInternal},
    {"CIContextOutputColorSpace", lua_CIContextOutputColorSpace},
    {"CIContextWorkingColorSpace", lua_CIContextWorkingColorSpace},
    {"CIContextUseSoftwareRenderer", lua_CIContextUseSoftwareRenderer},
    {NULL, NULL},
};

int LuaOpenCIContext(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCIContextAPIs);
    return 0;
}
