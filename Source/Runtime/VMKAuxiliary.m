//
//  VMKAuxiliary.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKAuxiliary.h"

#import "VMKObject.h"

const char * kVMKNSObjectMetaTableName = "com.veritas.vm.meta.NSObject";

const char * kVMKClassMetaTableName = "com.veritas.vm.meta.Class";

id VMKCheckObject(lua_State *L, int index)
{
    switch (lua_type(L, index))
    {
        case LUA_TNIL:
        {
            return nil;
        }
        case LUA_TSTRING:
        {
            return @( lua_tostring(L, index) );
        }
        case LUA_TUSERDATA:
        {
            void* obj = lua_touserdata(L, index);
            
            return VMKObjectGetObject(obj);
        }
        default:
        {
            return nil;
        }
    }
}

CFIndex VMKCheckInteger(lua_State *L, int index)
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

const char* VMKCheckString(lua_State *L, int index)
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
            VMKObjectRef obj = lua_touserdata(L, index);
            return [VMKObjectGetObject(obj) UTF8String];
        }
        default:
        {
            return NULL;
        }
    }
}

int VMKPushObject(lua_State *L, id nsObject, bool shouldStoreInPool, bool isClass)
{
    if (nsObject)
    {
        VMKObjectCreate(L, nsObject, isClass);
        
        if (shouldStoreInPool)
        {
            VMKObjectStoreInPool(L, nsObject);
        }
        
    }else
    {
        lua_pushnil(L);
    }
    
    return 1;
}

void VMKLoadGlobalFunctions(struct lua_State *L, const struct luaL_Reg *functions)
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

void VMKLoadGlobalFunctionsWithLength(lua_State *L, const luaL_Reg functions[], CFIndex count)
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

void VMKLoadCreateMetatable(lua_State *L, const char *name, const luaL_Reg methods[])
{
    luaL_newmetatable(L, name);
    lua_pushvalue(L, -1);  /* push metatable */
    lua_setfield(L, -2, "__index");  /* metatable.__index = metatable */
    luaL_setfuncs(L, methods, 0);  /* add file methods to new metatable */
    lua_pop(L, 1);  /* pop new metatable */
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