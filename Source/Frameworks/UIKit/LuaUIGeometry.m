//
//  LuaUIGeometry.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#include "LuaUIGeometry.h"
#include "VMKAuxiliary.h"
#include "LuaCGGeometry.h"
#include "VMKFrameworkFunctions.h"
#include <UIKit/UIGeometry.h>

int VMKPushUIEdgeInsets(lua_State *L, UIEdgeInsets edgeInsets)
{
    UIEdgeInsets *e = lua_newuserdata(L, sizeof(UIEdgeInsets));
    *e = edgeInsets;
    
    luaL_getmetatable(L, LUA_UIEdgeInsets_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}
static int lua_UIEdgeInsetsMake(lua_State *L) 
{
    VMKPushUIEdgeInsets(L, UIEdgeInsetsMake(lua_tonumber(L, 1),
                                             lua_tonumber(L, 2),
                                             lua_tonumber(L, 3),
                                             lua_tonumber(L, 4)));
    return 1;
}

static int lua_UIEdgeInsetsInsetRect(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    UIEdgeInsets *insets = lua_touserdata(L, 2);
    VMKPushCGRect(L, UIEdgeInsetsInsetRect(*rect, *insets));
    return 1;
}

int VMKPushUIOffset(lua_State *L, UIOffset offset)
{
    UIOffset *o = lua_newuserdata(L, sizeof(UIOffset));
    *o = offset;
    
    luaL_getmetatable(L, LUA_UIOffset_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}

static int lua_UIOffsetMake(lua_State *L)
{
    VMKPushUIOffset(L, UIOffsetMake(lua_tonumber(L, 1), lua_tonumber(L, 2)));
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
    {"UIEdgeInsetsEqualToEdgeInsets", lua_UIEdgeInsetsEqualToEdgeInsets},
    {NULL, NULL},
};

static const luaL_Reg __LuaUIOffsetAPIs [] =
{
    {"UIOffsetMake", lua_UIOffsetMake},
    {"UIOffsetEqualToOffset", lua_UIOffsetEqualToOffset},
    {NULL, NULL},
};

static int _luaUIEdgeInsetIndex(lua_State *L)
{
    UIEdgeInsets *obj = luaL_checkudata(L, 1, LUA_UIEdgeInsets_METANAME);
    const char *fieldName = lua_tostring(L, 2);
    if (!strcmp(fieldName, "top"))
    {
        lua_pushnumber(L, obj->top);
        return 1;
    }else if (!strcmp(fieldName, "bottom"))
    {
        lua_pushnumber(L, obj->bottom);
        return 1;
    }else if (!strcmp(fieldName, "left"))
    {
        lua_pushnumber(L, obj->left);
        return 1;
    }else if (!strcmp(fieldName, "right"))
    {
        lua_pushnumber(L, obj->right);
        return 1;
    }
    
    return 0;
}

static int _luaUIEdgeInsetNewIndex(lua_State *L)
{
    UIEdgeInsets *obj = luaL_checkudata(L, 1, LUA_UIEdgeInsets_METANAME);
    const char *fieldName = lua_tostring(L, 2);
    if (!strcmp(fieldName, "top"))
    {
        obj->top = lua_tonumber(L, 3);

    }else if (!strcmp(fieldName, "bottom"))
    {
        obj->bottom = lua_tonumber(L, 3);

    }else if (!strcmp(fieldName, "left"))
    {
        obj->left = lua_tonumber(L, 3);

    }else if (!strcmp(fieldName, "right"))
    {
        obj->right = lua_tonumber(L, 3);
    }
    
    return 0;
}

static const luaL_Reg __LuaUIEdgeInsetMetaMethods[] =
{
    {"__gc", LuaInternalStructGarbageCollection},
    {"__index", _luaUIEdgeInsetIndex},
    {"__newindex", _luaUIEdgeInsetNewIndex},
    {NULL, NULL},
};


static int _luaUIGeometryUIOffsetIndex(lua_State *L)
{
    UIOffset *o = luaL_checkudata(L, 1, LUA_UIOffset_METANAME);
    const char *fieldName = lua_tostring(L, 2);
    if (!strcmp(fieldName, "vertical"))
    {
        lua_pushnumber(L, o->vertical);
        return 1;
        
    }else if (!strcmp(fieldName, "horizontal"))
    {
        lua_pushnumber(L, o->horizontal);
        return 1;
    }
    
    return 0;
}

static int _luaUIGeometryUIOffsetNewIndex(lua_State *L)
{
    UIOffset *o = luaL_checkudata(L, 1, LUA_UIOffset_METANAME);
    const char *fieldName = lua_tostring(L, 2);
    if (!strcmp(fieldName, "vertical"))
    {
        o->vertical = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "horizontal"))
    {
        o->horizontal = lua_tonumber(L, 3);
    }
    
    return 0;
}

static const luaL_Reg __LuaUIOffsetMetaMethods[] =
{
    {"__gc", LuaInternalStructGarbageCollection},
    {"__index", _luaUIGeometryUIOffsetIndex},
    {"__newindex", _luaUIGeometryUIOffsetNewIndex},
    {NULL, NULL},
};

int VMKOpenUIGeometry(lua_State *L)
{
    VMKLoadCreateMetatable(L, LUA_UIEdgeInsets_METANAME, __LuaUIEdgeInsetMetaMethods);

    VMKLoadCreateMetatable(L, LUA_UIOffset_METANAME, __LuaUIOffsetMetaMethods);

    VMKLoadGlobalFunctions(L, __LuaUIGeometryAPIs);

    VMKLoadGlobalFunctions(L, __LuaUIOffsetAPIs);
    
    return 0;
}
