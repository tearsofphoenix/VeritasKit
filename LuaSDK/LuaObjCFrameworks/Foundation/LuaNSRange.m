//
//  LuaNSRange.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSRange.h"
#import "lua.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaObjCAuxiliary.h"
#import "LuaObjCFrameworkFunctions.h"

int lua_pushNSRange(lua_State *L, NSRange r)
{
    NSRange *range = lua_newuserdata(L, sizeof(NSRange));
    *range = r;
    
    luaL_getmetatable(L, LUA_NSRange_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}

static int lua_NSMakeRange(lua_State *L) 
{
    NSUInteger loc = lua_tointeger(L, 1);
    NSUInteger len = lua_tointeger(L, 2);
    
    NSRange *range = lua_newuserdata(L, sizeof(NSRange));
    range->location = loc;
    range->length = len;
    
    luaL_getmetatable(L, LUA_NSRange_METANAME);
    lua_setmetatable(L, -2);
    return 1;

}

static int lua_NSMaxRange(lua_State *L) 
{
    NSRange *range = luaL_checkudata(L, 1, LUA_NSRange_METANAME);
    lua_pushinteger(L, NSMaxRange(*range));
    return 1;
}

static int lua_NSLocationInRange(lua_State *L) 
{
    NSUInteger loc = lua_tointeger(L, 1);
    NSRange *range = luaL_checkudata(L, 2, LUA_NSRange_METANAME);
    lua_pushboolean(L, NSLocationInRange(loc, *range));
    return 1;
}

static int lua_NSEqualRanges(lua_State *L) 
{
    NSRange *range1 = luaL_checkudata(L, 1, LUA_NSRange_METANAME);
    NSRange *range2 = luaL_checkudata(L, 2, LUA_NSRange_METANAME);

    lua_pushboolean(L, NSEqualRanges(*range1, *range2));
    return 1;
}

static int lua_NSUnionRange(lua_State *L)
{
    NSRange *range1 = luaL_checkudata(L, 1, LUA_NSRange_METANAME);
    NSRange *range2 = luaL_checkudata(L, 2, LUA_NSRange_METANAME);
    
    lua_pushNSRange(L, NSUnionRange(*range1, *range2));
    return 1;
}
 static int lua_NSIntersectionRange(lua_State *L)
{
    NSRange *range1 = luaL_checkudata(L, 1, LUA_NSRange_METANAME);
    NSRange *range2 = luaL_checkudata(L, 2, LUA_NSRange_METANAME);
    
    lua_pushNSRange(L, NSIntersectionRange(*range1, *range2));
    return 1;
}
 
static int lua_NSStringFromRange(lua_State *L)
{
    NSRange *range = luaL_checkudata(L, 1, LUA_NSRange_METANAME);
    luaObjC_pushNSObject(L, NSStringFromRange(*range));
    return 1;
}

static int lua_NSRangeFromString(lua_State *L)
{
    NSString *aString = luaObjC_checkNSObject(L, 1);
    lua_pushNSRange(L, NSRangeFromString(aString));
    return 1;
}

static int lua_NSRangeIndex(lua_State *L)
{
    NSRange *r = luaL_checkudata(L, 1, LUA_NSRange_METANAME);
    const char *fieldName = lua_tostring(L, 2);
    if (!strcmp(fieldName, "location"))
    {
        lua_pushnumber(L, r->location);
        return 1;
        
    }else if (!strcmp(fieldName, "length"))
    {
        lua_pushnumber(L, r->length);
        return 1;
    }
    return 0;
}

static int lua_NSRangeNewIndex(lua_State *L)
{
    NSRange *r = luaL_checkudata(L, 1, LUA_NSRange_METANAME);
    const char *fieldName = lua_tostring(L, 2);
    if (!strcmp(fieldName, "location"))
    {
        r->location = lua_tointeger(L, 3);
        
    }else if (!strcmp(fieldName, "length"))
    {
        r->length = lua_tointeger(L, 3);
    }
    return 0;
}

static const luaL_Reg __luaNSRangeMetaMethods[] =
{
    {"__gc", luaObjCInternal_StructGarbageCollection},
    {"__index", lua_NSRangeIndex},
    {"__newindex", lua_NSRangeNewIndex},
    {NULL, NULL},
};

static const luaL_Reg __luaNSRangeAPIs[] = {
    {"NSMakeRange", lua_NSMakeRange},
    {"NSMaxRange", lua_NSMaxRange},
    {"NSLocationInRange", lua_NSLocationInRange},
    {"NSEqualRanges", lua_NSEqualRanges},
    {"NSUnionRange", lua_NSUnionRange},
    {"NSIntersectionRange", lua_NSIntersectionRange},
    {"NSStringFromRange", lua_NSStringFromRange},
    {"NSRangeFromString", lua_NSRangeFromString},
    {NULL, NULL},
};

int LuaOpenNSRange(lua_State *L)
{
    luaObjCInternal_createmeta(L, LUA_NSRange_METANAME, __luaNSRangeMetaMethods);

    luaObjC_loadGlobalFunctions(L, __luaNSRangeAPIs);
    
    return 0;
}
