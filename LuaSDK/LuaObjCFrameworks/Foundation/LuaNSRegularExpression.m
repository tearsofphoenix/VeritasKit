//
//  LuaNSRegularExpression.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSRegularExpression.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSRegularExpressionConstants[] = 
{
    {"NSRegularExpressionCaseInsensitive", NSRegularExpressionCaseInsensitive},
    {"NSRegularExpressionAllowCommentsAndWhitespace", NSRegularExpressionAllowCommentsAndWhitespace},
    {"NSRegularExpressionIgnoreMetacharacters", NSRegularExpressionIgnoreMetacharacters},
    {"NSRegularExpressionDotMatchesLineSeparators", NSRegularExpressionDotMatchesLineSeparators},
    {"NSRegularExpressionAnchorsMatchLines", NSRegularExpressionAnchorsMatchLines},
    {"NSRegularExpressionUseUnixLineSeparators", NSRegularExpressionUseUnixLineSeparators},
    {"NSRegularExpressionUseUnicodeWordBoundaries", NSRegularExpressionUseUnicodeWordBoundaries},
    {"NSMatchingReportProgress", NSMatchingReportProgress},
    {"NSMatchingReportCompletion", NSMatchingReportCompletion},
    {"NSMatchingAnchored", NSMatchingAnchored},
    {"NSMatchingWithTransparentBounds", NSMatchingWithTransparentBounds},
    {"NSMatchingWithoutAnchoringBounds", NSMatchingWithoutAnchoringBounds},
    {"NSMatchingProgress", NSMatchingProgress},
    {"NSMatchingCompleted", NSMatchingCompleted},
    {"NSMatchingHitEnd", NSMatchingHitEnd},
    {"NSMatchingRequiredEnd", NSMatchingRequiredEnd},
    {"NSMatchingInternalError", NSMatchingInternalError},
    {NULL, 0},
};


int LuaOpenNSRegularExpression(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSRegularExpressionConstants);
    return 0;
}
