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

enum
{
    VMKInvalidClouserID = -1,
};

typedef int LuaClosureType;

VMK_EXPORT LuaClosureType LuaInternalGetClosureIDOfBlock(id block);

#define LUA_NSLIBNAME       "NS"    

LUAMOD_API int VMKOpenFoundationSupport(struct lua_State *L);

VMK_EXTERN__C_END

#endif
