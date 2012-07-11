//
//  LuaCGPDFOperatorTable.h
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
#define LUA_CGPDFOperatorTable_METANAME	"CGPDFOperatorTable"
LUAMOD_API int (LuaOpenCGPDFOperatorTable)(lua_State *L);
#include <CoreGraphics/CGPDFOperatorTable.h>
#ifdef __cplusplus
}
#endif
