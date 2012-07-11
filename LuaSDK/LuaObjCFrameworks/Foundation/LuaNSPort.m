//
//  LuaNSPort.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSPort.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSPortConstants[] = 
{
#if MAC_OS_X_VERSION_10_5 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
    {"NSMachPortDeallocateNone", NSMachPortDeallocateNone},
    {"NSMachPortDeallocateSendRight", NSMachPortDeallocateSendRight},
    {"NSMachPortDeallocateReceiveRight", NSMachPortDeallocateReceiveRight},
#endif
    {NULL, 0},
};

int LuaOpenNSPort(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSPortConstants);
    return 0;
}
