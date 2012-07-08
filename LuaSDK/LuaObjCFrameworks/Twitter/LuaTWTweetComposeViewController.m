//
//  LuaTWTweetComposeViewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaTWTweetComposeViewController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_TWTweetComposeViewControllerResult(lua_State *L)
{
    TWTweetComposeViewControllerResult(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWTweetComposeViewControllerResultCancelled(lua_State *L)
{
    TWTweetComposeViewControllerResultCancelled(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWTweetComposeViewControllerResultDone(lua_State *L)
{
    TWTweetComposeViewControllerResultDone(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWTweetComposeViewControllerResult(lua_State *L)
{
    TWTweetComposeViewControllerResult(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWTweetComposeViewControllerCompletionHandler(lua_State *L)
{
    TWTweetComposeViewControllerCompletionHandler(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWTweetComposeViewControllerCompletionHandler(lua_State *L)
{
    TWTweetComposeViewControllerCompletionHandler(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaTWTweetComposeViewControllerAPIs[] = {
    {"TWTweetComposeViewControllerResult", lua_TWTweetComposeViewControllerResult},
    {"TWTweetComposeViewControllerResultCancelled", lua_TWTweetComposeViewControllerResultCancelled},
    {"TWTweetComposeViewControllerResultDone", lua_TWTweetComposeViewControllerResultDone},
    {"TWTweetComposeViewControllerResult", lua_TWTweetComposeViewControllerResult},
    {"TWTweetComposeViewControllerCompletionHandler", lua_TWTweetComposeViewControllerCompletionHandler},
    {"TWTweetComposeViewControllerCompletionHandler", lua_TWTweetComposeViewControllerCompletionHandler},
    {NULL, NULL},
};

int LuaOpenTWTweetComposeViewController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaTWTweetComposeViewControllerAPIs);
    return 0;
}
