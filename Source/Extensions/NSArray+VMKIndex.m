//
//  NSArray+VMKIndex.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+VMKIndex.h"

#import "VMKAuxiliary.h"
#import "VMKObject.h"

@implementation NSArray (VMKIndex)

- (void)indexObjectWithState: (lua_State *)L
{
    NSUInteger index = lua_tointeger(L, 2);
    VMKPushObject(L, [self objectAtIndex: index], true, false);
}

- (void)concatObjectWithState: (lua_State *)state
{
    NSArray *other = VMKCheckObject(state, 2);
    VMKPushObject(state, [self arrayByAddingObjectsFromArray: other], true, false);
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
        VMKPushObject(L, [array objectAtIndex: index], true, false);
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

@implementation NSMutableArray (VMKIndex)

- (void)addObjectAtIndexWithState: (lua_State *)L
{
    NSUInteger index = lua_tointeger(L, 2);
    id obj = VMKCheckObject(L, 3);
    [self insertObject: obj
               atIndex: index];
}

@end