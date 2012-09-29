//
//  LuaObjCAccelerator.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//the first argument is `id', the second is `SEL',
//so the arguments of the method starts from 3,
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

#define LuaObjCArgumentStart (3)

typedef int (* LuaObjCAcceleratorIMP)(id obj, SEL sel, struct lua_State *L);

extern void LuaObjCAcceleratorInitialize(void);

extern void LuaObjCAcceleratorRegister(Class theClass, SEL selector, LuaObjCAcceleratorIMP imp);

extern LuaObjCAcceleratorIMP LuaObjCAcceleratorGetIMPBySelector(Class theClass, SEL selector);

//accelerator for methods that have no argument
//
extern int LuaObjCAcceleratorForNoArgument(struct lua_State *L, const char* returnType, IMP impRef, id obj, SEL selector);

__END_DECLS