//
//  LuaNSStream.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSStream.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSStreamConstants[] = 
{
    {"NSStreamStatusNotOpen", NSStreamStatusNotOpen},
    {"NSStreamStatusOpening", NSStreamStatusOpening},
    {"NSStreamStatusOpen", NSStreamStatusOpen},
    {"NSStreamStatusReading", NSStreamStatusReading},
    {"NSStreamStatusWriting", NSStreamStatusWriting},
    {"NSStreamStatusAtEnd", NSStreamStatusAtEnd},
    {"NSStreamStatusClosed", NSStreamStatusClosed},
    {"NSStreamStatusError", NSStreamStatusError},
    {"NSStreamEventNone", NSStreamEventNone},
    {"NSStreamEventOpenCompleted", NSStreamEventOpenCompleted},
    {"NSStreamEventHasBytesAvailable", NSStreamEventHasBytesAvailable},
    {"NSStreamEventHasSpaceAvailable", NSStreamEventHasSpaceAvailable},
    {"NSStreamEventErrorOccurred", NSStreamEventErrorOccurred},
    {"NSStreamEventEndEncountered", NSStreamEventEndEncountered},
    {NULL, 0},
};

int LuaOpenNSStream(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSStreamConstants);
    return 0;
}
