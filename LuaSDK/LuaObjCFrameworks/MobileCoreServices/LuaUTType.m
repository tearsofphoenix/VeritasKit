//
//  LuaUTType.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUTType.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_UTTypeIdentifier(lua_State *L)
{
    UTTypeIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeDescription(lua_State *L)
{
    UTTypeDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeIconFile(lua_State *L)
{
    UTTypeIconFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeConformsTo(lua_State *L)
{
    UTTypeConformsTo(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeTagSpecification(lua_State *L)
{
    UTTypeTagSpecification(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeIdentifierKey(lua_State *L)
{
    UTTypeIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeIdentifierKey(lua_State *L)
{
    UTTypeIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeTagSpecificationKey(lua_State *L)
{
    UTTypeTagSpecificationKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeTagSpecificationKey(lua_State *L)
{
    UTTypeTagSpecificationKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeConformsToKey(lua_State *L)
{
    UTTypeConformsToKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeConformsToKey(lua_State *L)
{
    UTTypeConformsToKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeDescriptionKey(lua_State *L)
{
    UTTypeDescriptionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeDescriptionKey(lua_State *L)
{
    UTTypeDescriptionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeIconFileKey(lua_State *L)
{
    UTTypeIconFileKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeIconFileKey(lua_State *L)
{
    UTTypeIconFileKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeReferenceURLKey(lua_State *L)
{
    UTTypeReferenceURLKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeReferenceURLKey(lua_State *L)
{
    UTTypeReferenceURLKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeVersionKey(lua_State *L)
{
    UTTypeVersionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeVersionKey(lua_State *L)
{
    UTTypeVersionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCreatePreferredIdentifierForTag(lua_State *L)
{
    UTTypeCreatePreferredIdentifierForTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCreateAllIdentifiersForTag(lua_State *L)
{
    UTTypeCreateAllIdentifiersForTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCreatePreferredIdentifierForTag(lua_State *L)
{
    UTTypeCreatePreferredIdentifierForTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCreateAllIdentifiersForTag(lua_State *L)
{
    UTTypeCreateAllIdentifiersForTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCreateAllIdentifiersForTag(lua_State *L)
{
    UTTypeCreateAllIdentifiersForTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCopyPreferredTagWithClass(lua_State *L)
{
    UTTypeCopyPreferredTagWithClass(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCopyPreferredTagWithClass(lua_State *L)
{
    UTTypeCopyPreferredTagWithClass(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeEqual(lua_State *L)
{
    UTTypeEqual(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeEqual(lua_State *L)
{
    UTTypeEqual(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeConformsTo(lua_State *L)
{
    UTTypeConformsTo(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeConformsTo(lua_State *L)
{
    UTTypeConformsTo(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCopyDescription(lua_State *L)
{
    UTTypeCopyDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCopyDescription(lua_State *L)
{
    UTTypeCopyDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCopyDeclaration(lua_State *L)
{
    UTTypeCopyDeclaration(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCopyDeclaration(lua_State *L)
{
    UTTypeCopyDeclaration(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCopyDeclaringBundleURL(lua_State *L)
{
    UTTypeCopyDeclaringBundleURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_UTTypeCopyDeclaringBundleURL(lua_State *L)
{
    UTTypeCopyDeclaringBundleURL(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaUTTypeAPIs[] = {
    {"UTTypeIdentifier", lua_UTTypeIdentifier},
    {"UTTypeDescription", lua_UTTypeDescription},
    {"UTTypeIconFile", lua_UTTypeIconFile},
    {"UTTypeConformsTo", lua_UTTypeConformsTo},
    {"UTTypeTagSpecification", lua_UTTypeTagSpecification},
    {"UTTypeIdentifierKey", lua_UTTypeIdentifierKey},
    {"UTTypeIdentifierKey", lua_UTTypeIdentifierKey},
    {"UTTypeTagSpecificationKey", lua_UTTypeTagSpecificationKey},
    {"UTTypeTagSpecificationKey", lua_UTTypeTagSpecificationKey},
    {"UTTypeConformsToKey", lua_UTTypeConformsToKey},
    {"UTTypeConformsToKey", lua_UTTypeConformsToKey},
    {"UTTypeDescriptionKey", lua_UTTypeDescriptionKey},
    {"UTTypeDescriptionKey", lua_UTTypeDescriptionKey},
    {"UTTypeIconFileKey", lua_UTTypeIconFileKey},
    {"UTTypeIconFileKey", lua_UTTypeIconFileKey},
    {"UTTypeReferenceURLKey", lua_UTTypeReferenceURLKey},
    {"UTTypeReferenceURLKey", lua_UTTypeReferenceURLKey},
    {"UTTypeVersionKey", lua_UTTypeVersionKey},
    {"UTTypeVersionKey", lua_UTTypeVersionKey},
    {"UTTypeCreatePreferredIdentifierForTag", lua_UTTypeCreatePreferredIdentifierForTag},
    {"UTTypeCreateAllIdentifiersForTag", lua_UTTypeCreateAllIdentifiersForTag},
    {"UTTypeCreatePreferredIdentifierForTag", lua_UTTypeCreatePreferredIdentifierForTag},
    {"UTTypeCreateAllIdentifiersForTag", lua_UTTypeCreateAllIdentifiersForTag},
    {"UTTypeCreateAllIdentifiersForTag", lua_UTTypeCreateAllIdentifiersForTag},
    {"UTTypeCopyPreferredTagWithClass", lua_UTTypeCopyPreferredTagWithClass},
    {"UTTypeCopyPreferredTagWithClass", lua_UTTypeCopyPreferredTagWithClass},
    {"UTTypeEqual", lua_UTTypeEqual},
    {"UTTypeEqual", lua_UTTypeEqual},
    {"UTTypeConformsTo", lua_UTTypeConformsTo},
    {"UTTypeConformsTo", lua_UTTypeConformsTo},
    {"UTTypeCopyDescription", lua_UTTypeCopyDescription},
    {"UTTypeCopyDescription", lua_UTTypeCopyDescription},
    {"UTTypeCopyDeclaration", lua_UTTypeCopyDeclaration},
    {"UTTypeCopyDeclaration", lua_UTTypeCopyDeclaration},
    {"UTTypeCopyDeclaringBundleURL", lua_UTTypeCopyDeclaringBundleURL},
    {"UTTypeCopyDeclaringBundleURL", lua_UTTypeCopyDeclaringBundleURL},
    {NULL, NULL},
};

int LuaOpenUTType(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaUTTypeAPIs);
    return 0;
}
