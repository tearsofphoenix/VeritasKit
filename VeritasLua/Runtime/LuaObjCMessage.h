//
//  LuaObjCMessage.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

VK_EXPORT int LuaObjCMessageSend(struct lua_State *L);

VK_EXPORT int LuaObjCMessageSendSuper(struct lua_State *L);

__END_DECLS
