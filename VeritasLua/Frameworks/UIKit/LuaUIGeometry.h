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
    
    VK_EXPORT int lua_pushUIEdgeInsets(struct lua_State *L, UIEdgeInsets edgeInsets);
    
    #define LUA_UIOffset_METANAME "UIOffset"
    
    VK_EXPORT int lua_pushUIOffset(struct lua_State *L, UIOffset offset);
    
    LUAMOD_API int LuaOpenUIGeometry(struct lua_State *L);

__END_DECLS
