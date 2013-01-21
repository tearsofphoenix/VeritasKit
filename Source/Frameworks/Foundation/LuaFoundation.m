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

int VMKOpenFoundation(struct lua_State *L)
{    
    VMKOpenNSBundle(L);
   
    VMKOpenNSRange(L);
    VMKOpenNSString(L);
    VMKOpenNSColletion(L);
    
    return 0;
}
