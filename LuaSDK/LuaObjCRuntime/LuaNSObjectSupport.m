//
//  LuaNSObjectSupport.m
//  LuaIOS
//
//  Created by LeixSnake on 8/2/12.
//
//

#import "LuaNSObjectSupport.h"
#import "lua.h"
#import "lauxlib.h"
#import "LuaObjCClass.h"
#import "LuaObjCAuxiliary.h"
#import "LuaObjCIndexing.h"
#import "LuaObjCInternal.h"
#import "LuaObjCBlock.h"
#import <objc/runtime.h>

static int luaObjC_NSLog(lua_State *L)
{
    const char* charLooper = luaObjC_checkString(L, 1);
    NSMutableString *logString = [NSMutableString string];
    int iLooper = 2;
    while (charLooper && *charLooper)
    {
        switch (*charLooper)
        {
            case '%':
            {
                ++charLooper;
                switch (*charLooper)
                {
                    case 0:
                    {
                        //end of the format string
                        break;
                    }
                    case '%':
                    {
                        [logString appendString: @"%@"];
                        break;
                    }
                    case 'd':
                    case 'i':
                    case 'u':
                    {
                        lua_Integer value = lua_tointeger(L, iLooper);
                        [logString appendFormat: @"%d", value];
                        ++iLooper;
                        break;
                    }
                    case 'f':
                    case 'F':
                    {
                        double value = lua_tonumber(L, iLooper);
                        [logString appendFormat: @"%f", value];
                        ++iLooper;
                        break;
                    }
                    case 's':
                    {
                        const char *s = lua_tostring(L, iLooper);
                        [logString appendFormat: @"%s", s];
                        ++iLooper;
                        break;
                    }
                    case 'p':
                    {
                        void* value = lua_touserdata(L, iLooper);
                        [logString appendFormat: @"%p", value];
                        ++iLooper;
                        break;
                    }
                    case 'c':
                    {
                        char c = lua_tointeger(L, iLooper);
                        [logString appendFormat: @"%c", c];
                        ++iLooper;
                        break;
                    }
                    case '@':
                    {
                        id obj = luaObjC_checkNSObject(L, iLooper);
                        [logString appendFormat: @"%@", obj];
                        ++iLooper;
                        break;
                    }
                    default:
                    {
                        [logString appendFormat: @"%c", *charLooper];
                        break;
                    }
                }
                break;
            }
            default:
            {
                [logString appendFormat: @"%c", *charLooper];
                break;
            }
        }
        ++charLooper;
    }
    
    NSLog(@"%@", logString);
    
    return 0;
}

static int luaObjC_description(lua_State *L)
{
    LuaObjectRef obj = lua_touserdata(L, 1);
    NSString *description = [LuaObjectGetObject(obj) description];
    lua_pushstring(L, [description UTF8String]);
    return 1;
}

static int luaObjC_garbadgeCollection(lua_State *L)
{
    LuaObjectRef objRef = lua_touserdata(L, 1);
    lua_Debug ar;
    lua_getstack(L, 1, &ar);
    const char * name = lua_getlocal(L, &ar, 1);
    //stackDump(L);
    
    printf("[GC]name: %s count: %d\n", name, LuaObjectGetRetainCount(objRef));
    LuaObjectFinalize(objRef);
    //free(objRef);
    
    return 0;
}

static int luaObjC_isEqual(lua_State *L)
{
    id obj1 = luaObjC_checkNSObject(L, 1);
    id obj2 = luaObjC_checkNSObject(L, 2);
    lua_pushboolean(L, [obj1 isEqual: obj2]);
    return 1;
}

static int luaObjC_indexCollection(lua_State *L)
{
    id obj = luaObjC_checkNSObject(L, 1);
    NSLog(@"in func: %s line: %d obj: %@", __func__, __LINE__, obj);
    if ([obj respondsToSelector: @selector(indexObjectWithState:)])
    {
        [obj indexObjectWithState: L];
        return 1;
    }else
    {
        return 0;
    }
}

static int luaObjC_addObjectToCollection(lua_State *L)
{
    return 0;
}

static int luaObjC_getLengthOfObject(lua_State *L)
{
    id obj = luaObjC_checkNSObject(L, 1);
    if ([obj respondsToSelector: @selector(getLengthOfObjectWithState:)])
    {
        [obj getLengthOfObjectWithState: L];
        return 1;
    }else
    {
        return 0;
    }
}

static int luaObjC_unionCollection(lua_State *L)
{
    return 1;
}

static int luaObjC_subconcatCollection(lua_State *L)
{
    return 1;
}

static int luaObjC_concatCollection(lua_State *L)
{
    id obj = luaObjC_checkNSObject(L, 1);
    
    NSLog(@"in func: %s line: %d obj: %@", __func__, __LINE__, obj);
    if ([obj respondsToSelector: @selector(concatObjectWithState:)])
    {
        [obj concatObjectWithState: L];
        return 1;
    }else
    {
        return 0;
    }
}

static int luaObjC_callBlockObject(lua_State *L)
{
    //include the block
    //
    int argCount = lua_gettop(L);
    int returnCount = 1;
    id block = luaObjC_checkNSObject(L, 1);
    
    if ([block isKindOfClass: objc_getClass("NSBlock")])
    {
        int clouserID = LuaObjCBlockGetClosureID(block);
        lua_rawgeti(L, LUA_REGISTRYINDEX, clouserID);
        for (int iLooper = 2; iLooper < argCount + 1; ++iLooper)
        {
            switch (lua_type(L, iLooper))
            {
                case LUA_TNIL:
                {
                    lua_pushnil(L);
                    break;
                }
                case LUA_TBOOLEAN:
                {
                    lua_pushboolean(L, lua_toboolean(L, iLooper));
                    break;
                }
                case LUA_TLIGHTUSERDATA:
                case LUA_TUSERDATA:
                {
                    lua_pushlightuserdata(L, lua_touserdata(L, iLooper));
                    break;
                }
                case LUA_TNUMBER:
                {
                    lua_pushnumber(L, lua_tonumber(L, iLooper));
                    break;
                }
                case LUA_TSTRING:
                {
                    lua_pushstring(L, lua_tostring(L, iLooper));
                    break;
                }
                case LUA_TTABLE:
                {
                    //TODO
                    //lua_gettable(<#lua_State *L#>, <#int idx#>)
                    break;
                }
                case LUA_TFUNCTION:
                {
                    //TODO
                    //
                    break;
                }
                case LUA_TTHREAD:
                {
                    //TODO
                    break;
                }
                default:
                {
                    break;
                }
            }
        }
        
        if(lua_pcall(L, argCount - 1, returnCount, 0) != LUA_OK)
        {
            luaObjC_throwExceptionIfError(L);
        }
        
    }else
    {
        NSException *exception = [NSException exceptionWithName: @"LuaObjCBlockException"
                                                         reason: @"Expect block object!"
                                                       userInfo: nil];
        @throw exception;
    }
    return returnCount;
}

static const luaL_Reg LuaNS_ObjectMethods[] =
{
    {"__gc", luaObjC_garbadgeCollection},
    {"__tostring", luaObjC_description},
    
    {"__index", luaObjC_indexCollection},
    {"__newindex", luaObjC_addObjectToCollection},
    {"__len", luaObjC_getLengthOfObject},
    {"__eq", luaObjC_isEqual},
    {"__add", luaObjC_unionCollection},
    {"__sub", luaObjC_subconcatCollection},
    {"__concat", luaObjC_concatCollection},
    {"__call", luaObjC_callBlockObject},
    {NULL, NULL}
};


static const luaL_Reg luaNS_functions[] =
{
    {"NSLog", luaObjC_NSLog},
    {NULL, NULL}
};

int luaObjC_openNSObjectSupport(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, luaNS_functions);
    luaL_newlib(L, luaNS_functions);
    luaObjCInternal_createmeta(L, LUA_NSOBJECT_METATABLENAME, LuaNS_ObjectMethods);
    return 0;
}

