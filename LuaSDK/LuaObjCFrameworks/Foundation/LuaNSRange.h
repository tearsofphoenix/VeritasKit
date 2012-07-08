//
//  LuaNSRange.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lstate.h"
#define LUA_NSRange_METANAME	"NSRange"
    extern int lua_pushNSRange(lua_State *L, NSRange range);
    
LUAMOD_API int (LuaOpenNSRange)(lua_State *L);
#include <Foundation/NSRange.h>
#ifdef __cplusplus
}
#endif
