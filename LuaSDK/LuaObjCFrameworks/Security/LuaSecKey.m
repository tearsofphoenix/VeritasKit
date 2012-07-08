//
//  LuaSecKey.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSecKey.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SecKeyRawSign(lua_State *L)
{
    SecKeyRawSign(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRawSign(lua_State *L)
{
    SecKeyRawSign(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRawSign(lua_State *L)
{
    SecKeyRawSign(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGetTypeID(lua_State *L)
{
    SecKeyGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGetTypeID(lua_State *L)
{
    SecKeyGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGeneratePair(lua_State *L)
{
    SecKeyGeneratePair(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGeneratePair(lua_State *L)
{
    SecKeyGeneratePair(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRef(lua_State *L)
{
    SecKeyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRef(lua_State *L)
{
    SecKeyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGeneratePair(lua_State *L)
{
    SecKeyGeneratePair(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRef(lua_State *L)
{
    SecKeyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRawSign(lua_State *L)
{
    SecKeyRawSign(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGetBlockSize(lua_State *L)
{
    SecKeyGetBlockSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRawSign(lua_State *L)
{
    SecKeyRawSign(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRef(lua_State *L)
{
    SecKeyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRawVerify(lua_State *L)
{
    SecKeyRawVerify(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRawVerify(lua_State *L)
{
    SecKeyRawVerify(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRef(lua_State *L)
{
    SecKeyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyEncrypt(lua_State *L)
{
    SecKeyEncrypt(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGetBlockSize(lua_State *L)
{
    SecKeyGetBlockSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGetBlockSize(lua_State *L)
{
    SecKeyGetBlockSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyEncrypt(lua_State *L)
{
    SecKeyEncrypt(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRef(lua_State *L)
{
    SecKeyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyDecrypt(lua_State *L)
{
    SecKeyDecrypt(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGetBlockSize(lua_State *L)
{
    SecKeyGetBlockSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyDecrypt(lua_State *L)
{
    SecKeyDecrypt(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyRef(lua_State *L)
{
    SecKeyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGetBlockSize(lua_State *L)
{
    SecKeyGetBlockSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecKeyGetBlockSize(lua_State *L)
{
    SecKeyGetBlockSize(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSecKeyAPIs[] = {
    {"SecKeyRawSign", lua_SecKeyRawSign},
    {"SecKeyRawSign", lua_SecKeyRawSign},
    {"SecKeyRawSign", lua_SecKeyRawSign},
    {"SecKeyGetTypeID", lua_SecKeyGetTypeID},
    {"SecKeyGetTypeID", lua_SecKeyGetTypeID},
    {"SecKeyGeneratePair", lua_SecKeyGeneratePair},
    {"SecKeyGeneratePair", lua_SecKeyGeneratePair},
    {"SecKeyRef", lua_SecKeyRef},
    {"SecKeyRef", lua_SecKeyRef},
    {"SecKeyGeneratePair", lua_SecKeyGeneratePair},
    {"SecKeyRef", lua_SecKeyRef},
    {"SecKeyRawSign", lua_SecKeyRawSign},
    {"SecKeyGetBlockSize", lua_SecKeyGetBlockSize},
    {"SecKeyRawSign", lua_SecKeyRawSign},
    {"SecKeyRef", lua_SecKeyRef},
    {"SecKeyRawVerify", lua_SecKeyRawVerify},
    {"SecKeyRawVerify", lua_SecKeyRawVerify},
    {"SecKeyRef", lua_SecKeyRef},
    {"SecKeyEncrypt", lua_SecKeyEncrypt},
    {"SecKeyGetBlockSize", lua_SecKeyGetBlockSize},
    {"SecKeyGetBlockSize", lua_SecKeyGetBlockSize},
    {"SecKeyEncrypt", lua_SecKeyEncrypt},
    {"SecKeyRef", lua_SecKeyRef},
    {"SecKeyDecrypt", lua_SecKeyDecrypt},
    {"SecKeyGetBlockSize", lua_SecKeyGetBlockSize},
    {"SecKeyDecrypt", lua_SecKeyDecrypt},
    {"SecKeyRef", lua_SecKeyRef},
    {"SecKeyGetBlockSize", lua_SecKeyGetBlockSize},
    {"SecKeyGetBlockSize", lua_SecKeyGetBlockSize},
    {NULL, NULL},
};

int LuaOpenSecKey(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSecKeyAPIs);
    return 0;
}
