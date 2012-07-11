//
//  LuaGLKMatrix3.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKMatrix3.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaGLKMathUtils.h"
#import "LuaGLKVector3.h"

int lua_pushGLKMatrix3(lua_State *L, GLKMatrix3 matrix)
{
    GLKMatrix3 *m = lua_newuserdata(L, sizeof(GLKMatrix3));
    *m = matrix;
    
    luaL_getmetatable(L, LUA_GLKMatrix3_METANAME);
    lua_setmetatable(L, -2);
    return 1;
}
static int lua_GLKMatrix3Make(lua_State *L)
{
    lua_pushGLKMatrix3(L, GLKMatrix3Make(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                            lua_tonumber(L, 3), lua_tonumber(L, 4),
                                            lua_tonumber(L, 5), lua_tonumber(L, 6),
                                            lua_tonumber(L, 7), lua_tonumber(L, 8),
                                            lua_tonumber(L, 9)
                                            ));
    return 1;
}

static int lua_GLKMatrix3MakeAndTranspose(lua_State *L)
{
    lua_pushGLKMatrix3(L, GLKMatrix3MakeAndTranspose(lua_tonumber(L, 1), lua_tonumber(L, 2),
                                                        lua_tonumber(L, 3), lua_tonumber(L, 4),
                                                        lua_tonumber(L, 5), lua_tonumber(L, 6),
                                                        lua_tonumber(L, 7), lua_tonumber(L, 8),
                                                        lua_tonumber(L, 9))
                          );
    return 1;
}

#if 0
static int lua_GLKMatrix3MakeWithArray(lua_State *L)
{
    float *array = NULL;
    luasdk_get_arrayf(L, 1, &array);
    lua_pushGLKMatrix3(L, GLKMatrix3MakeWithArray(array));
    return 1;
}

static int lua_GLKMatrix3MakeWithArrayAndTranspose(lua_State *L)
{
    float *array = NULL;
    luasdk_get_arrayf(L, 1, &array);
    lua_pushGLKMatrix3(L, GLKMatrix3MakeWithArrayAndTranspose(array));
    return 1;
}
#endif

static int lua_GLKMatrix3MakeWithRows(lua_State *L)
{
    GLKVector3 *row0 = lua_touserdata(L, 1);
    GLKVector3 *row1 = lua_touserdata(L, 2);
    GLKVector3 *row2 = lua_touserdata(L, 3);
    
    lua_pushGLKMatrix3(L, GLKMatrix3MakeWithRows(*row0, *row1, *row2));
    return 1;
}

static int lua_GLKMatrix3MakeWithColumns(lua_State *L)
{
    GLKVector3 *column0     = lua_touserdata(L, 1);
    GLKVector3 *column1     = lua_touserdata(L, 2);
    GLKVector3 *column2     = lua_touserdata(L, 3);

    lua_pushGLKMatrix3(L, GLKMatrix3MakeWithColumns(*column0, *column1, *column2));
    return 1;
}

static int lua_GLKMatrix3MakeWithQuaternion(lua_State *L)
{
    GLKQuaternion *quaternion = lua_touserdata(L, 1);
    lua_pushGLKMatrix3(L, GLKMatrix3MakeWithQuaternion(*quaternion));
    return 1;
}

static int lua_GLKMatrix3MakeScale(lua_State *L)
{
    lua_pushGLKMatrix3(L, GLKMatrix3MakeScale(lua_tonumber(L, 1),
                                              lua_tonumber(L, 2),
                                              lua_tonumber(L, 3)));
    return 1;
}

static int lua_GLKMatrix3MakeRotation(lua_State *L)
{
    lua_pushGLKMatrix3(L, GLKMatrix3MakeRotation(lua_tonumber(L, 1),
                                                 lua_tonumber(L, 2),
                                                 lua_tonumber(L, 3),
                                                 lua_tonumber(L, 4)));
    return 1;
}

static int lua_GLKMatrix3MakeXRotation(lua_State *L)
{
    lua_pushGLKMatrix3(L, GLKMatrix3MakeXRotation(lua_tonumber(L, 1)));
    return 1;
}

static int lua_GLKMatrix3MakeYRotation(lua_State *L)
{
    lua_pushGLKMatrix3(L, GLKMatrix3MakeYRotation(lua_tonumber(L, 1)));
    return 1;
}

static int lua_GLKMatrix3MakeZRotation(lua_State *L)
{
    lua_pushGLKMatrix3(L, GLKMatrix3MakeZRotation(lua_tonumber(L, 1)));
    return 1;
}

static int lua_GLKMatrix3GetMatrix2(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    lua_pushGLKMatrix2(L, GLKMatrix3GetMatrix2(*matrix));
    return 1;
}

static int lua_GLKMatrix3GetRow(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    lua_pushGLKVector3(L, GLKMatrix3GetRow(*matrix, lua_tointeger(L, 2)));
    return 1;
}

static int lua_GLKMatrix3GetColumn(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    lua_pushGLKVector3(L, GLKMatrix3GetColumn(*matrix, lua_tointeger(L, 2)));
    return 1;
}

static int lua_GLKMatrix3SetRow(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    GLKVector3 *vector = lua_touserdata(L, 3);
    GLKMatrix3SetRow(*matrix, lua_tointeger(L, 2), *vector);
    return 0;
}

static int lua_GLKMatrix3SetColumn(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    GLKVector3 *vector = lua_touserdata(L, 3);
    GLKMatrix3SetColumn(*matrix, lua_tointeger(L, 2), *vector);
    return 0;
}

static int lua_GLKMatrix3Transpose(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    lua_pushGLKMatrix3(L, GLKMatrix3Transpose(*matrix));
    return 1;
}

static int lua_GLKMatrix3Invert(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    bool isInvetable;
    lua_pushGLKMatrix3(L, GLKMatrix3Invert(*matrix, &isInvetable));
    lua_pushboolean(L, isInvetable);
    return 2;
}

static int lua_GLKMatrix3InvertAndTranspose(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    bool isInvetable;
    lua_pushGLKMatrix3(L, GLKMatrix3InvertAndTranspose(*matrix, &isInvetable));
    lua_pushboolean(L, isInvetable);
    return 2;
}

static int lua_GLKMatrix3Multiply(lua_State *L)
{
    GLKMatrix3 *leftmatrix = lua_touserdata(L, 1); 
    GLKMatrix3 *rightmatrix = lua_touserdata(L, 2); 
    
    lua_pushGLKMatrix3(L, GLKMatrix3Multiply(*leftmatrix, *rightmatrix));
    return 1;
}

static int lua_GLKMatrix3Add(lua_State *L)
{
    GLKMatrix3 *leftmatrix = lua_touserdata(L, 1); 
    GLKMatrix3 *rightmatrix = lua_touserdata(L, 2); 
    lua_pushGLKMatrix3(L, GLKMatrix3Add(*leftmatrix, *rightmatrix));
    return 1;
}

static int lua_GLKMatrix3Subtract(lua_State *L)
{
    GLKMatrix3 *leftmatrix = lua_touserdata(L, 1); 
    GLKMatrix3 *rightmatrix = lua_touserdata(L, 2); 

    lua_pushGLKMatrix3(L, GLKMatrix3Subtract(*leftmatrix, *rightmatrix));
    return 1;
}

static int lua_GLKMatrix3Scale(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 

    lua_pushGLKMatrix3(L, GLKMatrix3Scale(*matrix, 
                                          lua_tonumber(L, 2),
                                          lua_tonumber(L, 3),
                                          lua_tonumber(L, 4)));
    return 1;
}

static int lua_GLKMatrix3ScaleWithVector3(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    GLKVector3 *vector = lua_touserdata(L, 2);
    lua_pushGLKMatrix3(L, GLKMatrix3ScaleWithVector3(*matrix, *vector));
    return 1;
}

static int lua_GLKMatrix3ScaleWithVector4(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    GLKVector4 *vector = lua_touserdata(L, 2);
    lua_pushGLKMatrix3(L, GLKMatrix3ScaleWithVector4(*matrix, *vector));
    return 1;
}

static int lua_GLKMatrix3Rotate(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    lua_pushGLKMatrix3(L, GLKMatrix3Rotate(*matrix,
                                          lua_tonumber(L, 2),
                                          lua_tonumber(L, 3),
                                          lua_tonumber(L, 4),
                                            lua_tonumber(L, 5)));
    return 1;
}

static int lua_GLKMatrix3RotateWithVector3(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    GLKVector3 *vector = lua_touserdata(L, 3);

    lua_pushGLKMatrix3(L, GLKMatrix3RotateWithVector3(*matrix, lua_tonumber(L, 2),
                                                      *vector));
    return 1;
}

static int lua_GLKMatrix3RotateWithVector4(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    GLKVector4 *vector = lua_touserdata(L, 3);
    lua_pushGLKMatrix3(L, GLKMatrix3RotateWithVector4(*matrix, lua_tonumber(L, 2), *vector));
    return 1;
}

static int lua_GLKMatrix3RotateX(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    lua_pushGLKMatrix3(L, GLKMatrix3RotateX(*matrix, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKMatrix3RotateY(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    lua_pushGLKMatrix3(L, GLKMatrix3RotateY(*matrix, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKMatrix3RotateZ(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    lua_pushGLKMatrix3(L, GLKMatrix3RotateZ(*matrix, lua_tonumber(L, 2)));
    return 1;
}

static int lua_GLKMatrix3MultiplyVector3(lua_State *L)
{
    GLKMatrix3 *matrix = lua_touserdata(L, 1); 
    GLKVector3 *vector = lua_touserdata(L, 2);
    lua_pushGLKVector3(L, GLKMatrix3MultiplyVector3(*matrix, *vector));
    return 1;
}

static int lua_GLKMatrix3MultiplyVector3Array(lua_State *L)
{
    //TODO
//    lua_pushlightuserdata(L, GLKMatrix3MultiplyVector3Array(lua_touserdata(L, 1)));
//    return 1;
    return 0;
}

static const luaL_Reg __LuaGLKMatrix3APIs[] = {
    {"GLKMatrix3Make", lua_GLKMatrix3Make},
    {"GLKMatrix3MakeAndTranspose", lua_GLKMatrix3MakeAndTranspose},
#if 0
    {"GLKMatrix3MakeWithArray", lua_GLKMatrix3MakeWithArray},
    {"GLKMatrix3MakeWithArrayAndTranspose", lua_GLKMatrix3MakeWithArrayAndTranspose},
#endif
    {"GLKMatrix3MakeWithRows", lua_GLKMatrix3MakeWithRows},
    {"GLKMatrix3MakeWithColumns", lua_GLKMatrix3MakeWithColumns},
    {"GLKMatrix3MakeWithQuaternion", lua_GLKMatrix3MakeWithQuaternion},
    {"GLKMatrix3MakeScale", lua_GLKMatrix3MakeScale},
    {"GLKMatrix3MakeRotation", lua_GLKMatrix3MakeRotation},
    {"GLKMatrix3MakeXRotation", lua_GLKMatrix3MakeXRotation},
    {"GLKMatrix3MakeYRotation", lua_GLKMatrix3MakeYRotation},
    {"GLKMatrix3MakeZRotation", lua_GLKMatrix3MakeZRotation},
    {"GLKMatrix3GetMatrix2", lua_GLKMatrix3GetMatrix2},
    {"GLKMatrix3GetRow", lua_GLKMatrix3GetRow},
    {"GLKMatrix3GetColumn", lua_GLKMatrix3GetColumn},
    {"GLKMatrix3SetRow", lua_GLKMatrix3SetRow},
    {"GLKMatrix3SetColumn", lua_GLKMatrix3SetColumn},
    {"GLKMatrix3Transpose", lua_GLKMatrix3Transpose},
    {"GLKMatrix3Invert", lua_GLKMatrix3Invert},
    {"GLKMatrix3InvertAndTranspose", lua_GLKMatrix3InvertAndTranspose},
    {"GLKMatrix3Multiply", lua_GLKMatrix3Multiply},
    {"GLKMatrix3Add", lua_GLKMatrix3Add},
    {"GLKMatrix3Subtract", lua_GLKMatrix3Subtract},
    {"GLKMatrix3Scale", lua_GLKMatrix3Scale},
    {"GLKMatrix3ScaleWithVector3", lua_GLKMatrix3ScaleWithVector3},
    {"GLKMatrix3ScaleWithVector4", lua_GLKMatrix3ScaleWithVector4},
    {"GLKMatrix3Rotate", lua_GLKMatrix3Rotate},
    {"GLKMatrix3RotateWithVector3", lua_GLKMatrix3RotateWithVector3},
    {"GLKMatrix3RotateWithVector4", lua_GLKMatrix3RotateWithVector4},
    {"GLKMatrix3RotateX", lua_GLKMatrix3RotateX},
    {"GLKMatrix3RotateY", lua_GLKMatrix3RotateY},
    {"GLKMatrix3RotateZ", lua_GLKMatrix3RotateZ},
    {"GLKMatrix3MultiplyVector3", lua_GLKMatrix3MultiplyVector3},
    {"GLKMatrix3MultiplyVector3Array", lua_GLKMatrix3MultiplyVector3Array},
    {NULL, NULL},
};

int LuaOpenGLKMatrix3(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGLKMatrix3APIs);
    return 0;
}
