//
//  NSArray+LuaObjCIndex.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+LuaObjCIndex.h"

#import "LuaObjCAuxiliary.h"
#import "LuaNSObjectSupport.h"

@implementation NSArray (LuaObjCIndex)

- (void)indexObjectWithState: (lua_State *)L
{
    NSUInteger index = lua_tointeger(L, 2);
    LuaObjCPushObject(L, [self objectAtIndex: index], true, false);
}

- (void)concatObjectWithState: (lua_State *)state
{
    NSArray *other = LuaObjCCheckObject(state, 2);
    LuaObjCPushObject(state, [self arrayByAddingObjectsFromArray: other], true, false);
}

- (void)getLengthOfObjectWithState: (lua_State *)state
{
    lua_pushinteger(state, [self count]);
}

static int luaObjC_NSArray_luaEnumerator(lua_State *L)
{
    LuaObjectRef obj = lua_touserdata(L, lua_upvalueindex(1));
    NSArray *array = LuaObjectGetObject(obj);
    static NSInteger index = 0;
    if (index < [array count])
    {
        LuaObjCPushObject(L, [array objectAtIndex: index], true, false);
        lua_pushinteger(L, index);
        ++index;
        return 2;
    }else 
    {
        return 0;
    }
}

- (lua_CFunction)luaEnumerator
{
    return luaObjC_NSArray_luaEnumerator;
}

@end

@implementation NSMutableArray (LuaObjCIndex)

- (void)addObjectAtIndexWithState: (lua_State *)L
{
    NSUInteger index = lua_tointeger(L, 2);
    id obj = LuaObjCCheckObject(L, 3);
    [self insertObject: obj
               atIndex: index];
}

@end