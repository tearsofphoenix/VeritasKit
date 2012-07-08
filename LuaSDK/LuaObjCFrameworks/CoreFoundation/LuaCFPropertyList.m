//
//  LuaCFPropertyList.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFPropertyList.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFPropertyListImmutable(lua_State *L)
{
    CFPropertyListImmutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListMutableContainers(lua_State *L)
{
    CFPropertyListMutableContainers(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListMutableContainersAndLeaves(lua_State *L)
{
    CFPropertyListMutableContainersAndLeaves(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListMutabilityOptions(lua_State *L)
{
    CFPropertyListMutabilityOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListCreateWithData(lua_State *L)
{
    CFPropertyListCreateWithData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListRef(lua_State *L)
{
    CFPropertyListRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListCreateData(lua_State *L)
{
    CFPropertyListCreateData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListCreateXMLData(lua_State *L)
{
    CFPropertyListCreateXMLData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListRef(lua_State *L)
{
    CFPropertyListRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListOpenStepFormat(lua_State *L)
{
    CFPropertyListOpenStepFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListXMLFormat_v1_0(lua_State *L)
{
    CFPropertyListXMLFormat_v1_0(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListBinaryFormat_v1_0(lua_State *L)
{
    CFPropertyListBinaryFormat_v1_0(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListFormat(lua_State *L)
{
    CFPropertyListFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListIsValid(lua_State *L)
{
    CFPropertyListIsValid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListWrite(lua_State *L)
{
    CFPropertyListWrite(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListWriteToStream(lua_State *L)
{
    CFPropertyListWriteToStream(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListCreateFromXMLData(lua_State *L)
{
    CFPropertyListCreateFromXMLData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListCreateFromXMLData(lua_State *L)
{
    CFPropertyListCreateFromXMLData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListCreateWithStream(lua_State *L)
{
    CFPropertyListCreateWithStream(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListRef(lua_State *L)
{
    CFPropertyListRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListReadCorruptError(lua_State *L)
{
    CFPropertyListReadCorruptError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListReadUnknownVersionError(lua_State *L)
{
    CFPropertyListReadUnknownVersionError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListReadStreamError(lua_State *L)
{
    CFPropertyListReadStreamError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListWriteStreamError(lua_State *L)
{
    CFPropertyListWriteStreamError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListMutabilityOptions(lua_State *L)
{
    CFPropertyListMutabilityOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListRef(lua_State *L)
{
    CFPropertyListRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListMutabilityOptions(lua_State *L)
{
    CFPropertyListMutabilityOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListRef(lua_State *L)
{
    CFPropertyListRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListWrite(lua_State *L)
{
    CFPropertyListWrite(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPropertyListCreateData(lua_State *L)
{
    CFPropertyListCreateData(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFPropertyListAPIs[] = {
    {"CFPropertyListImmutable", lua_CFPropertyListImmutable},
    {"CFPropertyListMutableContainers", lua_CFPropertyListMutableContainers},
    {"CFPropertyListMutableContainersAndLeaves", lua_CFPropertyListMutableContainersAndLeaves},
    {"CFPropertyListMutabilityOptions", lua_CFPropertyListMutabilityOptions},
    {"CFPropertyListCreateWithData", lua_CFPropertyListCreateWithData},
    {"CFPropertyListRef", lua_CFPropertyListRef},
    {"CFPropertyListCreateData", lua_CFPropertyListCreateData},
    {"CFPropertyListCreateXMLData", lua_CFPropertyListCreateXMLData},
    {"CFPropertyListRef", lua_CFPropertyListRef},
    {"CFPropertyListOpenStepFormat", lua_CFPropertyListOpenStepFormat},
    {"CFPropertyListXMLFormat_v1_0", lua_CFPropertyListXMLFormat_v1_0},
    {"CFPropertyListBinaryFormat_v1_0", lua_CFPropertyListBinaryFormat_v1_0},
    {"CFPropertyListFormat", lua_CFPropertyListFormat},
    {"CFPropertyListIsValid", lua_CFPropertyListIsValid},
    {"CFPropertyListWrite", lua_CFPropertyListWrite},
    {"CFPropertyListWriteToStream", lua_CFPropertyListWriteToStream},
    {"CFPropertyListCreateFromXMLData", lua_CFPropertyListCreateFromXMLData},
    {"CFPropertyListCreateFromXMLData", lua_CFPropertyListCreateFromXMLData},
    {"CFPropertyListCreateWithStream", lua_CFPropertyListCreateWithStream},
    {"CFPropertyListRef", lua_CFPropertyListRef},
    {"CFPropertyListReadCorruptError", lua_CFPropertyListReadCorruptError},
    {"CFPropertyListReadUnknownVersionError", lua_CFPropertyListReadUnknownVersionError},
    {"CFPropertyListReadStreamError", lua_CFPropertyListReadStreamError},
    {"CFPropertyListWriteStreamError", lua_CFPropertyListWriteStreamError},
    {"CFPropertyListMutabilityOptions", lua_CFPropertyListMutabilityOptions},
    {"CFPropertyListRef", lua_CFPropertyListRef},
    {"CFPropertyListMutabilityOptions", lua_CFPropertyListMutabilityOptions},
    {"CFPropertyListRef", lua_CFPropertyListRef},
    {"CFPropertyListWrite", lua_CFPropertyListWrite},
    {"CFPropertyListCreateData", lua_CFPropertyListCreateData},
    {NULL, NULL},
};

int LuaOpenCFPropertyList(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFPropertyListAPIs);
    return 0;
}
