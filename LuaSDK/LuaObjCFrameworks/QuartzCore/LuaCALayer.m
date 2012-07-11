//
//  LuaCALayer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCALayer.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaCALayerConstants[] = 
{
    {"kCALayerLeftEdge", kCALayerLeftEdge},
    {"kCALayerRightEdge", kCALayerRightEdge},
    {"kCALayerBottomEdge", kCALayerBottomEdge},
    {"kCALayerTopEdge", kCALayerTopEdge},
    {NULL, 0},
};

int LuaOpenCALayer(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaCALayerConstants);
    return 0;
}
