//
//  luasdk_utilities.c
//  LuaCL
//
//  Created by E-Reach Administrator on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "luasdk_utilities.h"

#include "lstate.h"

void luasdk_init_constants(LuaStateRef L, const LuaSDKConst *consts)
{
    for (; consts->str; consts++) 
    {
        lua_pushstring(L, consts->str);
        lua_pushinteger(L, consts->value);
        lua_settable(L, -3);
    }
}

void luasdk_init_metatable_with_name_and_methods(LuaStateRef L, 
                                                               const char* name,
                                                               const luaL_Reg methods[])
{
    luaL_newmetatable(L, name); /* Metatable */
    
    lua_pushliteral(L, "__index");
    lua_pushvalue(L, -2);
    lua_rawset(L, -3);
    
    if (methods)
    {        
        luaL_setfuncs(L, methods, 0);        
    }
}


#pragma mark - Utilities
void* luasdk_checkpointer(lua_State *L, int index)
{
    int type = lua_type(L, index);
    switch (type)
    {
        case LUA_TNIL:
        {
            return NULL;
        }
        case LUA_TLIGHTUSERDATA:
        {
            return lua_touserdata(L, index);
        }
        case LUA_TUSERDATA:
        {
            return lua_touserdata(L, index);
        }
        default:
        {
            printf("Error: Invalid types for pointer!\n");
            return NULL;
        }
    }
}



#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "lua.h"
#include "lauxlib.h"

#if LUA_VERSION_NUM > 501
lua_Number luasdk_tonumber(lua_State *L, int idx)
{
    return lua_tonumberx(L, idx, NULL);
}
lua_Integer luasdk_tointeger(lua_State *L, int idx)
{
    return lua_tointegerx(L, idx, NULL);
}
lua_Integer luasdk_tolong(lua_State *L, int idx)
{
    return lua_tointegerx(L, idx, NULL);
}

#else
lua_Number luasdk_tonumber(lua_State *L, int idx)
{
    return lua_tonumber(L, idx);
}
lua_Integer luasdk_tointeger(lua_State *L, int idx)
{
    return lua_tointeger(L, idx);
}
#endif

int luasdk_checkboolean (lua_State *L, int narg) 
{
    int d = lua_toboolean(L, narg);
    if (d == 0)  /* avoid extra test when d is not 0 */
        luaL_checktype(L, narg, LUA_TBOOLEAN);
    return d;
}

static void* luacl_checkuserdata (lua_State *L, int narg) 
{
    luaL_checktype(L, narg, LUA_TLIGHTUSERDATA);
    return lua_touserdata(L, narg);
}

const char* luasdk_checkstring(lua_State *L, int narg)
{
    int type = lua_type(L, narg);
    switch (type)
    {
        case LUA_TSTRING:
        {
            return luaL_checkstring(L, narg);
        }
        case LUA_TNIL:
        {
            return NULL;
        }
        default:
        {
            printf("Error: invalid argument for string type!");
            return NULL;
        }
    }
}
/* returns a bi-dimensional parray with given type and size */
#define LUAGL_NEW_ARRAY2(type, size1, size2) ( (type *)malloc((size1) * (size2) * sizeof(type)) )

#define LUAGL_INIT_ARRAY(parray, _type, size, conversionFunc)   \
{                                                               \
int i;                                                        \
for(i = 0; i < (size); i++) {                                 \
lua_rawgeti(L, index, i+1);                                 \
(parray)[i] = (_type)(conversionFunc)(L, -1);               \
lua_remove(L, -1);                                          \
}                                                             \
}

#define LUAGL_INIT_ARRAY2(parray, _type, size1, size2, conversionFunc)  \
{                                                               \
int i, j;                                                     \
for(i = 0; i < size1; i++)  {                                 \
lua_rawgeti(L, index, i+1);                                 \
if(!lua_istable(L, -1)) return -1;                          \
for(j = 0; j < size2; j++) {                                \
lua_rawgeti(L, -1, j+1);                                  \
(parray)[i*(size2) + j] = (_type)(conversionFunc)(L, -1); \
lua_remove(L, -1);                                        \
}                                                           \
lua_remove(L, -1);                                          \
}                                                             \
}

/* Gets an parray from a lua table, store it in 'parray' and returns the no. of elems of the parray
 index refers to where the table is in stack. */
#define DEFINE_GET_ARRAY_FUNC(name, _type, conversionFunc) \
int name(lua_State *L, int index, _type **parray)        \
{                                                          \
int type = lua_type(L, index);                              \
switch (type)                                              \
{                                                           \
case LUA_TNIL:                                         \
{                                                       \
*parray = NULL;                                     \
return 0;                                           \
}                                                       \
case LUA_TTABLE:                                        \
{                                                       \
int n = luasdk_getn(L, index);                               \
*parray = LUASDK_NEW_ARRAY(_type, n);                     \
LUAGL_INIT_ARRAY(*parray, _type, n, conversionFunc);     \
return n;                                                \
}                                                       \
default:                                                \
{                                                       \
printf("Error:Invalid argument for array!");        \
return 0;                                           \
}                                                       \
}                                                           \
}

#define DEFINE_GET_ARRAY2_FUNC(name, _type, conversionFunc)    \
int name(lua_State *L, int index, _type **parray, int *size) \
{                                                              \
int n;                                                       \
luaL_checktype(L, index, LUA_TTABLE);                        \
n = luasdk_getn(L, index);                                     \
lua_rawgeti(L, index, 1);                                    \
if(!lua_istable(L, -1)) { lua_remove(L, -1); return -1; }    \
*size = luasdk_getn(L, -1);                                    \
*parray = LUAGL_NEW_ARRAY2(_type, n, *size);                 \
LUAGL_INIT_ARRAY2(*parray, _type, n, *size, conversionFunc);  \
lua_remove(L, -1);                                           \
return n;                                                    \
}

DEFINE_GET_ARRAY_FUNC(luasdk_get_arrayb, unsigned char, lua_toboolean)
DEFINE_GET_ARRAY_FUNC(luasdk_get_arrayd, double, luasdk_tonumber)
DEFINE_GET_ARRAY_FUNC(luasdk_get_arrayi, int, luasdk_tointeger)
DEFINE_GET_ARRAY_FUNC(luasdk_get_arrayui, unsigned int, luasdk_tointeger)
DEFINE_GET_ARRAY_FUNC(luasdk_get_arrayuc, unsigned char, luasdk_tointeger)
DEFINE_GET_ARRAY_FUNC( luasdk_get_arrayl, long, luasdk_tolong)

int luasdk_get_arrayf(lua_State *L, int index, float **parray)
{                                                        
    int type = lua_type(L, index);                       
    switch (type)                                        
    {                                                    
        case LUA_TNIL:                                   
        {                                                
            *parray = NULL;                              
            return 0;                                    
        }                                                
        case LUA_TTABLE:                                        
        {                                                       
            break;                                              
        }   
        case LUA_TUSERDATA:
        {
            LuaCLVectorRef vectorRef =  (LuaCLVectorRef)luaL_checkudata(L, index, LuaCL_Vector_MetatableName);
            if (vectorRef)
            {
                *parray = vectorRef->values;
                return (int)vectorRef->vectorSize;
            }else
            {
                *parray = NULL;
                return 0;
            }
        }
        default:                                                
        {                                                       
            printf("Error:Invalid argument for array!");        
            return 0;                                           
        }                                                       
    }                                                           
    int n = luasdk_getn(L, index);                               
    *parray = calloc(n, sizeof(float));                     
    for(int i = 0; i < n; i++)
    {                 
        lua_rawgeti(L, index, i+1);                   
        (*parray)[i] = (float)lua_tonumber(L, -1); 
        lua_remove(L, -1);                            
    }                                             
    return n;                                                
}

int luasdk_get_pointer_array(lua_State *L, int index, void ***parray)
{    
    int type = lua_type(L, index);
    
    switch (type)
    {
        case LUA_TNIL:
        {
            *parray = NULL;
            return 0;
        }
        case LUA_TTABLE:
        {
            int n = luasdk_getn(L, index);                                
            *parray = calloc(n, sizeof(void*));
            for (int i=0; i<n; ++i)
            {
                lua_rawgeti(L, index, i+1);                             
                (*parray)[i] = (void*)luacl_checkuserdata(L, -1);           
                lua_remove(L, -1);
            }
            
            return n; 
        }
        default:
        {
            printf("Error:Invalid argument for OpenCL object array!");
            return 0;
        }
    }
}

DEFINE_GET_ARRAY2_FUNC(luasdk_get_array2uc, unsigned char, luasdk_tointeger)
DEFINE_GET_ARRAY2_FUNC(luasdk_get_array2d, double, luasdk_tonumber)
DEFINE_GET_ARRAY2_FUNC(luasdk_get_array2f, float, luasdk_tonumber)

#undef DEFINE_GET_ARRAY_FUNC
#undef DEFINE_GET_ARRAY2_FUNC

#define DEFINE_PUSH_ARRAY_FUNC(name, _type, pushFunc) \
void name(lua_State *L, _type *parray, int size)    \
{                                                     \
int i;                                              \
lua_createtable(L, size, 0);                        \
for(i = 0; i < size; i++)                           \
{                                                   \
lua_pushinteger(L, i+1);                          \
pushFunc(L, (_type)parray[i]);                    \
lua_settable(L, -3);                              \
}                                                   \
}

DEFINE_PUSH_ARRAY_FUNC(luasdk_push_arrayb, unsigned char, lua_pushboolean)
DEFINE_PUSH_ARRAY_FUNC(luasdk_push_arrayi, int, lua_pushinteger)
DEFINE_PUSH_ARRAY_FUNC(luasdk_push_arrayui, unsigned int, lua_pushinteger)
DEFINE_PUSH_ARRAY_FUNC(luasdk_push_arrayf, float, lua_pushnumber)
DEFINE_PUSH_ARRAY_FUNC(luasdk_push_arrayd, double, lua_pushnumber)
DEFINE_PUSH_ARRAY_FUNC(luasdk_push_arrayuc, unsigned char, lua_pushinteger)

void luasdk_push_pointer_array(lua_State *L, void **parray, int size, int elementSize)
{
    lua_createtable(L, size, 0);
    
    for (int i = 0; i < size; ++i)
    {
        lua_pushinteger(L, i+1); 
        lua_pushlightuserdata(L, parray[i]);
        lua_settable(L, -3);
    }
}


#define DEFINE_PUSH_ARRAY2_FUNC(name, _type, pushFunc) \
void name(lua_State *L, _type *parray, int height, int width)    \
{                                                     \
int i, j;                                           \
lua_createtable(L, height, 0);                      \
for(i = 0; i < height; i++)                         \
{                                                   \
lua_pushinteger(L, i+1);                          \
lua_createtable(L, width, 0);                     \
for(j = 0; j < width; j++)                        \
{                                                 \
lua_pushinteger(L, j+1);                        \
pushFunc(L, (_type)parray[i*width+j]);          \
lua_settable(L, -3);                            \
}                                                 \
lua_settable(L, -3);                              \
}                                                   \
}

DEFINE_PUSH_ARRAY2_FUNC(luasdk_push_array2f, float, lua_pushnumber)

int luasdk_get_string_array(lua_State *L, int index, const char ***parray, size_t **size)
{                                                               
    int n;    
    if (lua_type(L, index) == LUA_TNIL)
    {
        *parray = NULL;
        if (size)
        {
            *size = NULL;
        }
        n = 0;
        return n;
    }
    
    luaL_checktype(L, index, LUA_TTABLE);                        
    n = luasdk_getn(L, index);                                    
    lua_rawgeti(L, index, 1);                                    
    
    if(!lua_istable(L, -1)) 
    { 
        lua_remove(L, -1); 
        return -1; 
    }    
    
    if (size)
    {        
        *size = calloc(n, sizeof(size_t));                      
    }
    
    *parray = calloc(n, sizeof(const char*));     
    const char* stringLooper = NULL;
    
    for (int i=0; i<n; ++i)
    {
        lua_rawgeti(L, index, i+1); 
        stringLooper = luaL_checkstring(L, -1);
        (*parray)[i] = stringLooper;
        if(size)
        {
            (*size)[i] = strlen(stringLooper);
        }
        lua_remove(L, -1);                                           
    }
    
    lua_remove(L, -1);                                           
    return n;                                                    
}

#undef DEFINE_PUSH_ARRAY_FUNC
#undef DEFINE_PUSH_ARRAY2_FUNC
