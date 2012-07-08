//
//  LuaCFBinaryHeap.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFBinaryHeap.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFBinaryHeaps(lua_State *L)
{
    CFBinaryHeaps(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapCompareContext(lua_State *L)
{
    CFBinaryHeapCompareContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapCallBacks(lua_State *L)
{
    CFBinaryHeapCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapCallBacks(lua_State *L)
{
    CFBinaryHeapCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapCallBacks(lua_State *L)
{
    CFBinaryHeapCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapCallBacks(lua_State *L)
{
    CFBinaryHeapCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapApplierFunction(lua_State *L)
{
    CFBinaryHeapApplierFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapApplierFunction(lua_State *L)
{
    CFBinaryHeapApplierFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapRef(lua_State *L)
{
    CFBinaryHeapRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeaps(lua_State *L)
{
    CFBinaryHeaps(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapRef(lua_State *L)
{
    CFBinaryHeapRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetTypeID(lua_State *L)
{
    CFBinaryHeapGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetTypeID(lua_State *L)
{
    CFBinaryHeapGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapCreate(lua_State *L)
{
    CFBinaryHeapCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapCallBacks(lua_State *L)
{
    CFBinaryHeapCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapCallBacks(lua_State *L)
{
    CFBinaryHeapCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapCompareContext(lua_State *L)
{
    CFBinaryHeapCompareContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapRef(lua_State *L)
{
    CFBinaryHeapRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapCreateCopy(lua_State *L)
{
    CFBinaryHeapCreateCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapRef(lua_State *L)
{
    CFBinaryHeapRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetCount(lua_State *L)
{
    CFBinaryHeapGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetCount(lua_State *L)
{
    CFBinaryHeapGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetCountOfValue(lua_State *L)
{
    CFBinaryHeapGetCountOfValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetCountOfValue(lua_State *L)
{
    CFBinaryHeapGetCountOfValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapContainsValue(lua_State *L)
{
    CFBinaryHeapContainsValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapContainsValue(lua_State *L)
{
    CFBinaryHeapContainsValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetMinimum(lua_State *L)
{
    CFBinaryHeapGetMinimum(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetMinimum(lua_State *L)
{
    CFBinaryHeapGetMinimum(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetMinimumIfPresent(lua_State *L)
{
    CFBinaryHeapGetMinimumIfPresent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetMinimumIfPresent(lua_State *L)
{
    CFBinaryHeapGetMinimumIfPresent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetValues(lua_State *L)
{
    CFBinaryHeapGetValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetCount(lua_State *L)
{
    CFBinaryHeapGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapGetValues(lua_State *L)
{
    CFBinaryHeapGetValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapApplyFunction(lua_State *L)
{
    CFBinaryHeapApplyFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapApplyFunction(lua_State *L)
{
    CFBinaryHeapApplyFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapAddValue(lua_State *L)
{
    CFBinaryHeapAddValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapAddValue(lua_State *L)
{
    CFBinaryHeapAddValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapRemoveMinimumValue(lua_State *L)
{
    CFBinaryHeapRemoveMinimumValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapRemoveMinimumValue(lua_State *L)
{
    CFBinaryHeapRemoveMinimumValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapRemoveAllValues(lua_State *L)
{
    CFBinaryHeapRemoveAllValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBinaryHeapRemoveAllValues(lua_State *L)
{
    CFBinaryHeapRemoveAllValues(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFBinaryHeapAPIs[] = {
    {"CFBinaryHeaps", lua_CFBinaryHeaps},
    {"CFBinaryHeapCompareContext", lua_CFBinaryHeapCompareContext},
    {"CFBinaryHeapCallBacks", lua_CFBinaryHeapCallBacks},
    {"CFBinaryHeapCallBacks", lua_CFBinaryHeapCallBacks},
    {"CFBinaryHeapCallBacks", lua_CFBinaryHeapCallBacks},
    {"CFBinaryHeapCallBacks", lua_CFBinaryHeapCallBacks},
    {"CFBinaryHeapApplierFunction", lua_CFBinaryHeapApplierFunction},
    {"CFBinaryHeapApplierFunction", lua_CFBinaryHeapApplierFunction},
    {"CFBinaryHeapRef", lua_CFBinaryHeapRef},
    {"CFBinaryHeaps", lua_CFBinaryHeaps},
    {"CFBinaryHeapRef", lua_CFBinaryHeapRef},
    {"CFBinaryHeapGetTypeID", lua_CFBinaryHeapGetTypeID},
    {"CFBinaryHeapGetTypeID", lua_CFBinaryHeapGetTypeID},
    {"CFBinaryHeapCreate", lua_CFBinaryHeapCreate},
    {"CFBinaryHeapCallBacks", lua_CFBinaryHeapCallBacks},
    {"CFBinaryHeapCallBacks", lua_CFBinaryHeapCallBacks},
    {"CFBinaryHeapCompareContext", lua_CFBinaryHeapCompareContext},
    {"CFBinaryHeapRef", lua_CFBinaryHeapRef},
    {"CFBinaryHeapCreateCopy", lua_CFBinaryHeapCreateCopy},
    {"CFBinaryHeapRef", lua_CFBinaryHeapRef},
    {"CFBinaryHeapGetCount", lua_CFBinaryHeapGetCount},
    {"CFBinaryHeapGetCount", lua_CFBinaryHeapGetCount},
    {"CFBinaryHeapGetCountOfValue", lua_CFBinaryHeapGetCountOfValue},
    {"CFBinaryHeapGetCountOfValue", lua_CFBinaryHeapGetCountOfValue},
    {"CFBinaryHeapContainsValue", lua_CFBinaryHeapContainsValue},
    {"CFBinaryHeapContainsValue", lua_CFBinaryHeapContainsValue},
    {"CFBinaryHeapGetMinimum", lua_CFBinaryHeapGetMinimum},
    {"CFBinaryHeapGetMinimum", lua_CFBinaryHeapGetMinimum},
    {"CFBinaryHeapGetMinimumIfPresent", lua_CFBinaryHeapGetMinimumIfPresent},
    {"CFBinaryHeapGetMinimumIfPresent", lua_CFBinaryHeapGetMinimumIfPresent},
    {"CFBinaryHeapGetValues", lua_CFBinaryHeapGetValues},
    {"CFBinaryHeapGetCount", lua_CFBinaryHeapGetCount},
    {"CFBinaryHeapGetValues", lua_CFBinaryHeapGetValues},
    {"CFBinaryHeapApplyFunction", lua_CFBinaryHeapApplyFunction},
    {"CFBinaryHeapApplyFunction", lua_CFBinaryHeapApplyFunction},
    {"CFBinaryHeapAddValue", lua_CFBinaryHeapAddValue},
    {"CFBinaryHeapAddValue", lua_CFBinaryHeapAddValue},
    {"CFBinaryHeapRemoveMinimumValue", lua_CFBinaryHeapRemoveMinimumValue},
    {"CFBinaryHeapRemoveMinimumValue", lua_CFBinaryHeapRemoveMinimumValue},
    {"CFBinaryHeapRemoveAllValues", lua_CFBinaryHeapRemoveAllValues},
    {"CFBinaryHeapRemoveAllValues", lua_CFBinaryHeapRemoveAllValues},
    {NULL, NULL},
};

int LuaOpenCFBinaryHeap(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFBinaryHeapAPIs);
    return 0;
}
