//
//  LuaGLKQuaternion.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKQuaternion.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaGLKVector3.h"
#import "LuaGLKVector4.h"

int lua_pushGLKQuaternion(lua_State *L, GLKQuaternion quaternion)
{
    GLKQuaternion *q = lua_newuserdata(L, sizeof(GLKQuaternion));
    *q = quaternion;
    
    luaL_getmetatable(L, LUA_GLKQuaternion_METANAME);
    lua_setmetatable(L, -2);
    
    return 1;
}

static int lua_GLKQuaternionMake(lua_State *L)
{
    lua_pushGLKQuaternion(L, GLKQuaternionMake(lua_tonumber(L, 1),
                                               lua_tonumber(L, 2),
                                               lua_tonumber(L, 3),
                                               lua_tonumber(L, 4)));
    return 1;
}

static int lua_GLKQuaternionMakeWithVector3(lua_State *L)
{
    GLKVector3 *vector = lua_touserdata(L, 1);
    float scalar = lua_tonumber(L, 2);
    lua_pushGLKQuaternion(L, GLKQuaternionMakeWithVector3(*vector, scalar));
    return 1;
}

#if 0
static int lua_GLKQuaternionMakeWithArray(lua_State *L)
{
    float *array = NULL;
    luasdk_get_arrayf(L, 1, &array);
    lua_pushGLKQuaternion(L, GLKQuaternionMakeWithArray(array));
    return 1;
}
#endif

static int lua_GLKQuaternionMakeWithAngleAndAxis(lua_State *L)
{
    lua_pushGLKQuaternion(L, GLKQuaternionMakeWithAngleAndAxis(lua_tonumber(L, 1),
                                                               lua_tonumber(L, 2),
                                                               lua_tonumber(L, 3),
                                                               lua_tonumber(L, 4)));
    return 1;
}

static int lua_GLKQuaternionMakeWithAngleAndVector3Axis(lua_State *L)
{
    float radians = lua_tonumber(L, 1);
    GLKVector3 *vector =  lua_touserdata(L, 2);
    lua_pushGLKQuaternion(L, GLKQuaternionMakeWithAngleAndVector3Axis(radians, *vector));
    return 1;
}

static int lua_GLKQuaternionMakeWithMatrix3(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1);
    lua_pushGLKQuaternion(L, GLKQuaternionMakeWithMatrix3(*matrix));
    return 1;
}

static int lua_GLKQuaternionMakeWithMatrix4(lua_State *L)
{
    GLKMatrix4 *matrix = lua_touserdata(L, 1);
    lua_pushGLKQuaternion(L, GLKQuaternionMakeWithMatrix4(*matrix));
    return 1;
}

static int lua_GLKQuaternionAngle(lua_State *L)
{
    GLKQuaternion *q = lua_touserdata(L, 1);
    lua_pushnumber(L, GLKQuaternionAngle(*q));
    return 1;
}

static int lua_GLKQuaternionAxis(lua_State *L)
{
    GLKQuaternion *q = lua_touserdata(L, 1);
    lua_pushGLKVector3(L, GLKQuaternionAxis(*q));
    return 1;
}

static int lua_GLKQuaternionAdd(lua_State *L)
{
    GLKQuaternion *q1 = lua_touserdata(L, 1);
    GLKQuaternion *q2 = lua_touserdata(L, 2);
    lua_pushGLKQuaternion(L, GLKQuaternionAdd(*q1, *q2));
    return 1;
}

static int lua_GLKQuaternionSubtract(lua_State *L)
{
    GLKQuaternion *q1 = lua_touserdata(L, 1);
    GLKQuaternion *q2 = lua_touserdata(L, 2);
    lua_pushGLKQuaternion(L, GLKQuaternionSubtract(*q1, *q2));
    return 1;
}

static int lua_GLKQuaternionMultiply(lua_State *L)
{
    GLKQuaternion *q1 = lua_touserdata(L, 1);
    GLKQuaternion *q2 = lua_touserdata(L, 2);
    lua_pushGLKQuaternion(L, GLKQuaternionMultiply(*q1, *q2));
    return 1;
}

static int lua_GLKQuaternionSlerp(lua_State *L)
{
    GLKQuaternion *q1 = lua_touserdata(L, 1);
    GLKQuaternion *q2 = lua_touserdata(L, 2);
    lua_pushGLKQuaternion(L, GLKQuaternionSlerp(*q1, *q2, lua_tonumber(L, 3)));
    return 1;
}

static int lua_GLKQuaternionLength(lua_State *L)
{
    GLKQuaternion *q1 = lua_touserdata(L, 1);
    lua_pushnumber(L, GLKQuaternionLength(*q1));
    return 1;
}

static int lua_GLKQuaternionConjugate(lua_State *L)
{
    GLKQuaternion *q1 = lua_touserdata(L, 1);
    lua_pushGLKQuaternion(L, GLKQuaternionConjugate(*q1));
    return 1;
}

static int lua_GLKQuaternionInvert(lua_State *L)
{
    GLKQuaternion *q1 = lua_touserdata(L, 1);
    lua_pushGLKQuaternion(L, GLKQuaternionInvert(*q1));
    return 1;
}

static int lua_GLKQuaternionNormalize(lua_State *L)
{    
    GLKQuaternion *q1 = lua_touserdata(L, 1);
    lua_pushGLKQuaternion(L,  GLKQuaternionNormalize(*q1));
    return 1;
}

static int lua_GLKQuaternionRotateVector3(lua_State *L)
{
    GLKQuaternion *q1 = lua_touserdata(L, 1);
    GLKVector3 *vector = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKQuaternionRotateVector3(*q1, *vector));
    return 1;
}

static int lua_GLKQuaternionRotateVector3Array(lua_State *L)
{
    //TODO
//    lua_pushlightuserdata(L, GLKQuaternionRotateVector3Array(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKQuaternionRotateVector4(lua_State *L)
{
    GLKQuaternion *q1 = lua_touserdata(L, 1);
    GLKVector4 *vector = lua_touserdata(L, 2);
    lua_pushGLKVector4(L, GLKQuaternionRotateVector4(*q1, *vector));
    return 1;
}

static int lua_GLKQuaternionRotateVector4Array(lua_State *L)
{
    //TODO
//    lua_pushlightuserdata(L, GLKQuaternionRotateVector4Array(lua_touserdata(L, 1)));
    return 1;
}

static const luaL_Reg __LuaGLKQuaternionAPIs[] = {
    {"GLKQuaternionMake", lua_GLKQuaternionMake},
    {"GLKQuaternionMakeWithVector3", lua_GLKQuaternionMakeWithVector3},
#if 0
    {"GLKQuaternionMakeWithArray", lua_GLKQuaternionMakeWithArray},
#endif
    {"GLKQuaternionMakeWithAngleAndAxis", lua_GLKQuaternionMakeWithAngleAndAxis},
    {"GLKQuaternionMakeWithAngleAndVector3Axis", lua_GLKQuaternionMakeWithAngleAndVector3Axis},
    {"GLKQuaternionMakeWithMatrix3", lua_GLKQuaternionMakeWithMatrix3},
    {"GLKQuaternionMakeWithMatrix4", lua_GLKQuaternionMakeWithMatrix4},
    {"GLKQuaternionAngle", lua_GLKQuaternionAngle},
    {"GLKQuaternionAxis", lua_GLKQuaternionAxis},
    {"GLKQuaternionAdd", lua_GLKQuaternionAdd},
    {"GLKQuaternionSubtract", lua_GLKQuaternionSubtract},
    {"GLKQuaternionMultiply", lua_GLKQuaternionMultiply},
    {"GLKQuaternionSlerp", lua_GLKQuaternionSlerp},
    {"GLKQuaternionLength", lua_GLKQuaternionLength},
    {"GLKQuaternionConjugate", lua_GLKQuaternionConjugate},
    {"GLKQuaternionInvert", lua_GLKQuaternionInvert},
    {"GLKQuaternionNormalize", lua_GLKQuaternionNormalize},
    {"GLKQuaternionRotateVector3", lua_GLKQuaternionRotateVector3},
    {"GLKQuaternionRotateVector3Array", lua_GLKQuaternionRotateVector3Array},
    {"GLKQuaternionRotateVector4", lua_GLKQuaternionRotateVector4},
    {"GLKQuaternionRotateVector4Array", lua_GLKQuaternionRotateVector4Array},
    {NULL, NULL},
};


int LuaOpenGLKQuaternion(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGLKQuaternionAPIs);
    return 0;
}
