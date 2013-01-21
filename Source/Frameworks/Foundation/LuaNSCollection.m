//
//  LuaNSCollection.m
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaNSCollection.h"
#import "VMKMessage.h"
#import "VMKAuxiliary.h"

static NSMutableArray *__luaObjC_getArrayFromState(lua_State *L)
{
    NSMutableArray *array = [NSMutableArray array];
    int iLooper = VMKArgumentStart;
    id argLooper = VMKCheckObject(L, iLooper);
    while (argLooper)
    {
        [array addObject: argLooper];
        ++iLooper;
        argLooper = VMKCheckObject(L, iLooper);
    }
    return array;
}

static int _luaObjC_NSArray_arrayWithObjects(id obj, SEL selector, lua_State *L)
{
    NSMutableArray *array = __luaObjC_getArrayFromState(L);
    if (obj == [NSArray class])
    {
        VMKPushObject(L, [NSArray arrayWithArray: array], true, false);
    }else 
    {
        VMKPushObject(L, array, true, false);
    }
    
    return 1;
}

static int _luaObjC_NSArray_NSOrderedSet_initWithObjects(id obj, SEL selector, lua_State *L)
{
    NSMutableArray *array = __luaObjC_getArrayFromState(L);
    VMKPushObject(L, [obj initWithArray: array], true, false);
    return 1;
}

static NSMutableDictionary *__luaObjC_getDictionaryFromState(lua_State *L)
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    int iLooper = VMKArgumentStart;
    id valueLooper = VMKCheckObject(L, iLooper);
    id keyLooper =  VMKCheckObject(L, iLooper + 1);
    while (valueLooper && keyLooper)
    {
        [dict setObject: valueLooper 
                 forKey: keyLooper];
        iLooper += 2;
        valueLooper = VMKCheckObject(L, iLooper);
        keyLooper = VMKCheckObject(L, iLooper + 1);
    }
    
    return dict;
}

static int _luaObjC_NSDictionary_dictionaryWithObjectsAndKeys(id obj, SEL selector, lua_State *L)
{
    NSMutableDictionary *dict = __luaObjC_getDictionaryFromState(L);
    if (obj == [NSDictionary class])
    {
        VMKPushObject(L, [NSDictionary dictionaryWithDictionary: dict], true, false);
    }else 
    {
        VMKPushObject(L, dict, true, false);
    }
    return 1;
}

static int _luaObjC_NSDictionary_initWithObjectsAndKeys(id obj, SEL selector, lua_State *L)
{
    NSMutableDictionary *dict = __luaObjC_getDictionaryFromState(L);
    VMKPushObject(L, [obj initWithDictionary: dict], true, false);
    return 1;
}

static int _luaObjC_NSOrderedSet_orderedSetWithObjects(id obj, SEL selector, lua_State *L)
{
    NSArray *array = __luaObjC_getArrayFromState(L);
    
    VMKPushObject(L, [obj orderedSetWithArray: array], true, false);
    return 1;
}

static int _luaObjC_NSSet_setWithObjects(id obj, SEL selector, lua_State *L)
{
    NSArray *array = __luaObjC_getArrayFromState(L);
    VMKPushObject(L, [obj setWithArray: array], true, false);
    return 1;
}

static int _luaObjC_NSCollection_enumerateObjectsUsingBlock(id obj, SEL selector, lua_State *L)
{
    int functionID = luaL_ref(L, LUA_REGISTRYINDEX);
    
    [obj enumerateObjectsUsingBlock: (^(id obj, NSUInteger idx, BOOL *stop) 
                                      {
                                          lua_rawgeti(L, LUA_REGISTRYINDEX, functionID);
                                          VMKPushObject(L, obj, true, false);
                                          lua_pushinteger(L, idx);
                                          
                                          if(lua_pcall(L, 2, 1, 0) != LUA_OK)
                                          {
                                              luaL_error(L, "error in enumerateObjectsUsingBlock:");
                                          }
                                          *stop = lua_toboolean(L, -1);
                                          lua_pop(L, 1);
                                      })];
    return 0;
}

static int _luaObjC_NSCollection_enumerateObjectsWithOptions_usingBlock(id obj, SEL selector, lua_State *L)
{
    NSEnumerationOptions options = lua_tounsigned(L, VMKArgumentStart);
    int functionID = luaL_ref(L, LUA_REGISTRYINDEX);
    [obj enumerateObjectsWithOptions: options
                          usingBlock: (^(id obj, NSUInteger idx, BOOL *stop) 
                                       {
                                           lua_rawgeti(L, LUA_REGISTRYINDEX, functionID);
                                           VMKPushObject(L, obj, true, false);
                                           lua_pushinteger(L, idx);
                                           if(lua_pcall(L, 2, 1, 0) != LUA_OK)
                                           {
                                               luaL_error(L, "error in enumerateObjectsWithOptions:usingBlock:");
                                           }
                                           *stop = lua_toboolean(L, -1);
                                           lua_pop(L, 1);
                                       })];
    return 0;
}

static int _luaObjC_NSCollection_enumerateKeysAndObjectsUsingBlock(id obj, SEL selector, lua_State *L)
{    
    int functionID = luaL_ref(L, LUA_REGISTRYINDEX);
    
    [obj enumerateKeysAndObjectsUsingBlock: (^(id key, id obj, BOOL *stop) 
                                             {
                                                 lua_rawgeti(L, LUA_REGISTRYINDEX, functionID);
                                                 VMKPushObject(L, key, true, false);
                                                 VMKPushObject(L, obj, true, false);
                                                 if(lua_pcall(L, 2, 1, 0) != LUA_OK)
                                                 {
                                                     luaL_error(L, "error in enumerateKeysAndObjectsUsingBlock:");
                                                 }
                                                 *stop = lua_toboolean(L, -1);
                                                 lua_pop(L, 1);
                                                 
                                             })];
    
    return 0;
}

static int _luaObjC_NSCollection_enumerateKeysAndObjectsWithOptions_usingBlock(id obj, SEL selector, lua_State *L)
{
    NSEnumerationOptions options = lua_tounsigned(L, VMKArgumentStart);
    int functionID = luaL_ref(L, LUA_REGISTRYINDEX);
    
    [obj enumerateKeysAndObjectsWithOptions: options
                                 usingBlock: (^(id key, id obj, BOOL *stop) 
                                             {
                                                 lua_rawgeti(L, LUA_REGISTRYINDEX, functionID);
                                                 VMKPushObject(L, key, true, false);
                                                 VMKPushObject(L, obj, true, false);
                                                 if(lua_pcall(L, 2, 1, 0) != LUA_OK)
                                                 {
                                                     luaL_error(L, "error in enumerateKeysAndObjectsWithOptions:usingBlock:");
                                                 }
                                                 *stop = lua_toboolean(L, -1);
                                                 lua_pop(L, 1);
                                                 
                                             })];
    return 0;
}

int VMKOpenNSColletion(lua_State *L)
{
    //NSArray accelerators
    //

    VMKRegisterAccelerator([NSArray class], @selector(arrayWithObjects:),
                                _luaObjC_NSArray_arrayWithObjects);
    VMKRegisterAccelerator([NSArray class], @selector(initWithObjects:),
                                _luaObjC_NSArray_NSOrderedSet_initWithObjects);
    
    VMKRegisterAccelerator([NSDictionary class], @selector(dictionaryWithObjectsAndKeys:),
                                _luaObjC_NSDictionary_dictionaryWithObjectsAndKeys);
    VMKRegisterAccelerator([NSDictionary class], @selector(initWithObjectsAndKeys:),
                                _luaObjC_NSDictionary_initWithObjectsAndKeys);
    
    VMKRegisterAccelerator([NSOrderedSet class], @selector(orderedSetWithObjects:),
                                _luaObjC_NSOrderedSet_orderedSetWithObjects);
    VMKRegisterAccelerator([NSSet class], @selector(setWithObjects:),
                                _luaObjC_NSSet_setWithObjects);
    
    VMKRegisterAccelerator([NSObject class], @selector(enumerateObjectsUsingBlock:),
                                _luaObjC_NSCollection_enumerateObjectsUsingBlock);
    VMKRegisterAccelerator([NSObject class], @selector(enumerateObjectsWithOptions:usingBlock:),
                                _luaObjC_NSCollection_enumerateObjectsWithOptions_usingBlock);
    
    VMKRegisterAccelerator([NSObject class], @selector(enumerateKeysAndObjectsUsingBlock:),
                                _luaObjC_NSCollection_enumerateKeysAndObjectsUsingBlock);
    VMKRegisterAccelerator([NSObject class], @selector(enumerateKeysAndObjectsWithOptions:usingBlock:),
                                _luaObjC_NSCollection_enumerateKeysAndObjectsWithOptions_usingBlock);
    
    return 0;
}
