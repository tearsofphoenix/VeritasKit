//
//  LuaCGAffineTransform.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#include "LuaObjCBase.h"

__BEGIN_DECLS

#define LUA_CGAffineTransform_METANAME	"CGAffineTransform"
    
    VK_EXPORT int LuaObjCPushCGAffineTransform(struct lua_State *L, CGAffineTransform t);
    
    LUAMOD_API int LuaObjCOpenCGAffineTransform(struct lua_State *L);

__END_DECLS