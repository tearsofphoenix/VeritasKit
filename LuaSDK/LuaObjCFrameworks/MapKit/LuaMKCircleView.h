//
//  LuaMKCircleView.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lstate.h"
#define LUA_MKCircleView_METANAME	"MKCircleView"
LUAMOD_API int (LuaOpenMKCircleView)(lua_State *L);
#include <MapKit/MKCircleView.h>
#ifdef __cplusplus
}
#endif
