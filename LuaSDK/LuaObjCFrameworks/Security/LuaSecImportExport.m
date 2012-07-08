//
//  LuaSecImportExport.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSecImportExport.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SecImportExportPassphrase(lua_State *L)
{
    SecImportExportPassphrase(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecImportExportPassphrase(lua_State *L)
{
    SecImportExportPassphrase(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecImportExportPassphrase(lua_State *L)
{
    SecImportExportPassphrase(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSecImportExportAPIs[] = {
    {"SecImportExportPassphrase", lua_SecImportExportPassphrase},
    {"SecImportExportPassphrase", lua_SecImportExportPassphrase},
    {"SecImportExportPassphrase", lua_SecImportExportPassphrase},
    {NULL, NULL},
};

int LuaOpenSecImportExport(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSecImportExportAPIs);
    return 0;
}
