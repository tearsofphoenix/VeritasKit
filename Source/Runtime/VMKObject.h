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

#include <objc/objc.h>

typedef struct __VMKObject *VMKObjectRef;

VMK_EXPORT VMKObjectRef VMKObjectCreate(VMKLuaStateRef state, id rawObject, Boolean isClass);

VMK_EXPORT id VMKObjectGetObject(VMKObjectRef object);

VMK_EXPORT int VMKOpenNSObjectExtensionSupport(VMKLuaStateRef state);

VMK_EXTERN_C_END

#endif
