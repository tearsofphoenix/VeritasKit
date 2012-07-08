//
//  LuaCFArray.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFArray.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"


static int lua_CFArrayGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CFArrayGetTypeID());
    return 1;
}

static int lua_CFArrayCreate(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CFArrayCreate(lua_touserdata(L, 1), lua_touserdata(L, 2),
                  lua_tointeger(L,3), lua_touserdata(L, 4)));
    return 1;
}

static int lua_CFArrayCreateCopy(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CFArrayCreateCopy(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CFArrayCreateMutable(lua_State *L)
{
    lua_pushlightuserdata(L, CFArrayCreateMutable(lua_touserdata(L, 1), lua_tointeger(L,2), lua_touserdata(L, 3)));
    return 1;
}


static int lua_CFArrayCreateMutableCopy(lua_State *L)
{
    lua_pushlightuserdata(L, CFArrayCreateMutableCopy(lua_touserdata(L, 1), lua_tointeger(L,2), lua_touserdata(L, 3)));

    return 1;
}

static int lua_CFArrayGetCount(lua_State *L)
{
    lua_pushinteger(L, CFArrayGetCount(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CFArrayGetCountOfValue(lua_State *L)
{
    CFArrayGetCountOfValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayContainsValue(lua_State *L)
{
    CFArrayContainsValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayGetValueAtIndex(lua_State *L)
{
    CFArrayGetValueAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayGetValues(lua_State *L)
{
    CFArrayGetValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayApplyFunction(lua_State *L)
{
    CFArrayApplyFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayGetFirstIndexOfValue(lua_State *L)
{
    CFArrayGetFirstIndexOfValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayGetLastIndexOfValue(lua_State *L)
{
    CFArrayGetLastIndexOfValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayBSearchValues(lua_State *L)
{
    CFArrayBSearchValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayAppendValue(lua_State *L)
{
    CFArrayAppendValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayInsertValueAtIndex(lua_State *L)
{
    CFArrayInsertValueAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArraySetValueAtIndex(lua_State *L)
{
    CFArraySetValueAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayRemoveValueAtIndex(lua_State *L)
{
    CFArrayRemoveValueAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayRemoveAllValues(lua_State *L)
{
    CFArrayRemoveAllValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayReplaceValues(lua_State *L)
{
    CFArrayReplaceValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayExchangeValuesAtIndices(lua_State *L)
{
    CFArrayExchangeValuesAtIndices(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArraySortValues(lua_State *L)
{
    CFArraySortValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFArrayAppendArray(lua_State *L)
{
    CFArrayAppendArray(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFArrayAPIs[] = 
{
    {"CFArrayGetTypeID", lua_CFArrayGetTypeID},
    {"CFArrayCreate", lua_CFArrayCreate},
    {"CFArrayCreateCopy", lua_CFArrayCreateCopy},
    {"CFArrayCreateMutable", lua_CFArrayCreateMutable},
    {"CFArrayCreateMutableCopy", lua_CFArrayCreateMutableCopy},
    {"CFArrayGetCount", lua_CFArrayGetCount},
    {"CFArrayGetCountOfValue", lua_CFArrayGetCountOfValue},
    {"CFArrayContainsValue", lua_CFArrayContainsValue},
    {"CFArrayGetValueAtIndex", lua_CFArrayGetValueAtIndex},
    {"CFArrayGetValues", lua_CFArrayGetValues},
    {"CFArrayApplyFunction", lua_CFArrayApplyFunction},
    {"CFArrayGetFirstIndexOfValue", lua_CFArrayGetFirstIndexOfValue},
    {"CFArrayGetLastIndexOfValue", lua_CFArrayGetLastIndexOfValue},
    {"CFArrayBSearchValues", lua_CFArrayBSearchValues},
    {"CFArrayInsertValueAtIndex", lua_CFArrayInsertValueAtIndex},
    {"CFArrayAppendValue", lua_CFArrayAppendValue},
    {"CFArraySetValueAtIndex", lua_CFArraySetValueAtIndex},
    {"CFArraySetValueAtIndex", lua_CFArraySetValueAtIndex},
    {"CFArrayRemoveValueAtIndex", lua_CFArrayRemoveValueAtIndex},
    {"CFArrayRemoveAllValues", lua_CFArrayRemoveAllValues},
    {"CFArrayReplaceValues", lua_CFArrayReplaceValues},
    {"CFArrayExchangeValuesAtIndices", lua_CFArrayExchangeValuesAtIndices},
    {"CFArraySortValues", lua_CFArraySortValues},
    {"CFArrayAppendArray", lua_CFArrayAppendArray},
    {NULL, NULL},
};

int LuaOpenCFArray(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFArrayAPIs);
    return 0;
}
