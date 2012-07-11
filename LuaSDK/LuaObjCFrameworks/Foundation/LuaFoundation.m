//
//  LuaFoundation.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaFoundation.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaNSBundle.h"
#import "LuaNSRange.h"
#import "LuaNSString.h"
#import "LuaNSCollection.h"
#import "LuaNSCoder.h"

int LuaOpenFoundation(lua_State *L)
{    
    LuaOpenNSBundle(L);
   
    LuaOpenNSRange(L);
    LuaOpenNSString(L);
    LuaOpenNSColletion(L);
    LuaOpenNSCoder(L);
    
    return 0;
}
