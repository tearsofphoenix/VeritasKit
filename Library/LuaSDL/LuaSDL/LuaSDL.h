//
//  LuaSDL.h
//  LuaSDL
//
//  Created by Mac003 on 14/12/26.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#include <lua.h>

extern int luaopen_SDL(lua_State *L);

extern int luaopen_SDL_ttf(lua_State *L);

extern int luaopen_SDL_image(lua_State *L);