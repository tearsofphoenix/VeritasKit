//
//  LuaObjCFrameworkFunctions.h
//  LuaIOS
//
//  Created by tearsofphoenix on 7/13/12.
//
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

struct lua_State;

extern int luaObjCInternal_StructGarbageCollection(struct lua_State *L);

__END_DECLS
