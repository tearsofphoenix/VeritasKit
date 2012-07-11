//
//  luasdk_utilities.h
//  LuaCL
//
//  Created by E-Reach Administrator on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef LuaCL_luasdk_utilities_h
#define LuaCL_luasdk_utilities_h

#include "lua.h"

typedef struct lua_State *LuaStateRef;

typedef struct LuaSDKConst  
{
    const char *str;
    unsigned int value;
} LuaSDKConst;

#if LUA_VERSION_NUM > 501
#define luasdk_getn(L,i)          ((int)lua_rawlen(L, i))
#else
#define luasdk_getn(L,i)          ((int)lua_objlen(L, i))
#endif

#define luasdk_get_arrayf(L, a, b) 

#endif
