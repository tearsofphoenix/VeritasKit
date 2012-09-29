//
//  LuaObjCAuxiliary.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

struct lua_State;

extern id luaObjC_checkNSObject(struct lua_State *L, int index);

extern const char* luaObjC_checkString(struct lua_State *L, int index);

extern int luaObjC_pushNSObject(struct lua_State *L, id nsObject);

extern NSInteger luaObjC_checkInteger(struct lua_State *L, int index);

#define luaObjC_pushSelector(L, selector) lua_pushstring((L), (const char*)(selector))

__END_DECLS