//
//  LuaCATransform3D.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#include <QuartzCore/CATransform3D.h>

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

#define LUA_CATransform3D_METANAME	"CATransform3D"

    VMK_EXPORT int VMKPushCATransform3D(struct lua_State *L, CATransform3D t);

    LUAMOD_API int VMKOpenCATransform3D(struct lua_State *L);

VMK_EXTERN__C_END
