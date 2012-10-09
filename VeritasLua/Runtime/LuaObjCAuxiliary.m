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

#import "lauxlib.h"

const char * LUA_NSOBJECT_METATABLENAME = "com.veritas.vm.meta.NSObject";

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
            return [NSString stringWithUTF8String: lua_tostring(L, index)];
        }
        case LUA_TUSERDATA:
        {
            void* obj = luaL_testudata(L, index, LUA_NSOBJECT_METATABLENAME);
            
            return LuaObjectGetObject(obj);
        }
        default:
        {
            return nil;
        }
    }
}

NSInteger luaObjC_checkInteger(lua_State *L, int index)
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
            LuaObjectRef obj = luaL_checkudata(L, index, LUA_NSOBJECT_METATABLENAME);
            return [LuaObjectGetObject(obj) UTF8String];
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
        LuaObjectCreate(L, nsObject);
    }else
    {
        lua_pushnil(L);
    }
    
    return 1;
}

void LuaObjCLoadGlobalFunctions(struct lua_State *L, const struct luaL_Reg *functions)
{
    if (functions)
    {
        luaL_Reg regLooper;
        NSInteger iLooper = 0;
        while ((regLooper = functions[iLooper], regLooper.func && regLooper.name))
        {
            lua_pushcfunction(L, regLooper.func);
            lua_setglobal(L, regLooper.name);
            ++iLooper;
        }
    }
}

void LuaObjCLoadGlobalFunctionsWithLength(lua_State *L, const luaL_Reg functions[], NSUInteger count)
{
    NSUInteger iLooper = 0;
    luaL_Reg reg;
    for (iLooper = 0; iLooper < count; ++iLooper)
    {
        reg = functions[iLooper];
        if (reg.func && reg.name)
        {
            lua_pushcfunction(L, reg.func);
            lua_setglobal(L, reg.name);
        }
    }
}

void LuaObjC_createMetatable(lua_State *L, const char *name, const luaL_Reg methods[])
{
    luaL_newmetatable(L, name);
    lua_pushvalue(L, -1);  /* push metatable */
    lua_setfield(L, -2, "__index");  /* metatable.__index = metatable */
    luaL_setfuncs(L, methods, 0);  /* add file methods to new metatable */
    lua_pop(L, 1);  /* pop new metatable */
}
