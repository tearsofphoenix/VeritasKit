//
//  LuaNSDecimal.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSDecimal.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"


static const LuaSDKConst __luaNSDecimalConstants[] = 
{
    {"NSRoundPlain", NSRoundPlain},
    {"NSRoundDown", NSRoundDown},
    {"NSRoundUp", NSRoundUp},
    {"NSRoundBankers", NSRoundBankers},
    {"NSCalculationNoError", NSCalculationNoError},
    {"NSCalculationLossOfPrecision", NSCalculationLossOfPrecision},
    {"NSCalculationUnderflow", NSCalculationUnderflow},
    {"NSCalculationOverflow", NSCalculationOverflow},
    {"NSCalculationDivideByZero", NSCalculationDivideByZero},
    {NULL, 0},
};


static int lua_NSDecimalIsNotANumber(lua_State *L)
{
    lua_pushboolean(L, NSDecimalIsNotANumber(lua_touserdata(L, 1)));
    return 1;
}

static int lua_NSDecimalCopy(lua_State *L)
{
    NSDecimalCopy(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_NSDecimalCompact(lua_State *L)
{
    NSDecimalCompact(lua_touserdata(L, 1));
    return 0;
}

static int lua_NSDecimalCompare(lua_State *L)
{
    lua_pushinteger(L, NSDecimalCompare(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_NSDecimalRound(lua_State *L)
{
    NSDecimalRound(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_tointeger(L, 3), lua_tointeger(L, 4));
    return 0;
}

static int lua_NSDecimalNormalize(lua_State *L)
{
    lua_pushinteger(L, NSDecimalNormalize(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_tointeger(L, 3)));
    return 1;
}

static int lua_NSDecimalAdd(lua_State *L)
{
    lua_pushinteger(L, NSDecimalAdd(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_touserdata(L, 3), lua_tointeger(L, 4)));
    return 1;
}

static int lua_NSDecimalSubtract(lua_State *L)
{
    lua_pushinteger(L, NSDecimalSubtract(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_touserdata(L, 3), lua_tointeger(L, 4)));
    return 1;
}

static int lua_NSDecimalMultiply(lua_State *L)
{
    lua_pushinteger(L, NSDecimalMultiply(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_touserdata(L, 3), lua_tointeger(L, 4)));
    return 1;
}

static int lua_NSDecimalDivide(lua_State *L)
{
    lua_pushinteger(L, NSDecimalDivide(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_touserdata(L, 3), lua_tointeger(L, 4)));

    return 1;
}

static int lua_NSDecimalPower(lua_State *L)
{
    lua_pushinteger(L, NSDecimalPower(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_tointeger(L, 3), lua_tointeger(L, 4)));

    return 1;
}

static int lua_NSDecimalMultiplyByPowerOf10(lua_State *L)
{
    lua_pushinteger(L, NSDecimalMultiplyByPowerOf10(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_tointeger(L, 3), lua_tointeger(L, 4)));
    return 1;
}

static int lua_NSDecimalString(lua_State *L)
{
   luaObjC_pushNSObject(L, NSDecimalString(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static const luaL_Reg __luaNSDecimalAPIs[] = 
    {

    {"NSDecimalIsNotANumber", lua_NSDecimalIsNotANumber},
    {"NSDecimalCopy", lua_NSDecimalCopy},
    {"NSDecimalCompact", lua_NSDecimalCompact},
    {"NSDecimalCompare", lua_NSDecimalCompare},
    {"NSDecimalCompare", lua_NSDecimalCompare},
    {"NSDecimalRound", lua_NSDecimalRound},
    {"NSDecimalNormalize", lua_NSDecimalNormalize},
    {"NSDecimalAdd", lua_NSDecimalAdd},
    {"NSDecimalSubtract", lua_NSDecimalSubtract},
    {"NSDecimalMultiply", lua_NSDecimalMultiply},
    {"NSDecimalDivide", lua_NSDecimalDivide},
    {"NSDecimalPower", lua_NSDecimalPower},
    {"NSDecimalMultiplyByPowerOf10", lua_NSDecimalMultiplyByPowerOf10},
    {"NSDecimalString", lua_NSDecimalString},
    {NULL, NULL},
};

int LuaOpenNSDecimal(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSDecimalConstants);
    luaObjC_loadGlobalFunctions(L, __luaNSDecimalAPIs);
    return 0;
}
