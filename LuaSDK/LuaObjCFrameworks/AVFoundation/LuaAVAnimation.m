//
//  LuaAVAnimation.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVAnimation.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaAVAnimationAPIs[] = {
    {NULL, NULL},
};

int LuaOpenAVAnimation(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVAnimationAPIs);
    return 0;
}
