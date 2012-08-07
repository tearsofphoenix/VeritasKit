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
#define LuaObjCArgumentStart (3)

struct lua_State;

typedef int (* LuaObjCAcceleratorIMP)(id obj, SEL sel, struct lua_State *L);

extern void LuaObjCAcceleratorInitialize(void);

extern void LuaObjCAcceleratorRegister(SEL selector, LuaObjCAcceleratorIMP imp);

extern LuaObjCAcceleratorIMP LuaObjCAcceleratorGetIMPBySelector(SEL selector);

//accelerator for methods that have no argument
//
extern int LuaObjCAcceleratorForNoArgument(struct lua_State *L, const char* returnType, IMP impRef, id obj, SEL selector);

//accelerator for methods that have only one argument
//
extern int LuaObjCAcceleratorForOneArgument(struct lua_State *L, const char* argType, const char* returnType, IMP impRef, id obj, SEL selector);

