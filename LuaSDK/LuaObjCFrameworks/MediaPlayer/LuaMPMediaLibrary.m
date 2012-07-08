//
//  LuaMPMediaLibrary.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMPMediaLibrary.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MPMediaLibraryDidChangeNotification(lua_State *L)
{
    MPMediaLibraryDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaLibraryDidChangeNotification(lua_State *L)
{
    MPMediaLibraryDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaLibraryDidChangeNotification(lua_State *L)
{
    MPMediaLibraryDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMPMediaLibraryAPIs[] = {
    {"MPMediaLibraryDidChangeNotification", lua_MPMediaLibraryDidChangeNotification},
    {"MPMediaLibraryDidChangeNotification", lua_MPMediaLibraryDidChangeNotification},
    {"MPMediaLibraryDidChangeNotification", lua_MPMediaLibraryDidChangeNotification},
    {NULL, NULL},
};

int LuaOpenMPMediaLibrary(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMPMediaLibraryAPIs);
    return 0;
}
