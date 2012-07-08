//
//  LuaSKProduct.h
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
#define LUA_SKProduct_METANAME	"SKProduct"
LUAMOD_API int (LuaOpenSKProduct)(lua_State *L);
#include <StoreKit/SKProduct.h>
#ifdef __cplusplus
}
#endif
