//
//  LuaNSOperation.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSOperation.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSOperationConstants[] = 
{
    {"NSOperationQueuePriorityVeryLow", NSOperationQueuePriorityVeryLow},
    {"NSOperationQueuePriorityLow", NSOperationQueuePriorityLow},
    {"NSOperationQueuePriorityNormal", NSOperationQueuePriorityNormal},
    {"NSOperationQueuePriorityHigh", NSOperationQueuePriorityHigh},
    {"NSOperationQueuePriorityVeryHigh", NSOperationQueuePriorityVeryHigh},
    {"NSOperationQueueDefaultMaxConcurrentOperationCount", NSOperationQueueDefaultMaxConcurrentOperationCount},
    {NULL, 0},
};

int LuaOpenNSOperation(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSOperationConstants);
    return 0;
}
