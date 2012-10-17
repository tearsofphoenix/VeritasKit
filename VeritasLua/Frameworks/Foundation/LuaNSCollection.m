//
//  LuaNSCollection.m
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaNSCollection.h"
#import "LuaObjCAccelerator.h"
#import "LuaObjCInternal.h"
#import "LuaObjCAuxiliary.h"

static NSMutableArray *__luaObjC_getArrayFromState(lua_State *L)
{
    NSMutableArray *array = [NSMutableArray array];
    int iLooper = LuaObjCArgumentStart;
    id argLooper = luaObjC_checkNSObject(L, iLooper);
    while (argLooper)
    {
        [array addObject: argLooper];
        ++iLooper;
        argLooper = luaObjC_checkNSObject(L, iLooper);
    }
    return array;
}

static int _luaObjC_NSArray_arrayWithObjects(id obj, SEL selector, lua_State *L)
{
    NSMutableArray *array = __luaObjC_getArrayFromState(L);
    if (obj == [NSArray class])
    {
        luaObjC_pushNSObject(L, [NSArray arrayWithArray: array]);
    }else 
    {
        luaObjC_pushNSObject(L, array);
    }
    
    return 1;
}

static int _luaObjC_NSArray_NSOrderedSet_initWithObjects(id obj, SEL selector, lua_State *L)
{
    NSMutableArray *array = __luaObjC_getArrayFromState(L);
    luaObjC_pushNSObject(L, [obj initWithArray: array]);
    return 1;
}

static NSMutableDictionary *__luaObjC_getDictionaryFromState(lua_State *L)
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    int iLooper = LuaObjCArgumentStart;
    id valueLooper = luaObjC_checkNSObject(L, iLooper);
    id keyLooper =  luaObjC_checkNSObject(L, iLooper + 1);
    while (valueLooper && keyLooper)
    {
        [dict setObject: valueLooper 
                 forKey: keyLooper];
        iLooper += 2;
        valueLooper = luaObjC_checkNSObject(L, iLooper);
        keyLooper = luaObjC_checkNSObject(L, iLooper + 1);
    }
    
    return dict;
}

static int _luaObjC_NSDictionary_dictionaryWithObjectsAndKeys(id obj, SEL selector, lua_State *L)
{
    NSMutableDictionary *dict = __luaObjC_getDictionaryFromState(L);
    if (obj == [NSDictionary class])
    {
        luaObjC_pushNSObject(L, [NSDictionary dictionaryWithDictionary: dict]);
    }else 
    {
        luaObjC_pushNSObject(L, dict);
    }
    return 1;
}

static int _luaObjC_NSDictionary_initWithObjectsAndKeys(id obj, SEL selector, lua_State *L)
{
    NSMutableDictionary *dict = __luaObjC_getDictionaryFromState(L);
    luaObjC_pushNSObject(L, [obj initWithDictionary: dict]);
    return 1;
}

static int _luaObjC_NSOrderedSet_orderedSetWithObjects(id obj, SEL selector, lua_State *L)
{
    NSArray *array = __luaObjC_getArrayFromState(L);
    
    luaObjC_pushNSObject(L, [obj orderedSetWithArray: array]);
    return 1;
}

static int _luaObjC_NSSet_setWithObjects(id obj, SEL selector, lua_State *L)
{
    NSArray *array = __luaObjC_getArrayFromState(L);
    luaObjC_pushNSObject(L, [obj setWithArray: array]);
    return 1;
}

static int _luaObjC_NSCollection_enumerateObjectsUsingBlock(id obj, SEL selector, lua_State *L)
{
    int functionID = luaL_ref(L, LUA_REGISTRYINDEX);
    [obj enumerateObjectsUsingBlock: (^(id obj, NSUInteger idx, BOOL *stop) 
                                      {
                                          lua_rawgeti(L, LUA_REGISTRYINDEX, functionID);
                                          luaObjC_pushNSObject(L, obj);
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
    NSEnumerationOptions options = lua_tounsigned(L, LuaObjCArgumentStart);
    int functionID = luaL_ref(L, LUA_REGISTRYINDEX);
    [obj enumerateObjectsWithOptions: options
                          usingBlock: (^(id obj, NSUInteger idx, BOOL *stop) 
                                       {
                                           lua_rawgeti(L, LUA_REGISTRYINDEX, functionID);
                                           luaObjC_pushNSObject(L, obj);
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
                                                 luaObjC_pushNSObject(L, key);
                                                 luaObjC_pushNSObject(L, obj);
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
    NSEnumerationOptions options = lua_tounsigned(L, LuaObjCArgumentStart);
    int functionID = luaL_ref(L, LUA_REGISTRYINDEX);
    
    [obj enumerateKeysAndObjectsWithOptions: options
                                 usingBlock: (^(id key, id obj, BOOL *stop) 
                                             {
                                                 lua_rawgeti(L, LUA_REGISTRYINDEX, functionID);
                                                 luaObjC_pushNSObject(L, key);
                                                 luaObjC_pushNSObject(L, obj);
                                                 if(lua_pcall(L, 2, 1, 0) != LUA_OK)
                                                 {
                                                     luaL_error(L, "error in enumerateKeysAndObjectsWithOptions:usingBlock:");
                                                 }
                                                 *stop = lua_toboolean(L, -1);
                                                 lua_pop(L, 1);
                                                 
                                             })];
    return 0;
}

int LuaOpenNSColletion(lua_State *L)
{
    //NSArray accelerators
    //

    luaObjC_registerAccelerator([NSArray class], @selector(arrayWithObjects:),
                                _luaObjC_NSArray_arrayWithObjects);
    luaObjC_registerAccelerator([NSArray class], @selector(initWithObjects:),
                                _luaObjC_NSArray_NSOrderedSet_initWithObjects);
    
    luaObjC_registerAccelerator([NSDictionary class], @selector(dictionaryWithObjectsAndKeys:),
                                _luaObjC_NSDictionary_dictionaryWithObjectsAndKeys);
    luaObjC_registerAccelerator([NSDictionary class], @selector(initWithObjectsAndKeys:),
                                _luaObjC_NSDictionary_initWithObjectsAndKeys);
    
    luaObjC_registerAccelerator([NSOrderedSet class], @selector(orderedSetWithObjects:),
                                _luaObjC_NSOrderedSet_orderedSetWithObjects);
    luaObjC_registerAccelerator([NSSet class], @selector(setWithObjects:),
                                _luaObjC_NSSet_setWithObjects);
    
    luaObjC_registerAccelerator([NSObject class], @selector(enumerateObjectsUsingBlock:),
                                _luaObjC_NSCollection_enumerateObjectsUsingBlock);
    luaObjC_registerAccelerator([NSObject class], @selector(enumerateObjectsWithOptions:usingBlock:),
                                _luaObjC_NSCollection_enumerateObjectsWithOptions_usingBlock);
    
    luaObjC_registerAccelerator([NSObject class], @selector(enumerateKeysAndObjectsUsingBlock:),
                                _luaObjC_NSCollection_enumerateKeysAndObjectsUsingBlock);
    luaObjC_registerAccelerator([NSObject class], @selector(enumerateKeysAndObjectsWithOptions:usingBlock:),
                                _luaObjC_NSCollection_enumerateKeysAndObjectsWithOptions_usingBlock);
    
    return 0;
}
