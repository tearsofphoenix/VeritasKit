//
//  LuaCFURLEnumerator.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFURLEnumerator.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFURLEnumeratorRef(lua_State *L)
{
    CFURLEnumeratorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGetTypeID(lua_State *L)
{
    CFURLEnumeratorGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGetTypeID(lua_State *L)
{
    CFURLEnumeratorGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorOptions(lua_State *L)
{
    CFURLEnumeratorOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorDefaultBehavior(lua_State *L)
{
    CFURLEnumeratorDefaultBehavior(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorDescendRecursively(lua_State *L)
{
    CFURLEnumeratorDescendRecursively(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorSkipInvisibles(lua_State *L)
{
    CFURLEnumeratorSkipInvisibles(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGenerateFileReferenceURLs(lua_State *L)
{
    CFURLEnumeratorGenerateFileReferenceURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorSkipPackageContents(lua_State *L)
{
    CFURLEnumeratorSkipPackageContents(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorIncludeDirectoriesPreOrder(lua_State *L)
{
    CFURLEnumeratorIncludeDirectoriesPreOrder(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorIncludeDirectoriesPostOrder(lua_State *L)
{
    CFURLEnumeratorIncludeDirectoriesPostOrder(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorIncludeDirectoriesPreOrder(lua_State *L)
{
    CFURLEnumeratorIncludeDirectoriesPreOrder(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorOptions(lua_State *L)
{
    CFURLEnumeratorOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorCreateForDirectoryURL(lua_State *L)
{
    CFURLEnumeratorCreateForDirectoryURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGenerateFileReferenceURLs(lua_State *L)
{
    CFURLEnumeratorGenerateFileReferenceURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorRef(lua_State *L)
{
    CFURLEnumeratorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorCreateForMountedVolumes(lua_State *L)
{
    CFURLEnumeratorCreateForMountedVolumes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGenerateFileReferenceURLs(lua_State *L)
{
    CFURLEnumeratorGenerateFileReferenceURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorDescendRecursively(lua_State *L)
{
    CFURLEnumeratorDescendRecursively(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorRef(lua_State *L)
{
    CFURLEnumeratorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorResult(lua_State *L)
{
    CFURLEnumeratorResult(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorSuccess(lua_State *L)
{
    CFURLEnumeratorSuccess(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorEnd(lua_State *L)
{
    CFURLEnumeratorEnd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorError(lua_State *L)
{
    CFURLEnumeratorError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorDirectoryPostOrderSuccess(lua_State *L)
{
    CFURLEnumeratorDirectoryPostOrderSuccess(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorResult(lua_State *L)
{
    CFURLEnumeratorResult(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGetNextURL(lua_State *L)
{
    CFURLEnumeratorGetNextURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorResult(lua_State *L)
{
    CFURLEnumeratorResult(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorSkipDescendents(lua_State *L)
{
    CFURLEnumeratorSkipDescendents(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorSkipDescendents(lua_State *L)
{
    CFURLEnumeratorSkipDescendents(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGetNextURL(lua_State *L)
{
    CFURLEnumeratorGetNextURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGetNextURL(lua_State *L)
{
    CFURLEnumeratorGetNextURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorCreateForDirectoryURL(lua_State *L)
{
    CFURLEnumeratorCreateForDirectoryURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorSkipDescendents(lua_State *L)
{
    CFURLEnumeratorSkipDescendents(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGetDescendentLevel(lua_State *L)
{
    CFURLEnumeratorGetDescendentLevel(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGetDescendentLevel(lua_State *L)
{
    CFURLEnumeratorGetDescendentLevel(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGetSourceDidChange(lua_State *L)
{
    CFURLEnumeratorGetSourceDidChange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGetSourceDidChange(lua_State *L)
{
    CFURLEnumeratorGetSourceDidChange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEnumeratorGetSourceDidChange(lua_State *L)
{
    CFURLEnumeratorGetSourceDidChange(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFURLEnumeratorAPIs[] = {
    {"CFURLEnumeratorRef", lua_CFURLEnumeratorRef},
    {"CFURLEnumeratorGetTypeID", lua_CFURLEnumeratorGetTypeID},
    {"CFURLEnumeratorGetTypeID", lua_CFURLEnumeratorGetTypeID},
    {"CFURLEnumeratorOptions", lua_CFURLEnumeratorOptions},
    {"CFURLEnumeratorDefaultBehavior", lua_CFURLEnumeratorDefaultBehavior},
    {"CFURLEnumeratorDescendRecursively", lua_CFURLEnumeratorDescendRecursively},
    {"CFURLEnumeratorSkipInvisibles", lua_CFURLEnumeratorSkipInvisibles},
    {"CFURLEnumeratorGenerateFileReferenceURLs", lua_CFURLEnumeratorGenerateFileReferenceURLs},
    {"CFURLEnumeratorSkipPackageContents", lua_CFURLEnumeratorSkipPackageContents},
    {"CFURLEnumeratorIncludeDirectoriesPreOrder", lua_CFURLEnumeratorIncludeDirectoriesPreOrder},
    {"CFURLEnumeratorIncludeDirectoriesPostOrder", lua_CFURLEnumeratorIncludeDirectoriesPostOrder},
    {"CFURLEnumeratorIncludeDirectoriesPreOrder", lua_CFURLEnumeratorIncludeDirectoriesPreOrder},
    {"CFURLEnumeratorOptions", lua_CFURLEnumeratorOptions},
    {"CFURLEnumeratorCreateForDirectoryURL", lua_CFURLEnumeratorCreateForDirectoryURL},
    {"CFURLEnumeratorGenerateFileReferenceURLs", lua_CFURLEnumeratorGenerateFileReferenceURLs},
    {"CFURLEnumeratorRef", lua_CFURLEnumeratorRef},
    {"CFURLEnumeratorCreateForMountedVolumes", lua_CFURLEnumeratorCreateForMountedVolumes},
    {"CFURLEnumeratorGenerateFileReferenceURLs", lua_CFURLEnumeratorGenerateFileReferenceURLs},
    {"CFURLEnumeratorDescendRecursively", lua_CFURLEnumeratorDescendRecursively},
    {"CFURLEnumeratorRef", lua_CFURLEnumeratorRef},
    {"CFURLEnumeratorResult", lua_CFURLEnumeratorResult},
    {"CFURLEnumeratorSuccess", lua_CFURLEnumeratorSuccess},
    {"CFURLEnumeratorEnd", lua_CFURLEnumeratorEnd},
    {"CFURLEnumeratorError", lua_CFURLEnumeratorError},
    {"CFURLEnumeratorDirectoryPostOrderSuccess", lua_CFURLEnumeratorDirectoryPostOrderSuccess},
    {"CFURLEnumeratorResult", lua_CFURLEnumeratorResult},
    {"CFURLEnumeratorGetNextURL", lua_CFURLEnumeratorGetNextURL},
    {"CFURLEnumeratorResult", lua_CFURLEnumeratorResult},
    {"CFURLEnumeratorSkipDescendents", lua_CFURLEnumeratorSkipDescendents},
    {"CFURLEnumeratorSkipDescendents", lua_CFURLEnumeratorSkipDescendents},
    {"CFURLEnumeratorGetNextURL", lua_CFURLEnumeratorGetNextURL},
    {"CFURLEnumeratorGetNextURL", lua_CFURLEnumeratorGetNextURL},
    {"CFURLEnumeratorCreateForDirectoryURL", lua_CFURLEnumeratorCreateForDirectoryURL},
    {"CFURLEnumeratorSkipDescendents", lua_CFURLEnumeratorSkipDescendents},
    {"CFURLEnumeratorGetDescendentLevel", lua_CFURLEnumeratorGetDescendentLevel},
    {"CFURLEnumeratorGetDescendentLevel", lua_CFURLEnumeratorGetDescendentLevel},
    {"CFURLEnumeratorGetSourceDidChange", lua_CFURLEnumeratorGetSourceDidChange},
    {"CFURLEnumeratorGetSourceDidChange", lua_CFURLEnumeratorGetSourceDidChange},
    {"CFURLEnumeratorGetSourceDidChange", lua_CFURLEnumeratorGetSourceDidChange},
    {NULL, NULL},
};

int LuaOpenCFURLEnumerator(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFURLEnumeratorAPIs);
    return 0;
}
