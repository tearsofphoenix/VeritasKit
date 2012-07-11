//
//  LuaNSUndoManager.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSUndoManager.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSUndoManagerConstants[] = 
{
    {"NSUndoCloseGroupingRunLoopOrdering", NSUndoCloseGroupingRunLoopOrdering},
    {NULL, 0},
};


int LuaOpenNSUndoManager(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSUndoManagerConstants);
    return 0;
}
