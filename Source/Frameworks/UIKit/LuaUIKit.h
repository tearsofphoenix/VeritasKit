//
//  LuaUIKit.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

#define LUA_UIKITLIBNAME	"UIKit"

LUAMOD_API int VMKOpenUIKit(VMKLuaStateRef state);

VMK_EXTERN_C_END
