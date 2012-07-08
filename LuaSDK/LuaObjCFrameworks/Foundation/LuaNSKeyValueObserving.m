//
//  LuaNSKeyValueObserving.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSKeyValueObserving.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaNSKeyValueObservingConstants[] = 
{
    {"NSKeyValueObservingOptionNew", NSKeyValueObservingOptionNew},
    {"NSKeyValueObservingOptionOld", NSKeyValueObservingOptionOld},
    {"NSKeyValueObservingOptionInitial", NSKeyValueObservingOptionInitial},
    {"NSKeyValueObservingOptionPrior", NSKeyValueObservingOptionPrior},
    {"NSKeyValueChangeSetting", NSKeyValueChangeSetting},
    {"NSKeyValueChangeInsertion", NSKeyValueChangeInsertion},
    {"NSKeyValueChangeRemoval", NSKeyValueChangeRemoval},
    {"NSKeyValueChangeReplacement", NSKeyValueChangeReplacement},
    {"NSKeyValueUnionSetMutation", NSKeyValueUnionSetMutation},
    {"NSKeyValueMinusSetMutation", NSKeyValueMinusSetMutation},
    {"NSKeyValueIntersectSetMutation", NSKeyValueIntersectSetMutation},
    {"NSKeyValueSetSetMutation", NSKeyValueSetSetMutation},
    {NULL, 0},
};

int LuaOpenNSKeyValueObserving(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSKeyValueObservingConstants);
    return 0;
}
