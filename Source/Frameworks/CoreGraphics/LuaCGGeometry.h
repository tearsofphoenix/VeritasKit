//
//  LuaCGGeometry.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#ifndef __VMK_LUACGGEOMETRY__
#define __VMK_LUACGGEOMETRY__ 1

#include "VMKBase.h"

#if TARGET_OS_IPHONE || TARGET_OS_EMBEDDED
#include <CoreGraphics/CGGeometry.h>
#else
#include <Foundation/NSGeometry.h>
#endif

VMK_EXTERN_C_BEGIN

#define LUA_CGPoint_METANAME	"CGPoint"

#define LUA_CGSize_METANAME	"CGSize"

#define LUA_CGRect_METANAME	"CGRect"

VMK_EXPORT int VMKPushCGPoint(VMKLuaStateRef state, CGPoint p);

VMK_EXPORT int VMKPushCGSize(VMKLuaStateRef state, CGSize s);

VMK_EXPORT int VMKPushCGRect(VMKLuaStateRef state, CGRect r);

LUAMOD_API int VMKOpenCGGeometry(VMKLuaStateRef state);

VMK_EXTERN_C_END

#endif
