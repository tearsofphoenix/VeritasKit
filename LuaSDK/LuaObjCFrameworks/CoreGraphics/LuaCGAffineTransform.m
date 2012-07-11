//
//  LuaCGAffineTransform.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGAffineTransform.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaCGGeometry.h"

int lua_pushCGAffineTransform(lua_State *L, CGAffineTransform t)
{
    CGAffineTransform *trans = lua_newuserdata(L, sizeof(CGAffineTransform));
    trans->a = t.a;
    trans->b = t.b;
    trans->c = t.c;
    trans->d = t.d;
    trans->tx = t.tx;
    trans->ty = t.ty;
    
    luaL_getmetatable(L, LUA_CGAffineTransform_METANAME);
    lua_setmetatable(L, -2);
    return 1;

}

static int lua_CGAffineTransformMake(lua_State *L)
{
   lua_pushCGAffineTransform(L, CGAffineTransformMake(lua_tonumber(L, 1), 
                                                      lua_tonumber(L, 2), 
                                                      lua_tonumber(L, 3),
                                                      lua_tonumber(L, 4), 
                                                      lua_tonumber(L, 5), 
                                                      lua_tonumber(L, 6)));
    return 1;
}

static int lua_CGAffineTransformMakeTranslation(lua_State *L)
{
   lua_pushCGAffineTransform(L,  CGAffineTransformMakeTranslation(lua_tonumber(L, 1), 
                                                                  lua_tonumber(L, 2)));
    return 1;
}

static int lua_CGAffineTransformMakeScale(lua_State *L)
{
    lua_pushCGAffineTransform(L, CGAffineTransformMakeScale(lua_tonumber(L, 1),
                                                            lua_tonumber(L, 2)));
    return 1;
}

static int lua_CGAffineTransformMakeRotation(lua_State *L)
{
   lua_pushCGAffineTransform(L, CGAffineTransformMakeRotation(lua_tonumber(L, 1)));
    return 1;
}

static int lua_CGAffineTransformIsIdentity(lua_State *L)
{
    CGAffineTransform *t = luaL_checkudata(L, 1, LUA_CGAffineTransform_METANAME);
    lua_pushboolean(L, CGAffineTransformIsIdentity(*t));
    return 1;
}

static int lua_CGAffineTransformTranslate(lua_State *L)
{
    CGAffineTransform *t = luaL_checkudata(L, 1, LUA_CGAffineTransform_METANAME);

   lua_pushCGAffineTransform(L, CGAffineTransformTranslate(*t, lua_tonumber(L, 2), lua_tonumber(L, 3)));
    return 1;
}

static int lua_CGAffineTransformScale(lua_State *L)
{
    CGAffineTransform *t = luaL_checkudata(L, 1, LUA_CGAffineTransform_METANAME);
   lua_pushCGAffineTransform(L, CGAffineTransformScale(*t, lua_tonumber(L, 2), lua_tonumber(L, 3)));
    return 1;
}

static int lua_CGAffineTransformRotate(lua_State *L)
{
    CGAffineTransform *t = luaL_checkudata(L, 1, LUA_CGAffineTransform_METANAME);
    lua_pushCGAffineTransform(L, CGAffineTransformRotate(*t, lua_tonumber(L, 2)));
    return 1;
}

static int lua_CGAffineTransformInvert(lua_State *L)
{
    CGAffineTransform *t = luaL_checkudata(L, 1, LUA_CGAffineTransform_METANAME);
    lua_pushCGAffineTransform(L, CGAffineTransformInvert(*t));
    return 1;
}

static int lua_CGAffineTransformConcat(lua_State *L)
{
    CGAffineTransform *t1 = luaL_checkudata(L, 1, LUA_CGAffineTransform_METANAME);
    CGAffineTransform *t2 = luaL_checkudata(L, 2, LUA_CGAffineTransform_METANAME);

    lua_pushCGAffineTransform(L, CGAffineTransformConcat(*t1, *t2));
    return 1;
}

static int lua_CGAffineTransformEqualToTransform(lua_State *L)
{
    CGAffineTransform *t1 = luaL_checkudata(L, 1, LUA_CGAffineTransform_METANAME);
    CGAffineTransform *t2 = luaL_checkudata(L, 2, LUA_CGAffineTransform_METANAME);

    lua_pushboolean(L, CGAffineTransformEqualToTransform(*t1, *t2));
    return 1;
}

static int lua_CGPointApplyAffineTransform(lua_State *L)
{
    CGPoint *p = luaL_checkudata(L, 1, LUA_CGPoint_METANAME);
    CGAffineTransform *t = luaL_checkudata(L, 2, LUA_CGAffineTransform_METANAME);

    lua_pushCGPoint(L, CGPointApplyAffineTransform(*p, *t));
    return 1;
}

static int lua_CGSizeApplyAffineTransform(lua_State *L)
{
    CGSize *size = luaL_checkudata(L, 1, LUA_CGSize_METANAME);
    CGAffineTransform *t = luaL_checkudata(L, 2, LUA_CGAffineTransform_METANAME);
    lua_pushCGSize(L, CGSizeApplyAffineTransform(*size, *t));
    return 1;
}

static int lua_CGRectApplyAffineTransform(lua_State *L)
{
    CGRect *rect = luaL_checkudata(L, 1, LUA_CGRect_METANAME);
    CGAffineTransform *t = luaL_checkudata(L, 2, LUA_CGAffineTransform_METANAME);
    lua_pushCGRect(L, CGRectApplyAffineTransform(*rect, *t));
    return 1;
}

static const luaL_Reg __luaCGAffineTransformAPIs[] = 
{
    {"CGAffineTransformMake", lua_CGAffineTransformMake},
    {"CGAffineTransformMakeTranslation", lua_CGAffineTransformMakeTranslation},
    {"CGAffineTransformMakeScale", lua_CGAffineTransformMakeScale},
    {"CGAffineTransformMakeRotation", lua_CGAffineTransformMakeRotation},
    {"CGAffineTransformIsIdentity", lua_CGAffineTransformIsIdentity},
    {"CGAffineTransformTranslate", lua_CGAffineTransformTranslate},
    {"CGAffineTransformScale", lua_CGAffineTransformScale},
    {"CGAffineTransformRotate", lua_CGAffineTransformRotate},
    {"CGAffineTransformInvert", lua_CGAffineTransformInvert},
    {"CGAffineTransformConcat", lua_CGAffineTransformConcat},
    {"CGAffineTransformEqualToTransform", lua_CGAffineTransformEqualToTransform},
    {NULL, NULL},
};

int LuaOpenCGAffineTransform(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __luaCGAffineTransformAPIs);
    return 0;
}
