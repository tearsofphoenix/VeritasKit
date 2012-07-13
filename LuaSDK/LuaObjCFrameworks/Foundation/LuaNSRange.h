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

#define LUA_NSRange_METANAME	"NSRange"
    
    struct lua_State;
    
    extern int lua_pushNSRange(struct lua_State *L, NSRange range);
    
LUAMOD_API int (LuaOpenNSRange)(struct lua_State *L);

#ifdef __cplusplus
}
#endif
