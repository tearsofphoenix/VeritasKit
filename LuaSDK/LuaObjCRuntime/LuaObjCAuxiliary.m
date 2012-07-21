//
//  LuaObjCAuxiliary.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCAuxiliary.h"

#import "LuaObjCClass.h"

#import "LuaObjCInternal.h"

#import "LuaObjCCacheTable.h"
#import "lauxlib.h"

#import <objc/runtime.h>

id luaObjC_checkNSObject(lua_State *L, int index)
{
    switch (lua_type(L, index))
    {
        case LUA_TNIL:
        {
            return nil;
        }   
        case LUA_TSTRING:
        {
            return [NSString stringWithCString: lua_tostring(L, index)
                                      encoding: NSUTF8StringEncoding];
        }
        case LUA_TUSERDATA:
        {
            LuaObjCClassRef obj = luaL_checkudata(L, index, LUA_NSOBJECT_METATABLENAME);
            return LuaObjCClassGetObject(obj);
        }
        default:
        {
            return nil;
        }
    }
}

int luaObjC_checkInteger(lua_State *L, int index)
{
    switch (lua_type(L, index))
    {
        case LUA_TNIL:
        {
            return 0;
        }
        case LUA_TBOOLEAN:
        {
            return lua_toboolean(L, index);
        }
        case LUA_TNUMBER:
        {
            return lua_tointeger(L, index);
        }   
        default:
        {
            lua_error(L);
            return 0;
        }
    }
}
const char* luaObjC_checkString(lua_State *L, int index)
{
    switch (lua_type(L, index))
    {
        case LUA_TNIL:
        {
            return NULL;
        }   
        case LUA_TSTRING:
        {
            return lua_tostring(L, index);
        }
        case LUA_TUSERDATA:
        {
            LuaObjCClassRef obj = luaL_checkudata(L, index, LUA_NSOBJECT_METATABLENAME);
            return [LuaObjCClassGetObject(obj) UTF8String];
        }
        default:
        {
            return NULL;
        }
    }
}

int luaObjC_pushNSObject(lua_State *L, id nsObject)
{    
    if (nsObject)
    {
        LuaObjCClassInitialize(L, nsObject, nil, true);        
    }else 
    {
        lua_pushnil(L);
    }
    
    return 1;
}
