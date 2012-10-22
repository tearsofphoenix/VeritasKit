//
//  LuaCATransform3D.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#include <QuartzCore/CATransform3D.h>

#include "LuaObjCBase.h"

__BEGIN_DECLS

#define LUA_CATransform3D_METANAME	"CATransform3D"

    VK_EXPORT int LuaObjCPushCATransform3D(struct lua_State *L, CATransform3D t);

    LUAMOD_API int LuaObjCOpenCATransform3D(struct lua_State *L);

__END_DECLS
