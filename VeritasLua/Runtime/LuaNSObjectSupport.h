//
//  LuaNSObjectSupport.h
//  LuaIOS
//
//  Created by LeixSnake on 8/2/12.
//
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

#pragma mark - Object observer

typedef struct __LuaObject *LuaObjectRef;

VK_EXPORT LuaObjectRef LuaObjectCreate(struct lua_State *L, id rawObject, bool isClass);

VK_EXPORT void LuaObjectStoreInPool(struct lua_State *L, id obj);

VK_EXPORT id LuaObjectGetObject(LuaObjectRef ref);

VK_EXPORT int LuaObjCOpenNSObjectExtensionSupport(struct lua_State *L);

__END_DECLS