//
//  LuaQuartzCore.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaQuartzCore.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaCABase.h"
#import "LuaCALayer.h"
#import "LuaCATransform3D.h"

int LuaOpenQuartzCore(lua_State *L)
{
    LuaOpenCABase(L);
    LuaOpenCALayer(L);
    LuaOpenCATransform3D(L);
    
    return 0;
}
