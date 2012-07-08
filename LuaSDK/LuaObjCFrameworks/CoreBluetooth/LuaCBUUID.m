//
//  LuaCBUUID.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCBUUID.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CBUUIDGenericAccessProfileString(lua_State *L)
{
    CBUUIDGenericAccessProfileString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDGenericAccessProfileString(lua_State *L)
{
    CBUUIDGenericAccessProfileString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDGenericAttributeProfileString(lua_State *L)
{
    CBUUIDGenericAttributeProfileString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDGenericAttributeProfileString(lua_State *L)
{
    CBUUIDGenericAttributeProfileString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDCharacteristicExtendedPropertiesString(lua_State *L)
{
    CBUUIDCharacteristicExtendedPropertiesString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDCharacteristicExtendedPropertiesString(lua_State *L)
{
    CBUUIDCharacteristicExtendedPropertiesString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDCharacteristicUserDescriptionString(lua_State *L)
{
    CBUUIDCharacteristicUserDescriptionString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDCharacteristicUserDescriptionString(lua_State *L)
{
    CBUUIDCharacteristicUserDescriptionString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDClientCharacteristicConfigurationString(lua_State *L)
{
    CBUUIDClientCharacteristicConfigurationString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDClientCharacteristicConfigurationString(lua_State *L)
{
    CBUUIDClientCharacteristicConfigurationString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDServerCharacteristicConfigurationString(lua_State *L)
{
    CBUUIDServerCharacteristicConfigurationString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDServerCharacteristicConfigurationString(lua_State *L)
{
    CBUUIDServerCharacteristicConfigurationString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDCharacteristicFormatString(lua_State *L)
{
    CBUUIDCharacteristicFormatString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDCharacteristicFormatString(lua_State *L)
{
    CBUUIDCharacteristicFormatString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDCharacteristicAggregateFormatString(lua_State *L)
{
    CBUUIDCharacteristicAggregateFormatString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDCharacteristicAggregateFormatString(lua_State *L)
{
    CBUUIDCharacteristicAggregateFormatString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDDeviceNameString(lua_State *L)
{
    CBUUIDDeviceNameString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDDeviceNameString(lua_State *L)
{
    CBUUIDDeviceNameString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDAppearanceString(lua_State *L)
{
    CBUUIDAppearanceString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDAppearanceString(lua_State *L)
{
    CBUUIDAppearanceString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDPeripheralPrivacyFlagString(lua_State *L)
{
    CBUUIDPeripheralPrivacyFlagString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDPeripheralPrivacyFlagString(lua_State *L)
{
    CBUUIDPeripheralPrivacyFlagString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDReconnectionAddressString(lua_State *L)
{
    CBUUIDReconnectionAddressString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDReconnectionAddressString(lua_State *L)
{
    CBUUIDReconnectionAddressString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDPeripheralPreferredConnectionParametersString(lua_State *L)
{
    CBUUIDPeripheralPreferredConnectionParametersString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDPeripheralPreferredConnectionParametersString(lua_State *L)
{
    CBUUIDPeripheralPreferredConnectionParametersString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDServiceChangedString(lua_State *L)
{
    CBUUIDServiceChangedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBUUIDServiceChangedString(lua_State *L)
{
    CBUUIDServiceChangedString(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCBUUIDAPIs[] = {
    {"CBUUIDGenericAccessProfileString", lua_CBUUIDGenericAccessProfileString},
    {"CBUUIDGenericAccessProfileString", lua_CBUUIDGenericAccessProfileString},
    {"CBUUIDGenericAttributeProfileString", lua_CBUUIDGenericAttributeProfileString},
    {"CBUUIDGenericAttributeProfileString", lua_CBUUIDGenericAttributeProfileString},
    {"CBUUIDCharacteristicExtendedPropertiesString", lua_CBUUIDCharacteristicExtendedPropertiesString},
    {"CBUUIDCharacteristicExtendedPropertiesString", lua_CBUUIDCharacteristicExtendedPropertiesString},
    {"CBUUIDCharacteristicUserDescriptionString", lua_CBUUIDCharacteristicUserDescriptionString},
    {"CBUUIDCharacteristicUserDescriptionString", lua_CBUUIDCharacteristicUserDescriptionString},
    {"CBUUIDClientCharacteristicConfigurationString", lua_CBUUIDClientCharacteristicConfigurationString},
    {"CBUUIDClientCharacteristicConfigurationString", lua_CBUUIDClientCharacteristicConfigurationString},
    {"CBUUIDServerCharacteristicConfigurationString", lua_CBUUIDServerCharacteristicConfigurationString},
    {"CBUUIDServerCharacteristicConfigurationString", lua_CBUUIDServerCharacteristicConfigurationString},
    {"CBUUIDCharacteristicFormatString", lua_CBUUIDCharacteristicFormatString},
    {"CBUUIDCharacteristicFormatString", lua_CBUUIDCharacteristicFormatString},
    {"CBUUIDCharacteristicAggregateFormatString", lua_CBUUIDCharacteristicAggregateFormatString},
    {"CBUUIDCharacteristicAggregateFormatString", lua_CBUUIDCharacteristicAggregateFormatString},
    {"CBUUIDDeviceNameString", lua_CBUUIDDeviceNameString},
    {"CBUUIDDeviceNameString", lua_CBUUIDDeviceNameString},
    {"CBUUIDAppearanceString", lua_CBUUIDAppearanceString},
    {"CBUUIDAppearanceString", lua_CBUUIDAppearanceString},
    {"CBUUIDPeripheralPrivacyFlagString", lua_CBUUIDPeripheralPrivacyFlagString},
    {"CBUUIDPeripheralPrivacyFlagString", lua_CBUUIDPeripheralPrivacyFlagString},
    {"CBUUIDReconnectionAddressString", lua_CBUUIDReconnectionAddressString},
    {"CBUUIDReconnectionAddressString", lua_CBUUIDReconnectionAddressString},
    {"CBUUIDPeripheralPreferredConnectionParametersString", lua_CBUUIDPeripheralPreferredConnectionParametersString},
    {"CBUUIDPeripheralPreferredConnectionParametersString", lua_CBUUIDPeripheralPreferredConnectionParametersString},
    {"CBUUIDServiceChangedString", lua_CBUUIDServiceChangedString},
    {"CBUUIDServiceChangedString", lua_CBUUIDServiceChangedString},
    {NULL, NULL},
};

int LuaOpenCBUUID(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCBUUIDAPIs);
    return 0;
}
