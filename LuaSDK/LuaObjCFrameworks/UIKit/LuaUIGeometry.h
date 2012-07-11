//
//  LuaUIGeometry.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lua.h"
#include <UIKit/UIGeometry.h>

    #define LUA_UIEdgeInsets_METANAME "UIEdgeInsets"
    
    int lua_pushUIEdgeInsets(lua_State *L, UIEdgeInsets edgeInsets);
    
    #define LUA_UIOffset_METANAME "UIOffset"
    
    int lua_pushUIOffset(lua_State *L, UIOffset offset);
    
    LUAMOD_API int (LuaOpenUIGeometry)(lua_State *L);
    
    
#ifdef __cplusplus
}
#endif
