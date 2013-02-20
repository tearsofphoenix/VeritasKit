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

- (void)indexObjectWithState: (VMKLuaStateRef)state
{
    NSUInteger index = lua_tointeger(state, 2);
    VMKPushObject(state, [self objectAtIndex: index], true, false);
}

- (void)concatObjectWithState: (VMKLuaStateRef)state
{
    NSArray *other = VMKCheckObject(state, 2);
    VMKPushObject(state, [self arrayByAddingObjectsFromArray: other], true, false);
}

- (void)getLengthOfObjectWithState: (VMKLuaStateRef)state
{
    lua_pushinteger(state, [self count]);
}

static int luaObjC_NSArray_luaEnumerator(VMKLuaStateRef state)
{
    VMKObjectRef obj = lua_touserdata(state, lua_upvalueindex(1));
    NSArray *array = VMKObjectGetObject(obj);
    static NSInteger index = 0;
    if (index < [array count])
    {
        VMKPushObject(state, [array objectAtIndex: index], true, false);
        lua_pushinteger(state, index);
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

- (void)addObjectAtIndexWithState: (VMKLuaStateRef)state
{
    NSUInteger index = lua_tointeger(state, 2);
    id obj = VMKCheckObject(state, 3);
    [self insertObject: obj
               atIndex: index];
}

@end