//
//  LuaCGPDFDictionary.h
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
#define LUA_CGPDFDictionary_METANAME	"CGPDFDictionary"
LUAMOD_API int (LuaOpenCGPDFDictionary)(lua_State *L);
#include <CoreGraphics/CGPDFDictionary.h>
#ifdef __cplusplus
}
#endif
