//
//  LuaCGPDFString.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lua.h"
#define LUA_CGPDFString_METANAME	"CGPDFString"
LUAMOD_API int (LuaOpenCGPDFString)(lua_State *L);
#include <CoreGraphics/CGPDFString.h>
#ifdef __cplusplus
}
#endif
