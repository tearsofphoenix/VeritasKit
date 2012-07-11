//
//  LuaGLKVector4.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKVector4.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"

int lua_pushGLKVector4(lua_State *L, GLKVector4 vector)
{
    GLKVector4 *v = lua_newuserdata(L, sizeof(GLKVector4));
    *v = vector;
    
    luaL_getmetatable(L, LUA_GLKVector4_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}

static int lua_GLKVector4Make(lua_State *L)
{
    lua_pushGLKVector4(L, GLKVector4Make(lua_tonumber(L, 1),
                                        lua_tonumber(L, 2),
                                        lua_tonumber(L, 3),
                                        lua_tonumber(L, 4)));
    return 1;
}

#if 0
static int lua_GLKVector4MakeWithArray(lua_State *L)
{
    float *array = NULL;
    luasdk_get_arrayf(L, 1, &array);
    lua_pushGLKVector4(L, GLKVector4MakeWithArray(array));
    return 1;
}
#endif

static int lua_GLKVector4MakeWithVector3(lua_State *L)
{
    GLKVector3 *vector = lua_touserdata(L, 1);
    lua_pushGLKVector4(L, GLKVector4MakeWithVector3(*vector, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKVector4Negate(lua_State *L)
{
    GLKVector4 *vector = lua_touserdata(L, 1);
    lua_pushGLKVector4(L, GLKVector4Negate(*vector));
    return 1;
}

static int lua_GLKVector4Add(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector4(L, GLKVector4Add(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4Subtract(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector4(L, GLKVector4Subtract(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4Multiply(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector4(L, GLKVector4Multiply(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4Divide(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector4(L, GLKVector4Divide(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4AddScalar(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    lua_pushGLKVector4(L, GLKVector4AddScalar(*vector1, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKVector4SubtractScalar(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    lua_pushGLKVector4(L, GLKVector4SubtractScalar(*vector1, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKVector4MultiplyScalar(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    lua_pushGLKVector4(L, GLKVector4MultiplyScalar(*vector1, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKVector4DivideScalar(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    lua_pushGLKVector4(L, GLKVector4DivideScalar(*vector1, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKVector4Maximum(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector4(L, GLKVector4Maximum(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4Minimum(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector4(L, GLKVector4Minimum(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4AllEqualToVector4(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushboolean(L, GLKVector4AllEqualToVector4(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4AllEqualToScalar(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    lua_pushboolean(L, GLKVector4AllEqualToScalar(*vector1, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKVector4AllGreaterThanVector4(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushboolean(L, GLKVector4AllGreaterThanVector4(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4AllGreaterThanScalar(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    lua_pushboolean(L, GLKVector4AllGreaterThanScalar(*vector1, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKVector4AllGreaterThanOrEqualToVector4(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushboolean(L, GLKVector4AllGreaterThanOrEqualToVector4(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4AllGreaterThanOrEqualToScalar(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    lua_pushboolean(L, GLKVector4AllGreaterThanOrEqualToScalar(*vector1, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKVector4Normalize(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    lua_pushGLKVector4(L, GLKVector4Normalize(*vector1));
    return 1;
}

static int lua_GLKVector4DotProduct(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushnumber(L, GLKVector4DotProduct(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4Length(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    lua_pushnumber(L, GLKVector4Length(*vector1));
    return 1;
}

static int lua_GLKVector4Distance(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushnumber(L, GLKVector4Distance(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4Lerp(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector4(L, GLKVector4Lerp(*vector1, *vector2, lua_tonumber(L, 3)));
    return 1;
}

static int lua_GLKVector4CrossProduct(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector4(L, GLKVector4CrossProduct(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector4Project(lua_State *L)
{
    GLKVector4 *vector1 = lua_touserdata(L, 1);
    GLKVector4 *vector2 = lua_touserdata(L, 2);

    lua_pushGLKVector4(L, GLKVector4Project(*vector1, *vector2));
    return 1;
}

static const luaL_Reg __LuaGLKVector4APIs[] = 
{
    {"GLKVector4Make", lua_GLKVector4Make},
#if 0
    {"GLKVector4MakeWithArray", lua_GLKVector4MakeWithArray},
#endif
    {"GLKVector4MakeWithVector3", lua_GLKVector4MakeWithVector3},
    {"GLKVector4Negate", lua_GLKVector4Negate},
    {"GLKVector4Add", lua_GLKVector4Add},
    {"GLKVector4Subtract", lua_GLKVector4Subtract},
    {"GLKVector4Multiply", lua_GLKVector4Multiply},
    {"GLKVector4Divide", lua_GLKVector4Divide},
    {"GLKVector4AddScalar", lua_GLKVector4AddScalar},
    {"GLKVector4SubtractScalar", lua_GLKVector4SubtractScalar},
    {"GLKVector4MultiplyScalar", lua_GLKVector4MultiplyScalar},
    {"GLKVector4DivideScalar", lua_GLKVector4DivideScalar},
    {"GLKVector4Maximum", lua_GLKVector4Maximum},
    {"GLKVector4Minimum", lua_GLKVector4Minimum},
    {"GLKVector4AllEqualToVector4", lua_GLKVector4AllEqualToVector4},
    {"GLKVector4AllEqualToScalar", lua_GLKVector4AllEqualToScalar},
    {"GLKVector4AllGreaterThanVector4", lua_GLKVector4AllGreaterThanVector4},
    {"GLKVector4AllGreaterThanScalar", lua_GLKVector4AllGreaterThanScalar},
    {"GLKVector4AllGreaterThanOrEqualToVector4", lua_GLKVector4AllGreaterThanOrEqualToVector4},
    {"GLKVector4AllGreaterThanOrEqualToScalar", lua_GLKVector4AllGreaterThanOrEqualToScalar},
    {"GLKVector4Normalize", lua_GLKVector4Normalize},
    {"GLKVector4DotProduct", lua_GLKVector4DotProduct},
    {"GLKVector4Length", lua_GLKVector4Length},
    {"GLKVector4Distance", lua_GLKVector4Distance},
    {"GLKVector4Lerp", lua_GLKVector4Lerp},
    {"GLKVector4CrossProduct", lua_GLKVector4CrossProduct},
    {"GLKVector4Project", lua_GLKVector4Project},
    {NULL, NULL},
};

int LuaOpenGLKVector4(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGLKVector4APIs);
    return 0;
}
