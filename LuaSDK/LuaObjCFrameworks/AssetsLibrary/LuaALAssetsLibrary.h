//
//  LuaALAssetsLibrary.h
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
#define LUA_ALAssetsLibrary_METANAME	"ALAssetsLibrary"
LUAMOD_API int (LuaOpenALAssetsLibrary)(lua_State *L);
#include <AssetsLibrary/ALAssetsLibrary.h>
#ifdef __cplusplus
}
#endif
