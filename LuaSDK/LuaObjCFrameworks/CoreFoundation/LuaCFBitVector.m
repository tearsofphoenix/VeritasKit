//
//  LuaCFBitVector.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFBitVector.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFBitVectorRef(lua_State *L)
{
    CFBitVectorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorGetTypeID(lua_State *L)
{
    CFBitVectorGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorRef(lua_State *L)
{
    CFBitVectorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorRef(lua_State *L)
{
    CFBitVectorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorCreateMutable(lua_State *L)
{
    CFBitVectorCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorCreateMutableCopy(lua_State *L)
{
    CFBitVectorCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorGetCount(lua_State *L)
{
    CFBitVectorGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorGetCountOfBit(lua_State *L)
{
    CFBitVectorGetCountOfBit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorContainsBit(lua_State *L)
{
    CFBitVectorContainsBit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorGetBitAtIndex(lua_State *L)
{
    CFBitVectorGetBitAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorGetBits(lua_State *L)
{
    CFBitVectorGetBits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorGetFirstIndexOfBit(lua_State *L)
{
    CFBitVectorGetFirstIndexOfBit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorGetLastIndexOfBit(lua_State *L)
{
    CFBitVectorGetLastIndexOfBit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorSetCount(lua_State *L)
{
    CFBitVectorSetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorFlipBitAtIndex(lua_State *L)
{
    CFBitVectorFlipBitAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorFlipBits(lua_State *L)
{
    CFBitVectorFlipBits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorSetBitAtIndex(lua_State *L)
{
    CFBitVectorSetBitAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorSetBits(lua_State *L)
{
    CFBitVectorSetBits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBitVectorSetAllBits(lua_State *L)
{
    CFBitVectorSetAllBits(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFBitVectorAPIs[] = {
    {"CFBitVectorRef", lua_CFBitVectorRef},
    {"CFBitVectorGetTypeID", lua_CFBitVectorGetTypeID},
    {"CFBitVectorRef", lua_CFBitVectorRef},
    {"CFBitVectorRef", lua_CFBitVectorRef},
    {"CFBitVectorCreateMutable", lua_CFBitVectorCreateMutable},
    {"CFBitVectorCreateMutableCopy", lua_CFBitVectorCreateMutableCopy},
    {"CFBitVectorGetCount", lua_CFBitVectorGetCount},
    {"CFBitVectorGetCountOfBit", lua_CFBitVectorGetCountOfBit},
    {"CFBitVectorContainsBit", lua_CFBitVectorContainsBit},
    {"CFBitVectorGetBitAtIndex", lua_CFBitVectorGetBitAtIndex},
    {"CFBitVectorGetBits", lua_CFBitVectorGetBits},
    {"CFBitVectorGetFirstIndexOfBit", lua_CFBitVectorGetFirstIndexOfBit},
    {"CFBitVectorGetLastIndexOfBit", lua_CFBitVectorGetLastIndexOfBit},
    {"CFBitVectorSetCount", lua_CFBitVectorSetCount},
    {"CFBitVectorFlipBitAtIndex", lua_CFBitVectorFlipBitAtIndex},
    {"CFBitVectorFlipBits", lua_CFBitVectorFlipBits},
    {"CFBitVectorSetBitAtIndex", lua_CFBitVectorSetBitAtIndex},
    {"CFBitVectorSetBits", lua_CFBitVectorSetBits},
    {"CFBitVectorSetAllBits", lua_CFBitVectorSetAllBits},
    {NULL, NULL},
};

int LuaOpenCFBitVector(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFBitVectorAPIs);
    return 0;
}
