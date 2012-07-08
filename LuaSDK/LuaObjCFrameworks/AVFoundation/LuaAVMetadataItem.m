//
//  LuaAVMetadataItem.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVMetadataItem.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVMetadataItems(lua_State *L)
{
    AVMetadataItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItems(lua_State *L)
{
    AVMetadataItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItems(lua_State *L)
{
    AVMetadataItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItemArrayFiltering(lua_State *L)
{
    AVMetadataItemArrayFiltering(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItemInternal(lua_State *L)
{
    AVMetadataItemInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItemInternal(lua_State *L)
{
    AVMetadataItemInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItemTypeCoercion(lua_State *L)
{
    AVMetadataItemTypeCoercion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItemArrayFiltering(lua_State *L)
{
    AVMetadataItemArrayFiltering(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItems(lua_State *L)
{
    AVMetadataItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItems(lua_State *L)
{
    AVMetadataItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItems(lua_State *L)
{
    AVMetadataItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataItems(lua_State *L)
{
    AVMetadataItems(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVMetadataItemAPIs[] = {
    {"AVMetadataItems", lua_AVMetadataItems},
    {"AVMetadataItems", lua_AVMetadataItems},
    {"AVMetadataItems", lua_AVMetadataItems},
    {"AVMetadataItemArrayFiltering", lua_AVMetadataItemArrayFiltering},
    {"AVMetadataItemInternal", lua_AVMetadataItemInternal},
    {"AVMetadataItemInternal", lua_AVMetadataItemInternal},
    {"AVMetadataItemTypeCoercion", lua_AVMetadataItemTypeCoercion},
    {"AVMetadataItemArrayFiltering", lua_AVMetadataItemArrayFiltering},
    {"AVMetadataItems", lua_AVMetadataItems},
    {"AVMetadataItems", lua_AVMetadataItems},
    {"AVMetadataItems", lua_AVMetadataItems},
    {"AVMetadataItems", lua_AVMetadataItems},
    {NULL, NULL},
};

int LuaOpenAVMetadataItem(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVMetadataItemAPIs);
    return 0;
}
