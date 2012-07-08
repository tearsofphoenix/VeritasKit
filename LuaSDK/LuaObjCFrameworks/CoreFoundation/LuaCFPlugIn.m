//
//  LuaCFPlugIn.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFPlugIn.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFPlugInDynamicRegistrationKey(lua_State *L)
{
    CFPlugInDynamicRegistrationKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInDynamicRegisterFunctionKey(lua_State *L)
{
    CFPlugInDynamicRegisterFunctionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInUnloadFunctionKey(lua_State *L)
{
    CFPlugInUnloadFunctionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInFactoriesKey(lua_State *L)
{
    CFPlugInFactoriesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInTypesKey(lua_State *L)
{
    CFPlugInTypesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInDynamicRegisterFunction(lua_State *L)
{
    CFPlugInDynamicRegisterFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInUnloadFunction(lua_State *L)
{
    CFPlugInUnloadFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInFactoryFunction(lua_State *L)
{
    CFPlugInFactoryFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInGetTypeID(lua_State *L)
{
    CFPlugInGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInRef(lua_State *L)
{
    CFPlugInRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInGetBundle(lua_State *L)
{
    CFPlugInGetBundle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInSetLoadOnDemand(lua_State *L)
{
    CFPlugInSetLoadOnDemand(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInSetLoadOnDemand(lua_State *L)
{
    CFPlugInSetLoadOnDemand(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInIsLoadOnDemand(lua_State *L)
{
    CFPlugInIsLoadOnDemand(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInFindFactoriesForPlugInType(lua_State *L)
{
    CFPlugInFindFactoriesForPlugInType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInFindFactoriesForPlugInTypeInPlugIn(lua_State *L)
{
    CFPlugInFindFactoriesForPlugInTypeInPlugIn(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInInstanceCreate(lua_State *L)
{
    CFPlugInInstanceCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInRegisterFactoryFunction(lua_State *L)
{
    CFPlugInRegisterFactoryFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInRegisterFactoryFunctionByName(lua_State *L)
{
    CFPlugInRegisterFactoryFunctionByName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInUnregisterFactory(lua_State *L)
{
    CFPlugInUnregisterFactory(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInRegisterPlugInType(lua_State *L)
{
    CFPlugInRegisterPlugInType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInUnregisterPlugInType(lua_State *L)
{
    CFPlugInUnregisterPlugInType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInAddInstanceForFactory(lua_State *L)
{
    CFPlugInAddInstanceForFactory(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInRemoveInstanceForFactory(lua_State *L)
{
    CFPlugInRemoveInstanceForFactory(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInInstance(lua_State *L)
{
    CFPlugInInstance(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInInstanceGetInterfaceFunction(lua_State *L)
{
    CFPlugInInstanceGetInterfaceFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInInstanceDeallocateInstanceDataFunction(lua_State *L)
{
    CFPlugInInstanceDeallocateInstanceDataFunction(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInInstanceGetInterfaceFunctionTable(lua_State *L)
{
    CFPlugInInstanceGetInterfaceFunctionTable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInInstanceGetFactoryName(lua_State *L)
{
    CFPlugInInstanceGetFactoryName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInInstanceGetInstanceData(lua_State *L)
{
    CFPlugInInstanceGetInstanceData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInInstanceGetTypeID(lua_State *L)
{
    CFPlugInInstanceGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInInstanceRef(lua_State *L)
{
    CFPlugInInstanceRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPlugInCOM(lua_State *L)
{
    CFPlugInCOM(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFPlugInAPIs[] = {
    {"CFPlugInDynamicRegistrationKey", lua_CFPlugInDynamicRegistrationKey},
    {"CFPlugInDynamicRegisterFunctionKey", lua_CFPlugInDynamicRegisterFunctionKey},
    {"CFPlugInUnloadFunctionKey", lua_CFPlugInUnloadFunctionKey},
    {"CFPlugInFactoriesKey", lua_CFPlugInFactoriesKey},
    {"CFPlugInTypesKey", lua_CFPlugInTypesKey},
    {"CFPlugInDynamicRegisterFunction", lua_CFPlugInDynamicRegisterFunction},
    {"CFPlugInUnloadFunction", lua_CFPlugInUnloadFunction},
    {"CFPlugInFactoryFunction", lua_CFPlugInFactoryFunction},
    {"CFPlugInGetTypeID", lua_CFPlugInGetTypeID},
    {"CFPlugInRef", lua_CFPlugInRef},
    {"CFPlugInGetBundle", lua_CFPlugInGetBundle},
    {"CFPlugInSetLoadOnDemand", lua_CFPlugInSetLoadOnDemand},
    {"CFPlugInSetLoadOnDemand", lua_CFPlugInSetLoadOnDemand},
    {"CFPlugInIsLoadOnDemand", lua_CFPlugInIsLoadOnDemand},
    {"CFPlugInFindFactoriesForPlugInType", lua_CFPlugInFindFactoriesForPlugInType},
    {"CFPlugInFindFactoriesForPlugInTypeInPlugIn", lua_CFPlugInFindFactoriesForPlugInTypeInPlugIn},
    {"CFPlugInInstanceCreate", lua_CFPlugInInstanceCreate},
    {"CFPlugInRegisterFactoryFunction", lua_CFPlugInRegisterFactoryFunction},
    {"CFPlugInRegisterFactoryFunctionByName", lua_CFPlugInRegisterFactoryFunctionByName},
    {"CFPlugInUnregisterFactory", lua_CFPlugInUnregisterFactory},
    {"CFPlugInRegisterPlugInType", lua_CFPlugInRegisterPlugInType},
    {"CFPlugInUnregisterPlugInType", lua_CFPlugInUnregisterPlugInType},
    {"CFPlugInAddInstanceForFactory", lua_CFPlugInAddInstanceForFactory},
    {"CFPlugInRemoveInstanceForFactory", lua_CFPlugInRemoveInstanceForFactory},
    {"CFPlugInInstance", lua_CFPlugInInstance},
    {"CFPlugInInstanceGetInterfaceFunction", lua_CFPlugInInstanceGetInterfaceFunction},
    {"CFPlugInInstanceDeallocateInstanceDataFunction", lua_CFPlugInInstanceDeallocateInstanceDataFunction},
    {"CFPlugInInstanceGetInterfaceFunctionTable", lua_CFPlugInInstanceGetInterfaceFunctionTable},
    {"CFPlugInInstanceGetFactoryName", lua_CFPlugInInstanceGetFactoryName},
    {"CFPlugInInstanceGetInstanceData", lua_CFPlugInInstanceGetInstanceData},
    {"CFPlugInInstanceGetTypeID", lua_CFPlugInInstanceGetTypeID},
    {"CFPlugInInstanceRef", lua_CFPlugInInstanceRef},
    {"CFPlugInCOM", lua_CFPlugInCOM},
    {NULL, NULL},
};

int LuaOpenCFPlugIn(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFPlugInAPIs);
    return 0;
}
