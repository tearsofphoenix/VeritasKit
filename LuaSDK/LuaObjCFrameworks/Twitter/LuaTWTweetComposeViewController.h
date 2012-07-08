//
//  LuaTWTweetComposeViewController.h
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
#define LUA_TWTweetComposeViewController_METANAME	"TWTweetComposeViewController"
LUAMOD_API int (LuaOpenTWTweetComposeViewController)(lua_State *L);
#include <Twitter/TWTweetComposeViewController.h>
#ifdef __cplusplus
}
#endif
