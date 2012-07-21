//
//  LuaObjCAuxiliary.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "lua.h"

extern id luaObjC_checkNSObject(struct lua_State *L, int index);

extern const char* luaObjC_checkString(struct lua_State *L, int index);

extern int luaObjC_pushNSObject(struct lua_State *L, id nsObject);

extern lua_Integer luaObjC_checkInteger(struct lua_State *L, int index);
