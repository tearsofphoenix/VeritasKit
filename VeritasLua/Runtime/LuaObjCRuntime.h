//
//  LuaObjCRuntime.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

enum
{
    LuaObjCInvalidClouserID = -1,
};

typedef int LuaClosureType;

VK_EXPORT LuaClosureType LuaInternalGetClosureIDOfBlock(id block);

#define LUA_NSLIBNAME       "NS"    

LUAMOD_API int LuaObjCOpenFoundationSupport(struct lua_State *L);

__END_DECLS
