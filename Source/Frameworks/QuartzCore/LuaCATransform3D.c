//
//  LuaCATransform3D.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#include "LuaCATransform3D.h"

#include "VMKAuxiliary.h"
#include "LuaCGAffineTransform.h"

int VMKPushCATransform3D(lua_State *L, CATransform3D t)
{
    CATransform3D *result = lua_newuserdata(L, sizeof(CATransform3D));
    *result = t;
    
    luaL_getmetatable(L, LUA_CATransform3D_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}

static int lua_CATransform3DIndex(lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);
    const char *fieldName = lua_tostring(L, 2);
    if (!strcmp(fieldName, "m11"))
    {
        lua_pushnumber(L, t->m11);
        
    }else if (!strcmp(fieldName, "m12"))
    {
        lua_pushnumber(L, t->m12);
        
    }else if (!strcmp(fieldName, "m13"))
    {
        lua_pushnumber(L, t->m13);
        
    }else if (!strcmp(fieldName, "m14"))
    {
        lua_pushnumber(L, t->m14);
        
    }else if (!strcmp(fieldName, "m21"))
    {
        lua_pushnumber(L, t->m21);
        
    }else if (!strcmp(fieldName, "m22"))
    {
        lua_pushnumber(L, t->m22);
        
    }else if (!strcmp(fieldName, "m23"))
    {
        lua_pushnumber(L, t->m23);
        
    }else if (!strcmp(fieldName, "m24"))
    {
        lua_pushnumber(L, t->m24);
        
    }else if (!strcmp(fieldName, "m31"))
    {
        lua_pushnumber(L, t->m31);
        
    }else if (!strcmp(fieldName, "m32"))
    {
        lua_pushnumber(L, t->m32);
        
    }else if (!strcmp(fieldName, "m33"))
    {
        lua_pushnumber(L, t->m33);
        
    }else if (!strcmp(fieldName, "m34"))
    {
        lua_pushnumber(L, t->m34);
        
    }else if (!strcmp(fieldName, "m41"))
    {
        lua_pushnumber(L, t->m41);
        
    }else if (!strcmp(fieldName, "m42"))
    {
        lua_pushnumber(L, t->m42);
        
    }else if (!strcmp(fieldName, "m43"))
    {
        lua_pushnumber(L, t->m43);
        
    }else if (!strcmp(fieldName, "m44"))
    {
        lua_pushnumber(L, t->m44);
    }
    return 1;
}

static int lua_CATransform3DNewIndex(lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);
    const char *fieldName = lua_tostring(L, 2);
    if (!strcmp(fieldName, "m11"))
    {
        t->m11 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m12"))
    {
        t->m12 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m13"))
    {
        t->m13 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m14"))
    {
        t->m14 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m21"))
    {
        t->m21 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m22"))
    {
        t->m22 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m23"))
    {
        t->m23 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m24"))
    {
        t->m24 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m31"))
    {
        t->m31 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m32"))
    {
        t->m32 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m33"))
    {
        t->m33 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m34"))
    {
        t->m34 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m41"))
    {
        t->m41 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m42"))
    {
        t->m42 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m43"))
    {
        t->m43 = lua_tonumber(L, 3);
        
    }else if (!strcmp(fieldName, "m44"))
    {
        t->m44 = lua_tonumber(L, 3);
    }
    return 0;
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
    VMKPushCATransform3D(L, CATransform3DMakeTranslation(lua_tonumber(L, 1),
                                                          lua_tonumber(L, 2), 
                                                          lua_tonumber(L, 3)));
    return 1;
}

static int lua_CATransform3DMakeScale (lua_State *L)
{
    VMKPushCATransform3D(L, CATransform3DMakeScale (lua_tonumber(L, 1),
                                                     lua_tonumber(L, 2), 
                                                     lua_tonumber(L, 3)));
    return 1;
}

static int lua_CATransform3DMakeRotation (lua_State *L)
{
    VMKPushCATransform3D(L, CATransform3DMakeRotation(lua_tonumber(L, 1),
                                                       lua_tonumber(L, 2), 
                                                       lua_tonumber(L, 3),
                                                       lua_tonumber(L, 4)));
    return 1;
}

static int lua_CATransform3DTranslate (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);
    VMKPushCATransform3D(L, CATransform3DTranslate(*t, lua_tonumber(L, 2), 
                                                    lua_tonumber(L, 3),
                                                    lua_tonumber(L, 4)));
    return 1;
}

static int lua_CATransform3DScale (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);

    VMKPushCATransform3D(L, CATransform3DScale(*t, lua_tonumber(L, 2), 
                                                 lua_tonumber(L, 3),
                                                 lua_tonumber(L, 4)));
    return 1;
}

static int lua_CATransform3DRotate (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);

    VMKPushCATransform3D(L, CATransform3DRotate (*t, lua_tonumber(L, 2), 
                                                  lua_tonumber(L, 3),
                                                  lua_tonumber(L, 4),
                                                  lua_tonumber(L, 5)));
    return 1;
}

static int lua_CATransform3DConcat (lua_State *L)
{
    CATransform3D *t1 = lua_touserdata(L, 1);
    CATransform3D *t2 = lua_touserdata(L, 2);

    VMKPushCATransform3D(L, CATransform3DConcat (*t1, *t2));
    return 1;
}

static int lua_CATransform3DInvert (lua_State *L)
{
    CATransform3D *t = lua_touserdata(L, 1);

    VMKPushCATransform3D(L, CATransform3DInvert (*t));
    return 1;
}

static int lua_CATransform3DMakeAffineTransform (lua_State *L)
{
    CGAffineTransform *m = lua_touserdata(L, 1);
    VMKPushCATransform3D(L, CATransform3DMakeAffineTransform (*m));
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

    VMKPushCGAffineTransform(L, CATransform3DGetAffineTransform (*t));
    return 1;
}

static const luaL_Reg __LuaCATransform3DMetaMethods[] =
{
    //{"__gc", }, no need gc
    {"__index", lua_CATransform3DIndex},
    {"__newindex", lua_CATransform3DNewIndex},
    {NULL, NULL},
};

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

int VMKOpenCATransform3D(lua_State *L)
{
    VMKCreateMetatable(L, LUA_CATransform3D_METANAME, __LuaCATransform3DMetaMethods);
    
    VMKLoadGlobalFunctions(L, __LuaCATransform3DAPIs);
    
    return 0;
}
