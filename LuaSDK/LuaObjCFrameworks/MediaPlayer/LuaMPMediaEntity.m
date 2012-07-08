//
//  LuaMPMediaEntity.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMPMediaEntity.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MPMediaEntityPropertyPersistentID(lua_State *L)
{
    MPMediaEntityPropertyPersistentID(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMPMediaEntityAPIs[] = {
    {"MPMediaEntityPropertyPersistentID", lua_MPMediaEntityPropertyPersistentID},
    {NULL, NULL},
};

int LuaOpenMPMediaEntity(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMPMediaEntityAPIs);
    return 0;
}
