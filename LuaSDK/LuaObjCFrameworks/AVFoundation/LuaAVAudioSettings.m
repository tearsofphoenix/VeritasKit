//
//  LuaAVAudioSettings.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVAudioSettings.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaAVAudioSettingsAPIs[] = {
    {NULL, NULL},
};

int LuaOpenAVAudioSettings(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVAudioSettingsAPIs);
    return 0;
}
