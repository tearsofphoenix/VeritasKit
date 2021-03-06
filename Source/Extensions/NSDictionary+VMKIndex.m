//
//  VMKIndex.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+VMKIndex.h"
#import "VMKAuxiliary.h"
#import "VMKObject.h"

@implementation NSDictionary (VMKIndex)

- (void)indexObjectWithState: (lua_State *)L
{
    id key = VMKCheckObject(L, 2);
    VMKPushObject(L, [self objectForKey: key], true);
}

- (void)concatObjectWithState: (lua_State *)state
{
    NSDictionary *dict = VMKCheckObject(state, 2);
    
    NSMutableDictionary *ret = [[[NSMutableDictionary alloc] initWithDictionary: self] autorelease];
    [ret addEntriesFromDictionary: dict];
    VMKPushObject(state, ret, true);
}

- (void)getLengthOfObjectWithState: (lua_State *)state
{
    lua_pushinteger(state, [self count]);
}


static NSArray * __keys = nil;
static NSInteger __keyIndex = 0;

static int luaObjC_NSDictionary_luaEnumerator(lua_State *L)
{
    VMKObjectRef obj = lua_touserdata(L, lua_upvalueindex(1));
    NSDictionary *dict = VMKObjectGetObject(obj);
    if (!__keys)
    {
        __keys = [dict allKeys];
    }
    
    if (__keyIndex < [__keys count])
    {
        id key = [__keys objectAtIndex: __keyIndex];
        VMKPushObject(L, key, true);
        VMKPushObject(L, dict[key], true);
        ++__keyIndex;
        return 2;
    }else 
    {
        __keys = nil;
        __keyIndex = 0;
        return 0;
    }
}

- (lua_CFunction)luaEnumerator
{
    return luaObjC_NSDictionary_luaEnumerator;
}

@end

@implementation NSMutableDictionary (VMKIndex)

- (void)addObjectAtIndexWithState: (lua_State *)L
{
    id key = VMKCheckObject(L, 2);
    id value = VMKCheckObject(L, 3);
    [self setObject: value 
             forKey: key];
}
@end