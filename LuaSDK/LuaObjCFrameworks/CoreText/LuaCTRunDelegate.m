//
//  LuaCTRunDelegate.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTRunDelegate.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTRunDelegateRef(lua_State *L)
{
    CTRunDelegateRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetTypeID(lua_State *L)
{
    CTRunDelegateGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetTypeID(lua_State *L)
{
    CTRunDelegateGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateDeallocateCallback(lua_State *L)
{
    CTRunDelegateDeallocateCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCreate(lua_State *L)
{
    CTRunDelegateCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateDeallocateCallback(lua_State *L)
{
    CTRunDelegateDeallocateCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetAscentCallback(lua_State *L)
{
    CTRunDelegateGetAscentCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCreate(lua_State *L)
{
    CTRunDelegateCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetAscentCallback(lua_State *L)
{
    CTRunDelegateGetAscentCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetDescentCallback(lua_State *L)
{
    CTRunDelegateGetDescentCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCreate(lua_State *L)
{
    CTRunDelegateCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetDescentCallback(lua_State *L)
{
    CTRunDelegateGetDescentCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetWidthCallback(lua_State *L)
{
    CTRunDelegateGetWidthCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCreate(lua_State *L)
{
    CTRunDelegateCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetWidthCallback(lua_State *L)
{
    CTRunDelegateGetWidthCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCallbacks(lua_State *L)
{
    CTRunDelegateCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCreate(lua_State *L)
{
    CTRunDelegateCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCurrentVersion(lua_State *L)
{
    CTRunDelegateCurrentVersion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateDeallocateCallback(lua_State *L)
{
    CTRunDelegateDeallocateCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetAscentCallback(lua_State *L)
{
    CTRunDelegateGetAscentCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetDescentCallback(lua_State *L)
{
    CTRunDelegateGetDescentCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetWidthCallback(lua_State *L)
{
    CTRunDelegateGetWidthCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCallbacks(lua_State *L)
{
    CTRunDelegateCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCallbacks(lua_State *L)
{
    CTRunDelegateCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCreate(lua_State *L)
{
    CTRunDelegateCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateVersion1(lua_State *L)
{
    CTRunDelegateVersion1(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCurrentVersion(lua_State *L)
{
    CTRunDelegateCurrentVersion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCreate(lua_State *L)
{
    CTRunDelegateCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateRef(lua_State *L)
{
    CTRunDelegateRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateCallbacks(lua_State *L)
{
    CTRunDelegateCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetRefCon(lua_State *L)
{
    CTRunDelegateGetRefCon(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateGetRefCon(lua_State *L)
{
    CTRunDelegateGetRefCon(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDelegateRef(lua_State *L)
{
    CTRunDelegateRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTRunDelegateAPIs[] = {
    {"CTRunDelegateRef", lua_CTRunDelegateRef},
    {"CTRunDelegateGetTypeID", lua_CTRunDelegateGetTypeID},
    {"CTRunDelegateGetTypeID", lua_CTRunDelegateGetTypeID},
    {"CTRunDelegateDeallocateCallback", lua_CTRunDelegateDeallocateCallback},
    {"CTRunDelegateCreate", lua_CTRunDelegateCreate},
    {"CTRunDelegateDeallocateCallback", lua_CTRunDelegateDeallocateCallback},
    {"CTRunDelegateGetAscentCallback", lua_CTRunDelegateGetAscentCallback},
    {"CTRunDelegateCreate", lua_CTRunDelegateCreate},
    {"CTRunDelegateGetAscentCallback", lua_CTRunDelegateGetAscentCallback},
    {"CTRunDelegateGetDescentCallback", lua_CTRunDelegateGetDescentCallback},
    {"CTRunDelegateCreate", lua_CTRunDelegateCreate},
    {"CTRunDelegateGetDescentCallback", lua_CTRunDelegateGetDescentCallback},
    {"CTRunDelegateGetWidthCallback", lua_CTRunDelegateGetWidthCallback},
    {"CTRunDelegateCreate", lua_CTRunDelegateCreate},
    {"CTRunDelegateGetWidthCallback", lua_CTRunDelegateGetWidthCallback},
    {"CTRunDelegateCallbacks", lua_CTRunDelegateCallbacks},
    {"CTRunDelegateCreate", lua_CTRunDelegateCreate},
    {"CTRunDelegateCurrentVersion", lua_CTRunDelegateCurrentVersion},
    {"CTRunDelegateDeallocateCallback", lua_CTRunDelegateDeallocateCallback},
    {"CTRunDelegateGetAscentCallback", lua_CTRunDelegateGetAscentCallback},
    {"CTRunDelegateGetDescentCallback", lua_CTRunDelegateGetDescentCallback},
    {"CTRunDelegateGetWidthCallback", lua_CTRunDelegateGetWidthCallback},
    {"CTRunDelegateCallbacks", lua_CTRunDelegateCallbacks},
    {"CTRunDelegateCallbacks", lua_CTRunDelegateCallbacks},
    {"CTRunDelegateCreate", lua_CTRunDelegateCreate},
    {"CTRunDelegateVersion1", lua_CTRunDelegateVersion1},
    {"CTRunDelegateCurrentVersion", lua_CTRunDelegateCurrentVersion},
    {"CTRunDelegateCreate", lua_CTRunDelegateCreate},
    {"CTRunDelegateRef", lua_CTRunDelegateRef},
    {"CTRunDelegateCallbacks", lua_CTRunDelegateCallbacks},
    {"CTRunDelegateGetRefCon", lua_CTRunDelegateGetRefCon},
    {"CTRunDelegateGetRefCon", lua_CTRunDelegateGetRefCon},
    {"CTRunDelegateRef", lua_CTRunDelegateRef},
    {NULL, NULL},
};

int LuaOpenCTRunDelegate(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTRunDelegateAPIs);
    return 0;
}
