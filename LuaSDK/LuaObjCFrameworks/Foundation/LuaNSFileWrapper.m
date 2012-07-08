//
//  LuaNSFileWrapper.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSFileWrapper.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaNSFileWrapperConstants[] = 
{
    {"NSFileWrapperReadingImmediate", NSFileWrapperReadingImmediate},
    {"NSFileWrapperReadingWithoutMapping", NSFileWrapperReadingWithoutMapping},
    {"NSFileWrapperWritingAtomic", NSFileWrapperWritingAtomic},
    {"NSFileWrapperWritingWithNameUpdating", NSFileWrapperWritingWithNameUpdating},
    {NULL, 0},
};

int LuaOpenNSFileWrapper(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSFileWrapperConstants);
    return 0;
}
