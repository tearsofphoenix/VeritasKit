//
//  LuaCATransform3D.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#ifndef __VMK_LUACATRANSFORM3D__
#define __VMK_LUACATRANSFORM3D__ 1

#include "VMKBase.h"

#include <QuartzCore/CATransform3D.h>

VMK_EXTERN_C_BEGIN

#define LUA_CATransform3D_METANAME	"CATransform3D"

    VMK_EXPORT int VMKPushCATransform3D(VMKLuaStateRef state, CATransform3D t);

    LUAMOD_API int VMKOpenCATransform3D(VMKLuaStateRef state);

VMK_EXTERN_C_END

#endif
