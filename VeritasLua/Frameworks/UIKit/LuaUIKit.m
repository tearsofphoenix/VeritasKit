//
//  LuaUIKit.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIKit.h"

#import "LuaCoreGraphics.h"

#import "LuaUIAccessibility.h"
#import "LuaUIGeometry.h"
#import "LuaUIGraphics.h"
#import "LuaUIView.h"
#import "LuaObjCFrameworkFunctions.h"

int LuaOpenUIKit(struct lua_State *L)
{
    //load CoreGraphics
    //
    LuaOpenCoreGraphics(L);
        
    LuaOpenUIAccessibility(L);
    LuaOpenUIGeometry(L);
    LuaOpenUIGraphics(L);

    LuaOpenUIView(L);

    return 0;
}
