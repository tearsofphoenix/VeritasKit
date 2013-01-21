//
//  VMKInternal.h
//  LuaIOS
//
//  Created by tearsofphoenix on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef __VMK_VMKPROPERTY__
#define __VMK_VMKPROPERTY__ 1

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

#include <objc/objc.h>

VMK_EXPORT void LuaInternalDumpObjCClass(Class theClass);

VMK_EXPORT int LuaInternalDumpLuaStack(struct lua_State *L);

/*
 *   internal api of @property syntax support, they are used to contribute the virtal machine only.
 *   lua function <---> Objective-C property bridge
 */

VMK_EXPORT int LuaIMPAddPropertyToClass(struct lua_State *L);

VMK_EXTERN__C_END


#endif
