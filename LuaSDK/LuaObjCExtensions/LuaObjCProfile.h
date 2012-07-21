//
//  LuaObjCProfile.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "luaconf.h"

struct lua_State;

LUAMOD_API int (luaopen_objc_profile)(struct lua_State *L);

