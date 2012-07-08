//
//  LuaCATransform3D.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCATransform3D.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaCGAffineTransform.h"

int lua_pushCATransform3D(lua_State *L, CATransform3D t)
{
    CATransform3D *result = lua_newuserdata(L, sizeof(CATransform3D));
    *result = t;
    
    luaL_getmetatable(L, LUA_CATransform3D_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}
static int lua_CATransform3DIsIdentity (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);
    lua_pushboolean(L, CATransform3DIsIdentity (*t));
    return 1;
}

static int lua_CATransform3DEqualToTransform (lua_State *L)
{
    CATransform3D *t1 = lua_touserdata(L, 1);
    CATransform3D *t2 = lua_touserdata(L, 2);

    lua_pushboolean(L, CATransform3DEqualToTransform (*t1, *t2));
    return 1;
}

static int lua_CATransform3DMakeTranslation (lua_State *L)
{    
    lua_pushCATransform3D(L, CATransform3DMakeTranslation(lua_tonumber(L, 1),
                                                          lua_tonumber(L, 2), 
                                                          lua_tonumber(L, 3)));
    return 1;
}

static int lua_CATransform3DMakeScale (lua_State *L)
{
    lua_pushCATransform3D(L, CATransform3DMakeScale (lua_tonumber(L, 1),
                                                     lua_tonumber(L, 2), 
                                                     lua_tonumber(L, 3)));
    return 1;
}

static int lua_CATransform3DMakeRotation (lua_State *L)
{
    lua_pushCATransform3D(L, CATransform3DMakeRotation(lua_tonumber(L, 1),
                                                       lua_tonumber(L, 2), 
                                                       lua_tonumber(L, 3),
                                                       lua_tonumber(L, 4)));
    return 1;
}

static int lua_CATransform3DTranslate (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);
    lua_pushCATransform3D(L, CATransform3DTranslate(*t, lua_tonumber(L, 2), 
                                                    lua_tonumber(L, 3),
                                                    lua_tonumber(L, 4)));
    return 1;
}

static int lua_CATransform3DScale (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);

    lua_pushCATransform3D(L, CATransform3DScale(*t, lua_tonumber(L, 2), 
                                                 lua_tonumber(L, 3),
                                                 lua_tonumber(L, 4)));
    return 1;
}

static int lua_CATransform3DRotate (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);

    lua_pushCATransform3D(L, CATransform3DRotate (*t, lua_tonumber(L, 2), 
                                                  lua_tonumber(L, 3),
                                                  lua_tonumber(L, 4),
                                                  lua_tonumber(L, 5)));
    return 1;
}

static int lua_CATransform3DConcat (lua_State *L)
{
    CATransform3D *t1 = lua_touserdata(L, 1);
    CATransform3D *t2 = lua_touserdata(L, 2);

    lua_pushCATransform3D(L, CATransform3DConcat (*t1, *t2));
    return 1;
}

static int lua_CATransform3DInvert (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);

    lua_pushCATransform3D(L, CATransform3DInvert (*t));
    return 1;
}

static int lua_CATransform3DMakeAffineTransform (lua_State *L)
{
    CGAffineTransform *m = lua_touserdata(L, 1);
    lua_pushCATransform3D(L, CATransform3DMakeAffineTransform (*m));
    return 1;
}

static int lua_CATransform3DIsAffine (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);

    lua_pushboolean(L, CATransform3DIsAffine (*t));
    return 1;
}

static int lua_CATransform3DGetAffineTransform (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);

    lua_pushCGAffineTransform(L, CATransform3DGetAffineTransform (*t));
    return 1;
}

static const luaL_Reg __LuaCATransform3DAPIs[] = 
{
    {"CATransform3DIsIdentity ", lua_CATransform3DIsIdentity },
    {"CATransform3DEqualToTransform ", lua_CATransform3DEqualToTransform },
    {"CATransform3DMakeTranslation ", lua_CATransform3DMakeTranslation },
    {"CATransform3DMakeScale ", lua_CATransform3DMakeScale },
    {"CATransform3DMakeRotation ", lua_CATransform3DMakeRotation },
    {"CATransform3DTranslate ", lua_CATransform3DTranslate },
    {"CATransform3DScale ", lua_CATransform3DScale },
    {"CATransform3DRotate ", lua_CATransform3DRotate },
    {"CATransform3DConcat ", lua_CATransform3DConcat },
    {"CATransform3DInvert ", lua_CATransform3DInvert },
    {"CATransform3DMakeAffineTransform ", lua_CATransform3DMakeAffineTransform },
    {"CATransform3DIsAffine ", lua_CATransform3DIsAffine },
    {"CATransform3DGetAffineTransform ", lua_CATransform3DGetAffineTransform },
    {NULL, NULL},
};

int LuaOpenCATransform3D(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCATransform3DAPIs);
    return 0;
}
