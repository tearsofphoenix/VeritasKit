//
//  LuaCMTimeRange.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCMTimeRange.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CMTimeRangeContainsTime(lua_State *L)
{
    CMTimeRangeContainsTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRanges(lua_State *L)
{
    CMTimeRanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeMakeFromDictionary(lua_State *L)
{
    CMTimeRangeMakeFromDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeGetUnion(lua_State *L)
{
    CMTimeRangeGetUnion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRanges(lua_State *L)
{
    CMTimeRanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeZero(lua_State *L)
{
    CMTimeRangeZero(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeInvalid(lua_State *L)
{
    CMTimeRangeInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeMake(lua_State *L)
{
    CMTimeRangeMake(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeMake(lua_State *L)
{
    CMTimeRangeMake(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeGetUnion(lua_State *L)
{
    CMTimeRangeGetUnion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRanges(lua_State *L)
{
    CMTimeRanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRanges(lua_State *L)
{
    CMTimeRanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeGetUnion(lua_State *L)
{
    CMTimeRangeGetUnion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeGetIntersection(lua_State *L)
{
    CMTimeRangeGetIntersection(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRanges(lua_State *L)
{
    CMTimeRanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRanges(lua_State *L)
{
    CMTimeRanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeGetIntersection(lua_State *L)
{
    CMTimeRangeGetIntersection(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeEqual(lua_State *L)
{
    CMTimeRangeEqual(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRanges(lua_State *L)
{
    CMTimeRanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeEqual(lua_State *L)
{
    CMTimeRangeEqual(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeContainsTime(lua_State *L)
{
    CMTimeRangeContainsTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeContainsTime(lua_State *L)
{
    CMTimeRangeContainsTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeContainsTimeRange(lua_State *L)
{
    CMTimeRangeContainsTimeRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeContainsTimeRange(lua_State *L)
{
    CMTimeRangeContainsTimeRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeGetEnd(lua_State *L)
{
    CMTimeRangeGetEnd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeContainsTime(lua_State *L)
{
    CMTimeRangeContainsTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeGetEnd(lua_State *L)
{
    CMTimeRangeGetEnd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeFromTimeToTime(lua_State *L)
{
    CMTimeRangeFromTimeToTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeFromTimeToTime(lua_State *L)
{
    CMTimeRangeFromTimeToTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeCopyAsDictionary(lua_State *L)
{
    CMTimeRangeCopyAsDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRanges(lua_State *L)
{
    CMTimeRanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeCopyAsDictionary(lua_State *L)
{
    CMTimeRangeCopyAsDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeMakeFromDictionary(lua_State *L)
{
    CMTimeRangeMakeFromDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeCopyAsDictionary(lua_State *L)
{
    CMTimeRangeCopyAsDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRanges(lua_State *L)
{
    CMTimeRanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeMakeFromDictionary(lua_State *L)
{
    CMTimeRangeMakeFromDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeTimeKey(lua_State *L)
{
    CMTimeRangeTimeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeStartKey(lua_State *L)
{
    CMTimeRangeStartKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeDurationKey(lua_State *L)
{
    CMTimeRangeDurationKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeDurationKey(lua_State *L)
{
    CMTimeRangeDurationKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeCopyDescription(lua_State *L)
{
    CMTimeRangeCopyDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeCopyDescription(lua_State *L)
{
    CMTimeRangeCopyDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeShow(lua_State *L)
{
    CMTimeRangeShow(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRangeShow(lua_State *L)
{
    CMTimeRangeShow(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCMTimeRangeAPIs[] = {
    {"CMTimeRangeContainsTime", lua_CMTimeRangeContainsTime},
    {"CMTimeRanges", lua_CMTimeRanges},
    {"CMTimeRangeMakeFromDictionary", lua_CMTimeRangeMakeFromDictionary},
    {"CMTimeRangeGetUnion", lua_CMTimeRangeGetUnion},
    {"CMTimeRanges", lua_CMTimeRanges},
    {"CMTimeRangeZero", lua_CMTimeRangeZero},
    {"CMTimeRangeInvalid", lua_CMTimeRangeInvalid},
    {"CMTimeRangeMake", lua_CMTimeRangeMake},
    {"CMTimeRangeMake", lua_CMTimeRangeMake},
    {"CMTimeRangeGetUnion", lua_CMTimeRangeGetUnion},
    {"CMTimeRanges", lua_CMTimeRanges},
    {"CMTimeRanges", lua_CMTimeRanges},
    {"CMTimeRangeGetUnion", lua_CMTimeRangeGetUnion},
    {"CMTimeRangeGetIntersection", lua_CMTimeRangeGetIntersection},
    {"CMTimeRanges", lua_CMTimeRanges},
    {"CMTimeRanges", lua_CMTimeRanges},
    {"CMTimeRangeGetIntersection", lua_CMTimeRangeGetIntersection},
    {"CMTimeRangeEqual", lua_CMTimeRangeEqual},
    {"CMTimeRanges", lua_CMTimeRanges},
    {"CMTimeRangeEqual", lua_CMTimeRangeEqual},
    {"CMTimeRangeContainsTime", lua_CMTimeRangeContainsTime},
    {"CMTimeRangeContainsTime", lua_CMTimeRangeContainsTime},
    {"CMTimeRangeContainsTimeRange", lua_CMTimeRangeContainsTimeRange},
    {"CMTimeRangeContainsTimeRange", lua_CMTimeRangeContainsTimeRange},
    {"CMTimeRangeGetEnd", lua_CMTimeRangeGetEnd},
    {"CMTimeRangeContainsTime", lua_CMTimeRangeContainsTime},
    {"CMTimeRangeGetEnd", lua_CMTimeRangeGetEnd},
    {"CMTimeRangeFromTimeToTime", lua_CMTimeRangeFromTimeToTime},
    {"CMTimeRangeFromTimeToTime", lua_CMTimeRangeFromTimeToTime},
    {"CMTimeRangeCopyAsDictionary", lua_CMTimeRangeCopyAsDictionary},
    {"CMTimeRanges", lua_CMTimeRanges},
    {"CMTimeRangeCopyAsDictionary", lua_CMTimeRangeCopyAsDictionary},
    {"CMTimeRangeMakeFromDictionary", lua_CMTimeRangeMakeFromDictionary},
    {"CMTimeRangeCopyAsDictionary", lua_CMTimeRangeCopyAsDictionary},
    {"CMTimeRanges", lua_CMTimeRanges},
    {"CMTimeRangeMakeFromDictionary", lua_CMTimeRangeMakeFromDictionary},
    {"CMTimeRangeTimeKey", lua_CMTimeRangeTimeKey},
    {"CMTimeRangeStartKey", lua_CMTimeRangeStartKey},
    {"CMTimeRangeDurationKey", lua_CMTimeRangeDurationKey},
    {"CMTimeRangeDurationKey", lua_CMTimeRangeDurationKey},
    {"CMTimeRangeCopyDescription", lua_CMTimeRangeCopyDescription},
    {"CMTimeRangeCopyDescription", lua_CMTimeRangeCopyDescription},
    {"CMTimeRangeShow", lua_CMTimeRangeShow},
    {"CMTimeRangeShow", lua_CMTimeRangeShow},
    {NULL, NULL},
};

int LuaOpenCMTimeRange(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCMTimeRangeAPIs);
    return 0;
}
