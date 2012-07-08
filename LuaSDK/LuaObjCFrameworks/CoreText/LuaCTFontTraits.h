//
//  LuaCTFontTraits.h
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
#define LUA_CTFontTraits_METANAME	"CTFontTraits"
LUAMOD_API int (LuaOpenCTFontTraits)(lua_State *L);
#include <CoreText/CTFontTraits.h>
#ifdef __cplusplus
}
#endif
