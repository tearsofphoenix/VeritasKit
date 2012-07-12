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

extern int luaObjC_getEncodeOfType(struct lua_State *L);

extern int luaObjC_checkInteger(struct lua_State *L, int index);

extern void luaObjC_loadGlobalClasses(struct lua_State *L, const char* classList[]);

extern const char* luaObjc_gotoStartOfSourceAtLine(const char *source, int lineNumber);

extern void LuaObjectBridge_CreateUserData(struct lua_State* lua_state, id the_object, bool should_retain, bool is_instance);

extern void luaObjCInternal_createmeta(struct lua_State *L, const char *name, const struct luaL_Reg *methods);