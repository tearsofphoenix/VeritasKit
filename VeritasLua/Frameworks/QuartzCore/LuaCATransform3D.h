//
//  LuaCATransform3D.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#include "luaconf.h"

#include <QuartzCore/CATransform3D.h>

#include "LuaObjCBase.h"

__BEGIN_DECLS

#define LUA_CATransform3D_METANAME	"CATransform3D"

    extern int lua_pushCATransform3D(struct lua_State *L, CATransform3D t);

    LUAMOD_API int LuaOpenCATransform3D(struct lua_State *L);

__END_DECLS
