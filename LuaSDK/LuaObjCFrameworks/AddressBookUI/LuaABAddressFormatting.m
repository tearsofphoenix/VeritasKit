//
//  LuaABAddressFormatting.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaABAddressFormatting.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaObjCAuxiliary.h"

static int lua_ABCreateStringWithAddressDictionary(lua_State *L)
{
    luaObjC_pushNSObject(L, ABCreateStringWithAddressDictionary(luaObjC_checkNSObject(L, 1), lua_toboolean(L, 2)));
    return 1;
}

static const luaL_Reg __LuaABAddressFormattingAPIs[] = 
{
    {"ABCreateStringWithAddressDictionary", lua_ABCreateStringWithAddressDictionary},
    {NULL, NULL},
};

int LuaOpenABAddressFormatting(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaABAddressFormattingAPIs);
    return 0;
}
