//
//  NSArray+LuaObjCIndex.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+LuaObjCIndex.h"

#import "lua.h"
#import "LuaObjCAuxiliary.h"
#import "LuaObjCClass.h"

@implementation NSArray (LuaObjCIndex)

- (void)indexObjectWithState: (lua_State *)L
{
    NSUInteger index = lua_tointeger(L, 2);
    luaObjC_pushNSObject(L, [self objectAtIndex: index]);    
}

- (void)concatObjectWithState: (lua_State *)state
{
    NSArray *other = luaObjC_checkNSObject(state, 2);
    luaObjC_pushNSObject(state, [self arrayByAddingObjectsFromArray: other]); 
}

- (void)getLengthOfObjectWithState: (lua_State *)state
{
    lua_pushinteger(state, [self count]);
}

static int luaObjC_NSArray_luaEnumerator(lua_State *L)
{
    LuaClassRef obj = lua_touserdata(L, lua_upvalueindex(1));
    NSArray *array = LuaClassGetObject(obj);
    static NSInteger index = 0;
    if (index < [array count])
    {
        luaObjC_pushNSObject(L, [array objectAtIndex: index]);
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
    id obj = luaObjC_checkNSObject(L, 3);
    [self insertObject: obj
               atIndex: index];
}

@end