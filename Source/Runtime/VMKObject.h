//
//  VMKObject.h
//  LuaIOS
//
//  Created by LeixSnake on 8/2/12.
//
//
#ifndef __VMK_VMKOBJECT__
#define __VMK_VMKOBJECT__ 1

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

typedef struct __VMKObject *VMKObjectRef;

VMK_EXPORT VMKObjectRef VMKObjectCreate(struct lua_State *L, id rawObject, bool isClass);

VMK_EXPORT void VMKObjectStoreInPool(struct lua_State *L, id obj);

VMK_EXPORT id VMKObjectGetObject(VMKObjectRef ref);

VMK_EXPORT int VMKOpenNSObjectExtensionSupport(struct lua_State *L);

VMK_EXTERN__C_END

#endif
