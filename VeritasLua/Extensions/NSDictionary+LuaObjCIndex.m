//
//  LuaObjCIndex.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+LuaObjCIndex.h"
#import "LuaObjCAuxiliary.h"
#import "LuaNSObjectSupport.h"

@implementation NSDictionary (LuaObjCIndex)

- (void)indexObjectWithState: (lua_State *)L
{
    id key = LuaObjCCheckObject(L, 2);
    LuaObjCPushObject(L, [self objectForKey: key], true, false);
}

- (void)concatObjectWithState: (lua_State *)state
{
    NSDictionary *dict = LuaObjCCheckObject(state, 2);
    
    NSMutableDictionary *ret = [[[NSMutableDictionary alloc] initWithDictionary: self] autorelease];
    [ret addEntriesFromDictionary: dict];
    LuaObjCPushObject(state, ret, true, false);
}

- (void)getLengthOfObjectWithState: (lua_State *)state
{
    lua_pushinteger(state, [self count]);
}


static NSArray * __keys = nil;
static NSInteger __keyIndex = 0;

static int luaObjC_NSDictionary_luaEnumerator(lua_State *L)
{
    LuaObjectRef obj = lua_touserdata(L, lua_upvalueindex(1));
    NSDictionary *dict = LuaObjectGetObject(obj);
    if (!__keys)
    {
        __keys = [dict allKeys];
    }
    
    if (__keyIndex < [__keys count])
    {
        id key = [__keys objectAtIndex: __keyIndex];
        LuaObjCPushObject(L, key, true, false);
        LuaObjCPushObject(L, [dict objectForKey: key], true, false);
        ++__keyIndex;
        return 2;
    }else 
    {
        return 0;
    }
}

- (lua_CFunction)luaEnumerator
{
    return luaObjC_NSDictionary_luaEnumerator;
}

@end

@implementation NSMutableDictionary (LuaObjCIndex)

- (void)addObjectAtIndexWithState: (lua_State *)L
{
    id key = LuaObjCCheckObject(L, 2);
    id value = LuaObjCCheckObject(L, 3);
    [self setObject: value 
             forKey: key];
}
@end