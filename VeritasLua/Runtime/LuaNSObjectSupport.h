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

VK_EXPORT LuaObjectRef LuaObjectCreate(struct lua_State *L,
                                       id rawObject,
                                       bool shouldStore);

VK_EXPORT id LuaObjectGetObject(LuaObjectRef ref);


VK_EXPORT int luaObjC_openNSObjectExtensionSupport(struct lua_State *L);

__END_DECLS