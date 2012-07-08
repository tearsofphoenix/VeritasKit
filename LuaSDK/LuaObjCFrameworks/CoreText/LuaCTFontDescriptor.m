//
//  LuaCTFontDescriptor.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTFontDescriptor.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorGetTypeID(lua_State *L)
{
    CTFontDescriptorGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorGetTypeID(lua_State *L)
{
    CTFontDescriptorGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRefs(lua_State *L)
{
    CTFontDescriptorRefs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCreateWithNameAndSize(lua_State *L)
{
    CTFontDescriptorCreateWithNameAndSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCreateWithAttributes(lua_State *L)
{
    CTFontDescriptorCreateWithAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCreateCopyWithAttributes(lua_State *L)
{
    CTFontDescriptorCreateCopyWithAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCreateCopyWithVariation(lua_State *L)
{
    CTFontDescriptorCreateCopyWithVariation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCreateCopyWithFeature(lua_State *L)
{
    CTFontDescriptorCreateCopyWithFeature(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCreateMatchingFontDescriptors(lua_State *L)
{
    CTFontDescriptorCreateMatchingFontDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCreateMatchingFontDescriptors(lua_State *L)
{
    CTFontDescriptorCreateMatchingFontDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCreateMatchingFontDescriptor(lua_State *L)
{
    CTFontDescriptorCreateMatchingFontDescriptor(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCopyAttributes(lua_State *L)
{
    CTFontDescriptorCopyAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCopyAttributes(lua_State *L)
{
    CTFontDescriptorCopyAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCopyAttribute(lua_State *L)
{
    CTFontDescriptorCopyAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCopyAttribute(lua_State *L)
{
    CTFontDescriptorCopyAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCopyLocalizedAttribute(lua_State *L)
{
    CTFontDescriptorCopyLocalizedAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCopyAttribute(lua_State *L)
{
    CTFontDescriptorCopyAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorCopyLocalizedAttribute(lua_State *L)
{
    CTFontDescriptorCopyLocalizedAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTFontDescriptorAPIs[] = {
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorGetTypeID", lua_CTFontDescriptorGetTypeID},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorGetTypeID", lua_CTFontDescriptorGetTypeID},
    {"CTFontDescriptorRefs", lua_CTFontDescriptorRefs},
    {"CTFontDescriptorCreateWithNameAndSize", lua_CTFontDescriptorCreateWithNameAndSize},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorCreateWithAttributes", lua_CTFontDescriptorCreateWithAttributes},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorCreateCopyWithAttributes", lua_CTFontDescriptorCreateCopyWithAttributes},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorCreateCopyWithVariation", lua_CTFontDescriptorCreateCopyWithVariation},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorCreateCopyWithFeature", lua_CTFontDescriptorCreateCopyWithFeature},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorCreateMatchingFontDescriptors", lua_CTFontDescriptorCreateMatchingFontDescriptors},
    {"CTFontDescriptorCreateMatchingFontDescriptors", lua_CTFontDescriptorCreateMatchingFontDescriptors},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorCreateMatchingFontDescriptor", lua_CTFontDescriptorCreateMatchingFontDescriptor},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorCopyAttributes", lua_CTFontDescriptorCopyAttributes},
    {"CTFontDescriptorCopyAttributes", lua_CTFontDescriptorCopyAttributes},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorCopyAttribute", lua_CTFontDescriptorCopyAttribute},
    {"CTFontDescriptorCopyAttribute", lua_CTFontDescriptorCopyAttribute},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontDescriptorCopyLocalizedAttribute", lua_CTFontDescriptorCopyLocalizedAttribute},
    {"CTFontDescriptorCopyAttribute", lua_CTFontDescriptorCopyAttribute},
    {"CTFontDescriptorCopyLocalizedAttribute", lua_CTFontDescriptorCopyLocalizedAttribute},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {NULL, NULL},
};

int LuaOpenCTFontDescriptor(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTFontDescriptorAPIs);
    return 0;
}
