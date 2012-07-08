//
//  LuaQLPreviewController.h
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
#define LUA_QLPreviewController_METANAME	"QLPreviewController"
LUAMOD_API int (LuaOpenQLPreviewController)(lua_State *L);
#include <QuickLook/QLPreviewController.h>
#ifdef __cplusplus
}
#endif
