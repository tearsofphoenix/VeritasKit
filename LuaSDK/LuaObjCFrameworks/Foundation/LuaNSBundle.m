//
//  LuaNSBundle.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSBundle.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaObjCAuxiliary.h"

static int lua_NSLocalizedString(lua_State *L)
{
    luaObjC_pushNSObject(L, NSLocalizedString(luaObjC_checkNSObject(L, 1), luaObjC_checkNSObject(L, 2)));
    return 1;
}

static int lua_NSLocalizedStringFromTable(lua_State *L)
{    
    luaObjC_pushNSObject(L, NSLocalizedStringFromTable(luaObjC_checkNSObject(L, 1), 
                                                    luaObjC_checkNSObject(L, 2),
                                                    luaObjC_checkNSObject(L, 3)));

    return 1;
}

static int lua_NSLocalizedStringFromTableInBundle(lua_State *L)
{    
    luaObjC_pushNSObject(L, NSLocalizedStringFromTableInBundle(luaObjC_checkNSObject(L, 1), 
                                                            luaObjC_checkNSObject(L, 2),
                                                            luaObjC_checkNSObject(L, 3),
                                                            luaObjC_checkNSObject(L, 4)));
    
    return 1;
}

static int lua_NSLocalizedStringWithDefaultValue(lua_State *L)
{    
    luaObjC_pushNSObject(L, NSLocalizedStringWithDefaultValue(luaObjC_checkNSObject(L, 1), 
                                                            luaObjC_checkNSObject(L, 2),
                                                            luaObjC_checkNSObject(L, 3),
                                                            luaObjC_checkNSObject(L, 4),
                                                            luaObjC_checkNSObject(L, 5)));
    
    return 1;
}

static const luaL_Reg __luaNSBundleAPIs[] = 
{
    {"NSLocalizedString", lua_NSLocalizedString},
    {"NSLocalizedStringFromTable", lua_NSLocalizedStringFromTable},
    {"NSLocalizedStringFromTableInBundle", lua_NSLocalizedStringFromTableInBundle},
    {"NSLocalizedStringWithDefaultValue", lua_NSLocalizedStringWithDefaultValue},
    {NULL, NULL},
};

int LuaOpenNSBundle(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __luaNSBundleAPIs);
    return 0;
}
