//
//  LuaSKProductsRequest.h
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
#define LUA_SKProductsRequest_METANAME	"SKProductsRequest"
LUAMOD_API int (LuaOpenSKProductsRequest)(lua_State *L);
#include <StoreKit/SKProductsRequest.h>
#ifdef __cplusplus
}
#endif
