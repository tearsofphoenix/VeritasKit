//
//  luasdk_utilities.h
//  LuaCL
//
//  Created by E-Reach Administrator on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef LuaCL_luasdk_utilities_h
#define LuaCL_luasdk_utilities_h

#include "lauxlib.h"

typedef struct lua_State *LuaStateRef;

typedef struct LuaSDKConst  
{
    const char *str;
    unsigned int value;
} LuaSDKConst;

void luasdk_init_constants(LuaStateRef L, const LuaSDKConst *consts);

void luasdk_init_metatable_with_name_and_methods(LuaStateRef L, 
                                                               const char* name,
                                                               const luaL_Reg methods[]);
typedef struct LuaSDKCallbackInfo
{
    LuaStateRef luaState;
    void *originUserData;
    lua_CFunction originCallbackFunction;
    
}LuaSDKCallbackInfo;

typedef LuaSDKCallbackInfo *LuaCLCallbackInfoRef;


struct LuaCLVector 
{
    lua_Integer count;
    lua_Integer vectorSize;
    void *values;
    lua_Integer dataType;
};

typedef struct LuaCLVector LuaCLVector;
typedef struct LuaCLVector  *LuaCLVectorRef;

#define LuaCL_Vector_MetatableName "LuaCL.Vector"


void* luasdk_checkpointer(LuaStateRef L, int index);


#if LUA_VERSION_NUM > 501
#define luasdk_getn(L,i)          ((int)lua_rawlen(L, i))
#else
#define luasdk_getn(L,i)          ((int)lua_objlen(L, i))
#endif

lua_Number  luasdk_tonumber(lua_State *L, int idx);
lua_Integer luasdk_tointeger(lua_State *L, int idx);
lua_Integer luasdk_tolong(lua_State *L, int idx);




int luasdk_checkboolean (lua_State *L, int narg);

const char* luasdk_checkstring(lua_State *L, int narg);

/* returns an parray with given type and size */
#define LUASDK_NEW_ARRAY(_type, _size) ( (_type *)calloc(_size, sizeof(_type)) )

/* frees the space for the given parray, must be called together with LUASDK_NEW_ARRAY */
#define LUASDK_DELETE_ARRAY(_parray) do{ if(_parray) {free(_parray);} }while(0)

/* Returns an array in a lua table. */
void luasdk_push_arrayuc(lua_State *L, unsigned char* parray, int size);
void luasdk_push_arrayb(lua_State *L, unsigned char* parray, int size);  /* boolean */
void luasdk_push_arrayui(lua_State *L, unsigned int* parray, int size);
void luasdk_push_arrayi(lua_State *L, int* parray, int size);
void luasdk_push_arrayf(lua_State *L, float* parray, int size);
void luasdk_push_arrayd(lua_State *L, double* parray, int size);
void luasdk_push_pointer_array(lua_State *L, void **parray, 
                                    int size, int elementSize);

void luasdk_push_array2f(lua_State *L, float* parray, int height, int width);

/* Gets an parray from a lua table, store it in 'parray' and returns the no. of elems of the parray
 index refers to where the table is in stack. */
int luasdk_get_arrayuc(lua_State *L, int index, unsigned char **parray);
int luasdk_get_arrayb(lua_State *L, int index, unsigned char **parray);  /* boolean */
int luasdk_get_arrayi(lua_State *L, int index, int **parray);
int luasdk_get_arrayui(lua_State *L, int index, unsigned int **parray);
int luasdk_get_arrayd(lua_State *L, int index, double **parray);
int luasdk_get_arrayl(lua_State *L, int index, long **parray);
int luasdk_get_arrayf(lua_State *L, int index, float **parray);

int luasdk_get_pointer_array(lua_State *L, int index, void ***parray);

int luasdk_get_string_array(lua_State *L, int index, const char ***parray, size_t **size);


int luasdk_get_array2uc(lua_State *L, int index, unsigned char **parray, int *size);
int luasdk_get_array2d(lua_State *L, int index, double **parray, int *size);
int luasdk_get_array2f(lua_State *L, int index, float **parray, int *size);

#endif
