//
//  LuaCATransform3D.h
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
#include <QuartzCore/CATransform3D.h>

#define LUA_CATransform3D_METANAME	"CATransform3D"
    extern int lua_pushCATransform3D(lua_State *L, CATransform3D t);
    LUAMOD_API int (LuaOpenCATransform3D)(lua_State *L);
#ifdef __cplusplus
}
#endif
