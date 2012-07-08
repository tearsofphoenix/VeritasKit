//
//  LuaCTParagraphStyle.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTParagraphStyle.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTParagraphStyleRef(lua_State *L)
{
    CTParagraphStyleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleGetTypeID(lua_State *L)
{
    CTParagraphStyleGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleGetTypeID(lua_State *L)
{
    CTParagraphStyleGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifier(lua_State *L)
{
    CTParagraphStyleSpecifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierAlignment(lua_State *L)
{
    CTParagraphStyleSpecifierAlignment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierFirstLineHeadIndent(lua_State *L)
{
    CTParagraphStyleSpecifierFirstLineHeadIndent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierHeadIndent(lua_State *L)
{
    CTParagraphStyleSpecifierHeadIndent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierTailIndent(lua_State *L)
{
    CTParagraphStyleSpecifierTailIndent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierTabStops(lua_State *L)
{
    CTParagraphStyleSpecifierTabStops(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierDefaultTabInterval(lua_State *L)
{
    CTParagraphStyleSpecifierDefaultTabInterval(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierTabStops(lua_State *L)
{
    CTParagraphStyleSpecifierTabStops(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierLineBreakMode(lua_State *L)
{
    CTParagraphStyleSpecifierLineBreakMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierLineHeightMultiple(lua_State *L)
{
    CTParagraphStyleSpecifierLineHeightMultiple(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierMaximumLineHeight(lua_State *L)
{
    CTParagraphStyleSpecifierMaximumLineHeight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierMinimumLineHeight(lua_State *L)
{
    CTParagraphStyleSpecifierMinimumLineHeight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierLineSpacing(lua_State *L)
{
    CTParagraphStyleSpecifierLineSpacing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierMaximumLineSpacing(lua_State *L)
{
    CTParagraphStyleSpecifierMaximumLineSpacing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierLineSpaceAdjustment(lua_State *L)
{
    CTParagraphStyleSpecifierLineSpaceAdjustment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierParagraphSpacing(lua_State *L)
{
    CTParagraphStyleSpecifierParagraphSpacing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierParagraphSpacing(lua_State *L)
{
    CTParagraphStyleSpecifierParagraphSpacing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierParagraphSpacingBefore(lua_State *L)
{
    CTParagraphStyleSpecifierParagraphSpacingBefore(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierParagraphSpacingBefore(lua_State *L)
{
    CTParagraphStyleSpecifierParagraphSpacingBefore(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierBaseWritingDirection(lua_State *L)
{
    CTParagraphStyleSpecifierBaseWritingDirection(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierMaximumLineSpacing(lua_State *L)
{
    CTParagraphStyleSpecifierMaximumLineSpacing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierMinimumLineSpacing(lua_State *L)
{
    CTParagraphStyleSpecifierMinimumLineSpacing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierLineSpaceAdjustment(lua_State *L)
{
    CTParagraphStyleSpecifierLineSpaceAdjustment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierAlignment(lua_State *L)
{
    CTParagraphStyleSpecifierAlignment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierFirstLineHeadIndent(lua_State *L)
{
    CTParagraphStyleSpecifierFirstLineHeadIndent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierHeadIndent(lua_State *L)
{
    CTParagraphStyleSpecifierHeadIndent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierTailIndent(lua_State *L)
{
    CTParagraphStyleSpecifierTailIndent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierTabStops(lua_State *L)
{
    CTParagraphStyleSpecifierTabStops(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierDefaultTabInterval(lua_State *L)
{
    CTParagraphStyleSpecifierDefaultTabInterval(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierLineBreakMode(lua_State *L)
{
    CTParagraphStyleSpecifierLineBreakMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierLineHeightMultiple(lua_State *L)
{
    CTParagraphStyleSpecifierLineHeightMultiple(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierMaximumLineHeight(lua_State *L)
{
    CTParagraphStyleSpecifierMaximumLineHeight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierMinimumLineHeight(lua_State *L)
{
    CTParagraphStyleSpecifierMinimumLineHeight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierLineSpacing(lua_State *L)
{
    CTParagraphStyleSpecifierLineSpacing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierParagraphSpacing(lua_State *L)
{
    CTParagraphStyleSpecifierParagraphSpacing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierParagraphSpacingBefore(lua_State *L)
{
    CTParagraphStyleSpecifierParagraphSpacingBefore(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierBaseWritingDirection(lua_State *L)
{
    CTParagraphStyleSpecifierBaseWritingDirection(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierMaximumLineSpacing(lua_State *L)
{
    CTParagraphStyleSpecifierMaximumLineSpacing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierMinimumLineSpacing(lua_State *L)
{
    CTParagraphStyleSpecifierMinimumLineSpacing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierLineSpacingAdjustment(lua_State *L)
{
    CTParagraphStyleSpecifierLineSpacingAdjustment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifierCount(lua_State *L)
{
    CTParagraphStyleSpecifierCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifier(lua_State *L)
{
    CTParagraphStyleSpecifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSetting(lua_State *L)
{
    CTParagraphStyleSetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifier(lua_State *L)
{
    CTParagraphStyleSpecifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSetting(lua_State *L)
{
    CTParagraphStyleSetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifier(lua_State *L)
{
    CTParagraphStyleSpecifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSetting(lua_State *L)
{
    CTParagraphStyleSetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleCreate(lua_State *L)
{
    CTParagraphStyleCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleRef(lua_State *L)
{
    CTParagraphStyleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSetting(lua_State *L)
{
    CTParagraphStyleSetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleCreateCopy(lua_State *L)
{
    CTParagraphStyleCreateCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleRef(lua_State *L)
{
    CTParagraphStyleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleRef(lua_State *L)
{
    CTParagraphStyleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleGetValueForSpecifier(lua_State *L)
{
    CTParagraphStyleGetValueForSpecifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleGetValueForSpecifier(lua_State *L)
{
    CTParagraphStyleGetValueForSpecifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleRef(lua_State *L)
{
    CTParagraphStyleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTParagraphStyleSpecifier(lua_State *L)
{
    CTParagraphStyleSpecifier(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTParagraphStyleAPIs[] = {
    {"CTParagraphStyleRef", lua_CTParagraphStyleRef},
    {"CTParagraphStyleGetTypeID", lua_CTParagraphStyleGetTypeID},
    {"CTParagraphStyleGetTypeID", lua_CTParagraphStyleGetTypeID},
    {"CTParagraphStyleSpecifier", lua_CTParagraphStyleSpecifier},
    {"CTParagraphStyleSpecifierAlignment", lua_CTParagraphStyleSpecifierAlignment},
    {"CTParagraphStyleSpecifierFirstLineHeadIndent", lua_CTParagraphStyleSpecifierFirstLineHeadIndent},
    {"CTParagraphStyleSpecifierHeadIndent", lua_CTParagraphStyleSpecifierHeadIndent},
    {"CTParagraphStyleSpecifierTailIndent", lua_CTParagraphStyleSpecifierTailIndent},
    {"CTParagraphStyleSpecifierTabStops", lua_CTParagraphStyleSpecifierTabStops},
    {"CTParagraphStyleSpecifierDefaultTabInterval", lua_CTParagraphStyleSpecifierDefaultTabInterval},
    {"CTParagraphStyleSpecifierTabStops", lua_CTParagraphStyleSpecifierTabStops},
    {"CTParagraphStyleSpecifierLineBreakMode", lua_CTParagraphStyleSpecifierLineBreakMode},
    {"CTParagraphStyleSpecifierLineHeightMultiple", lua_CTParagraphStyleSpecifierLineHeightMultiple},
    {"CTParagraphStyleSpecifierMaximumLineHeight", lua_CTParagraphStyleSpecifierMaximumLineHeight},
    {"CTParagraphStyleSpecifierMinimumLineHeight", lua_CTParagraphStyleSpecifierMinimumLineHeight},
    {"CTParagraphStyleSpecifierLineSpacing", lua_CTParagraphStyleSpecifierLineSpacing},
    {"CTParagraphStyleSpecifierMaximumLineSpacing", lua_CTParagraphStyleSpecifierMaximumLineSpacing},
    {"CTParagraphStyleSpecifierLineSpaceAdjustment", lua_CTParagraphStyleSpecifierLineSpaceAdjustment},
    {"CTParagraphStyleSpecifierParagraphSpacing", lua_CTParagraphStyleSpecifierParagraphSpacing},
    {"CTParagraphStyleSpecifierParagraphSpacing", lua_CTParagraphStyleSpecifierParagraphSpacing},
    {"CTParagraphStyleSpecifierParagraphSpacingBefore", lua_CTParagraphStyleSpecifierParagraphSpacingBefore},
    {"CTParagraphStyleSpecifierParagraphSpacingBefore", lua_CTParagraphStyleSpecifierParagraphSpacingBefore},
    {"CTParagraphStyleSpecifierBaseWritingDirection", lua_CTParagraphStyleSpecifierBaseWritingDirection},
    {"CTParagraphStyleSpecifierMaximumLineSpacing", lua_CTParagraphStyleSpecifierMaximumLineSpacing},
    {"CTParagraphStyleSpecifierMinimumLineSpacing", lua_CTParagraphStyleSpecifierMinimumLineSpacing},
    {"CTParagraphStyleSpecifierLineSpaceAdjustment", lua_CTParagraphStyleSpecifierLineSpaceAdjustment},
    {"CTParagraphStyleSpecifierAlignment", lua_CTParagraphStyleSpecifierAlignment},
    {"CTParagraphStyleSpecifierFirstLineHeadIndent", lua_CTParagraphStyleSpecifierFirstLineHeadIndent},
    {"CTParagraphStyleSpecifierHeadIndent", lua_CTParagraphStyleSpecifierHeadIndent},
    {"CTParagraphStyleSpecifierTailIndent", lua_CTParagraphStyleSpecifierTailIndent},
    {"CTParagraphStyleSpecifierTabStops", lua_CTParagraphStyleSpecifierTabStops},
    {"CTParagraphStyleSpecifierDefaultTabInterval", lua_CTParagraphStyleSpecifierDefaultTabInterval},
    {"CTParagraphStyleSpecifierLineBreakMode", lua_CTParagraphStyleSpecifierLineBreakMode},
    {"CTParagraphStyleSpecifierLineHeightMultiple", lua_CTParagraphStyleSpecifierLineHeightMultiple},
    {"CTParagraphStyleSpecifierMaximumLineHeight", lua_CTParagraphStyleSpecifierMaximumLineHeight},
    {"CTParagraphStyleSpecifierMinimumLineHeight", lua_CTParagraphStyleSpecifierMinimumLineHeight},
    {"CTParagraphStyleSpecifierLineSpacing", lua_CTParagraphStyleSpecifierLineSpacing},
    {"CTParagraphStyleSpecifierParagraphSpacing", lua_CTParagraphStyleSpecifierParagraphSpacing},
    {"CTParagraphStyleSpecifierParagraphSpacingBefore", lua_CTParagraphStyleSpecifierParagraphSpacingBefore},
    {"CTParagraphStyleSpecifierBaseWritingDirection", lua_CTParagraphStyleSpecifierBaseWritingDirection},
    {"CTParagraphStyleSpecifierMaximumLineSpacing", lua_CTParagraphStyleSpecifierMaximumLineSpacing},
    {"CTParagraphStyleSpecifierMinimumLineSpacing", lua_CTParagraphStyleSpecifierMinimumLineSpacing},
    {"CTParagraphStyleSpecifierLineSpacingAdjustment", lua_CTParagraphStyleSpecifierLineSpacingAdjustment},
    {"CTParagraphStyleSpecifierCount", lua_CTParagraphStyleSpecifierCount},
    {"CTParagraphStyleSpecifier", lua_CTParagraphStyleSpecifier},
    {"CTParagraphStyleSetting", lua_CTParagraphStyleSetting},
    {"CTParagraphStyleSpecifier", lua_CTParagraphStyleSpecifier},
    {"CTParagraphStyleSetting", lua_CTParagraphStyleSetting},
    {"CTParagraphStyleSpecifier", lua_CTParagraphStyleSpecifier},
    {"CTParagraphStyleSetting", lua_CTParagraphStyleSetting},
    {"CTParagraphStyleCreate", lua_CTParagraphStyleCreate},
    {"CTParagraphStyleRef", lua_CTParagraphStyleRef},
    {"CTParagraphStyleSetting", lua_CTParagraphStyleSetting},
    {"CTParagraphStyleCreateCopy", lua_CTParagraphStyleCreateCopy},
    {"CTParagraphStyleRef", lua_CTParagraphStyleRef},
    {"CTParagraphStyleRef", lua_CTParagraphStyleRef},
    {"CTParagraphStyleGetValueForSpecifier", lua_CTParagraphStyleGetValueForSpecifier},
    {"CTParagraphStyleGetValueForSpecifier", lua_CTParagraphStyleGetValueForSpecifier},
    {"CTParagraphStyleRef", lua_CTParagraphStyleRef},
    {"CTParagraphStyleSpecifier", lua_CTParagraphStyleSpecifier},
    {NULL, NULL},
};

int LuaOpenCTParagraphStyle(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTParagraphStyleAPIs);
    return 0;
}
