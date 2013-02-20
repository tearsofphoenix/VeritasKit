//
//  LuaCGAffineTransform.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#ifndef __VMK_LUACGAFFINETRANSFORM__
#define __VMK_LUACGAFFINETRANSFORM__ 1

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

#include <CoreGraphics/CGAffineTransform.h>

#define LUA_CGAffineTransform_METANAME	"CGAffineTransform"

VMK_EXPORT int VMKPushCGAffineTransform(VMKLuaStateRef state, CGAffineTransform t);

LUAMOD_API int VMKOpenCGAffineTransform(VMKLuaStateRef state);

VMK_EXTERN_C_END

#endif
