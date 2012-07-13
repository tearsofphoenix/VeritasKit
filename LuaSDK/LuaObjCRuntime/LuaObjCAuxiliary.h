//
//  LuaObjCAuxiliary.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

struct luaL_Reg;
struct lua_State;

extern id luaObjC_checkNSObject(struct lua_State *L, int index);

extern const char* luaObjC_checkString(struct lua_State *L, int index);

extern int luaObjC_pushNSObject(struct lua_State *L, id nsObject);

extern int luaObjC_checkInteger(struct lua_State *L, int index);
