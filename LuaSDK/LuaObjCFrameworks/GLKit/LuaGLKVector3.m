//
//  LuaGLKVector3.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKVector3.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"

int lua_pushGLKVector3(lua_State *L, GLKVector3 vector)
{
    GLKVector3 *v = lua_newuserdata(L, sizeof(GLKVector3));
    *v = vector;
    
    luaL_getmetatable(L, LUA_GLKVector3_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}

static int lua_GLKVector3Make(lua_State *L)
{
    lua_pushGLKVector3(L, GLKVector3Make(lua_tonumber(L, 1),
                                         lua_tonumber(L, 2),
                                         lua_tonumber(L, 3)));
    return 1;
}

static int lua_GLKVector3MakeWithArray(lua_State *L)
{
    float *array = NULL;
    luasdk_get_arrayf(L, 1, &array);
    
    lua_pushGLKVector3(L, GLKVector3MakeWithArray(array));
    return 1;
}

static int lua_GLKVector3Negate(lua_State *L)
{
    GLKVector3 *vector = lua_touserdata(L, 1);
    lua_pushGLKVector3(L, GLKVector3Negate(*vector));
    return 1;
}

static int lua_GLKVector3Add(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKVector3Add(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3Subtract(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKVector3Subtract(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3Multiply(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKVector3Multiply(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3Divide(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKVector3Divide(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3AddScalar(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushGLKVector3(L, GLKVector3AddScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector3SubtractScalar(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushGLKVector3(L, GLKVector3SubtractScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector3MultiplyScalar(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushGLKVector3(L, GLKVector3MultiplyScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector3DivideScalar(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushGLKVector3(L, GLKVector3DivideScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector3Maximum(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKVector3Maximum(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3Minimum(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKVector3Minimum(*vector1, *vector2));
    return 1;}

static int lua_GLKVector3AllEqualToVector3(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushboolean(L, GLKVector3AllEqualToVector3(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3AllEqualToScalar(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushboolean(L, GLKVector3AllEqualToScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector3AllGreaterThanVector3(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushboolean(L, GLKVector3AllGreaterThanVector3(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3AllGreaterThanScalar(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushboolean(L, GLKVector3AllGreaterThanScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector3AllGreaterThanOrEqualToVector3(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushboolean(L, GLKVector3AllGreaterThanOrEqualToVector3(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3AllGreaterThanOrEqualToScalar(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushboolean(L, GLKVector3AllGreaterThanOrEqualToScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector3Normalize(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    lua_pushGLKVector3(L, GLKVector3Normalize(*vector1));
    return 1;
}

static int lua_GLKVector3DotProduct(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushnumber(L, GLKVector3DotProduct(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3Length(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    lua_pushnumber(L, GLKVector3Length(*vector1));
    return 1;
}

static int lua_GLKVector3Distance(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushnumber(L, GLKVector3Distance(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3Lerp(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKVector3Lerp(*vector1, *vector2, lua_tonumber(L, 3)));
    return 1;
}

static int lua_GLKVector3CrossProduct(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKVector3CrossProduct(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector3Project(lua_State *L)
{
    GLKVector3 *vector1 = lua_touserdata(L, 1);
    GLKVector3 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKVector3Project(*vector1, *vector2));
    return 1;
}

static const luaL_Reg __LuaGLKVector3APIs[] = {
    {"GLKVector3Make", lua_GLKVector3Make},
    {"GLKVector3MakeWithArray", lua_GLKVector3MakeWithArray},
    {"GLKVector3Negate", lua_GLKVector3Negate},
    {"GLKVector3Add", lua_GLKVector3Add},
    {"GLKVector3Subtract", lua_GLKVector3Subtract},
    {"GLKVector3Multiply", lua_GLKVector3Multiply},
    {"GLKVector3Divide", lua_GLKVector3Divide},
    {"GLKVector3AddScalar", lua_GLKVector3AddScalar},
    {"GLKVector3SubtractScalar", lua_GLKVector3SubtractScalar},
    {"GLKVector3MultiplyScalar", lua_GLKVector3MultiplyScalar},
    {"GLKVector3DivideScalar", lua_GLKVector3DivideScalar},
    {"GLKVector3Maximum", lua_GLKVector3Maximum},
    {"GLKVector3Minimum", lua_GLKVector3Minimum},
    {"GLKVector3AllEqualToVector3", lua_GLKVector3AllEqualToVector3},
    {"GLKVector3AllEqualToScalar", lua_GLKVector3AllEqualToScalar},
    {"GLKVector3AllGreaterThanVector3", lua_GLKVector3AllGreaterThanVector3},
    {"GLKVector3AllGreaterThanScalar", lua_GLKVector3AllGreaterThanScalar},
    {"GLKVector3AllGreaterThanOrEqualToVector3", lua_GLKVector3AllGreaterThanOrEqualToVector3},
    {"GLKVector3AllGreaterThanOrEqualToScalar", lua_GLKVector3AllGreaterThanOrEqualToScalar},
    {"GLKVector3Normalize", lua_GLKVector3Normalize},
    {"GLKVector3DotProduct", lua_GLKVector3DotProduct},
    {"GLKVector3Length", lua_GLKVector3Length},
    {"GLKVector3Distance", lua_GLKVector3Distance},
    {"GLKVector3Lerp", lua_GLKVector3Lerp},
    {"GLKVector3CrossProduct", lua_GLKVector3CrossProduct},
    {"GLKVector3Project", lua_GLKVector3Project},
    {NULL, NULL},
};

int LuaOpenGLKVector3(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGLKVector3APIs);
    return 0;
}
