//
//  LuaAudioUnitParameters.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioUnitParameters.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaAudioUnitParametersAPIs[] = {
    {NULL, NULL},
};

int LuaOpenAudioUnitParameters(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioUnitParametersAPIs);
    return 0;
}
