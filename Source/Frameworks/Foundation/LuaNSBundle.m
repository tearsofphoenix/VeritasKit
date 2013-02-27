//
//  LuaNSBundle.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSBundle.h"

#import "VMKAuxiliary.h"

static int lua_NSLocalizedString(lua_State *L)
{
    VMKPushObject(L, NSLocalizedString(VMKCheckObject(L, 1),
                                              VMKCheckObject(L, 2)), false);
    return 1;
}

static int lua_NSLocalizedStringFromTable(lua_State *L)
{    
    VMKPushObject(L, NSLocalizedStringFromTable(VMKCheckObject(L, 1), 
                                                    VMKCheckObject(L, 2),
                                                    VMKCheckObject(L, 3)), false);

    return 1;
}

static int lua_NSLocalizedStringFromTableInBundle(lua_State *L)
{    
    VMKPushObject(L, NSLocalizedStringFromTableInBundle(VMKCheckObject(L, 1), 
                                                            VMKCheckObject(L, 2),
                                                            VMKCheckObject(L, 3),
                                                            VMKCheckObject(L, 4)), false);
    
    return 1;
}

static int lua_NSLocalizedStringWithDefaultValue(lua_State *L)
{    
    VMKPushObject(L, NSLocalizedStringWithDefaultValue(VMKCheckObject(L, 1), 
                                                            VMKCheckObject(L, 2),
                                                            VMKCheckObject(L, 3),
                                                            VMKCheckObject(L, 4),
                                                            VMKCheckObject(L, 5)), false);
    
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

int VMKOpenNSBundle(lua_State *L)
{
    VMKLoadGlobalFunctions(L, __luaNSBundleAPIs);
    return 0;
}
