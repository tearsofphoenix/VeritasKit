//
//  LuaCTTelephonyNetworkInfo.h
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
#define LUA_CTTelephonyNetworkInfo_METANAME	"CTTelephonyNetworkInfo"
LUAMOD_API int (LuaOpenCTTelephonyNetworkInfo)(lua_State *L);
#include <CoreTelephony/CTTelephonyNetworkInfo.h>
#ifdef __cplusplus
}
#endif
