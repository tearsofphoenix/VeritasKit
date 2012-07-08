//
//  LuaCFDictionary.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFDictionary.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFDictionaryKeyCallBacks(lua_State *L)
{
    CFDictionaryKeyCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRetainCallBack(lua_State *L)
{
    CFDictionaryRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryReleaseCallBack(lua_State *L)
{
    CFDictionaryReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryCopyDescriptionCallBack(lua_State *L)
{
    CFDictionaryCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryEqualCallBack(lua_State *L)
{
    CFDictionaryEqualCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryHashCallBack(lua_State *L)
{
    CFDictionaryHashCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRetainCallBack(lua_State *L)
{
    CFDictionaryRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryReleaseCallBack(lua_State *L)
{
    CFDictionaryReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryCopyDescriptionCallBack(lua_State *L)
{
    CFDictionaryCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryEqualCallBack(lua_State *L)
{
    CFDictionaryEqualCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryHashCallBack(lua_State *L)
{
    CFDictionaryHashCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryKeyCallBacks(lua_State *L)
{
    CFDictionaryKeyCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryKeyCallBacks(lua_State *L)
{
    CFDictionaryKeyCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryKeyCallBacks(lua_State *L)
{
    CFDictionaryKeyCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryKeyCallBacks(lua_State *L)
{
    CFDictionaryKeyCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryKeyCallBacks(lua_State *L)
{
    CFDictionaryKeyCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryValueCallBacks(lua_State *L)
{
    CFDictionaryValueCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRetainCallBack(lua_State *L)
{
    CFDictionaryRetainCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryReleaseCallBack(lua_State *L)
{
    CFDictionaryReleaseCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryCopyDescriptionCallBack(lua_State *L)
{
    CFDictionaryCopyDescriptionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryEqualCallBack(lua_State *L)
{
    CFDictionaryEqualCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryValueCallBacks(lua_State *L)
{
    CFDictionaryValueCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryValueCallBacks(lua_State *L)
{
    CFDictionaryValueCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryValueCallBacks(lua_State *L)
{
    CFDictionaryValueCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryApplierFunction(lua_State *L)
{
    CFDictionaryApplierFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionarys(lua_State *L)
{
    CFDictionarys(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryApplierFunction(lua_State *L)
{
    CFDictionaryApplierFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRef(lua_State *L)
{
    CFDictionaryRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionarys(lua_State *L)
{
    CFDictionarys(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRef(lua_State *L)
{
    CFDictionaryRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionarys(lua_State *L)
{
    CFDictionarys(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetTypeID(lua_State *L)
{
    CFDictionaryGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetTypeID(lua_State *L)
{
    CFDictionaryGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryCreate(lua_State *L)
{
    CFDictionaryCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryKeyCallBacks(lua_State *L)
{
    CFDictionaryKeyCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryKeyCallBacks(lua_State *L)
{
    CFDictionaryKeyCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryValueCallBacks(lua_State *L)
{
    CFDictionaryValueCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryValueCallBacks(lua_State *L)
{
    CFDictionaryValueCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRef(lua_State *L)
{
    CFDictionaryRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryCreateCopy(lua_State *L)
{
    CFDictionaryCreateCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRef(lua_State *L)
{
    CFDictionaryRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryCreateMutable(lua_State *L)
{
    CFDictionaryCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryKeyCallBacks(lua_State *L)
{
    CFDictionaryKeyCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryKeyCallBacks(lua_State *L)
{
    CFDictionaryKeyCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryValueCallBacks(lua_State *L)
{
    CFDictionaryValueCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryValueCallBacks(lua_State *L)
{
    CFDictionaryValueCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryCreateMutable(lua_State *L)
{
    CFDictionaryCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryCreateMutableCopy(lua_State *L)
{
    CFDictionaryCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryCreateMutableCopy(lua_State *L)
{
    CFDictionaryCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetCount(lua_State *L)
{
    CFDictionaryGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetCount(lua_State *L)
{
    CFDictionaryGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetCountOfKey(lua_State *L)
{
    CFDictionaryGetCountOfKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetCountOfKey(lua_State *L)
{
    CFDictionaryGetCountOfKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetCountOfValue(lua_State *L)
{
    CFDictionaryGetCountOfValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetCountOfValue(lua_State *L)
{
    CFDictionaryGetCountOfValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryContainsKey(lua_State *L)
{
    CFDictionaryContainsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryContainsKey(lua_State *L)
{
    CFDictionaryContainsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryContainsValue(lua_State *L)
{
    CFDictionaryContainsValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryContainsValue(lua_State *L)
{
    CFDictionaryContainsValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetValue(lua_State *L)
{
    CFDictionaryGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetValueIfPresent(lua_State *L)
{
    CFDictionaryGetValueIfPresent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetValue(lua_State *L)
{
    CFDictionaryGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetValueIfPresent(lua_State *L)
{
    CFDictionaryGetValueIfPresent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetValueIfPresent(lua_State *L)
{
    CFDictionaryGetValueIfPresent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetKeysAndValues(lua_State *L)
{
    CFDictionaryGetKeysAndValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetCount(lua_State *L)
{
    CFDictionaryGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetCount(lua_State *L)
{
    CFDictionaryGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryGetKeysAndValues(lua_State *L)
{
    CFDictionaryGetKeysAndValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryApplyFunction(lua_State *L)
{
    CFDictionaryApplyFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryApplyFunction(lua_State *L)
{
    CFDictionaryApplyFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryAddValue(lua_State *L)
{
    CFDictionaryAddValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryAddValue(lua_State *L)
{
    CFDictionaryAddValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionarySetValue(lua_State *L)
{
    CFDictionarySetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionarySetValue(lua_State *L)
{
    CFDictionarySetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryReplaceValue(lua_State *L)
{
    CFDictionaryReplaceValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryReplaceValue(lua_State *L)
{
    CFDictionaryReplaceValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRemoveValue(lua_State *L)
{
    CFDictionaryRemoveValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRemoveValue(lua_State *L)
{
    CFDictionaryRemoveValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRemoveAllValues(lua_State *L)
{
    CFDictionaryRemoveAllValues(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDictionaryRemoveAllValues(lua_State *L)
{
    CFDictionaryRemoveAllValues(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFDictionaryAPIs[] = {
    {"CFDictionaryKeyCallBacks", lua_CFDictionaryKeyCallBacks},
    {"CFDictionaryRetainCallBack", lua_CFDictionaryRetainCallBack},
    {"CFDictionaryReleaseCallBack", lua_CFDictionaryReleaseCallBack},
    {"CFDictionaryCopyDescriptionCallBack", lua_CFDictionaryCopyDescriptionCallBack},
    {"CFDictionaryEqualCallBack", lua_CFDictionaryEqualCallBack},
    {"CFDictionaryHashCallBack", lua_CFDictionaryHashCallBack},
    {"CFDictionaryRetainCallBack", lua_CFDictionaryRetainCallBack},
    {"CFDictionaryReleaseCallBack", lua_CFDictionaryReleaseCallBack},
    {"CFDictionaryCopyDescriptionCallBack", lua_CFDictionaryCopyDescriptionCallBack},
    {"CFDictionaryEqualCallBack", lua_CFDictionaryEqualCallBack},
    {"CFDictionaryHashCallBack", lua_CFDictionaryHashCallBack},
    {"CFDictionaryKeyCallBacks", lua_CFDictionaryKeyCallBacks},
    {"CFDictionaryKeyCallBacks", lua_CFDictionaryKeyCallBacks},
    {"CFDictionaryKeyCallBacks", lua_CFDictionaryKeyCallBacks},
    {"CFDictionaryKeyCallBacks", lua_CFDictionaryKeyCallBacks},
    {"CFDictionaryKeyCallBacks", lua_CFDictionaryKeyCallBacks},
    {"CFDictionaryValueCallBacks", lua_CFDictionaryValueCallBacks},
    {"CFDictionaryRetainCallBack", lua_CFDictionaryRetainCallBack},
    {"CFDictionaryReleaseCallBack", lua_CFDictionaryReleaseCallBack},
    {"CFDictionaryCopyDescriptionCallBack", lua_CFDictionaryCopyDescriptionCallBack},
    {"CFDictionaryEqualCallBack", lua_CFDictionaryEqualCallBack},
    {"CFDictionaryValueCallBacks", lua_CFDictionaryValueCallBacks},
    {"CFDictionaryValueCallBacks", lua_CFDictionaryValueCallBacks},
    {"CFDictionaryValueCallBacks", lua_CFDictionaryValueCallBacks},
    {"CFDictionaryApplierFunction", lua_CFDictionaryApplierFunction},
    {"CFDictionarys", lua_CFDictionarys},
    {"CFDictionaryApplierFunction", lua_CFDictionaryApplierFunction},
    {"CFDictionaryRef", lua_CFDictionaryRef},
    {"CFDictionarys", lua_CFDictionarys},
    {"CFDictionaryRef", lua_CFDictionaryRef},
    {"CFDictionarys", lua_CFDictionarys},
    {"CFDictionaryGetTypeID", lua_CFDictionaryGetTypeID},
    {"CFDictionaryGetTypeID", lua_CFDictionaryGetTypeID},
    {"CFDictionaryCreate", lua_CFDictionaryCreate},
    {"CFDictionaryKeyCallBacks", lua_CFDictionaryKeyCallBacks},
    {"CFDictionaryKeyCallBacks", lua_CFDictionaryKeyCallBacks},
    {"CFDictionaryValueCallBacks", lua_CFDictionaryValueCallBacks},
    {"CFDictionaryValueCallBacks", lua_CFDictionaryValueCallBacks},
    {"CFDictionaryRef", lua_CFDictionaryRef},
    {"CFDictionaryCreateCopy", lua_CFDictionaryCreateCopy},
    {"CFDictionaryRef", lua_CFDictionaryRef},
    {"CFDictionaryCreateMutable", lua_CFDictionaryCreateMutable},
    {"CFDictionaryKeyCallBacks", lua_CFDictionaryKeyCallBacks},
    {"CFDictionaryKeyCallBacks", lua_CFDictionaryKeyCallBacks},
    {"CFDictionaryValueCallBacks", lua_CFDictionaryValueCallBacks},
    {"CFDictionaryValueCallBacks", lua_CFDictionaryValueCallBacks},
    {"CFDictionaryCreateMutable", lua_CFDictionaryCreateMutable},
    {"CFDictionaryCreateMutableCopy", lua_CFDictionaryCreateMutableCopy},
    {"CFDictionaryCreateMutableCopy", lua_CFDictionaryCreateMutableCopy},
    {"CFDictionaryGetCount", lua_CFDictionaryGetCount},
    {"CFDictionaryGetCount", lua_CFDictionaryGetCount},
    {"CFDictionaryGetCountOfKey", lua_CFDictionaryGetCountOfKey},
    {"CFDictionaryGetCountOfKey", lua_CFDictionaryGetCountOfKey},
    {"CFDictionaryGetCountOfValue", lua_CFDictionaryGetCountOfValue},
    {"CFDictionaryGetCountOfValue", lua_CFDictionaryGetCountOfValue},
    {"CFDictionaryContainsKey", lua_CFDictionaryContainsKey},
    {"CFDictionaryContainsKey", lua_CFDictionaryContainsKey},
    {"CFDictionaryContainsValue", lua_CFDictionaryContainsValue},
    {"CFDictionaryContainsValue", lua_CFDictionaryContainsValue},
    {"CFDictionaryGetValue", lua_CFDictionaryGetValue},
    {"CFDictionaryGetValueIfPresent", lua_CFDictionaryGetValueIfPresent},
    {"CFDictionaryGetValue", lua_CFDictionaryGetValue},
    {"CFDictionaryGetValueIfPresent", lua_CFDictionaryGetValueIfPresent},
    {"CFDictionaryGetValueIfPresent", lua_CFDictionaryGetValueIfPresent},
    {"CFDictionaryGetKeysAndValues", lua_CFDictionaryGetKeysAndValues},
    {"CFDictionaryGetCount", lua_CFDictionaryGetCount},
    {"CFDictionaryGetCount", lua_CFDictionaryGetCount},
    {"CFDictionaryGetKeysAndValues", lua_CFDictionaryGetKeysAndValues},
    {"CFDictionaryApplyFunction", lua_CFDictionaryApplyFunction},
    {"CFDictionaryApplyFunction", lua_CFDictionaryApplyFunction},
    {"CFDictionaryAddValue", lua_CFDictionaryAddValue},
    {"CFDictionaryAddValue", lua_CFDictionaryAddValue},
    {"CFDictionarySetValue", lua_CFDictionarySetValue},
    {"CFDictionarySetValue", lua_CFDictionarySetValue},
    {"CFDictionaryReplaceValue", lua_CFDictionaryReplaceValue},
    {"CFDictionaryReplaceValue", lua_CFDictionaryReplaceValue},
    {"CFDictionaryRemoveValue", lua_CFDictionaryRemoveValue},
    {"CFDictionaryRemoveValue", lua_CFDictionaryRemoveValue},
    {"CFDictionaryRemoveAllValues", lua_CFDictionaryRemoveAllValues},
    {"CFDictionaryRemoveAllValues", lua_CFDictionaryRemoveAllValues},
    {NULL, NULL},
};

int LuaOpenCFDictionary(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFDictionaryAPIs);
    return 0;
}
