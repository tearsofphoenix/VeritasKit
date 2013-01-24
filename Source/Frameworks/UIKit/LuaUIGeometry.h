//
//  LuaUIGeometry.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#ifndef __VMK_LUAUIGEOMETRY__
#define __VMK_LUAUIGEOMETRY__ 1

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

#define LUA_UIEdgeInsets_METANAME "UIEdgeInsets"

VMK_EXPORT int VMKPushUIEdgeInsets(struct lua_State *L, UIEdgeInsets edgeInsets);

#define LUA_UIOffset_METANAME "UIOffset"

VMK_EXPORT int VMKPushUIOffset(struct lua_State *L, UIOffset offset);

LUAMOD_API int VMKOpenUIGeometry(struct lua_State *L);

VMK_EXTERN__C_END

#endif
