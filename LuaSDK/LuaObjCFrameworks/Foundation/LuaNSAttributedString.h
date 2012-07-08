//
//  LuaNSAttributedString.h
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
#define LUA_NSAttributedString_METANAME	"NSAttributedString"
LUAMOD_API int (LuaOpenNSAttributedString)(lua_State *L);
#include <Foundation/NSAttributedString.h>
#ifdef __cplusplus
}
#endif
