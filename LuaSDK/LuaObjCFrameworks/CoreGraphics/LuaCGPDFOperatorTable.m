//
//  LuaCGPDFOperatorTable.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFOperatorTable.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"


static int lua_CGPDFOperatorTableCreate(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFOperatorTableCreate());
    return 1;
}

static int lua_CGPDFOperatorTableRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFOperatorTableRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFOperatorTableRelease(lua_State *L)
{
    CGPDFOperatorTableRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGPDFOperatorTableSetCallback(lua_State *L)
{
    CGPDFOperatorTableSetCallback(lua_touserdata(L, 1), lua_tostring(L, 2), lua_touserdata(L, 3));
    return 0;
}

static const luaL_Reg __LuaCGPDFOperatorTableAPIs[] = {
    {"CGPDFOperatorTableCreate", lua_CGPDFOperatorTableCreate},
    {"CGPDFOperatorTableRetain", lua_CGPDFOperatorTableRetain},
    {"CGPDFOperatorTableRelease", lua_CGPDFOperatorTableRelease},
    {"CGPDFOperatorTableSetCallback", lua_CGPDFOperatorTableSetCallback},
    {NULL, NULL},
};


int LuaOpenCGPDFOperatorTable(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFOperatorTableAPIs);
    return 0;
}
