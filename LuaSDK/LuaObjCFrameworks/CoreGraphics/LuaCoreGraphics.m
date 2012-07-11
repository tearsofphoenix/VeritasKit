//
//  LuaCoreGraphics.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCoreGraphics.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

#import "LuaCGAffineTransform.h"
#import "LuaCGGeometry.h"

int LuaOpenCoreGraphics(lua_State *L)
{
    LuaOpenCGAffineTransform(L);
    LuaOpenCGGeometry(L);

    return 0;
}
