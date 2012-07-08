//
//  LuaCIFeature.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCIFeature.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CIFeatureTypeFace(lua_State *L)
{
    CIFeatureTypeFace(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCIFeatureAPIs[] = {
    {"CIFeatureTypeFace", lua_CIFeatureTypeFace},
    {NULL, NULL},
};

int LuaOpenCIFeature(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCIFeatureAPIs);
    return 0;
}
