//
//  LuaNKAssetDownload.h
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
#define LUA_NKAssetDownload_METANAME	"NKAssetDownload"
LUAMOD_API int (LuaOpenNKAssetDownload)(lua_State *L);
#include <NewsstandKit/NKAssetDownload.h>
#ifdef __cplusplus
}
#endif
