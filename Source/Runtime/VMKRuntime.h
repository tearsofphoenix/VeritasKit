//
//  VMKRuntime.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef __VMK_VMKRUNTIME__
#define __VMK_VMKRUNTIME__ 1

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

#define LUA_NSLIBNAME       "NS"

enum
{
    VMKInvalidClouserID = -1,
};

typedef int LuaClosureType;

VMK_EXPORT LuaClosureType LuaInternalGetClosureIDOfBlock(id block);

VMK_EXPORT int VMKOpenFoundationSupport(VMKLuaStateRef state);

VMK_EXTERN_C_END

#endif
