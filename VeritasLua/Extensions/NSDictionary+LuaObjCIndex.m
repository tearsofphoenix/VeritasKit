//
//  LuaObjCIndex.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+LuaObjCIndex.h"

#import "lua.h"
#import "LuaObjCAuxiliary.h"
#import "LuaObjCClass.h"

@implementation NSDictionary (LuaObjCIndex)

- (void)indexObjectWithState: (lua_State *)L
{
    id key = luaObjC_checkNSObject(L, 2);
    luaObjC_pushNSObject(L, [self objectForKey: key]);    
}

- (void)concatObjectWithState: (lua_State *)state
{
    NSDictionary *dict = luaObjC_checkNSObject(state, 2);
    
    NSMutableDictionary *ret = [[[NSMutableDictionary alloc] initWithDictionary: self] autorelease];
    [ret addEntriesFromDictionary: dict];
    luaObjC_pushNSObject(state, ret);
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
        luaObjC_pushNSObject(L, key);
        luaObjC_pushNSObject(L, [dict objectForKey: key]);
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
    id key = luaObjC_checkNSObject(L, 2);
    id value = luaObjC_checkNSObject(L, 3);
    [self setObject: value 
             forKey: key];
}
@end