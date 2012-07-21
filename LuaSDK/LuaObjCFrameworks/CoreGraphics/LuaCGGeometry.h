//
//  LuaCGGeometry.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif

#include "luaconf.h"

#if TARGET_OS_IPHONE || TARGET_OS_EMBEDDED
#include <CoreGraphics/CGGeometry.h>
#endif
    
#define LUA_CGPoint_METANAME	"CGPoint"

#define LUA_CGSize_METANAME	"CGSize"

#define LUA_CGRect_METANAME	"CGRect"

    struct lua_State;
    
    extern int lua_pushCGPoint(struct lua_State *L, CGPoint p);
    
    extern int lua_pushCGSize(struct lua_State *L, CGSize s);
    
    extern int lua_pushCGRect(struct lua_State *L, CGRect r);
    
    LUAMOD_API int (LuaOpenCGGeometry)(struct lua_State *L);
    
    
#ifdef __cplusplus
}
#endif
