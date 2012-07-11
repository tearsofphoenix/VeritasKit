//
//  LuaObjCAuxiliary.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCAuxiliary.h"

#import "LuaObjCClass.h"

#import "LuaObjCInternal.h"

#import "LuaObjCRecordTable.h"
#import "lua.h"
#import "lauxlib.h"
#import "luasdk_utilities.h"
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
        //if (!luaObjCWeakTableGetObjectInGlobalWeakTable(L, nsObject))
        {
            //lua_pop(L, 1);
            LuaObjCClassInitialize(L, nsObject, nil, true);        
            //luaObjCWeakTableInsertObjectInGlobalWeakTable(L, -1, nsObject);
        }
        
    }else 
    {
        lua_pushnil(L);
    }
    
    return 1;
}

// will create a new userdata container for the object and push it on the stack.
void LuaObjectBridge_CreateUserData(lua_State* lua_state, id the_object, bool should_retain, bool is_instance)
{
	// Create the new container
	LuaObjCClassInitialize(lua_state, the_object, nil, is_instance);
}

int luaObjC_getEncodeOfType(lua_State *L)
{
    const char* objCType = NULL;
    
    switch (lua_type(L, 1))
    {
        case LUA_TNONE:
        case LUA_TNIL:
        {
            objCType = @encode(void);
            break;
        }
        case LUA_TBOOLEAN:
        {
            objCType = @encode(bool);
            break;
        }
        case LUA_TLIGHTUSERDATA:
        {
            objCType = @encode(void*);
            break;
        }
        case LUA_TNUMBER:
        {
            objCType = @encode(CGFloat);
            break;
        }
        case LUA_TSTRING:
        {
            objCType = @encode(const char*);
            break;
        }
        case LUA_TTABLE:
        {
            //TODO
            break;
        }
        case LUA_TFUNCTION:
        {
            //TODO
            break;
        }
        case LUA_TUSERDATA:
        {
            objCType = @encode(void*);
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
    
    return luaObjC_pushNSObject(L, [NSString stringWithFormat: @"%s", objCType]);
}

void luaObjC_loadGlobalConstants(lua_State *L, const LuaSDKConst contants[])
{
    NSInteger iLooper = 0;
    LuaSDKConst constLooper = contants[iLooper];
    while (constLooper.str)
    {
        lua_pushinteger(L, constLooper.value);
        lua_setglobal(L, constLooper.str);
        
        ++iLooper;
        constLooper = contants[iLooper];
    }
    
}

void luaObjC_loadGlobalClasses(lua_State *L, const char* classList[])
{
    NSInteger iLooper = 0;
    const char* nameLooper = classList[iLooper];
    Class classLooper = nil;
    while (nameLooper)
    {
        classLooper = objc_getClass(nameLooper);
        
        luaObjC_pushNSObject(L, classLooper);
        lua_setglobal(L, nameLooper);
        
        ++iLooper;
        nameLooper = classList[iLooper];
    }
}

const char* luaObjc_gotoStartOfSourceAtLine(const char *source, int lineNumber)
{
    return [[[[NSString stringWithUTF8String: source] componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] objectAtIndex: lineNumber] UTF8String];
}

void luaObjCInternal_createmeta(lua_State *L, const char *name, const luaL_Reg methods[]) 
{
    luaL_newmetatable(L, name); 
    lua_pushvalue(L, -1);  /* push metatable */
    lua_setfield(L, -2, "__index");  /* metatable.__index = metatable */
    luaL_setfuncs(L, methods, 0);  /* add file methods to new metatable */
    lua_pop(L, 1);  /* pop new metatable */
}
