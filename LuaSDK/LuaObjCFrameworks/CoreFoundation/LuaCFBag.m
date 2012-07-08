//
//  LuaCFBag.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFBag.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFBagRetainCallBack(lua_State *L)
{
    CFBagRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagReleaseCallBack(lua_State *L)
{
    CFBagReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagCopyDescriptionCallBack(lua_State *L)
{
    CFBagCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagEqualCallBack(lua_State *L)
{
    CFBagEqualCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagHashCallBack(lua_State *L)
{
    CFBagHashCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagRetainCallBack(lua_State *L)
{
    CFBagRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagReleaseCallBack(lua_State *L)
{
    CFBagReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagCopyDescriptionCallBack(lua_State *L)
{
    CFBagCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagEqualCallBack(lua_State *L)
{
    CFBagEqualCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagHashCallBack(lua_State *L)
{
    CFBagHashCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagCallBacks(lua_State *L)
{
    CFBagCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagCallBacks(lua_State *L)
{
    CFBagCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagCallBacks(lua_State *L)
{
    CFBagCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagApplierFunction(lua_State *L)
{
    CFBagApplierFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagRef(lua_State *L)
{
    CFBagRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagGetTypeID(lua_State *L)
{
    CFBagGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagRef(lua_State *L)
{
    CFBagRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagRef(lua_State *L)
{
    CFBagRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagCreateMutable(lua_State *L)
{
    CFBagCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagCreateMutableCopy(lua_State *L)
{
    CFBagCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagGetCount(lua_State *L)
{
    CFBagGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagGetCountOfValue(lua_State *L)
{
    CFBagGetCountOfValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagContainsValue(lua_State *L)
{
    CFBagContainsValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagGetValue(lua_State *L)
{
    CFBagGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagGetValueIfPresent(lua_State *L)
{
    CFBagGetValueIfPresent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagGetValues(lua_State *L)
{
    CFBagGetValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagApplyFunction(lua_State *L)
{
    CFBagApplyFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagAddValue(lua_State *L)
{
    CFBagAddValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagReplaceValue(lua_State *L)
{
    CFBagReplaceValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagSetValue(lua_State *L)
{
    CFBagSetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagRemoveValue(lua_State *L)
{
    CFBagRemoveValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBagRemoveAllValues(lua_State *L)
{
    CFBagRemoveAllValues(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFBagAPIs[] = {
    {"CFBagRetainCallBack", lua_CFBagRetainCallBack},
    {"CFBagReleaseCallBack", lua_CFBagReleaseCallBack},
    {"CFBagCopyDescriptionCallBack", lua_CFBagCopyDescriptionCallBack},
    {"CFBagEqualCallBack", lua_CFBagEqualCallBack},
    {"CFBagHashCallBack", lua_CFBagHashCallBack},
    {"CFBagRetainCallBack", lua_CFBagRetainCallBack},
    {"CFBagReleaseCallBack", lua_CFBagReleaseCallBack},
    {"CFBagCopyDescriptionCallBack", lua_CFBagCopyDescriptionCallBack},
    {"CFBagEqualCallBack", lua_CFBagEqualCallBack},
    {"CFBagHashCallBack", lua_CFBagHashCallBack},
    {"CFBagCallBacks", lua_CFBagCallBacks},
    {"CFBagCallBacks", lua_CFBagCallBacks},
    {"CFBagCallBacks", lua_CFBagCallBacks},
    {"CFBagApplierFunction", lua_CFBagApplierFunction},
    {"CFBagRef", lua_CFBagRef},
    {"CFBagGetTypeID", lua_CFBagGetTypeID},
    {"CFBagRef", lua_CFBagRef},
    {"CFBagRef", lua_CFBagRef},
    {"CFBagCreateMutable", lua_CFBagCreateMutable},
    {"CFBagCreateMutableCopy", lua_CFBagCreateMutableCopy},
    {"CFBagGetCount", lua_CFBagGetCount},
    {"CFBagGetCountOfValue", lua_CFBagGetCountOfValue},
    {"CFBagContainsValue", lua_CFBagContainsValue},
    {"CFBagGetValue", lua_CFBagGetValue},
    {"CFBagGetValueIfPresent", lua_CFBagGetValueIfPresent},
    {"CFBagGetValues", lua_CFBagGetValues},
    {"CFBagApplyFunction", lua_CFBagApplyFunction},
    {"CFBagAddValue", lua_CFBagAddValue},
    {"CFBagReplaceValue", lua_CFBagReplaceValue},
    {"CFBagSetValue", lua_CFBagSetValue},
    {"CFBagRemoveValue", lua_CFBagRemoveValue},
    {"CFBagRemoveAllValues", lua_CFBagRemoveAllValues},
    {NULL, NULL},
};

int LuaOpenCFBag(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFBagAPIs);
    return 0;
}
