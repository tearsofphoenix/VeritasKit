//
//  LuaCGPDFContext.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFContext.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"


static int lua_CGPDFContextCreate(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFContextCreate(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_touserdata(L, 3)));
    return 1;
}

static int lua_CGPDFContextCreateWithURL(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFContextCreateWithURL(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_touserdata(L, 3)));
    return 1;
}

static int lua_CGPDFContextClose(lua_State *L)
{
    CGPDFContextClose(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGPDFContextBeginPage(lua_State *L)
{
    CGPDFContextBeginPage(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGPDFContextEndPage(lua_State *L)
{
    CGPDFContextEndPage(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGPDFContextAddDocumentMetadata(lua_State *L)
{
    CGPDFContextAddDocumentMetadata(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGPDFContextSetURLForRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 3);
    CGPDFContextSetURLForRect(lua_touserdata(L, 1), lua_touserdata(L, 2), *r);
    return 0;
}

static int lua_CGPDFContextAddDestinationAtPoint(lua_State *L)
{
    CGPoint *p = lua_touserdata(L, 3);    
    CGPDFContextAddDestinationAtPoint(lua_touserdata(L, 1), lua_touserdata(L, 2), *p);
    return 0;
}

static int lua_CGPDFContextSetDestinationForRect(lua_State *L)
{
     CGRect *r = lua_touserdata(L, 3);
    CGPDFContextSetDestinationForRect(lua_touserdata(L, 1), lua_touserdata(L, 2), *r);
    return 0;
}

static const luaL_Reg __LuaCGPDFContextAPIs[] = {
    {"CGPDFContextCreate", lua_CGPDFContextCreate},
    {"CGPDFContextCreateWithURL", lua_CGPDFContextCreateWithURL},
    {"CGPDFContextClose", lua_CGPDFContextClose},
    {"CGPDFContextBeginPage", lua_CGPDFContextBeginPage},
    {"CGPDFContextEndPage", lua_CGPDFContextEndPage},
    {"CGPDFContextAddDocumentMetadata", lua_CGPDFContextAddDocumentMetadata},
    {"CGPDFContextSetURLForRect", lua_CGPDFContextSetURLForRect},
    {"CGPDFContextAddDestinationAtPoint", lua_CGPDFContextAddDestinationAtPoint},
    {"CGPDFContextSetDestinationForRect", lua_CGPDFContextSetDestinationForRect},
    {NULL, NULL},
};

int LuaOpenCGPDFContext(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFContextAPIs);
    return 0;
}
