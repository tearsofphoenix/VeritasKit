//
//  LuaUTCoreTypes.h
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
#define LUA_UTCoreTypes_METANAME	"UTCoreTypes"
LUAMOD_API int (LuaOpenUTCoreTypes)(lua_State *L);
#include <MobileCoreServices/UTCoreTypes.h>
#ifdef __cplusplus
}
#endif
