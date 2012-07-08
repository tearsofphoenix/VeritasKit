//
//  LuaMFMailComposeViewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMFMailComposeViewController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MFMailComposeViewControllerDelegate(lua_State *L)
{
    MFMailComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMailComposeViewControllerDelegate(lua_State *L)
{
    MFMailComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMailComposeViewControllerDelegate(lua_State *L)
{
    MFMailComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMailComposeViewControllerDelegate(lua_State *L)
{
    MFMailComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMailComposeViewControllerDelegate(lua_State *L)
{
    MFMailComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMFMailComposeViewControllerAPIs[] = {
    {"MFMailComposeViewControllerDelegate", lua_MFMailComposeViewControllerDelegate},
    {"MFMailComposeViewControllerDelegate", lua_MFMailComposeViewControllerDelegate},
    {"MFMailComposeViewControllerDelegate", lua_MFMailComposeViewControllerDelegate},
    {"MFMailComposeViewControllerDelegate", lua_MFMailComposeViewControllerDelegate},
    {"MFMailComposeViewControllerDelegate", lua_MFMailComposeViewControllerDelegate},
    {NULL, NULL},
};

int LuaOpenMFMailComposeViewController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMFMailComposeViewControllerAPIs);
    return 0;
}
