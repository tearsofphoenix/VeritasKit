//
//  LuaObjCExtensions.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCExtensions.h"

#import "LuaObjCAuxiliary.h"

#import "lua.h"

#import "lauxlib.h"

#import "LuaObjCInternal.h"

#import "NSString+LuaObjCIndex.h"
#import "NSArray+LuaObjCIndex.h"
#import "NSDictionary+LuaObjCIndex.h"
#import <objc/runtime.h>

static int luaObjC_objc_throw(lua_State *L)
{
    NSString *reason = nil;
    switch (lua_type(L, 1))
    {
        case LUA_TNIL:
        case LUA_TNONE:
        {
            reason = @"@throw nil value!";
            break;
        }   
        case LUA_TBOOLEAN:
        {
            BOOL value = lua_toboolean(L, 1);
            reason = [NSString stringWithFormat: @"@throw BOOL:%s value!", 
                      value ? "YES" : "NO"];
            break;
        }
        case LUA_TLIGHTUSERDATA:
        {
            void* p = lua_touserdata(L, 1);
            reason = [NSString stringWithFormat: @"@throw pointer:%p value!", p];
            break;
        }
        case LUA_TNUMBER:
        {
            lua_Number number = lua_tonumber(L, 1);
            reason = [NSString stringWithFormat: @"@throw number:%f value!", number];
            break;
        }
        case LUA_TSTRING:
        {
            const char* str = lua_tostring(L, 1);
            reason = [NSString stringWithFormat: @"@throw string:%s value!", str];
            break;
        }
        case LUA_TTABLE:
        {
            reason = @"@throw table value!";
            break;
        }
        case LUA_TFUNCTION:
        {                                                            
            reason = @"@throw function value!";
            break;
        }
        case LUA_TUSERDATA:
        {
            id obj = luaObjC_checkNSObject(L, 1);
            reason = [NSString stringWithFormat: @"@throw object:%@ value!", obj];
            break;
        }            
        case LUA_TTHREAD:
        {                                                             
            reason = @"@throw thread value!";
            break;
        }
        default:
        {                                                             
            reason = @"@throw (unknown) type!";
            break;
        }
    }
    
    NSException *exception = [NSException exceptionWithName: @"LuaObjCException"
                                                     reason: reason
                                                   userInfo: nil];

    @throw exception;
}

static int luaObjC_objc_tryCatchFinally(lua_State *L)
{
    int finallyBlock = luaL_ref(L, LUA_REGISTRYINDEX);
    int catchBlock = luaL_ref(L, LUA_REGISTRYINDEX);
    int tryBlock = luaL_ref(L, LUA_REGISTRYINDEX);
    @try 
    {
        lua_rawgeti(L, LUA_REGISTRYINDEX, tryBlock);
        
        printf("try in objc, line:%d\n", __LINE__);
        if(lua_pcall(L, 0, 0, 0) != LUA_OK)
        {
            printf("1st in try\n");
            luaObjC_throwExceptionIfError(L);
        }
        

    }
    @catch (NSException *exception) 
    {
        lua_rawgeti(L, LUA_REGISTRYINDEX, catchBlock);

        luaObjC_pushNSObject(L, exception);

        printf("catch in objc, line:%d\n", __LINE__);

        if(lua_pcall(L, 1, 0, 0) != LUA_OK)
        {
            printf("1st in catch\n");

            luaObjC_throwExceptionIfError(L);
        }
    }    
    @finally 
    {
        printf("finally in objc, line:%d\n", __LINE__);

        lua_rawgeti(L, LUA_REGISTRYINDEX, finallyBlock);
        lua_pcall(L, 0, 0, 0);
    }
    return 1;
}

static int luaObjC_objc_UUIDString(lua_State *L)
{
    NSString *uuidString = [[NSString UUID] stringByReplacingOccurrencesOfString: @"-" withString: @"_"];
    lua_pushstring(L, [uuidString UTF8String]);
    return 1;
}

static int luaObjC_objc_NSFastEnumerate(lua_State *L)
{
    id obj = luaObjC_checkNSObject(L, 1);
    if (obj)
    {
        //if the object does not support fast enumerate, it will cause a runtime exception
        //
        lua_CFunction enumerator = [obj luaEnumerator];
        lua_pushcclosure(L, enumerator, 1);
        return 1;
    }
    return 0;
}

static int luaObjC_createLiteralArray(lua_State *L)
{
    int count = lua_gettop(L);
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    for (int iLooper = 1; iLooper < count + 1; ++iLooper)
    {
        [array addObject: luaObjC_checkNSObject(L, iLooper)];
    }
    luaObjC_pushNSObject(L, array);
    return 1;
}

static int luaObjC_createLiteralDictionary(lua_State *L)
{
    int count = lua_gettop(L);
    int halfIndex = count / 2;

    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity: halfIndex];
    NSMutableArray *values = [[NSMutableArray alloc] initWithCapacity: halfIndex];
    for (int iLooper = 1; iLooper < halfIndex + 1; ++iLooper)
    {
        [keys addObject: luaObjC_checkNSObject(L, iLooper)];
        [values addObject: luaObjC_checkNSObject(L, halfIndex + iLooper)];
    }
    
    NSMutableDictionary *dict = [[[NSMutableDictionary alloc] initWithObjects: values
                                                                     forKeys: keys] autorelease];
    [keys release];
    [values release];
    
    luaObjC_pushNSObject(L, dict);
    return 1;
}

static int luaObjC_createConstantNumber(lua_State *L)
{
    CGFloat number = lua_tonumber(L, 1);
    luaObjC_pushNSObject(L, [NSNumber numberWithDouble: number]);
    return 1;
}

static const luaL_Reg __luaObjCExtensions [] =
{
    //veritas extensions
    {"objc_tryCatchFinally", luaObjC_objc_tryCatchFinally},
    {"objc_throw", luaObjC_objc_throw},
    {"objc_UUIDString", luaObjC_objc_UUIDString},
    {"objc_NSFastEnumerate", luaObjC_objc_NSFastEnumerate},
    {"objc_createLiteralArray", luaObjC_createLiteralArray},
    {"objc_createLiteralDictionary", luaObjC_createLiteralDictionary},
    {"__NSConstantNumber", luaObjC_createConstantNumber},
    {NULL, NULL}
};

int luaopen_objc_extensions(lua_State *L)
{
    LuaObjCLoadGlobalFunctions(L, __luaObjCExtensions);
    return 1;
}