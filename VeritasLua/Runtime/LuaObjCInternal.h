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

VK_EXPORT void objc_dumpClass(Class theClass);

VK_EXPORT void stackDump(struct lua_State *L);

VK_EXPORT void lua_dumpTable(struct lua_State *L);

VK_EXPORT const char* LuaObjCInternal_jumpoverEncodingDecorator(const char* charLooper);

/*
 *   internal api of IMP imeplementation, you should never use them directly.
 */

VK_EXPORT int LuaIMPAddInstanceMethod(struct lua_State *L);

VK_EXPORT int LuaIMPAddClassMethod(struct lua_State *L);

/*
 *   internal api of message send, you should never use them directly. they are only
 *   used to construct the veritas virtual machine.
 */

VK_EXPORT int LuaObjCMessageSend(struct lua_State *L);

VK_EXPORT int LuaObjCMessageSendSuper(struct lua_State *L);

/*
 *   internal api of @property syntax support, they are used to contribute the virtal machine only.
 *   lua function <---> Objective-C property bridge
 */

VK_EXPORT int LuaIMPAddPropertyToClass(struct lua_State *L);

/*
 * only for the veritas virtual machine
 */

//accelerator for methods that have no argument
//
VK_EXPORT int LuaObjCAcceleratorForNoArgument(struct lua_State *L,
                                              const char* returnType,
                                              IMP impRef,
                                              id obj,
                                              SEL selector);

__END_DECLS


#endif
