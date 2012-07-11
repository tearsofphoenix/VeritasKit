//
//  LuaGLKMatrixStack.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKMatrixStack.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaGLKMatrix3.h"
#import "LuaGLKMatrix4.h"
#import "LuaGLKMathUtils.h"

static int lua_GLKMatrixStackCreate(lua_State *L)
{
    lua_pushlightuserdata(L, GLKMatrixStackCreate(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrixStackGetTypeID(lua_State *L)
{
    lua_pushinteger(L, GLKMatrixStackGetTypeID());
    return 1;
}

static int lua_GLKMatrixStackPush(lua_State *L)
{
    GLKMatrixStackPush(lua_touserdata(L, 1));
    return 0;
}

static int lua_GLKMatrixStackPop(lua_State *L)
{
    GLKMatrixStackPop(lua_touserdata(L, 1));
    return 0;
}

static int lua_GLKMatrixStackSize(lua_State *L)
{
    lua_pushinteger(L, GLKMatrixStackSize(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrixStackLoadMatrix4(lua_State *L)
{
    GLKMatrix4 *matrix = lua_touserdata(L, 2);
    GLKMatrixStackLoadMatrix4(lua_touserdata(L, 1), *matrix);
    return 0;
}

static int lua_GLKMatrixStackGetMatrix4(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrixStackGetMatrix4(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrixStackGetMatrix3(lua_State *L)
{
    lua_pushGLKMatrix3(L, GLKMatrixStackGetMatrix3(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrixStackGetMatrix2(lua_State *L)
{
    lua_pushGLKMatrix2(L, GLKMatrixStackGetMatrix2(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrixStackGetMatrix4Inverse(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrixStackGetMatrix4Inverse(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrixStackGetMatrix4InverseTranspose(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrixStackGetMatrix4InverseTranspose(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrixStackGetMatrix3Inverse(lua_State *L)
{
    lua_pushGLKMatrix3(L, GLKMatrixStackGetMatrix3Inverse(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrixStackGetMatrix3InverseTranspose(lua_State *L)
{
    lua_pushGLKMatrix3(L, GLKMatrixStackGetMatrix3InverseTranspose(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrixStackMultiplyMatrix4(lua_State *L)
{
    GLKMatrix4 *matrix = lua_touserdata(L, 2);
    GLKMatrixStackMultiplyMatrix4(lua_touserdata(L, 1), *matrix);
    return 0;
}

static int lua_GLKMatrixStackMultiplyMatrixStack(lua_State *L)
{
    GLKMatrixStackMultiplyMatrixStack(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_GLKMatrixStackTranslate(lua_State *L)
{
    GLKMatrixStackTranslate(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3), lua_tonumber(L, 4));
    return 0;
}

static int lua_GLKMatrixStackTranslateWithVector3(lua_State *L)
{
    GLKVector3 *translationVector = lua_touserdata(L, 2);
    GLKMatrixStackTranslateWithVector3(lua_touserdata(L, 1), *translationVector);
    return 0;
}

static int lua_GLKMatrixStackTranslateWithVector4(lua_State *L)
{
    GLKVector4 *translationVector = lua_touserdata(L, 2);

    GLKMatrixStackTranslateWithVector4(lua_touserdata(L, 1), *translationVector);
    return 0;
}

static int lua_GLKMatrixStackScale(lua_State *L)
{
    GLKMatrixStackScale(lua_touserdata(L, 1),
                         lua_tonumber(L, 2), 
                         lua_tonumber(L, 3), 
                         lua_tonumber(L, 4));
    return 0;
}

static int lua_GLKMatrixStackScaleWithVector3(lua_State *L)
{
    GLKVector3 *scaleVector = lua_touserdata(L, 2);
    GLKMatrixStackScaleWithVector3(lua_touserdata(L, 1), *scaleVector);
    return 0;
}

static int lua_GLKMatrixStackScaleWithVector4(lua_State *L)
{
    GLKVector4 *scaleVector = lua_touserdata(L, 2);
    GLKMatrixStackScaleWithVector4(lua_touserdata(L, 1), *scaleVector);
    return 0;
}

static int lua_GLKMatrixStackRotate(lua_State *L)
{
    GLKMatrixStackRotate(lua_touserdata(L, 1),
                          lua_tonumber(L, 2), 
                          lua_tonumber(L, 3), 
                          lua_tonumber(L, 4),
                          lua_tonumber(L, 5));
    return 0;
}

static int lua_GLKMatrixStackRotateWithVector3(lua_State *L)
{
    float radians = lua_tonumber(L, 2);
    GLKVector3 *rotateVector = lua_touserdata(L, 3);

    GLKMatrixStackRotateWithVector3(lua_touserdata(L, 1), radians, *rotateVector);
    return 0;
}

static int lua_GLKMatrixStackRotateWithVector4(lua_State *L)
{
    float radians = lua_tonumber(L, 2);
    GLKVector4 *rotateVector = lua_touserdata(L, 3);
    GLKMatrixStackRotateWithVector4(lua_touserdata(L, 1), radians, *rotateVector);
    return 0;
}

static int lua_GLKMatrixStackRotateX(lua_State *L)
{
    float radians = lua_tonumber(L, 2);
    GLKMatrixStackRotateX(lua_touserdata(L, 1), radians);
    return 0;
}

static int lua_GLKMatrixStackRotateY(lua_State *L)
{
    float radians = lua_tonumber(L, 2);
    GLKMatrixStackRotateY(lua_touserdata(L, 1), radians);
    return 0;
}

static int lua_GLKMatrixStackRotateZ(lua_State *L)
{
    float radians = lua_tonumber(L, 2);
    GLKMatrixStackRotateZ(lua_touserdata(L, 1), radians);
    return 0;
}

static const luaL_Reg __LuaGLKMatrixStackAPIs[] = {
    {"GLKMatrixStackCreate", lua_GLKMatrixStackCreate},
    {"GLKMatrixStackGetTypeID", lua_GLKMatrixStackGetTypeID},
    {"GLKMatrixStackPush", lua_GLKMatrixStackPush},
    {"GLKMatrixStackPop", lua_GLKMatrixStackPop},
    {"GLKMatrixStackSize", lua_GLKMatrixStackSize},
    {"GLKMatrixStackLoadMatrix4", lua_GLKMatrixStackLoadMatrix4},
    {"GLKMatrixStackGetMatrix4", lua_GLKMatrixStackGetMatrix4},
    {"GLKMatrixStackGetMatrix3", lua_GLKMatrixStackGetMatrix3},
    {"GLKMatrixStackGetMatrix2", lua_GLKMatrixStackGetMatrix2},
    {"GLKMatrixStackGetMatrix4Inverse", lua_GLKMatrixStackGetMatrix4Inverse},
    {"GLKMatrixStackGetMatrix4InverseTranspose", lua_GLKMatrixStackGetMatrix4InverseTranspose},
    {"GLKMatrixStackGetMatrix3Inverse", lua_GLKMatrixStackGetMatrix3Inverse},
    {"GLKMatrixStackGetMatrix3InverseTranspose", lua_GLKMatrixStackGetMatrix3InverseTranspose},
    {"GLKMatrixStackMultiplyMatrix4", lua_GLKMatrixStackMultiplyMatrix4},
    {"GLKMatrixStackMultiplyMatrixStack", lua_GLKMatrixStackMultiplyMatrixStack},
    {"GLKMatrixStackTranslate", lua_GLKMatrixStackTranslate},
    {"GLKMatrixStackTranslateWithVector3", lua_GLKMatrixStackTranslateWithVector3},
    {"GLKMatrixStackTranslateWithVector4", lua_GLKMatrixStackTranslateWithVector4},
    {"GLKMatrixStackScale", lua_GLKMatrixStackScale},
    {"GLKMatrixStackScaleWithVector3", lua_GLKMatrixStackScaleWithVector3},
    {"GLKMatrixStackScaleWithVector4", lua_GLKMatrixStackScaleWithVector4},
    {"GLKMatrixStackRotate", lua_GLKMatrixStackRotate},
    {"GLKMatrixStackRotateWithVector3", lua_GLKMatrixStackRotateWithVector3},
    {"GLKMatrixStackRotateWithVector4", lua_GLKMatrixStackRotateWithVector4},
    {"GLKMatrixStackRotateX", lua_GLKMatrixStackRotateX},
    {"GLKMatrixStackRotateY", lua_GLKMatrixStackRotateY},
    {"GLKMatrixStackRotateZ", lua_GLKMatrixStackRotateZ},
    {NULL, NULL},
};


int LuaOpenGLKMatrixStack(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGLKMatrixStackAPIs);
    return 0;
}
