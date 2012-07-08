//
//  LuaCFAttributedString.h
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
#define LUA_CFAttributedString_METANAME	"CFAttributedString"
LUAMOD_API int (LuaOpenCFAttributedString)(lua_State *L);
#include <CoreFoundation/CFAttributedString.h>
#ifdef __cplusplus
}
#endif
