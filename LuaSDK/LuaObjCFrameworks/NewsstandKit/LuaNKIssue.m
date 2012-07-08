//
//  LuaNKIssue.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNKIssue.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NKIssueDownloadCompletedNotification(lua_State *L)
{
    NKIssueDownloadCompletedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_NKIssueDownloadCompletedNotification(lua_State *L)
{
    NKIssueDownloadCompletedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_NKIssueContentStatusNone(lua_State *L)
{
    NKIssueContentStatusNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_NKIssueContentStatusDownloading(lua_State *L)
{
    NKIssueContentStatusDownloading(lua_touserdata(L, 1));
    return 1;
}

static int lua_NKIssueContentStatusAvailable(lua_State *L)
{
    NKIssueContentStatusAvailable(lua_touserdata(L, 1));
    return 1;
}

static int lua_NKIssueContentStatus(lua_State *L)
{
    NKIssueContentStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_NKIssueContentStatusDownloading(lua_State *L)
{
    NKIssueContentStatusDownloading(lua_touserdata(L, 1));
    return 1;
}

static int lua_NKIssueContentStatusAvailable(lua_State *L)
{
    NKIssueContentStatusAvailable(lua_touserdata(L, 1));
    return 1;
}

static int lua_NKIssueContentStatusNone(lua_State *L)
{
    NKIssueContentStatusNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_NKIssueContentStatus(lua_State *L)
{
    NKIssueContentStatus(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNKIssueAPIs[] = {
    {"NKIssueDownloadCompletedNotification", lua_NKIssueDownloadCompletedNotification},
    {"NKIssueDownloadCompletedNotification", lua_NKIssueDownloadCompletedNotification},
    {"NKIssueContentStatusNone", lua_NKIssueContentStatusNone},
    {"NKIssueContentStatusDownloading", lua_NKIssueContentStatusDownloading},
    {"NKIssueContentStatusAvailable", lua_NKIssueContentStatusAvailable},
    {"NKIssueContentStatus", lua_NKIssueContentStatus},
    {"NKIssueContentStatusDownloading", lua_NKIssueContentStatusDownloading},
    {"NKIssueContentStatusAvailable", lua_NKIssueContentStatusAvailable},
    {"NKIssueContentStatusNone", lua_NKIssueContentStatusNone},
    {"NKIssueContentStatus", lua_NKIssueContentStatus},
    {NULL, NULL},
};

int LuaOpenNKIssue(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNKIssueAPIs);
    return 0;
}
