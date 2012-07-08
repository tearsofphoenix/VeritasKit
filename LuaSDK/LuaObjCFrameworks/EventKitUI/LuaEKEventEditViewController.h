//
//  LuaEKEventEditViewController.h
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
#define LUA_EKEventEditViewController_METANAME	"EKEventEditViewController"
LUAMOD_API int (LuaOpenEKEventEditViewController)(lua_State *L);
#include <EventKitUI/EKEventEditViewController.h>
#ifdef __cplusplus
}
#endif
