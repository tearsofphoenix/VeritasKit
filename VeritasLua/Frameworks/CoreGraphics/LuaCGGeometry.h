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

#include "LuaObjCBase.h"

__BEGIN_DECLS

#define LUA_CGPoint_METANAME	"CGPoint"

#define LUA_CGSize_METANAME	"CGSize"

#define LUA_CGRect_METANAME	"CGRect"
    
    VK_EXPORT int lua_pushCGPoint(struct lua_State *L, CGPoint p);
    
    VK_EXPORT int lua_pushCGSize(struct lua_State *L, CGSize s);
    
    VK_EXPORT int lua_pushCGRect(struct lua_State *L, CGRect r);
    
    LUAMOD_API int LuaOpenCGGeometry(struct lua_State *L);
    
__END_DECLS
