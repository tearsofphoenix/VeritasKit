//
//  LuaNSRange.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifndef __VMK_LUANSRANGE__
#define __VMK_LUANSRANGE__ 1

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

#include <Foundation/NSRange.h>

#define LUA_NSRange_METANAME	"NSRange"

VMK_EXPORT int VMKPushNSRange(VMKLuaStateRef state, NSRange range);
    
LUAMOD_API int VMKOpenNSRange(VMKLuaStateRef state);

VMK_EXTERN_C_END

#endif
