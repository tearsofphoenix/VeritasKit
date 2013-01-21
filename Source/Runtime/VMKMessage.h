//
//  VMKAccelerator.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//the first argument is `id', the second is `SEL',
//so the arguments of the method starts from 3,
//
#ifndef __VMK_VMKMESSAGE__
#define __VMK_VMKMESSAGE__ 1

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

#define VMKArgumentStart (3)

typedef int (* VMKAcceleratorIMP)(id obj, SEL sel, struct lua_State *L);

VMK_EXPORT void VMKRegisterAccelerator(Class theClass, SEL selector, VMKAcceleratorIMP imp);

VMK_EXPORT VMKAcceleratorIMP VMKGetRegisterIMPOfSelector(Class theClass, SEL selector);


/*
 *   internal api of message send, you should never use them directly. they are only
 *   used to construct the veritas virtual machine.
 */

VMK_EXPORT int VMKMessageSend(struct lua_State *L);

VMK_EXPORT int VMKMessageSendSuper(struct lua_State *L);

VMK_EXTERN__C_END

#endif
