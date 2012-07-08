//
//  LuaCFFileSecurity.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFFileSecurity.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFFileSecurityRef(lua_State *L)
{
    CFFileSecurityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityGetTypeID(lua_State *L)
{
    CFFileSecurityGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityRef(lua_State *L)
{
    CFFileSecurityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityRef(lua_State *L)
{
    CFFileSecurityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityCopyOwnerUUID(lua_State *L)
{
    CFFileSecurityCopyOwnerUUID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecuritySetOwnerUUID(lua_State *L)
{
    CFFileSecuritySetOwnerUUID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityCopyGroupUUID(lua_State *L)
{
    CFFileSecurityCopyGroupUUID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecuritySetGroupUUID(lua_State *L)
{
    CFFileSecuritySetGroupUUID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityCopyAccessControlList(lua_State *L)
{
    CFFileSecurityCopyAccessControlList(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityRemoveACL(lua_State *L)
{
    CFFileSecurityRemoveACL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityRef(lua_State *L)
{
    CFFileSecurityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityRemoveACL(lua_State *L)
{
    CFFileSecurityRemoveACL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityRemoveACL(lua_State *L)
{
    CFFileSecurityRemoveACL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecuritySetAccessControlList(lua_State *L)
{
    CFFileSecuritySetAccessControlList(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityGetOwner(lua_State *L)
{
    CFFileSecurityGetOwner(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecuritySetOwner(lua_State *L)
{
    CFFileSecuritySetOwner(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityGetGroup(lua_State *L)
{
    CFFileSecurityGetGroup(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecuritySetGroup(lua_State *L)
{
    CFFileSecuritySetGroup(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecurityGetMode(lua_State *L)
{
    CFFileSecurityGetMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileSecuritySetMode(lua_State *L)
{
    CFFileSecuritySetMode(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFFileSecurityAPIs[] = {
    {"CFFileSecurityRef", lua_CFFileSecurityRef},
    {"CFFileSecurityGetTypeID", lua_CFFileSecurityGetTypeID},
    {"CFFileSecurityRef", lua_CFFileSecurityRef},
    {"CFFileSecurityRef", lua_CFFileSecurityRef},
    {"CFFileSecurityCopyOwnerUUID", lua_CFFileSecurityCopyOwnerUUID},
    {"CFFileSecuritySetOwnerUUID", lua_CFFileSecuritySetOwnerUUID},
    {"CFFileSecurityCopyGroupUUID", lua_CFFileSecurityCopyGroupUUID},
    {"CFFileSecuritySetGroupUUID", lua_CFFileSecuritySetGroupUUID},
    {"CFFileSecurityCopyAccessControlList", lua_CFFileSecurityCopyAccessControlList},
    {"CFFileSecurityRemoveACL", lua_CFFileSecurityRemoveACL},
    {"CFFileSecurityRef", lua_CFFileSecurityRef},
    {"CFFileSecurityRemoveACL", lua_CFFileSecurityRemoveACL},
    {"CFFileSecurityRemoveACL", lua_CFFileSecurityRemoveACL},
    {"CFFileSecuritySetAccessControlList", lua_CFFileSecuritySetAccessControlList},
    {"CFFileSecurityGetOwner", lua_CFFileSecurityGetOwner},
    {"CFFileSecuritySetOwner", lua_CFFileSecuritySetOwner},
    {"CFFileSecurityGetGroup", lua_CFFileSecurityGetGroup},
    {"CFFileSecuritySetGroup", lua_CFFileSecuritySetGroup},
    {"CFFileSecurityGetMode", lua_CFFileSecurityGetMode},
    {"CFFileSecuritySetMode", lua_CFFileSecuritySetMode},
    {NULL, NULL},
};

int LuaOpenCFFileSecurity(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFFileSecurityAPIs);
    return 0;
}
