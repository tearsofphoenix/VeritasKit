//
//  LuaObjCAuxiliary.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "luasdk_utilities.h"

extern id luaObjC_checkNSObject(lua_State *L, int index);

extern const char* luaObjC_checkString(lua_State *L, int index);

extern int luaObjC_pushNSObject(lua_State *L, id nsObject);

extern int luaObjC_getEncodeOfType(lua_State *L);

extern void luaObjC_loadGlobalConstants(lua_State *L, const LuaSDKConst contants[]);

extern int luaObjC_checkInteger(lua_State *L, int index);

extern void luaObjC_loadGlobalClasses(lua_State *L, const char* classList[]);

extern const char* luaObjc_gotoStartOfSourceAtLine(const char *source, int lineNumber);

extern void LuaObjectBridge_CreateUserData(lua_State* lua_state, id the_object, bool should_retain, bool is_instance);
