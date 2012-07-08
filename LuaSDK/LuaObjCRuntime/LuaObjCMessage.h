//
//  LuaObjCMessage.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

struct lua_State;

extern int luaObjC_objc_messageSend(struct lua_State *L);

extern int luaObjc_method_super_call(struct lua_State *L);
