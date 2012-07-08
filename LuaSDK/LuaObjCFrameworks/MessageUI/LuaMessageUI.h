//
//  LuaMessageUI.h
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
#define LUA_MessageUI_METANAME	"MessageUI"
LUAMOD_API int (LuaOpenMessageUI)(lua_State *L);
#include <MessageUI/MessageUI.h>
#ifdef __cplusplus
}
#endif
