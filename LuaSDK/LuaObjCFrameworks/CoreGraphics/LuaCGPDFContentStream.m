//
//  LuaCGPDFContentStream.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFContentStream.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"


static int lua_CGPDFContentStreamCreateWithPage(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFContentStreamCreateWithPage(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFContentStreamCreateWithStream(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFContentStreamCreateWithStream(lua_touserdata(L, 1),
                                                                lua_touserdata(L, 2),
                                                                lua_touserdata(L, 3)));
    return 1;
}

static int lua_CGPDFContentStreamRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFContentStreamRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFContentStreamRelease(lua_State *L)
{
    CGPDFContentStreamRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGPDFContentStreamGetStreams(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGPDFContentStreamGetStreams(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFContentStreamGetResource(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFContentStreamGetResource(lua_touserdata(L, 1),
                                                           lua_tostring(L, 2),
                                                           lua_tostring(L, 3)));
    return 1;
}

static const luaL_Reg __LuaCGPDFContentStreamAPIs[] = {
    {"CGPDFContentStreamCreateWithPage", lua_CGPDFContentStreamCreateWithPage},
    {"CGPDFContentStreamCreateWithStream", lua_CGPDFContentStreamCreateWithStream},
    {"CGPDFContentStreamRetain", lua_CGPDFContentStreamRetain},
    {"CGPDFContentStreamRelease", lua_CGPDFContentStreamRelease},
    {"CGPDFContentStreamGetStreams", lua_CGPDFContentStreamGetStreams},
    {"CGPDFContentStreamGetResource", lua_CGPDFContentStreamGetResource},
    {NULL, NULL},
};

int LuaOpenCGPDFContentStream(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFContentStreamAPIs);
    return 0;
}
