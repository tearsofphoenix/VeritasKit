//
//  LuaABAddressFormatting.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lua.h"
#define LUA_ABAddressFormatting_METANAME	"ABAddressFormatting"
LUAMOD_API int (LuaOpenABAddressFormatting)(lua_State *L);
#include <AddressBookUI/ABAddressFormatting.h>
#ifdef __cplusplus
}
#endif
