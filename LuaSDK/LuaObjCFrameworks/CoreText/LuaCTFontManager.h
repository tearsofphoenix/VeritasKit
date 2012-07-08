//
//  LuaCTFontManager.h
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
#define LUA_CTFontManager_METANAME	"CTFontManager"
LUAMOD_API int (LuaOpenCTFontManager)(lua_State *L);
#include <CoreText/CTFontManager.h>
#ifdef __cplusplus
}
#endif
