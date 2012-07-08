//
//  LuaGKFriendRequestComposeViewController.h
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
#define LUA_GKFriendRequestComposeViewController_METANAME	"GKFriendRequestComposeViewController"
LUAMOD_API int (LuaOpenGKFriendRequestComposeViewController)(lua_State *L);
#include <GameKit/GKFriendRequestComposeViewController.h>
#ifdef __cplusplus
}
#endif
