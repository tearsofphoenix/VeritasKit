//
//  LuaQuartzCore.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaQuartzCore.h"
#import "LuaCATransform3D.h"

int LuaOpenQuartzCore(struct lua_State *L)
{
    LuaOpenCATransform3D(L);
    
    return 0;
}
