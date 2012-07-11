//
//  LuaUIKit.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIKit.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

#import "LuaCoreGraphics.h"

#import "LuaUIAccessibility.h"
#import "LuaUIApplication.h"
#import "LuaUIGeometry.h"
#import "LuaUIGraphics.h"
#import "LuaUIView.h"

int LuaOpenUIKit(lua_State *L)
{
    //load CoreGraphics
    //
    LuaOpenCoreGraphics(L);
        
    LuaOpenUIAccessibility(L);
    LuaOpenUIApplication(L);
    LuaOpenUIGeometry(L);
    LuaOpenUIGraphics(L);

    LuaOpenUIView(L);

    return 0;
}
