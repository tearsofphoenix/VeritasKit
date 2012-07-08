//
//  LuaCFTimeZone.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFTimeZone.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFTimeZoneGetTypeID(lua_State *L)
{
    CFTimeZoneGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneRef(lua_State *L)
{
    CFTimeZoneRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneResetSystem(lua_State *L)
{
    CFTimeZoneResetSystem(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneRef(lua_State *L)
{
    CFTimeZoneRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneSetDefault(lua_State *L)
{
    CFTimeZoneSetDefault(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneCopyKnownNames(lua_State *L)
{
    CFTimeZoneCopyKnownNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneCopyAbbreviationDictionary(lua_State *L)
{
    CFTimeZoneCopyAbbreviationDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneSetAbbreviationDictionary(lua_State *L)
{
    CFTimeZoneSetAbbreviationDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneRef(lua_State *L)
{
    CFTimeZoneRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneRef(lua_State *L)
{
    CFTimeZoneRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneRef(lua_State *L)
{
    CFTimeZoneRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneGetName(lua_State *L)
{
    CFTimeZoneGetName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneGetData(lua_State *L)
{
    CFTimeZoneGetData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneGetSecondsFromGMT(lua_State *L)
{
    CFTimeZoneGetSecondsFromGMT(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneCopyAbbreviation(lua_State *L)
{
    CFTimeZoneCopyAbbreviation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneIsDaylightSavingTime(lua_State *L)
{
    CFTimeZoneIsDaylightSavingTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneGetDaylightSavingTimeOffset(lua_State *L)
{
    CFTimeZoneGetDaylightSavingTimeOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneGetNextDaylightSavingTimeTransition(lua_State *L)
{
    CFTimeZoneGetNextDaylightSavingTimeTransition(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneNameStyleStandard(lua_State *L)
{
    CFTimeZoneNameStyleStandard(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneNameStyleShortStandard(lua_State *L)
{
    CFTimeZoneNameStyleShortStandard(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneNameStyleDaylightSaving(lua_State *L)
{
    CFTimeZoneNameStyleDaylightSaving(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneNameStyleShortDaylightSaving(lua_State *L)
{
    CFTimeZoneNameStyleShortDaylightSaving(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneNameStyleGeneric(lua_State *L)
{
    CFTimeZoneNameStyleGeneric(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneNameStyleShortGeneric(lua_State *L)
{
    CFTimeZoneNameStyleShortGeneric(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneNameStyle(lua_State *L)
{
    CFTimeZoneNameStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneCopyLocalizedName(lua_State *L)
{
    CFTimeZoneCopyLocalizedName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFTimeZoneSystemTimeZoneDidChangeNotification(lua_State *L)
{
    CFTimeZoneSystemTimeZoneDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFTimeZoneAPIs[] = {
    {"CFTimeZoneGetTypeID", lua_CFTimeZoneGetTypeID},
    {"CFTimeZoneRef", lua_CFTimeZoneRef},
    {"CFTimeZoneResetSystem", lua_CFTimeZoneResetSystem},
    {"CFTimeZoneRef", lua_CFTimeZoneRef},
    {"CFTimeZoneSetDefault", lua_CFTimeZoneSetDefault},
    {"CFTimeZoneCopyKnownNames", lua_CFTimeZoneCopyKnownNames},
    {"CFTimeZoneCopyAbbreviationDictionary", lua_CFTimeZoneCopyAbbreviationDictionary},
    {"CFTimeZoneSetAbbreviationDictionary", lua_CFTimeZoneSetAbbreviationDictionary},
    {"CFTimeZoneRef", lua_CFTimeZoneRef},
    {"CFTimeZoneRef", lua_CFTimeZoneRef},
    {"CFTimeZoneRef", lua_CFTimeZoneRef},
    {"CFTimeZoneGetName", lua_CFTimeZoneGetName},
    {"CFTimeZoneGetData", lua_CFTimeZoneGetData},
    {"CFTimeZoneGetSecondsFromGMT", lua_CFTimeZoneGetSecondsFromGMT},
    {"CFTimeZoneCopyAbbreviation", lua_CFTimeZoneCopyAbbreviation},
    {"CFTimeZoneIsDaylightSavingTime", lua_CFTimeZoneIsDaylightSavingTime},
    {"CFTimeZoneGetDaylightSavingTimeOffset", lua_CFTimeZoneGetDaylightSavingTimeOffset},
    {"CFTimeZoneGetNextDaylightSavingTimeTransition", lua_CFTimeZoneGetNextDaylightSavingTimeTransition},
    {"CFTimeZoneNameStyleStandard", lua_CFTimeZoneNameStyleStandard},
    {"CFTimeZoneNameStyleShortStandard", lua_CFTimeZoneNameStyleShortStandard},
    {"CFTimeZoneNameStyleDaylightSaving", lua_CFTimeZoneNameStyleDaylightSaving},
    {"CFTimeZoneNameStyleShortDaylightSaving", lua_CFTimeZoneNameStyleShortDaylightSaving},
    {"CFTimeZoneNameStyleGeneric", lua_CFTimeZoneNameStyleGeneric},
    {"CFTimeZoneNameStyleShortGeneric", lua_CFTimeZoneNameStyleShortGeneric},
    {"CFTimeZoneNameStyle", lua_CFTimeZoneNameStyle},
    {"CFTimeZoneCopyLocalizedName", lua_CFTimeZoneCopyLocalizedName},
    {"CFTimeZoneSystemTimeZoneDidChangeNotification", lua_CFTimeZoneSystemTimeZoneDidChangeNotification},
    {NULL, NULL},
};

int LuaOpenCFTimeZone(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFTimeZoneAPIs);
    return 0;
}
