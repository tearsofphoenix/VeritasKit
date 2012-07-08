//
//  LuaMFMessageComposeViewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMFMessageComposeViewController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification(lua_State *L)
{
    MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification(lua_State *L)
{
    MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMessageComposeViewControllerTextMessageAvailabilityKey(lua_State *L)
{
    MFMessageComposeViewControllerTextMessageAvailabilityKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification(lua_State *L)
{
    MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMessageComposeViewControllerTextMessageAvailabilityKey(lua_State *L)
{
    MFMessageComposeViewControllerTextMessageAvailabilityKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMessageComposeViewControllerDelegate(lua_State *L)
{
    MFMessageComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMessageComposeViewControllerDelegate(lua_State *L)
{
    MFMessageComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMessageComposeViewControllerDelegate(lua_State *L)
{
    MFMessageComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMessageComposeViewControllerDelegate(lua_State *L)
{
    MFMessageComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMessageComposeViewControllerDelegate(lua_State *L)
{
    MFMessageComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MFMessageComposeViewControllerDelegate(lua_State *L)
{
    MFMessageComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMFMessageComposeViewControllerAPIs[] = {
    {"MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification", lua_MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification},
    {"MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification", lua_MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification},
    {"MFMessageComposeViewControllerTextMessageAvailabilityKey", lua_MFMessageComposeViewControllerTextMessageAvailabilityKey},
    {"MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification", lua_MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification},
    {"MFMessageComposeViewControllerTextMessageAvailabilityKey", lua_MFMessageComposeViewControllerTextMessageAvailabilityKey},
    {"MFMessageComposeViewControllerDelegate", lua_MFMessageComposeViewControllerDelegate},
    {"MFMessageComposeViewControllerDelegate", lua_MFMessageComposeViewControllerDelegate},
    {"MFMessageComposeViewControllerDelegate", lua_MFMessageComposeViewControllerDelegate},
    {"MFMessageComposeViewControllerDelegate", lua_MFMessageComposeViewControllerDelegate},
    {"MFMessageComposeViewControllerDelegate", lua_MFMessageComposeViewControllerDelegate},
    {"MFMessageComposeViewControllerDelegate", lua_MFMessageComposeViewControllerDelegate},
    {NULL, NULL},
};

int LuaOpenMFMessageComposeViewController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMFMessageComposeViewControllerAPIs);
    return 0;
}
