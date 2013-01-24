//
//  VMKFrameworkFunctions.h
//  LuaIOS
//
//  Created by tearsofphoenix on 7/13/12.
//
//
#ifndef __VMK_VMKFRAMEWORKFUNCTIONS__
#define __VMK_VMKFRAMEWORKFUNCTIONS__ 1

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

VMK_EXPORT int LuaInternalStructGarbageCollection(struct lua_State *L);

VMK_EXTERN__C_END

#endif
