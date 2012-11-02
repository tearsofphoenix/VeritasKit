//
//  LuaNSBundle.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSBundle.h"

#import "LuaObjCAuxiliary.h"

static int lua_NSLocalizedString(lua_State *L)
{
    LuaObjCPushObject(L, NSLocalizedString(LuaObjCCheckObject(L, 1),
                                              LuaObjCCheckObject(L, 2)), true, false);
    return 1;
}

static int lua_NSLocalizedStringFromTable(lua_State *L)
{    
    LuaObjCPushObject(L, NSLocalizedStringFromTable(LuaObjCCheckObject(L, 1), 
                                                    LuaObjCCheckObject(L, 2),
                                                    LuaObjCCheckObject(L, 3)), true, false);

    return 1;
}

static int lua_NSLocalizedStringFromTableInBundle(lua_State *L)
{    
    LuaObjCPushObject(L, NSLocalizedStringFromTableInBundle(LuaObjCCheckObject(L, 1), 
                                                            LuaObjCCheckObject(L, 2),
                                                            LuaObjCCheckObject(L, 3),
                                                            LuaObjCCheckObject(L, 4)), true, false);
    
    return 1;
}

static int lua_NSLocalizedStringWithDefaultValue(lua_State *L)
{    
    LuaObjCPushObject(L, NSLocalizedStringWithDefaultValue(LuaObjCCheckObject(L, 1), 
                                                            LuaObjCCheckObject(L, 2),
                                                            LuaObjCCheckObject(L, 3),
                                                            LuaObjCCheckObject(L, 4),
                                                            LuaObjCCheckObject(L, 5)), true, false);
    
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

int LuaObjCOpenNSBundle(lua_State *L)
{
    LuaObjCLoadGlobalFunctions(L, __luaNSBundleAPIs);
    return 0;
}
