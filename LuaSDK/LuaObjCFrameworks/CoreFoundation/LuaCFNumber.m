//
//  LuaCFNumber.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFNumber.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFNumberSInt8Type(lua_State *L)
{
    CFNumberSInt8Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberSInt16Type(lua_State *L)
{
    CFNumberSInt16Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberSInt32Type(lua_State *L)
{
    CFNumberSInt32Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberSInt64Type(lua_State *L)
{
    CFNumberSInt64Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFloat32Type(lua_State *L)
{
    CFNumberFloat32Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFloat64Type(lua_State *L)
{
    CFNumberFloat64Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberCharType(lua_State *L)
{
    CFNumberCharType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberShortType(lua_State *L)
{
    CFNumberShortType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberIntType(lua_State *L)
{
    CFNumberIntType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberLongType(lua_State *L)
{
    CFNumberLongType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberLongLongType(lua_State *L)
{
    CFNumberLongLongType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFloatType(lua_State *L)
{
    CFNumberFloatType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberDoubleType(lua_State *L)
{
    CFNumberDoubleType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberCFIndexType(lua_State *L)
{
    CFNumberCFIndexType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberNSIntegerType(lua_State *L)
{
    CFNumberNSIntegerType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberCGFloatType(lua_State *L)
{
    CFNumberCGFloatType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberMaxType(lua_State *L)
{
    CFNumberMaxType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberMaxType(lua_State *L)
{
    CFNumberMaxType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberType(lua_State *L)
{
    CFNumberType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberRef(lua_State *L)
{
    CFNumberRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberRef(lua_State *L)
{
    CFNumberRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberRef(lua_State *L)
{
    CFNumberRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberRef(lua_State *L)
{
    CFNumberRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberGetTypeID(lua_State *L)
{
    CFNumberGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberRef(lua_State *L)
{
    CFNumberRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberCreate(lua_State *L)
{
    CFNumberCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberType(lua_State *L)
{
    CFNumberType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberGetByteSize(lua_State *L)
{
    CFNumberGetByteSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberIsFloatType(lua_State *L)
{
    CFNumberIsFloatType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberGetValue(lua_State *L)
{
    CFNumberGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumbers(lua_State *L)
{
    CFNumbers(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberCompare(lua_State *L)
{
    CFNumberCompare(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFNumberAPIs[] = {
    {"CFNumberSInt8Type", lua_CFNumberSInt8Type},
    {"CFNumberSInt16Type", lua_CFNumberSInt16Type},
    {"CFNumberSInt32Type", lua_CFNumberSInt32Type},
    {"CFNumberSInt64Type", lua_CFNumberSInt64Type},
    {"CFNumberFloat32Type", lua_CFNumberFloat32Type},
    {"CFNumberFloat64Type", lua_CFNumberFloat64Type},
    {"CFNumberCharType", lua_CFNumberCharType},
    {"CFNumberShortType", lua_CFNumberShortType},
    {"CFNumberIntType", lua_CFNumberIntType},
    {"CFNumberLongType", lua_CFNumberLongType},
    {"CFNumberLongLongType", lua_CFNumberLongLongType},
    {"CFNumberFloatType", lua_CFNumberFloatType},
    {"CFNumberDoubleType", lua_CFNumberDoubleType},
    {"CFNumberCFIndexType", lua_CFNumberCFIndexType},
    {"CFNumberNSIntegerType", lua_CFNumberNSIntegerType},
    {"CFNumberCGFloatType", lua_CFNumberCGFloatType},
    {"CFNumberMaxType", lua_CFNumberMaxType},
    {"CFNumberMaxType", lua_CFNumberMaxType},
    {"CFNumberType", lua_CFNumberType},
    {"CFNumberRef", lua_CFNumberRef},
    {"CFNumberRef", lua_CFNumberRef},
    {"CFNumberRef", lua_CFNumberRef},
    {"CFNumberRef", lua_CFNumberRef},
    {"CFNumberGetTypeID", lua_CFNumberGetTypeID},
    {"CFNumberRef", lua_CFNumberRef},
    {"CFNumberCreate", lua_CFNumberCreate},
    {"CFNumberType", lua_CFNumberType},
    {"CFNumberGetByteSize", lua_CFNumberGetByteSize},
    {"CFNumberIsFloatType", lua_CFNumberIsFloatType},
    {"CFNumberGetValue", lua_CFNumberGetValue},
    {"CFNumbers", lua_CFNumbers},
    {"CFNumberCompare", lua_CFNumberCompare},
    {NULL, NULL},
};

int LuaOpenCFNumber(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFNumberAPIs);
    return 0;
}
