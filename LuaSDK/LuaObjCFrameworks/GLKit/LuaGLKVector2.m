//
//  LuaGLKVector2.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKVector2.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

int lua_pushGLKVector2(lua_State *L, GLKVector2 vector)
{
    GLKVector2 *v = lua_newuserdata(L, sizeof(GLKVector2));
    *v = vector;
    
    luaL_getmetatable(L, LUA_GLKVector2_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}

static int lua_GLKVector2Make(lua_State *L)
{
    lua_pushGLKVector2(L, GLKVector2Make(lua_tonumber(L, 1),
                                            lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKVector2MakeWithArray(lua_State *L)
{
    lua_pushGLKVector2(L, GLKVector2MakeWithArray(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKVector2Negate(lua_State *L)
{
    GLKVector2 *vector = lua_touserdata(L, 1);
    lua_pushGLKVector2(L, GLKVector2Negate(*vector));
    return 1;
}

static int lua_GLKVector2Add(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector2(L, GLKVector2Add(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2Subtract(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector2(L, GLKVector2Subtract(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2Multiply(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector2(L, GLKVector2Multiply(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2Divide(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector2(L, GLKVector2Divide(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2AddScalar(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushGLKVector2(L, GLKVector2AddScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector2SubtractScalar(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushGLKVector2(L, GLKVector2SubtractScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector2MultiplyScalar(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushGLKVector2(L, GLKVector2MultiplyScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector2DivideScalar(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushGLKVector2(L, GLKVector2DivideScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector2Maximum(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector2(L, GLKVector2Maximum(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2Minimum(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector2(L, GLKVector2Minimum(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2AllEqualToVector2(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushboolean(L, GLKVector2AllEqualToVector2(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2AllEqualToScalar(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushboolean(L, GLKVector2AllEqualToScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector2AllGreaterThanVector2(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushboolean(L, GLKVector2AllGreaterThanVector2(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2AllGreaterThanScalar(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushboolean(L, GLKVector2AllGreaterThanScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector2AllGreaterThanOrEqualToVector2(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushboolean(L, GLKVector2AllGreaterThanOrEqualToVector2(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2AllGreaterThanOrEqualToScalar(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushboolean(L, GLKVector2AllGreaterThanOrEqualToScalar(*vector1, scalar));
    return 1;
}

static int lua_GLKVector2Normalize(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    lua_pushGLKVector2(L, GLKVector2Normalize(*vector1));
    return 1;
}

static int lua_GLKVector2DotProduct(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushnumber(L, GLKVector2DotProduct(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2Length(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    lua_pushnumber(L, GLKVector2Length(*vector1));
    return 1;
}

static int lua_GLKVector2Distance(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushnumber(L, GLKVector2Distance(*vector1, *vector2));
    return 1;
}

static int lua_GLKVector2Lerp(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector2(L, GLKVector2Lerp(*vector1, *vector2, lua_tonumber(L, 3)));
    return 1;
}

static int lua_GLKVector2Project(lua_State *L)
{
    GLKVector2 *vector1 = lua_touserdata(L, 1);
    GLKVector2 *vector2 = lua_touserdata(L, 2);
    lua_pushGLKVector2(L, GLKVector2Project(*vector1, *vector2));
    return 1;
}

static const luaL_Reg __LuaGLKVector2APIs[] = {
    {"GLKVector2Make", lua_GLKVector2Make},
    {"GLKVector2MakeWithArray", lua_GLKVector2MakeWithArray},
    {"GLKVector2Negate", lua_GLKVector2Negate},
    {"GLKVector2Add", lua_GLKVector2Add},
    {"GLKVector2Subtract", lua_GLKVector2Subtract},
    {"GLKVector2Multiply", lua_GLKVector2Multiply},
    {"GLKVector2Divide", lua_GLKVector2Divide},
    {"GLKVector2AddScalar", lua_GLKVector2AddScalar},
    {"GLKVector2SubtractScalar", lua_GLKVector2SubtractScalar},
    {"GLKVector2MultiplyScalar", lua_GLKVector2MultiplyScalar},
    {"GLKVector2DivideScalar", lua_GLKVector2DivideScalar},
    {"GLKVector2Maximum", lua_GLKVector2Maximum},
    {"GLKVector2Minimum", lua_GLKVector2Minimum},
    {"GLKVector2AllEqualToVector2", lua_GLKVector2AllEqualToVector2},
    {"GLKVector2AllEqualToScalar", lua_GLKVector2AllEqualToScalar},
    {"GLKVector2AllGreaterThanVector2", lua_GLKVector2AllGreaterThanVector2},
    {"GLKVector2AllGreaterThanScalar", lua_GLKVector2AllGreaterThanScalar},
    {"GLKVector2AllGreaterThanOrEqualToVector2", lua_GLKVector2AllGreaterThanOrEqualToVector2},
    {"GLKVector2AllGreaterThanOrEqualToScalar", lua_GLKVector2AllGreaterThanOrEqualToScalar},
    {"GLKVector2Normalize", lua_GLKVector2Normalize},
    {"GLKVector2DotProduct", lua_GLKVector2DotProduct},
    {"GLKVector2Length", lua_GLKVector2Length},
    {"GLKVector2Distance", lua_GLKVector2Distance},
    {"GLKVector2Lerp", lua_GLKVector2Lerp},
    {"GLKVector2Project", lua_GLKVector2Project},
    {NULL, NULL},
};

int LuaOpenGLKVector2(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGLKVector2APIs);
    return 0;
}
