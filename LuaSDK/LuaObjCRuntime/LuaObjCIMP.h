//
//  LuaObjCIMP.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

struct lua_State;

extern int luaObjC_luaClass_addObjectMethod(struct lua_State *L);

extern int luaObjC_luaClass_addClassMethod(struct lua_State *L);

extern void luaObjC_addPropertyToClassOrigin(const char* className, const char* atomic, const char* ownership,
                                             const char* getterName, const char* setterName, const char* typeName,
                                             const char* propertyName);

extern int luaObjC_addPropertyToClass(struct lua_State *L);

extern void luaObjC_setThisPointerInCurrentContextOfClass(struct lua_State *L, id thisObj);
