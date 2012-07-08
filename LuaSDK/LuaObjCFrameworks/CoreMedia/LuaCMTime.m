//
//  LuaCMTime.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCMTime.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMakeFromDictionary(lua_State *L)
{
    CMTimeMakeFromDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeValue(lua_State *L)
{
    CMTimeValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeValue(lua_State *L)
{
    CMTimeValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeScale(lua_State *L)
{
    CMTimeScale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeScale(lua_State *L)
{
    CMTimeScale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMaxTimescale(lua_State *L)
{
    CMTimeMaxTimescale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeEpoch(lua_State *L)
{
    CMTimeEpoch(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeEpoch(lua_State *L)
{
    CMTimeEpoch(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags(lua_State *L)
{
    CMTimeFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_Valid(lua_State *L)
{
    CMTimeFlags_Valid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_PositiveInfinity(lua_State *L)
{
    CMTimeFlags_PositiveInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_NegativeInfinity(lua_State *L)
{
    CMTimeFlags_NegativeInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_Indefinite(lua_State *L)
{
    CMTimeFlags_Indefinite(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_Valid(lua_State *L)
{
    CMTimeFlags_Valid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_PositiveInfinity(lua_State *L)
{
    CMTimeFlags_PositiveInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_NegativeInfinity(lua_State *L)
{
    CMTimeFlags_NegativeInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_Indefinite(lua_State *L)
{
    CMTimeFlags_Indefinite(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_ImpliedValueFlagsMask(lua_State *L)
{
    CMTimeFlags_ImpliedValueFlagsMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags(lua_State *L)
{
    CMTimeFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeValue(lua_State *L)
{
    CMTimeValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeScale(lua_State *L)
{
    CMTimeScale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags(lua_State *L)
{
    CMTimeFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeEpoch(lua_State *L)
{
    CMTimeEpoch(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_Valid(lua_State *L)
{
    CMTimeFlags_Valid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimePositiveInfinity(lua_State *L)
{
    CMTimePositiveInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_PositiveInfinity(lua_State *L)
{
    CMTimeFlags_PositiveInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_NegativeInfinity(lua_State *L)
{
    CMTimeFlags_NegativeInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_Indefinite(lua_State *L)
{
    CMTimeFlags_Indefinite(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_Valid(lua_State *L)
{
    CMTimeFlags_Valid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeInvalid(lua_State *L)
{
    CMTimeInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeInvalid(lua_State *L)
{
    CMTimeInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeIndefinite(lua_State *L)
{
    CMTimeIndefinite(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeIndefinite(lua_State *L)
{
    CMTimeIndefinite(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimePositiveInfinity(lua_State *L)
{
    CMTimePositiveInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimePositiveInfinity(lua_State *L)
{
    CMTimePositiveInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeNegativeInfinity(lua_State *L)
{
    CMTimeNegativeInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeNegativeInfinity(lua_State *L)
{
    CMTimeNegativeInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeZero(lua_State *L)
{
    CMTimeZero(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeZero(lua_State *L)
{
    CMTimeZero(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeCompare(lua_State *L)
{
    CMTimeCompare(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMake(lua_State *L)
{
    CMTimeMake(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMake(lua_State *L)
{
    CMTimeMake(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMakeWithEpoch(lua_State *L)
{
    CMTimeMakeWithEpoch(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMakeWithEpoch(lua_State *L)
{
    CMTimeMakeWithEpoch(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMakeWithSeconds(lua_State *L)
{
    CMTimeMakeWithSeconds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMakeWithSeconds(lua_State *L)
{
    CMTimeMakeWithSeconds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeGetSeconds(lua_State *L)
{
    CMTimeGetSeconds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeGetSeconds(lua_State *L)
{
    CMTimeGetSeconds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod(lua_State *L)
{
    CMTimeRoundingMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundHalfAwayFromZero(lua_State *L)
{
    CMTimeRoundingMethod_RoundHalfAwayFromZero(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_Default(lua_State *L)
{
    CMTimeRoundingMethod_Default(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundTowardZero(lua_State *L)
{
    CMTimeRoundingMethod_RoundTowardZero(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundAwayFromZero(lua_State *L)
{
    CMTimeRoundingMethod_RoundAwayFromZero(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_QuickTime(lua_State *L)
{
    CMTimeRoundingMethod_QuickTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundAwayFromZero(lua_State *L)
{
    CMTimeRoundingMethod_RoundAwayFromZero(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundTowardPositiveInfinity(lua_State *L)
{
    CMTimeRoundingMethod_RoundTowardPositiveInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundTowardNegativeInfinity(lua_State *L)
{
    CMTimeRoundingMethod_RoundTowardNegativeInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundHalfAwayFromZero(lua_State *L)
{
    CMTimeRoundingMethod_RoundHalfAwayFromZero(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundTowardZero(lua_State *L)
{
    CMTimeRoundingMethod_RoundTowardZero(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundAwayFromZero(lua_State *L)
{
    CMTimeRoundingMethod_RoundAwayFromZero(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_QuickTime(lua_State *L)
{
    CMTimeRoundingMethod_QuickTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundTowardPositiveInfinity(lua_State *L)
{
    CMTimeRoundingMethod_RoundTowardPositiveInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_RoundTowardNegativeInfinity(lua_State *L)
{
    CMTimeRoundingMethod_RoundTowardNegativeInfinity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod_Default(lua_State *L)
{
    CMTimeRoundingMethod_Default(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod(lua_State *L)
{
    CMTimeRoundingMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeConvertScale(lua_State *L)
{
    CMTimeConvertScale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod(lua_State *L)
{
    CMTimeRoundingMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeConvertScale(lua_State *L)
{
    CMTimeConvertScale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeRoundingMethod(lua_State *L)
{
    CMTimeRoundingMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeAdd(lua_State *L)
{
    CMTimeAdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMaxTimescale(lua_State *L)
{
    CMTimeMaxTimescale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeAdd(lua_State *L)
{
    CMTimeAdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeSubtract(lua_State *L)
{
    CMTimeSubtract(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMaxTimescale(lua_State *L)
{
    CMTimeMaxTimescale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeSubtract(lua_State *L)
{
    CMTimeSubtract(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMultiply(lua_State *L)
{
    CMTimeMultiply(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMultiply(lua_State *L)
{
    CMTimeMultiply(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMultiplyByFloat64(lua_State *L)
{
    CMTimeMultiplyByFloat64(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlags_HasBeenRounded(lua_State *L)
{
    CMTimeFlags_HasBeenRounded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMultiplyByFloat64(lua_State *L)
{
    CMTimeMultiplyByFloat64(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeCompare(lua_State *L)
{
    CMTimeCompare(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeCompare(lua_State *L)
{
    CMTimeCompare(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeCompare(lua_State *L)
{
    CMTimeCompare(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMinimum(lua_State *L)
{
    CMTimeMinimum(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMinimum(lua_State *L)
{
    CMTimeMinimum(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMaximum(lua_State *L)
{
    CMTimeMaximum(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMaximum(lua_State *L)
{
    CMTimeMaximum(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeAbsoluteValue(lua_State *L)
{
    CMTimeAbsoluteValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeAbsoluteValue(lua_State *L)
{
    CMTimeAbsoluteValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeCopyAsDictionary(lua_State *L)
{
    CMTimeCopyAsDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeCopyAsDictionary(lua_State *L)
{
    CMTimeCopyAsDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMakeFromDictionary(lua_State *L)
{
    CMTimeMakeFromDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeCopyAsDictionary(lua_State *L)
{
    CMTimeCopyAsDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimes(lua_State *L)
{
    CMTimes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeMakeFromDictionary(lua_State *L)
{
    CMTimeMakeFromDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeValueKey(lua_State *L)
{
    CMTimeValueKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeValueKey(lua_State *L)
{
    CMTimeValueKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeScaleKey(lua_State *L)
{
    CMTimeScaleKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeScaleKey(lua_State *L)
{
    CMTimeScaleKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeEpochKey(lua_State *L)
{
    CMTimeEpochKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeEpochKey(lua_State *L)
{
    CMTimeEpochKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlagsKey(lua_State *L)
{
    CMTimeFlagsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeFlagsKey(lua_State *L)
{
    CMTimeFlagsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeCopyDescription(lua_State *L)
{
    CMTimeCopyDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeCopyDescription(lua_State *L)
{
    CMTimeCopyDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeShow(lua_State *L)
{
    CMTimeShow(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMTimeShow(lua_State *L)
{
    CMTimeShow(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCMTimeAPIs[] = {
    {"CMTimes", lua_CMTimes},
    {"CMTimes", lua_CMTimes},
    {"CMTimeMakeFromDictionary", lua_CMTimeMakeFromDictionary},
    {"CMTimeValue", lua_CMTimeValue},
    {"CMTimeValue", lua_CMTimeValue},
    {"CMTimeScale", lua_CMTimeScale},
    {"CMTimeScale", lua_CMTimeScale},
    {"CMTimeMaxTimescale", lua_CMTimeMaxTimescale},
    {"CMTimeEpoch", lua_CMTimeEpoch},
    {"CMTimeEpoch", lua_CMTimeEpoch},
    {"CMTimeFlags", lua_CMTimeFlags},
    {"CMTimeFlags_Valid", lua_CMTimeFlags_Valid},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeFlags_PositiveInfinity", lua_CMTimeFlags_PositiveInfinity},
    {"CMTimeFlags_NegativeInfinity", lua_CMTimeFlags_NegativeInfinity},
    {"CMTimeFlags_Indefinite", lua_CMTimeFlags_Indefinite},
    {"CMTimeFlags_Valid", lua_CMTimeFlags_Valid},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeFlags_PositiveInfinity", lua_CMTimeFlags_PositiveInfinity},
    {"CMTimeFlags_NegativeInfinity", lua_CMTimeFlags_NegativeInfinity},
    {"CMTimeFlags_Indefinite", lua_CMTimeFlags_Indefinite},
    {"CMTimeFlags_ImpliedValueFlagsMask", lua_CMTimeFlags_ImpliedValueFlagsMask},
    {"CMTimeFlags", lua_CMTimeFlags},
    {"CMTimeValue", lua_CMTimeValue},
    {"CMTimeScale", lua_CMTimeScale},
    {"CMTimeFlags", lua_CMTimeFlags},
    {"CMTimeEpoch", lua_CMTimeEpoch},
    {"CMTimeFlags_Valid", lua_CMTimeFlags_Valid},
    {"CMTimePositiveInfinity", lua_CMTimePositiveInfinity},
    {"CMTimeFlags_PositiveInfinity", lua_CMTimeFlags_PositiveInfinity},
    {"CMTimeFlags_NegativeInfinity", lua_CMTimeFlags_NegativeInfinity},
    {"CMTimeFlags_Indefinite", lua_CMTimeFlags_Indefinite},
    {"CMTimeFlags_Valid", lua_CMTimeFlags_Valid},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeInvalid", lua_CMTimeInvalid},
    {"CMTimeInvalid", lua_CMTimeInvalid},
    {"CMTimes", lua_CMTimes},
    {"CMTimeIndefinite", lua_CMTimeIndefinite},
    {"CMTimeIndefinite", lua_CMTimeIndefinite},
    {"CMTimes", lua_CMTimes},
    {"CMTimePositiveInfinity", lua_CMTimePositiveInfinity},
    {"CMTimePositiveInfinity", lua_CMTimePositiveInfinity},
    {"CMTimes", lua_CMTimes},
    {"CMTimeNegativeInfinity", lua_CMTimeNegativeInfinity},
    {"CMTimeNegativeInfinity", lua_CMTimeNegativeInfinity},
    {"CMTimes", lua_CMTimes},
    {"CMTimeZero", lua_CMTimeZero},
    {"CMTimeZero", lua_CMTimeZero},
    {"CMTimes", lua_CMTimes},
    {"CMTimeCompare", lua_CMTimeCompare},
    {"CMTimeMake", lua_CMTimeMake},
    {"CMTimeMake", lua_CMTimeMake},
    {"CMTimeMakeWithEpoch", lua_CMTimeMakeWithEpoch},
    {"CMTimeMakeWithEpoch", lua_CMTimeMakeWithEpoch},
    {"CMTimeMakeWithSeconds", lua_CMTimeMakeWithSeconds},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeMakeWithSeconds", lua_CMTimeMakeWithSeconds},
    {"CMTimeGetSeconds", lua_CMTimeGetSeconds},
    {"CMTimeGetSeconds", lua_CMTimeGetSeconds},
    {"CMTimeRoundingMethod", lua_CMTimeRoundingMethod},
    {"CMTimeRoundingMethod_RoundHalfAwayFromZero", lua_CMTimeRoundingMethod_RoundHalfAwayFromZero},
    {"CMTimeRoundingMethod_Default", lua_CMTimeRoundingMethod_Default},
    {"CMTimeRoundingMethod_RoundTowardZero", lua_CMTimeRoundingMethod_RoundTowardZero},
    {"CMTimeRoundingMethod_RoundAwayFromZero", lua_CMTimeRoundingMethod_RoundAwayFromZero},
    {"CMTimeRoundingMethod_QuickTime", lua_CMTimeRoundingMethod_QuickTime},
    {"CMTimeRoundingMethod_RoundAwayFromZero", lua_CMTimeRoundingMethod_RoundAwayFromZero},
    {"CMTimeRoundingMethod_RoundTowardPositiveInfinity", lua_CMTimeRoundingMethod_RoundTowardPositiveInfinity},
    {"CMTimeRoundingMethod_RoundTowardNegativeInfinity", lua_CMTimeRoundingMethod_RoundTowardNegativeInfinity},
    {"CMTimeRoundingMethod_RoundHalfAwayFromZero", lua_CMTimeRoundingMethod_RoundHalfAwayFromZero},
    {"CMTimeRoundingMethod_RoundTowardZero", lua_CMTimeRoundingMethod_RoundTowardZero},
    {"CMTimeRoundingMethod_RoundAwayFromZero", lua_CMTimeRoundingMethod_RoundAwayFromZero},
    {"CMTimeRoundingMethod_QuickTime", lua_CMTimeRoundingMethod_QuickTime},
    {"CMTimeRoundingMethod_RoundTowardPositiveInfinity", lua_CMTimeRoundingMethod_RoundTowardPositiveInfinity},
    {"CMTimeRoundingMethod_RoundTowardNegativeInfinity", lua_CMTimeRoundingMethod_RoundTowardNegativeInfinity},
    {"CMTimeRoundingMethod_Default", lua_CMTimeRoundingMethod_Default},
    {"CMTimeRoundingMethod", lua_CMTimeRoundingMethod},
    {"CMTimeConvertScale", lua_CMTimeConvertScale},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeRoundingMethod", lua_CMTimeRoundingMethod},
    {"CMTimeConvertScale", lua_CMTimeConvertScale},
    {"CMTimeRoundingMethod", lua_CMTimeRoundingMethod},
    {"CMTimeAdd", lua_CMTimeAdd},
    {"CMTimes", lua_CMTimes},
    {"CMTimeMaxTimescale", lua_CMTimeMaxTimescale},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimes", lua_CMTimes},
    {"CMTimeAdd", lua_CMTimeAdd},
    {"CMTimeSubtract", lua_CMTimeSubtract},
    {"CMTimes", lua_CMTimes},
    {"CMTimeMaxTimescale", lua_CMTimeMaxTimescale},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimes", lua_CMTimes},
    {"CMTimeSubtract", lua_CMTimeSubtract},
    {"CMTimeMultiply", lua_CMTimeMultiply},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeMultiply", lua_CMTimeMultiply},
    {"CMTimeMultiplyByFloat64", lua_CMTimeMultiplyByFloat64},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeFlags_HasBeenRounded", lua_CMTimeFlags_HasBeenRounded},
    {"CMTimeMultiplyByFloat64", lua_CMTimeMultiplyByFloat64},
    {"CMTimeCompare", lua_CMTimeCompare},
    {"CMTimes", lua_CMTimes},
    {"CMTimes", lua_CMTimes},
    {"CMTimes", lua_CMTimes},
    {"CMTimes", lua_CMTimes},
    {"CMTimeCompare", lua_CMTimeCompare},
    {"CMTimes", lua_CMTimes},
    {"CMTimeCompare", lua_CMTimeCompare},
    {"CMTimeMinimum", lua_CMTimeMinimum},
    {"CMTimes", lua_CMTimes},
    {"CMTimes", lua_CMTimes},
    {"CMTimeMinimum", lua_CMTimeMinimum},
    {"CMTimeMaximum", lua_CMTimeMaximum},
    {"CMTimes", lua_CMTimes},
    {"CMTimes", lua_CMTimes},
    {"CMTimeMaximum", lua_CMTimeMaximum},
    {"CMTimeAbsoluteValue", lua_CMTimeAbsoluteValue},
    {"CMTimeAbsoluteValue", lua_CMTimeAbsoluteValue},
    {"CMTimeCopyAsDictionary", lua_CMTimeCopyAsDictionary},
    {"CMTimes", lua_CMTimes},
    {"CMTimeCopyAsDictionary", lua_CMTimeCopyAsDictionary},
    {"CMTimeMakeFromDictionary", lua_CMTimeMakeFromDictionary},
    {"CMTimeCopyAsDictionary", lua_CMTimeCopyAsDictionary},
    {"CMTimes", lua_CMTimes},
    {"CMTimeMakeFromDictionary", lua_CMTimeMakeFromDictionary},
    {"CMTimeValueKey", lua_CMTimeValueKey},
    {"CMTimeValueKey", lua_CMTimeValueKey},
    {"CMTimeScaleKey", lua_CMTimeScaleKey},
    {"CMTimeScaleKey", lua_CMTimeScaleKey},
    {"CMTimeEpochKey", lua_CMTimeEpochKey},
    {"CMTimeEpochKey", lua_CMTimeEpochKey},
    {"CMTimeFlagsKey", lua_CMTimeFlagsKey},
    {"CMTimeFlagsKey", lua_CMTimeFlagsKey},
    {"CMTimeCopyDescription", lua_CMTimeCopyDescription},
    {"CMTimeCopyDescription", lua_CMTimeCopyDescription},
    {"CMTimeShow", lua_CMTimeShow},
    {"CMTimeShow", lua_CMTimeShow},
    {NULL, NULL},
};

int LuaOpenCMTime(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCMTimeAPIs);
    return 0;
}
