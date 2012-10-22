//
//  LuaNSRange.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#include "LuaObjCBase.h"

__BEGIN_DECLS

#define LUA_NSRange_METANAME	"NSRange"

VK_EXPORT int LuaObjCPushNSRange(struct lua_State *L, NSRange range);
    
LUAMOD_API int LuaObjCOpenNSRange(struct lua_State *L);

__END_DECLS
