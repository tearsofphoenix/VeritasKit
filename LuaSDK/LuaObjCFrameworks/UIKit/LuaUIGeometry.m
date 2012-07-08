//
//  LuaUIGeometry.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIGeometry.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaCGGeometry.h"

int lua_pushUIEdgeInsets(lua_State *L, UIEdgeInsets edgeInsets)
{
    UIEdgeInsets *e = lua_newuserdata(L, sizeof(UIEdgeInsets));
    *e = edgeInsets;
    
    luaL_getmetatable(L, LUA_UIEdgeInsets_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}
static int lua_UIEdgeInsetsMake(lua_State *L) 
{
    lua_pushUIEdgeInsets(L, UIEdgeInsetsMake(lua_tonumber(L, 1),
                                             lua_tonumber(L, 2),
                                             lua_tonumber(L, 3),
                                             lua_tonumber(L, 4)));
    return 1;
}

static int lua_UIEdgeInsetsInsetRect(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    UIEdgeInsets *insets = lua_touserdata(L, 2);
    lua_pushCGRect(L, UIEdgeInsetsInsetRect(*rect, *insets));
    return 1;
}

int lua_pushUIOffset(lua_State *L, UIOffset offset)
{
    UIOffset *o = lua_newuserdata(L, sizeof(UIOffset));
    *o = offset;
    
    luaL_getmetatable(L, LUA_UIOffset_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}

static int lua_UIOffsetMake(lua_State *L)
{
    lua_pushUIOffset(L, UIOffsetMake(lua_tonumber(L, 1), lua_tonumber(L, 2)));
    return 1;
}

static int lua_UIEdgeInsetsEqualToEdgeInsets(lua_State *L)
{
    UIEdgeInsets *insets1 = lua_touserdata(L, 1);
    UIEdgeInsets *insets2 = lua_touserdata(L, 2);
    lua_pushboolean(L, UIEdgeInsetsEqualToEdgeInsets(*insets1, *insets2));
    return 1;
}

static int lua_UIOffsetEqualToOffset(lua_State *L)
{
    UIOffset *offset1 = lua_touserdata(L, 1);
    UIOffset *offset2 = lua_touserdata(L, 2);
    lua_pushboolean(L, UIOffsetEqualToOffset(*offset1, *offset2));
    return 1;
}

static const luaL_Reg __LuaUIGeometryAPIs[] = 
{
    {"UIEdgeInsetsMake", lua_UIEdgeInsetsMake},
    {"UIEdgeInsetsInsetRect", lua_UIEdgeInsetsInsetRect},
    {"UIOffsetMake", lua_UIOffsetMake},
    {"UIEdgeInsetsEqualToEdgeInsets", lua_UIEdgeInsetsEqualToEdgeInsets},
    {"UIOffsetEqualToOffset", lua_UIOffsetEqualToOffset},
    {NULL, NULL},
};

int LuaOpenUIGeometry(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaUIGeometryAPIs);
    return 0;
}
