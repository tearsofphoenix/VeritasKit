//
//  LuaALAsset.h
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
#define LUA_ALAsset_METANAME	"ALAsset"
LUAMOD_API int (LuaOpenALAsset)(lua_State *L);
#include <AssetsLibrary/ALAsset.h>
#ifdef __cplusplus
}
#endif
