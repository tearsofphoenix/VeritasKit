//
//  LuaCAFFile.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCAFFile.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CAFFile_H_(lua_State *L)
{
    CAFFile_H_(lua_touserdata(L, 1));
    return 1;
}

static int lua_CAFFile_H_(lua_State *L)
{
    CAFFile_H_(lua_touserdata(L, 1));
    return 1;
}

static int lua_CAFFileHeader(lua_State *L)
{
    CAFFileHeader(lua_touserdata(L, 1));
    return 1;
}

static int lua_CAFFileHeader(lua_State *L)
{
    CAFFileHeader(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCAFFileAPIs[] = {
    {"CAFFile_H_", lua_CAFFile_H_},
    {"CAFFile_H_", lua_CAFFile_H_},
    {"CAFFileHeader", lua_CAFFileHeader},
    {"CAFFileHeader", lua_CAFFileHeader},
    {NULL, NULL},
};

int LuaOpenCAFFile(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCAFFileAPIs);
    return 0;
}
