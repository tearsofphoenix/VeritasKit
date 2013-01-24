//
//  LuaNSString.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#include "LuaNSString.h"

#include "VMKAuxiliary.h"

#include <CoreFoundation/CFString.h>

static int lua_NSConstantStringCreate(lua_State *L)
{
    const char* str = lua_tostring(L, 1);
    
    CFStringRef constantString =  CFStringCreateWithCString(NULL, str, kCFStringEncodingUTF8);
    CFMakeCollectable(constantString);
    
    VMKPushObject(L, (id)constantString, true, false);
    return 1;
}

static const luaL_Reg __LuaNSStringFunctions[] = 
{
    {"__NSConstantString", lua_NSConstantStringCreate},
    {NULL, NULL},
};

int VMKOpenNSString(lua_State *L)
{
    VMKLoadGlobalFunctions(L, __LuaNSStringFunctions);
    return 0;
}
