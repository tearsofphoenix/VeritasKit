//
//  VMKAuxiliary.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "VMKAuxiliary.h"
#include "VMKObject.h"

const char * kVMKNSObjectMetaTableName = "com.veritas.vm.meta.NSObject";

const char * kVMKClassMetaTableName = "com.veritas.vm.meta.Class";

id VMKCheckObject(VMKLuaStateRef state, int index)
{
    switch (lua_type(state, index))
    {
        case LUA_TNIL:
        {
            return nil;
        }
        case LUA_TSTRING:
        {
            return @( lua_tostring(state, index) );
        }
        case LUA_TUSERDATA:
        {
            void* obj = lua_touserdata(state, index);
            
            return VMKObjectGetObject(obj);
        }
        default:
        {
            return nil;
        }
    }
}

CFIndex VMKCheckInteger(VMKLuaStateRef state, int index)
{
    switch (lua_type(state, index))
    {
        case LUA_TNIL:
        {
            return 0;
        }
        case LUA_TBOOLEAN:
        {
            return lua_toboolean(state, index);
        }
        case LUA_TNUMBER:
        {
            return lua_tointeger(state, index);
        }
        default:
        {
            lua_error(state);
            return 0;
        }
    }
}

const char* VMKCheckString(VMKLuaStateRef state, int index)
{
    switch (lua_type(state, index))
    {
        case LUA_TNIL:
        {
            return NULL;
        }
        case LUA_TSTRING:
        {
            return lua_tostring(state, index);
        }
        case LUA_TUSERDATA:
        {
            VMKObjectRef obj = lua_touserdata(state, index);
            return [VMKObjectGetObject(obj) UTF8String];
        }
        default:
        {
            return NULL;
        }
    }
}

int VMKPushObject(VMKLuaStateRef state, id nsObject, bool shouldStoreInPool, bool isClass)
{
    if (nsObject)
    {
        VMKObjectCreate(state, nsObject, isClass);
        
        if (shouldStoreInPool)
        {
            VMKObjectStoreInPool(state, nsObject);
        }
        
    }else
    {
        lua_pushnil(state);
    }
    
    return 1;
}

void VMKLoadGlobalFunctions(VMKLuaStateRef state, const struct luaL_Reg *functions)
{
    if (functions)
    {
        luaL_Reg regLooper;
        NSInteger iLooper = 0;
        while ((regLooper = functions[iLooper], regLooper.func && regLooper.name))
        {
            lua_pushcfunction(state, regLooper.func);
            lua_setglobal(state, regLooper.name);
            ++iLooper;
        }
    }
}

void VMKLoadGlobalFunctionsWithLength(VMKLuaStateRef state, const luaL_Reg functions[], CFIndex count)
{
    NSUInteger iLooper = 0;
    luaL_Reg reg;
    for (iLooper = 0; iLooper < count; ++iLooper)
    {
        reg = functions[iLooper];
        if (reg.func && reg.name)
        {
            lua_pushcfunction(state, reg.func);
            lua_setglobal(state, reg.name);
        }
    }
}

void VMKLoadCreateMetatable(VMKLuaStateRef state, const char *name, const luaL_Reg methods[])
{
    luaL_newmetatable(state, name);
    lua_pushvalue(state, -1);  /* push metatable */
    lua_setfield(state, -2, "__index");  /* metatable.__index = metatable */
    luaL_setfuncs(state, methods, 0);  /* add file methods to new metatable */
    lua_pop(state, 1);  /* pop new metatable */
}

const char *VMKCopyUTF8StringFromString(CFStringRef str)
{
    CFIndex length = CFStringGetLength(str);
    
    CFIndex maxSize = CFStringGetMaximumSizeForEncoding(length, kCFStringEncodingUTF8);
    
    char *buffer = (char *)malloc(maxSize);
    
    if(!CFStringGetCString(str, buffer, maxSize, kCFStringEncodingUTF8))
    {
        free(buffer);
        buffer = NULL;
    }
    
    return buffer;
}