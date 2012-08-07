//
//  LuaNSString.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSString.h"
#import "lua.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

#import "LuaObjCAuxiliary.h"

static int lua_NSConstantStringCreate(lua_State *L)
{
    const char* str = lua_tostring(L, 1);
    NSString *constantString = [[NSString alloc] initWithUTF8String: str];
    luaObjC_pushNSObject(L, constantString);
    return 1;
}

static const luaL_Reg __LuaNSStringFunctions[] = 
{
    {"__NSConstantString", lua_NSConstantStringCreate},
    {NULL, NULL},
};

int LuaOpenNSString(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSStringFunctions);
    return 0;
}
