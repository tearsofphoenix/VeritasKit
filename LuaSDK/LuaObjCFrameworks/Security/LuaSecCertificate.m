//
//  LuaSecCertificate.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSecCertificate.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SecCertificateGetTypeID(lua_State *L)
{
    SecCertificateGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecCertificateGetTypeID(lua_State *L)
{
    SecCertificateGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecCertificateCreateWithData(lua_State *L)
{
    SecCertificateCreateWithData(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecCertificateRef(lua_State *L)
{
    SecCertificateRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecCertificateRef(lua_State *L)
{
    SecCertificateRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecCertificateCopyData(lua_State *L)
{
    SecCertificateCopyData(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecCertificateCreateWithData(lua_State *L)
{
    SecCertificateCreateWithData(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecCertificateCopyData(lua_State *L)
{
    SecCertificateCopyData(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecCertificateCopySubjectSummary(lua_State *L)
{
    SecCertificateCopySubjectSummary(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecCertificateCreateWithData(lua_State *L)
{
    SecCertificateCreateWithData(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecCertificateCopySubjectSummary(lua_State *L)
{
    SecCertificateCopySubjectSummary(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSecCertificateAPIs[] = {
    {"SecCertificateGetTypeID", lua_SecCertificateGetTypeID},
    {"SecCertificateGetTypeID", lua_SecCertificateGetTypeID},
    {"SecCertificateCreateWithData", lua_SecCertificateCreateWithData},
    {"SecCertificateRef", lua_SecCertificateRef},
    {"SecCertificateRef", lua_SecCertificateRef},
    {"SecCertificateCopyData", lua_SecCertificateCopyData},
    {"SecCertificateCreateWithData", lua_SecCertificateCreateWithData},
    {"SecCertificateCopyData", lua_SecCertificateCopyData},
    {"SecCertificateCopySubjectSummary", lua_SecCertificateCopySubjectSummary},
    {"SecCertificateCreateWithData", lua_SecCertificateCreateWithData},
    {"SecCertificateCopySubjectSummary", lua_SecCertificateCopySubjectSummary},
    {NULL, NULL},
};

int LuaOpenSecCertificate(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSecCertificateAPIs);
    return 0;
}
