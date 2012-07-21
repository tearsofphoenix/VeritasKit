//
//  LuaObjCMessage.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

struct lua_State;

extern int luaObjC_objc_messageSend(struct lua_State *L);

extern int luaObjC_objc_messageSend_Super(struct lua_State *L);
