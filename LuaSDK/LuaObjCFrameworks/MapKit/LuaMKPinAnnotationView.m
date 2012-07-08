//
//  LuaMKPinAnnotationView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMKPinAnnotationView.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MKPinAnnotationViewInternal(lua_State *L)
{
    MKPinAnnotationViewInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKPinAnnotationViewInternal(lua_State *L)
{
    MKPinAnnotationViewInternal(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMKPinAnnotationViewAPIs[] = {
    {"MKPinAnnotationViewInternal", lua_MKPinAnnotationViewInternal},
    {"MKPinAnnotationViewInternal", lua_MKPinAnnotationViewInternal},
    {NULL, NULL},
};

int LuaOpenMKPinAnnotationView(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMKPinAnnotationViewAPIs);
    return 0;
}
