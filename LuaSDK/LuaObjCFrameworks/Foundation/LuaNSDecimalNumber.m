//
//  LuaNSDecimalNumber.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSDecimalNumber.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

//TODO
/*
static const luaL_Reg __luaNSDecimalNumberAPIs[] = 
{
    {"NSDecimalNumberExactnessException", NSDecimalNumberExactnessException},
    {"NSDecimalNumberOverflowException", NSDecimalNumberOverflowException},
    {"NSDecimalNumberUnderflowException", NSDecimalNumberUnderflowException},
    {"NSDecimalNumberDivideByZeroException", NSDecimalNumberDivideByZeroException},
    {NULL, NULL},
};
*/

int LuaOpenNSDecimalNumber(lua_State *L)
{
//    luaObjC_loadGlobalFunctions(L, __LuaNSDecimalNumberAPIs);
    return 0;
}
