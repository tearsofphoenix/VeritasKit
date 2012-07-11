//
//  LuaNSComparisonPredicate.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSComparisonPredicate.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaNSComparisonPredicateConstants[] = 
{
    {"NSCaseInsensitivePredicateOption", NSCaseInsensitivePredicateOption},
    {"NSDiacriticInsensitivePredicateOption", NSDiacriticInsensitivePredicateOption},
    {"NSNormalizedPredicateOption", NSNormalizedPredicateOption},
    {"NSDirectPredicateModifier", NSDirectPredicateModifier},
    {"NSAllPredicateModifier", NSAllPredicateModifier},
    {"NSAnyPredicateModifier", NSAnyPredicateModifier},
    {"NSCustomSelectorPredicateOperatorType", NSCustomSelectorPredicateOperatorType},
    {"NSLessThanPredicateOperatorType", NSLessThanPredicateOperatorType},
    {"NSLessThanOrEqualToPredicateOperatorType", NSLessThanOrEqualToPredicateOperatorType},
    {"NSGreaterThanPredicateOperatorType", NSGreaterThanPredicateOperatorType},
    {"NSGreaterThanOrEqualToPredicateOperatorType", NSGreaterThanOrEqualToPredicateOperatorType},
    {"NSEqualToPredicateOperatorType", NSEqualToPredicateOperatorType},
    {"NSNotEqualToPredicateOperatorType", NSNotEqualToPredicateOperatorType},
    {"NSMatchesPredicateOperatorType", NSMatchesPredicateOperatorType},
    {"NSLikePredicateOperatorType", NSLikePredicateOperatorType},
    {"NSBeginsWithPredicateOperatorType", NSBeginsWithPredicateOperatorType},
    {"NSEndsWithPredicateOperatorType", NSEndsWithPredicateOperatorType},
    {"NSInPredicateOperatorType", NSInPredicateOperatorType},
    {"NSCustomSelectorPredicateOperatorType", NSCustomSelectorPredicateOperatorType},
    {"NSContainsPredicateOperatorType", NSContainsPredicateOperatorType},
    {"NSBetweenPredicateOperatorType", NSBetweenPredicateOperatorType},
    {NULL, 0},
};


int LuaOpenNSComparisonPredicate(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSComparisonPredicateConstants);
    return 0;
}
