//
//  LuaObjCIMP.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#include "LuaObjCBase.h"

__BEGIN_DECLS

struct lua_State;

extern int LuaIMPAddInstanceMethod(struct lua_State *L);

extern int LuaIMPAddClassMethod(struct lua_State *L);

__END_DECLS