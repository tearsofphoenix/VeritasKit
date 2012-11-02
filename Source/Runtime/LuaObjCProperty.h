//
//  LuaObjCInternal.h
//  LuaIOS
//
//  Created by tearsofphoenix on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef LuaIOS_LuaObjCInternal_h
#define LuaIOS_LuaObjCInternal_h

#include "LuaObjCBase.h"

__BEGIN_DECLS

VK_EXPORT void LuaInternalDumpObjCClass(Class theClass);

VK_EXPORT int LuaInternalDumpLuaStack(struct lua_State *L);

/*
 *   internal api of @property syntax support, they are used to contribute the virtal machine only.
 *   lua function <---> Objective-C property bridge
 */

VK_EXPORT int LuaIMPAddPropertyToClass(struct lua_State *L);

__END_DECLS


#endif
