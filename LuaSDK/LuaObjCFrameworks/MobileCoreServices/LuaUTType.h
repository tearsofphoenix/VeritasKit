//
//  LuaUTType.h
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
#define LUA_UTType_METANAME	"UTType"
LUAMOD_API int (LuaOpenUTType)(lua_State *L);
#include <MobileCoreServices/UTType.h>
#ifdef __cplusplus
}
#endif
