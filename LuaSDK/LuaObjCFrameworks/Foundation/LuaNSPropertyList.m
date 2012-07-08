//
//  LuaNSPropertyList.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSPropertyList.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSPropertyListConstants[] = 
{
    {"NSPropertyListImmutable", NSPropertyListImmutable},
    {"NSPropertyListMutableContainers", NSPropertyListMutableContainers},
    {"NSPropertyListMutableContainersAndLeaves", NSPropertyListMutableContainersAndLeaves},
    {"NSPropertyListOpenStepFormat", NSPropertyListOpenStepFormat},
    {"NSPropertyListXMLFormat_v1_0", NSPropertyListXMLFormat_v1_0},
    {"NSPropertyListBinaryFormat_v1_0", NSPropertyListBinaryFormat_v1_0},
    {NULL, 0},
};

int LuaOpenNSPropertyList(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSPropertyListConstants);
    return 0;
}
