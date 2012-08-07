//
//  LuaFoundation.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaFoundation.h"

#import "LuaNSBundle.h"
#import "LuaNSRange.h"
#import "LuaNSString.h"
#import "LuaNSCollection.h"

int LuaOpenFoundation(lua_State *L)
{    
    LuaOpenNSBundle(L);
   
    LuaOpenNSRange(L);
    LuaOpenNSString(L);
    LuaOpenNSColletion(L);
    
    return 0;
}
