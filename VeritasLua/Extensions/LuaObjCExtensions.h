//
//  LuaObjCExtensions.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

#import "LuaObjCIndexing.h"

struct lua_State;

extern int (luaopen_objc_extensions)(struct lua_State *L);

__END_DECLS