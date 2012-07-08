//
//  LuaCGPDFDocument.h
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
#define LUA_CGPDFDocument_METANAME	"CGPDFDocument"
LUAMOD_API int (LuaOpenCGPDFDocument)(lua_State *L);
#include <CoreGraphics/CGPDFDocument.h>
#ifdef __cplusplus
}
#endif
