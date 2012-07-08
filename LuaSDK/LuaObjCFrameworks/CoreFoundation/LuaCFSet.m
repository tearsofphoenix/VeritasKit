//
//  LuaCFSet.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFSet.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFSetRetainCallBack(lua_State *L)
{
    CFSetRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSets(lua_State *L)
{
    CFSets(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetRetainCallBack(lua_State *L)
{
    CFSetRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetReleaseCallBack(lua_State *L)
{
    CFSetReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSets(lua_State *L)
{
    CFSets(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetReleaseCallBack(lua_State *L)
{
    CFSetReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCopyDescriptionCallBack(lua_State *L)
{
    CFSetCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSets(lua_State *L)
{
    CFSets(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCopyDescriptionCallBack(lua_State *L)
{
    CFSetCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetEqualCallBack(lua_State *L)
{
    CFSetEqualCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSets(lua_State *L)
{
    CFSets(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetEqualCallBack(lua_State *L)
{
    CFSetEqualCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetHashCallBack(lua_State *L)
{
    CFSetHashCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSets(lua_State *L)
{
    CFSets(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetHashCallBack(lua_State *L)
{
    CFSetHashCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCallBacks(lua_State *L)
{
    CFSetCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetRetainCallBack(lua_State *L)
{
    CFSetRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetReleaseCallBack(lua_State *L)
{
    CFSetReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCopyDescriptionCallBack(lua_State *L)
{
    CFSetCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetEqualCallBack(lua_State *L)
{
    CFSetEqualCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetHashCallBack(lua_State *L)
{
    CFSetHashCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCallBacks(lua_State *L)
{
    CFSetCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCallBacks(lua_State *L)
{
    CFSetCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCallBacks(lua_State *L)
{
    CFSetCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCallBacks(lua_State *L)
{
    CFSetCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCallBacks(lua_State *L)
{
    CFSetCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetApplierFunction(lua_State *L)
{
    CFSetApplierFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSets(lua_State *L)
{
    CFSets(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetApplierFunction(lua_State *L)
{
    CFSetApplierFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetRef(lua_State *L)
{
    CFSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSets(lua_State *L)
{
    CFSets(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetRef(lua_State *L)
{
    CFSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSets(lua_State *L)
{
    CFSets(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetTypeID(lua_State *L)
{
    CFSetGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetTypeID(lua_State *L)
{
    CFSetGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCreate(lua_State *L)
{
    CFSetCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCallBacks(lua_State *L)
{
    CFSetCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCallBacks(lua_State *L)
{
    CFSetCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetRef(lua_State *L)
{
    CFSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCreateCopy(lua_State *L)
{
    CFSetCreateCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetRef(lua_State *L)
{
    CFSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCreateMutable(lua_State *L)
{
    CFSetCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCallBacks(lua_State *L)
{
    CFSetCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCallBacks(lua_State *L)
{
    CFSetCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCreateMutable(lua_State *L)
{
    CFSetCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCreateMutableCopy(lua_State *L)
{
    CFSetCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetCreateMutableCopy(lua_State *L)
{
    CFSetCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetCount(lua_State *L)
{
    CFSetGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetCount(lua_State *L)
{
    CFSetGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetCountOfValue(lua_State *L)
{
    CFSetGetCountOfValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetContainsValue(lua_State *L)
{
    CFSetContainsValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetCountOfValue(lua_State *L)
{
    CFSetGetCountOfValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetContainsValue(lua_State *L)
{
    CFSetContainsValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetContainsValue(lua_State *L)
{
    CFSetContainsValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetValue(lua_State *L)
{
    CFSetGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetValue(lua_State *L)
{
    CFSetGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetValueIfPresent(lua_State *L)
{
    CFSetGetValueIfPresent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetValueIfPresent(lua_State *L)
{
    CFSetGetValueIfPresent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetValues(lua_State *L)
{
    CFSetGetValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetCount(lua_State *L)
{
    CFSetGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetGetValues(lua_State *L)
{
    CFSetGetValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetApplyFunction(lua_State *L)
{
    CFSetApplyFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetApplyFunction(lua_State *L)
{
    CFSetApplyFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetAddValue(lua_State *L)
{
    CFSetAddValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetAddValue(lua_State *L)
{
    CFSetAddValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetReplaceValue(lua_State *L)
{
    CFSetReplaceValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetReplaceValue(lua_State *L)
{
    CFSetReplaceValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetSetValue(lua_State *L)
{
    CFSetSetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetSetValue(lua_State *L)
{
    CFSetSetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetRemoveValue(lua_State *L)
{
    CFSetRemoveValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetRemoveValue(lua_State *L)
{
    CFSetRemoveValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetRemoveAllValues(lua_State *L)
{
    CFSetRemoveAllValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSetRemoveAllValues(lua_State *L)
{
    CFSetRemoveAllValues(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFSetAPIs[] = {
    {"CFSetRetainCallBack", lua_CFSetRetainCallBack},
    {"CFSets", lua_CFSets},
    {"CFSetRetainCallBack", lua_CFSetRetainCallBack},
    {"CFSetReleaseCallBack", lua_CFSetReleaseCallBack},
    {"CFSets", lua_CFSets},
    {"CFSetReleaseCallBack", lua_CFSetReleaseCallBack},
    {"CFSetCopyDescriptionCallBack", lua_CFSetCopyDescriptionCallBack},
    {"CFSets", lua_CFSets},
    {"CFSetCopyDescriptionCallBack", lua_CFSetCopyDescriptionCallBack},
    {"CFSetEqualCallBack", lua_CFSetEqualCallBack},
    {"CFSets", lua_CFSets},
    {"CFSetEqualCallBack", lua_CFSetEqualCallBack},
    {"CFSetHashCallBack", lua_CFSetHashCallBack},
    {"CFSets", lua_CFSets},
    {"CFSetHashCallBack", lua_CFSetHashCallBack},
    {"CFSetCallBacks", lua_CFSetCallBacks},
    {"CFSetRetainCallBack", lua_CFSetRetainCallBack},
    {"CFSetReleaseCallBack", lua_CFSetReleaseCallBack},
    {"CFSetCopyDescriptionCallBack", lua_CFSetCopyDescriptionCallBack},
    {"CFSetEqualCallBack", lua_CFSetEqualCallBack},
    {"CFSetHashCallBack", lua_CFSetHashCallBack},
    {"CFSetCallBacks", lua_CFSetCallBacks},
    {"CFSetCallBacks", lua_CFSetCallBacks},
    {"CFSetCallBacks", lua_CFSetCallBacks},
    {"CFSetCallBacks", lua_CFSetCallBacks},
    {"CFSetCallBacks", lua_CFSetCallBacks},
    {"CFSetApplierFunction", lua_CFSetApplierFunction},
    {"CFSets", lua_CFSets},
    {"CFSetApplierFunction", lua_CFSetApplierFunction},
    {"CFSetRef", lua_CFSetRef},
    {"CFSets", lua_CFSets},
    {"CFSetRef", lua_CFSetRef},
    {"CFSets", lua_CFSets},
    {"CFSetGetTypeID", lua_CFSetGetTypeID},
    {"CFSetGetTypeID", lua_CFSetGetTypeID},
    {"CFSetCreate", lua_CFSetCreate},
    {"CFSetCallBacks", lua_CFSetCallBacks},
    {"CFSetCallBacks", lua_CFSetCallBacks},
    {"CFSetRef", lua_CFSetRef},
    {"CFSetCreateCopy", lua_CFSetCreateCopy},
    {"CFSetRef", lua_CFSetRef},
    {"CFSetCreateMutable", lua_CFSetCreateMutable},
    {"CFSetCallBacks", lua_CFSetCallBacks},
    {"CFSetCallBacks", lua_CFSetCallBacks},
    {"CFSetCreateMutable", lua_CFSetCreateMutable},
    {"CFSetCreateMutableCopy", lua_CFSetCreateMutableCopy},
    {"CFSetCreateMutableCopy", lua_CFSetCreateMutableCopy},
    {"CFSetGetCount", lua_CFSetGetCount},
    {"CFSetGetCount", lua_CFSetGetCount},
    {"CFSetGetCountOfValue", lua_CFSetGetCountOfValue},
    {"CFSetContainsValue", lua_CFSetContainsValue},
    {"CFSetGetCountOfValue", lua_CFSetGetCountOfValue},
    {"CFSetContainsValue", lua_CFSetContainsValue},
    {"CFSetContainsValue", lua_CFSetContainsValue},
    {"CFSetGetValue", lua_CFSetGetValue},
    {"CFSetGetValue", lua_CFSetGetValue},
    {"CFSetGetValueIfPresent", lua_CFSetGetValueIfPresent},
    {"CFSetGetValueIfPresent", lua_CFSetGetValueIfPresent},
    {"CFSetGetValues", lua_CFSetGetValues},
    {"CFSetGetCount", lua_CFSetGetCount},
    {"CFSetGetValues", lua_CFSetGetValues},
    {"CFSetApplyFunction", lua_CFSetApplyFunction},
    {"CFSetApplyFunction", lua_CFSetApplyFunction},
    {"CFSetAddValue", lua_CFSetAddValue},
    {"CFSetAddValue", lua_CFSetAddValue},
    {"CFSetReplaceValue", lua_CFSetReplaceValue},
    {"CFSetReplaceValue", lua_CFSetReplaceValue},
    {"CFSetSetValue", lua_CFSetSetValue},
    {"CFSetSetValue", lua_CFSetSetValue},
    {"CFSetRemoveValue", lua_CFSetRemoveValue},
    {"CFSetRemoveValue", lua_CFSetRemoveValue},
    {"CFSetRemoveAllValues", lua_CFSetRemoveAllValues},
    {"CFSetRemoveAllValues", lua_CFSetRemoveAllValues},
    {NULL, NULL},
};

int LuaOpenCFSet(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFSetAPIs);
    return 0;
}
