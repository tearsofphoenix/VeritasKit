//
//  LuaCFSocketStream.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFSocketStream.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFSocketStreamSOCKSGetErrorSubdomain(lua_State *L)
{
    CFSocketStreamSOCKSGetErrorSubdomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketStreamSOCKSGetError(lua_State *L)
{
    CFSocketStreamSOCKSGetError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketStreamPairSetSecurityProtocol(lua_State *L)
{
    CFSocketStreamPairSetSecurityProtocol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketStreamPairSetSecurityProtocol(lua_State *L)
{
    CFSocketStreamPairSetSecurityProtocol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketStreamPairSetSecurityProtocol(lua_State *L)
{
    CFSocketStreamPairSetSecurityProtocol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketStreamPairSetSecurityProtocol(lua_State *L)
{
    CFSocketStreamPairSetSecurityProtocol(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFSocketStreamAPIs[] = {
    {"CFSocketStreamSOCKSGetErrorSubdomain", lua_CFSocketStreamSOCKSGetErrorSubdomain},
    {"CFSocketStreamSOCKSGetError", lua_CFSocketStreamSOCKSGetError},
    {"CFSocketStreamPairSetSecurityProtocol", lua_CFSocketStreamPairSetSecurityProtocol},
    {"CFSocketStreamPairSetSecurityProtocol", lua_CFSocketStreamPairSetSecurityProtocol},
    {"CFSocketStreamPairSetSecurityProtocol", lua_CFSocketStreamPairSetSecurityProtocol},
    {"CFSocketStreamPairSetSecurityProtocol", lua_CFSocketStreamPairSetSecurityProtocol},
    {NULL, NULL},
};

int LuaOpenCFSocketStream(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFSocketStreamAPIs);
    return 0;
}
