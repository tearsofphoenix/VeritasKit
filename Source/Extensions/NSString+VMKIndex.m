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

- (void)indexObjectWithState: (lua_State *)L
{
    NSUInteger index = lua_tointeger(L, 2);
    lua_pushinteger(L, [self characterAtIndex: index]);    
}

- (void)concatObjectWithState:(lua_State *)state
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

- (void)getLengthOfObjectWithState: (lua_State *)state
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
    //CFShow( string );
    return [(id)string autorelease];
}

@end

@implementation NSMutableString (VMKIndex)

- (void)addObjectAtIndexWithState: (lua_State *)L
{
    NSUInteger index = lua_tointeger(L, 2);
    NSString *inserted = nil;
    switch(lua_type(L, 3))
    {
        case LUA_TNONE:
        case LUA_TNIL:
        {
            break
            ;
        }
    }
    [self insertString: inserted 
               atIndex: index];
}

@end