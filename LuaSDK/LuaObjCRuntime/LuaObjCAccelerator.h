//
//  LuaObjCAccelerator.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCAuxiliary.h"

//the first argument is `id', the second is `SEL', 
//so the arguments of the method starts from 3,
#define LuaObjCArgumentStart (3)

typedef int (* LuaObjCAcceleratorIMP)(id obj, SEL sel, lua_State *L);

extern int luaObjC_callImplementation_specializeForNoArgument(lua_State *L, const char* returnType, 
                                                       IMP impRef, id obj, SEL selector);

extern int luaObjC_callImplementation_specializeForOneArgument(lua_State *L, const char* argType,
                                                        const char* returnType, 
                                                        IMP impRef, id obj, SEL selector);

extern void luaObjC_initializeAccelerators(void);

extern void luaObjC_registerAccelerator(SEL selector, LuaObjCAcceleratorIMP imp);

extern LuaObjCAcceleratorIMP luaObjC_getAcceleratorIMPBySelector(SEL selector);
