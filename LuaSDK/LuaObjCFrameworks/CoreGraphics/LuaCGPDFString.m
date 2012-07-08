//
//  LuaCGPDFString.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFString.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"


static int lua_CGPDFStringGetLength(lua_State *L)
{
    lua_pushinteger(L, CGPDFStringGetLength(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFStringGetBytePtr(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGPDFStringGetBytePtr(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFStringCopyTextString(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGPDFStringCopyTextString(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFStringCopyDate(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGPDFStringCopyDate(lua_touserdata(L, 1)));
    return 1;
}

static const luaL_Reg __LuaCGPDFStringAPIs[] = 
{
    {"CGPDFStringGetLength", lua_CGPDFStringGetLength},
    {"CGPDFStringGetBytePtr", lua_CGPDFStringGetBytePtr},
    {"CGPDFStringCopyTextString", lua_CGPDFStringCopyTextString},
    {"CGPDFStringCopyDate", lua_CGPDFStringCopyDate},
    {NULL, NULL},
};

int LuaOpenCGPDFString(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFStringAPIs);
    return 0;
}
