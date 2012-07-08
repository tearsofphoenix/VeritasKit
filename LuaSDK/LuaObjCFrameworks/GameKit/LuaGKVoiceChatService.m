//
//  LuaGKVoiceChatService.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKVoiceChatService.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKVoiceChatServiceErrorDomain(lua_State *L)
{
    GKVoiceChatServiceErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKVoiceChatServiceAPIs[] = {
    {"GKVoiceChatServiceErrorDomain", lua_GKVoiceChatServiceErrorDomain},
    {NULL, NULL},
};

int LuaOpenGKVoiceChatService(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKVoiceChatServiceAPIs);
    return 0;
}
