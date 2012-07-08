//
//  LuaCFData.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFData.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFDataRef(lua_State *L)
{
    CFDataRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataGetTypeID(lua_State *L)
{
    CFDataGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataRef(lua_State *L)
{
    CFDataRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataRef(lua_State *L)
{
    CFDataRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataRef(lua_State *L)
{
    CFDataRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataCreateMutable(lua_State *L)
{
    CFDataCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataCreateMutableCopy(lua_State *L)
{
    CFDataCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataGetLength(lua_State *L)
{
    CFDataGetLength(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataGetBytePtr(lua_State *L)
{
    CFDataGetBytePtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataGetMutableBytePtr(lua_State *L)
{
    CFDataGetMutableBytePtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataGetBytes(lua_State *L)
{
    CFDataGetBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataSetLength(lua_State *L)
{
    CFDataSetLength(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataIncreaseLength(lua_State *L)
{
    CFDataIncreaseLength(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataAppendBytes(lua_State *L)
{
    CFDataAppendBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataReplaceBytes(lua_State *L)
{
    CFDataReplaceBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataDeleteBytes(lua_State *L)
{
    CFDataDeleteBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataSearchBackwards(lua_State *L)
{
    CFDataSearchBackwards(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataSearchAnchored(lua_State *L)
{
    CFDataSearchAnchored(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataSearchFlags(lua_State *L)
{
    CFDataSearchFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDataFind(lua_State *L)
{
    CFDataFind(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFDataAPIs[] = {
    {"CFDataRef", lua_CFDataRef},
    {"CFDataGetTypeID", lua_CFDataGetTypeID},
    {"CFDataRef", lua_CFDataRef},
    {"CFDataRef", lua_CFDataRef},
    {"CFDataRef", lua_CFDataRef},
    {"CFDataCreateMutable", lua_CFDataCreateMutable},
    {"CFDataCreateMutableCopy", lua_CFDataCreateMutableCopy},
    {"CFDataGetLength", lua_CFDataGetLength},
    {"CFDataGetBytePtr", lua_CFDataGetBytePtr},
    {"CFDataGetMutableBytePtr", lua_CFDataGetMutableBytePtr},
    {"CFDataGetBytes", lua_CFDataGetBytes},
    {"CFDataSetLength", lua_CFDataSetLength},
    {"CFDataIncreaseLength", lua_CFDataIncreaseLength},
    {"CFDataAppendBytes", lua_CFDataAppendBytes},
    {"CFDataReplaceBytes", lua_CFDataReplaceBytes},
    {"CFDataDeleteBytes", lua_CFDataDeleteBytes},
    {"CFDataSearchBackwards", lua_CFDataSearchBackwards},
    {"CFDataSearchAnchored", lua_CFDataSearchAnchored},
    {"CFDataSearchFlags", lua_CFDataSearchFlags},
    {"CFDataFind", lua_CFDataFind},
    {NULL, NULL},
};

int LuaOpenCFData(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFDataAPIs);
    return 0;
}
