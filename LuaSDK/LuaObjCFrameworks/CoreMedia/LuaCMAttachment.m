//
//  LuaCMAttachment.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCMAttachment.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearerRef(lua_State *L)
{
    CMAttachmentBearerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentMode_ShouldNotPropagate(lua_State *L)
{
    CMAttachmentMode_ShouldNotPropagate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentMode_ShouldPropagate(lua_State *L)
{
    CMAttachmentMode_ShouldPropagate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentMode(lua_State *L)
{
    CMAttachmentMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearerRef(lua_State *L)
{
    CMAttachmentBearerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearerRef(lua_State *L)
{
    CMAttachmentBearerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearerRef(lua_State *L)
{
    CMAttachmentBearerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearerRef(lua_State *L)
{
    CMAttachmentBearerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearerRef(lua_State *L)
{
    CMAttachmentBearerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearerRef(lua_State *L)
{
    CMAttachmentBearerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentMode_ShouldPropagate(lua_State *L)
{
    CMAttachmentMode_ShouldPropagate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearer(lua_State *L)
{
    CMAttachmentBearer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttachmentBearerRef(lua_State *L)
{
    CMAttachmentBearerRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCMAttachmentAPIs[] = {
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearerRef", lua_CMAttachmentBearerRef},
    {"CMAttachmentMode_ShouldNotPropagate", lua_CMAttachmentMode_ShouldNotPropagate},
    {"CMAttachmentMode_ShouldPropagate", lua_CMAttachmentMode_ShouldPropagate},
    {"CMAttachmentMode", lua_CMAttachmentMode},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearerRef", lua_CMAttachmentBearerRef},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearerRef", lua_CMAttachmentBearerRef},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearerRef", lua_CMAttachmentBearerRef},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearerRef", lua_CMAttachmentBearerRef},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearerRef", lua_CMAttachmentBearerRef},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearerRef", lua_CMAttachmentBearerRef},
    {"CMAttachmentMode_ShouldPropagate", lua_CMAttachmentMode_ShouldPropagate},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearer", lua_CMAttachmentBearer},
    {"CMAttachmentBearerRef", lua_CMAttachmentBearerRef},
    {NULL, NULL},
};

int LuaOpenCMAttachment(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCMAttachmentAPIs);
    return 0;
}
