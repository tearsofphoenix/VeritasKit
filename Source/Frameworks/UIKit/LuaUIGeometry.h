//
//  LuaUIGeometry.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#include "LuaObjCBase.h"

__BEGIN_DECLS

    #define LUA_UIEdgeInsets_METANAME "UIEdgeInsets"
    
    VK_EXPORT int LuaObjCPushUIEdgeInsets(struct lua_State *L, UIEdgeInsets edgeInsets);
    
    #define LUA_UIOffset_METANAME "UIOffset"
    
    VK_EXPORT int LuaObjCPushUIOffset(struct lua_State *L, UIOffset offset);
    
    LUAMOD_API int LuaObjCOpenUIGeometry(struct lua_State *L);

__END_DECLS
