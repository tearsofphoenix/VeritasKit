//
//  LuaNSNetServices.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSNetServices.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSNetServicesConstants[] =  
{
    {"NSNetServicesUnknownError", NSNetServicesUnknownError},
    {"NSNetServicesCollisionError", NSNetServicesCollisionError},
    {"NSNetServicesNotFoundError", NSNetServicesNotFoundError},
    {"NSNetServicesActivityInProgress", NSNetServicesActivityInProgress},
    {"NSNetServicesBadArgumentError", NSNetServicesBadArgumentError},
    {"NSNetServicesCancelledError", NSNetServicesCancelledError},
    {"NSNetServicesInvalidError", NSNetServicesInvalidError},
    {"NSNetServicesTimeoutError", NSNetServicesTimeoutError},
    {"NSNetServiceNoAutoRename", NSNetServiceNoAutoRename},
    {NULL, 0},
};

int LuaOpenNSNetServices(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSNetServicesConstants);
    return 0;
}
