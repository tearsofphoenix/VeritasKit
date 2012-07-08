//
//  LuaSKPaymentTransaction.h
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
#define LUA_SKPaymentTransaction_METANAME	"SKPaymentTransaction"
LUAMOD_API int (LuaOpenSKPaymentTransaction)(lua_State *L);
#include <StoreKit/SKPaymentTransaction.h>
#ifdef __cplusplus
}
#endif
