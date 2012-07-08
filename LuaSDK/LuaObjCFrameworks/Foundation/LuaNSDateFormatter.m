//
//  LuaNSDateFormatter.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSDateFormatter.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"


static const LuaSDKConst __luaNSDateFormatterConstants[] = 
{
    {"NSDateFormatterNoStyle", NSDateFormatterNoStyle},
    {"NSDateFormatterShortStyle", NSDateFormatterShortStyle},
    {"NSDateFormatterMediumStyle", NSDateFormatterMediumStyle},
    {"NSDateFormatterLongStyle", NSDateFormatterLongStyle},
    {"NSDateFormatterFullStyle", NSDateFormatterFullStyle},
    {"NSDateFormatterBehaviorDefault", NSDateFormatterBehaviorDefault},
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
    {"NSDateFormatterBehavior10_0", NSDateFormatterBehavior10_0},
#endif
    {"NSDateFormatterBehavior10_4", NSDateFormatterBehavior10_4},
    {NULL, 0},
};

int LuaOpenNSDateFormatter(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSDateFormatterConstants);
    return 0;
}
