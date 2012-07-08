//
//  LuaMFMessageComposeViewController.h
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
#define LUA_MFMessageComposeViewController_METANAME	"MFMessageComposeViewController"
LUAMOD_API int (LuaOpenMFMessageComposeViewController)(lua_State *L);
#include <MessageUI/MFMessageComposeViewController.h>
#ifdef __cplusplus
}
#endif
