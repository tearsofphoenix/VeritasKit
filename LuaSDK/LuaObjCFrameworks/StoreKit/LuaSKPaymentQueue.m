//
//  LuaSKPaymentQueue.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSKPaymentQueue.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaSKPaymentQueueAPIs[] = {
    {NULL, NULL},
};

int LuaOpenSKPaymentQueue(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSKPaymentQueueAPIs);
    return 0;
}
