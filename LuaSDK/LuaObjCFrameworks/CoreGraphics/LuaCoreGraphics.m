//
//  LuaCoreGraphics.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCoreGraphics.h"

#import "LuaCGAffineTransform.h"
#import "LuaCGGeometry.h"

int LuaOpenCoreGraphics(struct lua_State *L)
{
    LuaOpenCGAffineTransform(L);
    LuaOpenCGGeometry(L);

    return 0;
}
