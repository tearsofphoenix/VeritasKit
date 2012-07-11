//
//  LuaUIGeometry.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#include "luaconf.h"

#include <UIKit/UIGeometry.h>

struct lua_State;

    #define LUA_UIEdgeInsets_METANAME "UIEdgeInsets"
    
    int lua_pushUIEdgeInsets(struct lua_State *L, UIEdgeInsets edgeInsets);
    
    #define LUA_UIOffset_METANAME "UIOffset"
    
    int lua_pushUIOffset(struct lua_State *L, UIOffset offset);
    
    LUAMOD_API int (LuaOpenUIGeometry)(struct lua_State *L);
