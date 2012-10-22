//
//  LuaNSString.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSString.h"

#import "LuaObjCAuxiliary.h"

static int lua_NSConstantStringCreate(lua_State *L)
{
    const char* str = lua_tostring(L, 1);
    NSString *constantString = [[[NSString alloc] initWithUTF8String: str] autorelease];
    LuaObjCPushObject(L, constantString, true, false);
    return 1;
}

static const luaL_Reg __LuaNSStringFunctions[] = 
{
    {"__NSConstantString", lua_NSConstantStringCreate},
    {NULL, NULL},
};

int LuaObjCOpenNSString(lua_State *L)
{
    LuaObjCLoadGlobalFunctions(L, __LuaNSStringFunctions);
    return 0;
}
