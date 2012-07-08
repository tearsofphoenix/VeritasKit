//
//  LuaSKPaymentTransaction.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSKPaymentTransaction.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SKPaymentTransactionStatePurchasing(lua_State *L)
{
    SKPaymentTransactionStatePurchasing(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKPaymentTransactionStatePurchased(lua_State *L)
{
    SKPaymentTransactionStatePurchased(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKPaymentTransactionStateFailed(lua_State *L)
{
    SKPaymentTransactionStateFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKPaymentTransactionStateRestored(lua_State *L)
{
    SKPaymentTransactionStateRestored(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKPaymentTransactionState(lua_State *L)
{
    SKPaymentTransactionState(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKPaymentTransactionFailed(lua_State *L)
{
    SKPaymentTransactionFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKPaymentTransactionStateRestored(lua_State *L)
{
    SKPaymentTransactionStateRestored(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKPaymentTransactionStatePurchased(lua_State *L)
{
    SKPaymentTransactionStatePurchased(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKPaymentTransactionStatePurchased(lua_State *L)
{
    SKPaymentTransactionStatePurchased(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKPaymentTransactionStatePurchased(lua_State *L)
{
    SKPaymentTransactionStatePurchased(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKPaymentTransactionState(lua_State *L)
{
    SKPaymentTransactionState(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSKPaymentTransactionAPIs[] = {
    {"SKPaymentTransactionStatePurchasing", lua_SKPaymentTransactionStatePurchasing},
    {"SKPaymentTransactionStatePurchased", lua_SKPaymentTransactionStatePurchased},
    {"SKPaymentTransactionStateFailed", lua_SKPaymentTransactionStateFailed},
    {"SKPaymentTransactionStateRestored", lua_SKPaymentTransactionStateRestored},
    {"SKPaymentTransactionState", lua_SKPaymentTransactionState},
    {"SKPaymentTransactionFailed", lua_SKPaymentTransactionFailed},
    {"SKPaymentTransactionStateRestored", lua_SKPaymentTransactionStateRestored},
    {"SKPaymentTransactionStatePurchased", lua_SKPaymentTransactionStatePurchased},
    {"SKPaymentTransactionStatePurchased", lua_SKPaymentTransactionStatePurchased},
    {"SKPaymentTransactionStatePurchased", lua_SKPaymentTransactionStatePurchased},
    {"SKPaymentTransactionState", lua_SKPaymentTransactionState},
    {NULL, NULL},
};

int LuaOpenSKPaymentTransaction(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSKPaymentTransactionAPIs);
    return 0;
}
