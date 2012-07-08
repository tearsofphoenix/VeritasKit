//
//  Luagssapi_krb5.h
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
#define LUA_gssapi_krb5_METANAME	"gssapi_krb5"
LUAMOD_API int (LuaOpengssapi_krb5)(lua_State *L);
#include <GSS/gssapi_krb5.h>
#ifdef __cplusplus
}
#endif
