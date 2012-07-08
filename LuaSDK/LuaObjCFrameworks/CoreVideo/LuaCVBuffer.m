//
//  LuaCVBuffer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCVBuffer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CVBufferRef(lua_State *L)
{
    CVBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRefs(lua_State *L)
{
    CVBufferRefs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRef(lua_State *L)
{
    CVBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferPropagatedAttachmentsKey(lua_State *L)
{
    CVBufferPropagatedAttachmentsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferNonPropagatedAttachmentsKey(lua_State *L)
{
    CVBufferNonPropagatedAttachmentsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRef(lua_State *L)
{
    CVBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferMovieTimeKey(lua_State *L)
{
    CVBufferMovieTimeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferTimeValueKey(lua_State *L)
{
    CVBufferTimeValueKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferTimeScaleKey(lua_State *L)
{
    CVBufferTimeScaleKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRef(lua_State *L)
{
    CVBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRef(lua_State *L)
{
    CVBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRef(lua_State *L)
{
    CVBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRetain(lua_State *L)
{
    CVBufferRetain(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRetain(lua_State *L)
{
    CVBufferRetain(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRef(lua_State *L)
{
    CVBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRelease(lua_State *L)
{
    CVBufferRelease(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRetain(lua_State *L)
{
    CVBufferRetain(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRelease(lua_State *L)
{
    CVBufferRelease(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferAttachment(lua_State *L)
{
    CVBufferAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferSetAttachment(lua_State *L)
{
    CVBufferSetAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferGetAttachment(lua_State *L)
{
    CVBufferGetAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferSetAttachment(lua_State *L)
{
    CVBufferSetAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferGetAttachment(lua_State *L)
{
    CVBufferGetAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferGetAttachment(lua_State *L)
{
    CVBufferGetAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferGetAttachment(lua_State *L)
{
    CVBufferGetAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRemoveAttachment(lua_State *L)
{
    CVBufferRemoveAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRemoveAttachment(lua_State *L)
{
    CVBufferRemoveAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRemoveAttachment(lua_State *L)
{
    CVBufferRemoveAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRemoveAllAttachments(lua_State *L)
{
    CVBufferRemoveAllAttachments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRemoveAttachment(lua_State *L)
{
    CVBufferRemoveAttachment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferRemoveAllAttachments(lua_State *L)
{
    CVBufferRemoveAllAttachments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferGetAttachments(lua_State *L)
{
    CVBufferGetAttachments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferGetAttachments(lua_State *L)
{
    CVBufferGetAttachments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferGetAttachments(lua_State *L)
{
    CVBufferGetAttachments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferSetAttachments(lua_State *L)
{
    CVBufferSetAttachments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferSetAttachments(lua_State *L)
{
    CVBufferSetAttachments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferSetAttachments(lua_State *L)
{
    CVBufferSetAttachments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferPropagateAttachments(lua_State *L)
{
    CVBufferPropagateAttachments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferPropagateAttachments(lua_State *L)
{
    CVBufferPropagateAttachments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVBufferPropagateAttachments(lua_State *L)
{
    CVBufferPropagateAttachments(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCVBufferAPIs[] = {
    {"CVBufferRef", lua_CVBufferRef},
    {"CVBufferRefs", lua_CVBufferRefs},
    {"CVBufferRef", lua_CVBufferRef},
    {"CVBufferPropagatedAttachmentsKey", lua_CVBufferPropagatedAttachmentsKey},
    {"CVBufferNonPropagatedAttachmentsKey", lua_CVBufferNonPropagatedAttachmentsKey},
    {"CVBufferRef", lua_CVBufferRef},
    {"CVBufferMovieTimeKey", lua_CVBufferMovieTimeKey},
    {"CVBufferTimeValueKey", lua_CVBufferTimeValueKey},
    {"CVBufferTimeScaleKey", lua_CVBufferTimeScaleKey},
    {"CVBufferRef", lua_CVBufferRef},
    {"CVBufferRef", lua_CVBufferRef},
    {"CVBufferRef", lua_CVBufferRef},
    {"CVBufferRetain", lua_CVBufferRetain},
    {"CVBufferRetain", lua_CVBufferRetain},
    {"CVBufferRef", lua_CVBufferRef},
    {"CVBufferRelease", lua_CVBufferRelease},
    {"CVBufferRetain", lua_CVBufferRetain},
    {"CVBufferRelease", lua_CVBufferRelease},
    {"CVBufferAttachment", lua_CVBufferAttachment},
    {"CVBufferSetAttachment", lua_CVBufferSetAttachment},
    {"CVBufferGetAttachment", lua_CVBufferGetAttachment},
    {"CVBufferSetAttachment", lua_CVBufferSetAttachment},
    {"CVBufferGetAttachment", lua_CVBufferGetAttachment},
    {"CVBufferGetAttachment", lua_CVBufferGetAttachment},
    {"CVBufferGetAttachment", lua_CVBufferGetAttachment},
    {"CVBufferRemoveAttachment", lua_CVBufferRemoveAttachment},
    {"CVBufferRemoveAttachment", lua_CVBufferRemoveAttachment},
    {"CVBufferRemoveAttachment", lua_CVBufferRemoveAttachment},
    {"CVBufferRemoveAllAttachments", lua_CVBufferRemoveAllAttachments},
    {"CVBufferRemoveAttachment", lua_CVBufferRemoveAttachment},
    {"CVBufferRemoveAllAttachments", lua_CVBufferRemoveAllAttachments},
    {"CVBufferGetAttachments", lua_CVBufferGetAttachments},
    {"CVBufferGetAttachments", lua_CVBufferGetAttachments},
    {"CVBufferGetAttachments", lua_CVBufferGetAttachments},
    {"CVBufferSetAttachments", lua_CVBufferSetAttachments},
    {"CVBufferSetAttachments", lua_CVBufferSetAttachments},
    {"CVBufferSetAttachments", lua_CVBufferSetAttachments},
    {"CVBufferPropagateAttachments", lua_CVBufferPropagateAttachments},
    {"CVBufferPropagateAttachments", lua_CVBufferPropagateAttachments},
    {"CVBufferPropagateAttachments", lua_CVBufferPropagateAttachments},
    {NULL, NULL},
};

int LuaOpenCVBuffer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCVBufferAPIs);
    return 0;
}
