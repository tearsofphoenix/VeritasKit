//
//  LuaObjCIMP.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

struct lua_State;

extern int LuaIMPAddInstanceMethod(struct lua_State *L);

extern int LuaIMPAddClassMethod(struct lua_State *L);
