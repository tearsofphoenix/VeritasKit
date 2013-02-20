//
//  NSString+VMKIndex.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+VMKIndex.h"

#import "VMKAuxiliary.h"
#import "VMKClass.h"

@implementation NSString (VMKIndex)

- (void)indexObjectWithState: (VMKLuaStateRef)state
{
    NSUInteger index = lua_tointeger(state, 2);
    lua_pushinteger(state, [self characterAtIndex: index]);
}

- (void)concatObjectWithState: (VMKLuaStateRef)state
{
    switch (lua_type(state, 2)) 
    {
        case LUA_TSTRING:
        {
            const char* str = lua_tostring(state, 2);
            NSString *ret = [self stringByAppendingFormat: @"%s", str];
            VMKPushObject(state, ret, true, false);
            break;
        }   
        case LUA_TUSERDATA:
        {
            NSString *str = VMKCheckObject(state, 2);
            NSString *ret = [self stringByAppendingString: str];
            VMKPushObject(state, ret, true, false);
            break;
        }
        default:
        {
            break;
        }
    }    
}

- (void)getLengthOfObjectWithState: (VMKLuaStateRef)state
{
    lua_pushinteger(state, [self length]);
}

+ (NSString *)UUID
{
    CFUUIDRef   uuid;
    CFStringRef string;
    
    uuid = CFUUIDCreate( NULL );
    string = CFUUIDCreateString( NULL, uuid );
    CFRelease(uuid);

    return [(id)string autorelease];
}

@end
