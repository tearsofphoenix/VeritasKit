//
//  LuaEAGL.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEAGL.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static int _luaObjC_EAGLGetVersion(lua_State *L)
{
    unsigned int major;
    unsigned int minor;
    EAGLGetVersion(&major, &minor);
    
    lua_pushinteger(L, major);
    lua_pushinteger(L, minor);
    return 2;
}

static const luaL_Reg __luaObjC_EAGL_Functions[] = 
{
    {"EAGLGetVersion", _luaObjC_EAGLGetVersion},
    {NULL, NULL},
};

int LuaOpenEAGL(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __luaObjC_EAGL_Functions);
    
    return 0;
}
