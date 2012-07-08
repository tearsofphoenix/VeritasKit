//
//  LuaALAssetsGroup.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaALAssetsGroup.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ALAssetsGroupEnumerationResultsBlock(lua_State *L)
{
    ALAssetsGroupEnumerationResultsBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsGroupPropertyName(lua_State *L)
{
    ALAssetsGroupPropertyName(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsGroupPropertyType(lua_State *L)
{
    ALAssetsGroupPropertyType(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsGroupPropertyPersistentID(lua_State *L)
{
    ALAssetsGroupPropertyPersistentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsGroupPropertyURL(lua_State *L)
{
    ALAssetsGroupPropertyURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsGroupEnumerationResultsBlock(lua_State *L)
{
    ALAssetsGroupEnumerationResultsBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsGroupEnumerationResultsBlock(lua_State *L)
{
    ALAssetsGroupEnumerationResultsBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsGroupEnumerationResultsBlock(lua_State *L)
{
    ALAssetsGroupEnumerationResultsBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsGroups(lua_State *L)
{
    ALAssetsGroups(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaALAssetsGroupAPIs[] = {
    {"ALAssetsGroupEnumerationResultsBlock", lua_ALAssetsGroupEnumerationResultsBlock},
    {"ALAssetsGroupPropertyName", lua_ALAssetsGroupPropertyName},
    {"ALAssetsGroupPropertyType", lua_ALAssetsGroupPropertyType},
    {"ALAssetsGroupPropertyPersistentID", lua_ALAssetsGroupPropertyPersistentID},
    {"ALAssetsGroupPropertyURL", lua_ALAssetsGroupPropertyURL},
    {"ALAssetsGroupEnumerationResultsBlock", lua_ALAssetsGroupEnumerationResultsBlock},
    {"ALAssetsGroupEnumerationResultsBlock", lua_ALAssetsGroupEnumerationResultsBlock},
    {"ALAssetsGroupEnumerationResultsBlock", lua_ALAssetsGroupEnumerationResultsBlock},
    {"ALAssetsGroups", lua_ALAssetsGroups},
    {NULL, NULL},
};

int LuaOpenALAssetsGroup(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaALAssetsGroupAPIs);
    return 0;
}
