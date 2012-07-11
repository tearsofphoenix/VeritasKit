//
//  LuaGLKMatrix4.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKMatrix4.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaGLKMatrix3.h"
#import "LuaGLKVector3.h"
#import "LuaGLKVector4.h"
#import "LuaGLKMathUtils.h"


int lua_pushGLKMatrix4(lua_State *L, GLKMatrix4 matrix)
{
    GLKMatrix4 *m = lua_newuserdata(L, sizeof(GLKMatrix4));
    *m = matrix;
    
    luaL_getmetatable(L, LUA_GLKMatrix4_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}

static int lua_GLKMatrix4Make(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4Make(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                            lua_tonumber(L, 3), lua_tonumber(L, 4),
                                            lua_tonumber(L, 5), lua_tonumber(L, 6),
                                            lua_tonumber(L, 7), lua_tonumber(L, 8),
                                            lua_tonumber(L, 9),lua_tonumber(L, 10), 
                                            lua_tonumber(L, 11), lua_tonumber(L, 12),
                                            lua_tonumber(L, 13), lua_tonumber(L, 14),
                                            lua_tonumber(L, 15), lua_tonumber(L, 16)
                                            )
                          );
    return 1;
}

static int lua_GLKMatrix4MakeAndTranspose(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakeAndTranspose(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                         lua_tonumber(L, 3), lua_tonumber(L, 4),
                                         lua_tonumber(L, 5), lua_tonumber(L, 6),
                                         lua_tonumber(L, 7), lua_tonumber(L, 8),
                                         lua_tonumber(L, 9),lua_tonumber(L, 10), 
                                         lua_tonumber(L, 11), lua_tonumber(L, 12),
                                         lua_tonumber(L, 13), lua_tonumber(L, 14),
                                         lua_tonumber(L, 15), lua_tonumber(L, 16)
                                         )
                       );
    return 1;
}

#if 0
static int lua_GLKMatrix4MakeWithArray(lua_State *L)
{
    float *array = NULL;
    luasdk_get_arrayf(L, 1, &array);

    lua_pushGLKMatrix4(L, GLKMatrix4MakeWithArray(array));
    return 1;
}

static int lua_GLKMatrix4MakeWithArrayAndTranspose(lua_State *L)
{
    float *array = NULL;
    luasdk_get_arrayf(L, 1, &array);

    lua_pushGLKMatrix4(L, GLKMatrix4MakeWithArrayAndTranspose(array));
    return 1;
}
#endif

static int lua_GLKMatrix4MakeWithRows(lua_State *L)
{
    GLKVector4 *row0 = lua_touserdata(L, 1);
    GLKVector4 *row1 = lua_touserdata(L, 2); 
    GLKVector4 *row2 = lua_touserdata(L, 3);
    GLKVector4 *row3 = lua_touserdata(L, 4);
    lua_pushGLKMatrix4(L, GLKMatrix4MakeWithRows(*row0, *row1, *row2, *row3));
    return 1;
}

static int lua_GLKMatrix4MakeWithColumns(lua_State *L)
{
    GLKVector4 *column0 = lua_touserdata(L, 1);
    GLKVector4 *column1 = lua_touserdata(L, 2); 
    GLKVector4 *column2 = lua_touserdata(L, 3);
    GLKVector4 *column3 = lua_touserdata(L, 4);

    lua_pushGLKMatrix4(L, GLKMatrix4MakeWithColumns(*column0, *column1, *column2, *column3));
    return 1;
}

static int lua_GLKMatrix4MakeWithQuaternion(lua_State *L)
{
    GLKQuaternion *q = lua_touserdata(L, 1);
    lua_pushGLKMatrix4(L, GLKMatrix4MakeWithQuaternion(*q));
    return 1;
}

static int lua_GLKMatrix4MakeTranslation(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakeTranslation(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                                    lua_tonumber(L, 3)));
    return 1;
}

static int lua_GLKMatrix4MakeScale(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakeScale(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                              lua_tonumber(L, 3)));
    return 1;
}

static int lua_GLKMatrix4MakeRotation(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakeRotation(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                                 lua_tonumber(L, 3), lua_tonumber(L, 4)));
    return 1;
}

static int lua_GLKMatrix4MakeXRotation(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakeXRotation(lua_tonumber(L, 1)));
    return 1;
}

static int lua_GLKMatrix4MakeYRotation(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakeYRotation(lua_tonumber(L, 1)));
    return 1;
}

static int lua_GLKMatrix4MakeZRotation(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakeZRotation(lua_tonumber(L, 1)));
    return 1;
}

static int lua_GLKMatrix4MakePerspective(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakePerspective(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                                       lua_tonumber(L, 3), lua_tonumber(L, 4)));
    return 1;
}

static int lua_GLKMatrix4MakeFrustum(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakeFrustum(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                                lua_tonumber(L, 3), lua_tonumber(L, 4),
                                                lua_tonumber(L, 5), lua_tonumber(L, 6)));
    return 1;
}

static int lua_GLKMatrix4MakeOrtho(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakeOrtho(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                              lua_tonumber(L, 3), lua_tonumber(L, 4),
                                              lua_tonumber(L, 5), lua_tonumber(L, 6)));
    return 1;
}

static int lua_GLKMatrix4MakeLookAt(lua_State *L)
{
    lua_pushGLKMatrix4(L, GLKMatrix4MakeLookAt(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                               lua_tonumber(L, 3), lua_tonumber(L, 4),
                                               lua_tonumber(L, 5), lua_tonumber(L, 6),
                                               lua_tonumber(L, 7),
                                               lua_tonumber(L, 8), lua_tonumber(L, 9)));
    return 1;
}

static int lua_GLKMatrix4GetMatrix3(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    lua_pushGLKMatrix3(L, GLKMatrix4GetMatrix3(*m));
    return 1;
}

static int lua_GLKMatrix4GetMatrix2(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    lua_pushGLKMatrix2(L, GLKMatrix4GetMatrix2(*m));
    return 1;
}

static int lua_GLKMatrix4GetRow(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    lua_pushGLKVector4(L, GLKMatrix4GetRow(*m, lua_tointeger(L, 2)));
    return 1;
}

static int lua_GLKMatrix4GetColumn(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    lua_pushGLKVector4(L, GLKMatrix4GetColumn(*m, lua_tointeger(L, 2)));
    return 1;
}

static int lua_GLKMatrix4SetRow(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    GLKVector4 *vector = lua_touserdata(L, 3);
    GLKMatrix4SetRow(*m, lua_tointeger(L, 2), *vector);
    return 1;
}

static int lua_GLKMatrix4SetColumn(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    GLKVector4 *vector = lua_touserdata(L, 3);
    GLKMatrix4SetColumn(*m, lua_tointeger(L, 2), *vector);
    return 1;
}

static int lua_GLKMatrix4Transpose(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    lua_pushGLKMatrix4(L, GLKMatrix4Transpose(*m));
    return 1;
}

static int lua_GLKMatrix4Invert(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    bool isInvertable;
    lua_pushGLKMatrix4(L, GLKMatrix4Invert(*m, &isInvertable));
    lua_pushboolean(L, isInvertable);
    return 2;
}

static int lua_GLKMatrix4InvertAndTranspose(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    bool isInvertable;
    lua_pushGLKMatrix4(L, GLKMatrix4InvertAndTranspose(*m, &isInvertable));
    lua_pushboolean(L, isInvertable);
    return 2;
}

static int lua_GLKMatrix4Multiply(lua_State *L)
{
    GLKMatrix4 *m1 = lua_touserdata(L, 1);
    GLKMatrix4 *m2 = lua_touserdata(L, 2);

    lua_pushGLKMatrix4(L, GLKMatrix4Multiply(*m1, *m2));
    return 1;
}

static int lua_GLKMatrix4Add(lua_State *L)
{
    GLKMatrix4 *m1 = lua_touserdata(L, 1);
    GLKMatrix4 *m2 = lua_touserdata(L, 2);
    
    lua_pushGLKMatrix4(L, GLKMatrix4Add(*m1, *m2));
    return 1;
}

static int lua_GLKMatrix4Subtract(lua_State *L)
{
    GLKMatrix4 *m1 = lua_touserdata(L, 1);
    GLKMatrix4 *m2 = lua_touserdata(L, 2);
    
    lua_pushGLKMatrix4(L, GLKMatrix4Subtract(*m1, *m2));
    return 1;
}

static int lua_GLKMatrix4Translate(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    lua_pushGLKMatrix4(L, GLKMatrix4Translate(*m, lua_tonumber(L, 2),
                                                 lua_tonumber(L, 3),
                                                 lua_tonumber(L, 4)));
    return 1;
}

static int lua_GLKMatrix4TranslateWithVector3(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    GLKVector3 *vector = lua_touserdata(L, 2);
    lua_pushGLKMatrix4(L, GLKMatrix4TranslateWithVector3(*m, *vector));
    return 1;
}

static int lua_GLKMatrix4TranslateWithVector4(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    GLKVector4 *vector = lua_touserdata(L, 2);
    lua_pushGLKMatrix4(L, GLKMatrix4TranslateWithVector4(*m, *vector));
    return 1;
}

static int lua_GLKMatrix4Scale(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    lua_pushGLKMatrix4(L, GLKMatrix4Scale(*m, lua_tonumber(L, 2),
                                              lua_tonumber(L, 3),
                                              lua_tonumber(L, 4)));
    return 1;
}

static int lua_GLKMatrix4ScaleWithVector3(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    GLKVector3 *vector = lua_touserdata(L, 2);
    lua_pushGLKMatrix4(L, GLKMatrix4ScaleWithVector3(*m, *vector));
    return 1;
}

static int lua_GLKMatrix4ScaleWithVector4(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    GLKVector4 *vector = lua_touserdata(L, 2);
    lua_pushGLKMatrix4(L, GLKMatrix4ScaleWithVector4(*m, *vector));
    return 1;
}

static int lua_GLKMatrix4Rotate(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    lua_pushGLKMatrix4(L, GLKMatrix4Rotate(*m, lua_tonumber(L, 2),
                                          lua_tonumber(L, 3),
                                          lua_tonumber(L, 4),
                                           lua_tonumber(L, 5)));
    return 1;
}

static int lua_GLKMatrix4RotateWithVector3(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    float radians = lua_tonumber(L, 2);
    GLKVector3 *vector = lua_touserdata(L, 3);
    lua_pushGLKMatrix4(L, GLKMatrix4RotateWithVector3(*m,  radians, *vector));
    return 1;
}

static int lua_GLKMatrix4RotateWithVector4(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    float radians = lua_tonumber(L, 2);
    GLKVector4 *vector = lua_touserdata(L, 3);
    lua_pushGLKMatrix4(L, GLKMatrix4RotateWithVector4(*m,  radians, *vector));
    return 1;
}

static int lua_GLKMatrix4RotateX(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    float radians = lua_tonumber(L, 2);
    lua_pushGLKMatrix4(L, GLKMatrix4RotateX(*m, radians));
    return 1;
}

static int lua_GLKMatrix4RotateY(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    float radians = lua_tonumber(L, 2);
    lua_pushGLKMatrix4(L, GLKMatrix4RotateY(*m, radians));
    return 1;
}

static int lua_GLKMatrix4RotateZ(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    float radians = lua_tonumber(L, 2);
    lua_pushGLKMatrix4(L, GLKMatrix4RotateZ(*m, radians));
    return 1;
}

static int lua_GLKMatrix4MultiplyVector3(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    GLKVector3 *vector = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKMatrix4MultiplyVector3(*m, *vector));
    return 1;
}

static int lua_GLKMatrix4MultiplyVector3WithTranslation(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    GLKVector3 *vector = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKMatrix4MultiplyVector3WithTranslation(*m, *vector));
    return 1;
}

static int lua_GLKMatrix4MultiplyAndProjectVector3(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    GLKVector3 *vector = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKMatrix4MultiplyAndProjectVector3(*m, *vector));
    return 1;
}

static int lua_GLKMatrix4MultiplyVector3Array(lua_State *L)
{
    //TODO
//    lua_pushlightuserdata(L, GLKMatrix4MultiplyVector3Array(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrix4MultiplyVector3ArrayWithTranslation(lua_State *L)
{
    //TODO
//    lua_pushlightuserdata(L, GLKMatrix4MultiplyVector3ArrayWithTranslation(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrix4MultiplyAndProjectVector3Array(lua_State *L)
{
    //TODO
//    lua_pushlightuserdata(L, GLKMatrix4MultiplyAndProjectVector3Array(lua_touserdata(L, 1)));
    return 1;
}

static int lua_GLKMatrix4MultiplyVector4(lua_State *L)
{
    GLKMatrix4 *m = lua_touserdata(L, 1);
    GLKVector4 *vector = lua_touserdata(L, 2);
    lua_pushGLKVector4(L, GLKMatrix4MultiplyVector4(*m, *vector));
    return 1;
}

static int lua_GLKMatrix4MultiplyVector4Array(lua_State *L)
{
    //TODO
//    lua_pushlightuserdata(L, GLKMatrix4MultiplyVector4Array(lua_touserdata(L, 1)));
    return 1;
}

static const luaL_Reg __LuaGLKMatrix4APIs[] = {
    {"GLKMatrix4Make", lua_GLKMatrix4Make},
    {"GLKMatrix4MakeAndTranspose", lua_GLKMatrix4MakeAndTranspose},
#if 0
    {"GLKMatrix4MakeWithArray", lua_GLKMatrix4MakeWithArray},
    {"GLKMatrix4MakeWithArrayAndTranspose", lua_GLKMatrix4MakeWithArrayAndTranspose},
#endif
    {"GLKMatrix4MakeWithRows", lua_GLKMatrix4MakeWithRows},
    {"GLKMatrix4MakeWithColumns", lua_GLKMatrix4MakeWithColumns},
    {"GLKMatrix4MakeWithQuaternion", lua_GLKMatrix4MakeWithQuaternion},
    {"GLKMatrix4MakeTranslation", lua_GLKMatrix4MakeTranslation},
    {"GLKMatrix4MakeScale", lua_GLKMatrix4MakeScale},
    {"GLKMatrix4MakeRotation", lua_GLKMatrix4MakeRotation},
    {"GLKMatrix4MakeXRotation", lua_GLKMatrix4MakeXRotation},
    {"GLKMatrix4MakeYRotation", lua_GLKMatrix4MakeYRotation},
    {"GLKMatrix4MakeZRotation", lua_GLKMatrix4MakeZRotation},
    {"GLKMatrix4MakePerspective", lua_GLKMatrix4MakePerspective},
    {"GLKMatrix4MakeFrustum", lua_GLKMatrix4MakeFrustum},
    {"GLKMatrix4MakeOrtho", lua_GLKMatrix4MakeOrtho},
    {"GLKMatrix4MakeLookAt", lua_GLKMatrix4MakeLookAt},
    {"GLKMatrix4GetMatrix3", lua_GLKMatrix4GetMatrix3},
    {"GLKMatrix4GetMatrix2", lua_GLKMatrix4GetMatrix2},
    {"GLKMatrix4GetRow", lua_GLKMatrix4GetRow},
    {"GLKMatrix4GetColumn", lua_GLKMatrix4GetColumn},
    {"GLKMatrix4SetRow", lua_GLKMatrix4SetRow},
    {"GLKMatrix4SetColumn", lua_GLKMatrix4SetColumn},
    {"GLKMatrix4Transpose", lua_GLKMatrix4Transpose},
    {"GLKMatrix4Invert", lua_GLKMatrix4Invert},
    {"GLKMatrix4InvertAndTranspose", lua_GLKMatrix4InvertAndTranspose},
    {"GLKMatrix4Multiply", lua_GLKMatrix4Multiply},
    {"GLKMatrix4Add", lua_GLKMatrix4Add},
    {"GLKMatrix4Subtract", lua_GLKMatrix4Subtract},
    {"GLKMatrix4Translate", lua_GLKMatrix4Translate},
    {"GLKMatrix4TranslateWithVector3", lua_GLKMatrix4TranslateWithVector3},
    {"GLKMatrix4TranslateWithVector4", lua_GLKMatrix4TranslateWithVector4},
    {"GLKMatrix4Scale", lua_GLKMatrix4Scale},
    {"GLKMatrix4ScaleWithVector3", lua_GLKMatrix4ScaleWithVector3},
    {"GLKMatrix4ScaleWithVector4", lua_GLKMatrix4ScaleWithVector4},
    {"GLKMatrix4Rotate", lua_GLKMatrix4Rotate},
    {"GLKMatrix4RotateWithVector3", lua_GLKMatrix4RotateWithVector3},
    {"GLKMatrix4RotateWithVector4", lua_GLKMatrix4RotateWithVector4},
    {"GLKMatrix4RotateX", lua_GLKMatrix4RotateX},
    {"GLKMatrix4RotateY", lua_GLKMatrix4RotateY},
    {"GLKMatrix4RotateZ", lua_GLKMatrix4RotateZ},
    {"GLKMatrix4MultiplyVector3", lua_GLKMatrix4MultiplyVector3},
    {"GLKMatrix4MultiplyVector3WithTranslation", lua_GLKMatrix4MultiplyVector3WithTranslation},
    {"GLKMatrix4MultiplyAndProjectVector3", lua_GLKMatrix4MultiplyAndProjectVector3},
    {"GLKMatrix4MultiplyVector3Array", lua_GLKMatrix4MultiplyVector3Array},
    {"GLKMatrix4MultiplyVector3ArrayWithTranslation", lua_GLKMatrix4MultiplyVector3ArrayWithTranslation},
    {"GLKMatrix4MultiplyAndProjectVector3Array", lua_GLKMatrix4MultiplyAndProjectVector3Array},
    {"GLKMatrix4MultiplyVector4", lua_GLKMatrix4MultiplyVector4},
    {"GLKMatrix4MultiplyVector4Array", lua_GLKMatrix4MultiplyVector4Array},
    {NULL, NULL},
};


int LuaOpenGLKMatrix4(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGLKMatrix4APIs);
    return 0;
}
