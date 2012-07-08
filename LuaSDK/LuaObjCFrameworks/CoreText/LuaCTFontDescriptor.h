//
//  LuaCTFontDescriptor.h
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
#define LUA_CTFontDescriptor_METANAME	"CTFontDescriptor"
LUAMOD_API int (LuaOpenCTFontDescriptor)(lua_State *L);
#include <CoreText/CTFontDescriptor.h>
#ifdef __cplusplus
}
#endif
