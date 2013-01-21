//
//  LuaCGGeometry.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#if TARGET_OS_IPHONE || TARGET_OS_EMBEDDED
    #include <CoreGraphics/CGGeometry.h>
#else
    #include <Foundation/NSGeometry.h>
#endif

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

#define LUA_CGPoint_METANAME	"CGPoint"

#define LUA_CGSize_METANAME	"CGSize"

#define LUA_CGRect_METANAME	"CGRect"
    
    VMK_EXPORT int VMKPushCGPoint(struct lua_State *L, CGPoint p);
    
    VMK_EXPORT int VMKPushCGSize(struct lua_State *L, CGSize s);
    
    VMK_EXPORT int VMKPushCGRect(struct lua_State *L, CGRect r);
    
    LUAMOD_API int VMKOpenCGGeometry(struct lua_State *L);
    
VMK_EXTERN__C_END
