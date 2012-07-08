//
//  LuaMPMediaPlaylist.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMPMediaPlaylist.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MPMediaPlaylistAttributes(lua_State *L)
{
    MPMediaPlaylistAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistAttributeNone(lua_State *L)
{
    MPMediaPlaylistAttributeNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistAttributeOnTheGo(lua_State *L)
{
    MPMediaPlaylistAttributeOnTheGo(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistAttributeSmart(lua_State *L)
{
    MPMediaPlaylistAttributeSmart(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistAttributeGenius(lua_State *L)
{
    MPMediaPlaylistAttributeGenius(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistAttribute(lua_State *L)
{
    MPMediaPlaylistAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistPropertyPersistentID(lua_State *L)
{
    MPMediaPlaylistPropertyPersistentID(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistPropertyName(lua_State *L)
{
    MPMediaPlaylistPropertyName(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistPropertyPlaylistAttributes(lua_State *L)
{
    MPMediaPlaylistPropertyPlaylistAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistAttributeGenius(lua_State *L)
{
    MPMediaPlaylistAttributeGenius(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistAttributeGenius(lua_State *L)
{
    MPMediaPlaylistAttributeGenius(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPlaylistPropertySeedItems(lua_State *L)
{
    MPMediaPlaylistPropertySeedItems(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMPMediaPlaylistAPIs[] = {
    {"MPMediaPlaylistAttributes", lua_MPMediaPlaylistAttributes},
    {"MPMediaPlaylistAttributeNone", lua_MPMediaPlaylistAttributeNone},
    {"MPMediaPlaylistAttributeOnTheGo", lua_MPMediaPlaylistAttributeOnTheGo},
    {"MPMediaPlaylistAttributeSmart", lua_MPMediaPlaylistAttributeSmart},
    {"MPMediaPlaylistAttributeGenius", lua_MPMediaPlaylistAttributeGenius},
    {"MPMediaPlaylistAttribute", lua_MPMediaPlaylistAttribute},
    {"MPMediaPlaylistPropertyPersistentID", lua_MPMediaPlaylistPropertyPersistentID},
    {"MPMediaPlaylistPropertyName", lua_MPMediaPlaylistPropertyName},
    {"MPMediaPlaylistPropertyPlaylistAttributes", lua_MPMediaPlaylistPropertyPlaylistAttributes},
    {"MPMediaPlaylistAttributeGenius", lua_MPMediaPlaylistAttributeGenius},
    {"MPMediaPlaylistAttributeGenius", lua_MPMediaPlaylistAttributeGenius},
    {"MPMediaPlaylistPropertySeedItems", lua_MPMediaPlaylistPropertySeedItems},
    {NULL, NULL},
};

int LuaOpenMPMediaPlaylist(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMPMediaPlaylistAPIs);
    return 0;
}
