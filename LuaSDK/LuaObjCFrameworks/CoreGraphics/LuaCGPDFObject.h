//
//  LuaCGPDFObject.h
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
#define LUA_CGPDFObject_METANAME	"CGPDFObject"
LUAMOD_API int (LuaOpenCGPDFObject)(lua_State *L);
#include <CoreGraphics/CGPDFObject.h>
#ifdef __cplusplus
}
#endif
