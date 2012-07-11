//
//  LuaGLKMathUtils.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKMathUtils.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"
#import "LuaGLKVector3.h"

int lua_pushGLKMatrix2(lua_State *L, GLKMatrix2 matrix)
{
    GLKMatrix2 *m = lua_newuserdata(L, sizeof(GLKMatrix2));
    *m = matrix;
    
    luaL_getmetatable(L, LUA_GLKMatrix2_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}

static int lua_GLKMathDegreesToRadians(lua_State *L)
{
    lua_pushnumber(L, GLKMathDegreesToRadians(lua_tonumber(L, 1)));
    return 1;
}
static int lua_GLKMathRadiansToDegrees(lua_State *L)
{
    lua_pushnumber(L, GLKMathRadiansToDegrees(lua_tonumber(L, 1)));
    return 1;
}

#if 0
static int lua_GLKMathProject(lua_State *L)
{
    GLKVector3 *object = lua_touserdata(L, 1);
    GLKMatrix4 *model = lua_touserdata(L, 2);
    GLKMatrix4 *projection = lua_touserdata(L, 3);
    int *viewport = NULL;
    luasdk_get_arrayi(L, 4, &viewport);
    lua_pushGLKVector3(L, GLKMathProject(*object, *model, *projection, viewport));
    return 1;
}

static int lua_GLKMathUnproject(lua_State *L)
{
    GLKVector3 *window = lua_touserdata(L, 1);
    GLKMatrix4 *model = lua_touserdata(L, 2);
    GLKMatrix4 *projection = lua_touserdata(L, 3);
    int *viewport = NULL;
    luasdk_get_arrayi(L, 4, &viewport);
    bool success;
    lua_pushGLKVector3(L, GLKMathUnproject(*window, *model, *projection, viewport, &success));
    lua_pushboolean(L, success);
    return 2;

}

#endif

#ifdef __OBJC__
static int lua_NSStringFromGLKMatrix2(lua_State *L)
{
    GLKMatrix2 *matrix = lua_touserdata(L, 1);
    luaObjC_pushNSObject(L, NSStringFromGLKMatrix2(*matrix));
    return 1;
}
static int lua_NSStringFromGLKMatrix3(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1);
    luaObjC_pushNSObject(L, NSStringFromGLKMatrix3(*matrix));
    return 1;
}
static int lua_NSStringFromGLKMatrix4(lua_State *L)
{
    GLKMatrix4 *matrix = lua_touserdata(L, 1);
    luaObjC_pushNSObject(L, NSStringFromGLKMatrix4(*matrix));
    return 1;
}

static int lua_NSStringFromGLKVector2(lua_State *L)
{
    GLKVector2 *vector = lua_touserdata(L, 1);
    luaObjC_pushNSObject(L, NSStringFromGLKVector2(*vector));
    return 1;
}
static int lua_NSStringFromGLKVector3(lua_State *L)
{
    GLKVector3 *vector = lua_touserdata(L, 1);
    luaObjC_pushNSObject(L, NSStringFromGLKVector3(*vector));
    return 1;
}
static int lua_NSStringFromGLKVector4(lua_State *L)
{
    GLKVector4 *vector = lua_touserdata(L, 1);
    luaObjC_pushNSObject(L, NSStringFromGLKVector4(*vector));
    return 1;
}
static int lua_NSStringFromGLKQuaternion(lua_State *L)
{
    GLKQuaternion *quaternion = lua_touserdata(L, 1);
    luaObjC_pushNSObject(L, NSStringFromGLKQuaternion(*quaternion));
    return 1;
}

#endif


static const luaL_Reg __luaGLKMathUtilsAPIs[] = {
    {"GLKMathDegreesToRadians", lua_GLKMathDegreesToRadians},
    {"GLKMathRadiansToDegrees", lua_GLKMathRadiansToDegrees},
#if 0
    {"GLKMathProject", lua_GLKMathProject},
    {"GLKMathUnproject", lua_GLKMathUnproject},
#endif
    
#ifdef __OBJC__
    {"NSStringFromGLKMatrix2", lua_NSStringFromGLKMatrix2},
    {"NSStringFromGLKMatrix2", lua_NSStringFromGLKMatrix2},
    {"NSStringFromGLKMatrix2", lua_NSStringFromGLKMatrix2},

    {"NSStringFromGLKVector2", lua_NSStringFromGLKVector2},
    {"NSStringFromGLKVector2", lua_NSStringFromGLKVector2},
    {"NSStringFromGLKVector2", lua_NSStringFromGLKVector2},

    {"NSStringFromGLKQuaternion", lua_NSStringFromGLKQuaternion},
#endif
    
    {NULL, NULL},
};

int LuaOpenGLKMathUtils(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __luaGLKMathUtilsAPIs);
    return 0;
}
