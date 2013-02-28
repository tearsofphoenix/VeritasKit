//
//  LuaNSObjectSupport.m
//  LuaIOS
//
//  Created by LeixSnake on 8/2/12.
//
//

#include "VMKObject.h"

#include "VMKClass.h"
#include "VMKAuxiliary.h"
#include "VMKIndexing.h"
#include "VMKRuntime.h"
#include "VMKFunctions.h"

#include <objc/runtime.h>
#include <pthread.h>

#pragma mark - Object observer

struct __VMKObject
{
    id _obj;
    VMKLuaStateRef _luaState;
    
#if VMK_DEBUG
    Boolean _isClass;
    const char *_className;
#endif
    
};

VMKObjectRef VMKObjectCreate(VMKLuaStateRef state, id rawObject, Boolean isClass)
{
    VMKObjectRef objRef = lua_newuserdata(state, sizeof *objRef );
    
    objRef->_luaState = state;
    objRef->_obj = rawObject;
    
#if VMK_DEBUG
    objRef->_isClass = isClass;
    objRef->_className = object_getClassName(rawObject);
#endif
    
    if (isClass)
    {
        luaL_getmetatable(state, kVMKClassMetaTableName);
    }else
    {
        luaL_getmetatable(state, kVMKNSObjectMetaTableName);
    }
    
    lua_setmetatable(state, -2);
    
    return objRef;
}

id VMKObjectGetObject(VMKObjectRef ref)
{
    if (ref)
    {
        return ref->_obj;
    }
    return nil;
}

#pragma mark - meta methods of object observer
// `__tostring'
//
static int _VMKObjectDescription(VMKLuaStateRef state)
{
    VMKObjectRef obj = lua_touserdata(state, 1);
    NSString *description = [VMKObjectGetObject(obj) description];
    lua_pushstring(state, [description UTF8String]);
    
    return 1;
}

// `__eq'
//
static int _VMKObjectIsEqual(VMKLuaStateRef state)
{
    id obj1 = VMKCheckObject(state, 1);
    id obj2 = VMKCheckObject(state, 2);
    lua_pushboolean(state, CFEqual(obj1, obj2));
    
    return 1;
}

// `__index'
//
static int _VMKObjectIndex(VMKLuaStateRef state)
{
    id obj = VMKCheckObject(state, 1);
    
    if ([obj respondsToSelector: @selector(indexObjectWithState:)])
    {
        [obj indexObjectWithState: state];
        return 1;
        
    }else
    {
        luaL_error(state, "exception: unsupported __index operation on object: %p!", obj);
        
        return 0;
    }
}

// `__newindex'
//
static int _VMKObjectNewIndex(VMKLuaStateRef state)
{
    id obj = VMKCheckObject(state, 1);
    
    if ([obj respondsToSelector: @selector(addObjectAtIndexWithState:)])
    {
        [obj addObjectAtIndexWithState: state];
        return 0;
    }else
    {
        luaL_error(state, "exception: unsupported __add operation on object: %p!", obj);
        
        return 0;
    }
}

// `__len'
//
static int _VMKObjectGetLength(VMKLuaStateRef state)
{
    id obj = VMKCheckObject(state, 1);
    
    if ([obj respondsToSelector: @selector(getLengthOfObjectWithState:)])
    {
        [obj getLengthOfObjectWithState: state];
        return 1;
        
    }else
    {
        return 0;
    }
}

// `__add'
//
static int _VMKObjectUnion(VMKLuaStateRef state)
{
    return 1;
}

// `__sub'
//
static int _VMKObjectSubtract(VMKLuaStateRef state)
{
    return 1;
}

// `__concat'
//
static int _VMKObjectConcat(VMKLuaStateRef state)
{
    id obj = VMKCheckObject(state, 1);
    
    if ([obj respondsToSelector: @selector(concatObjectWithState:)])
    {
        [obj concatObjectWithState: state];
        return 1;
    }else
    {
        return 0;
    }
}

static Class sNSBlockClass = Nil;

static Boolean VMKIsKindOfClass(id obj, Class theClass)
{
    Class iLooper = object_getClass(obj);
    while (iLooper)
    {
        if (iLooper == theClass)
        {
            return TRUE;
        }
        
        iLooper = class_getSuperclass(iLooper);
    }
    
    return FALSE;
}

// `__call'
//
static int _VMKObjectCall(VMKLuaStateRef state)
{
    //include the block
    //
    int argCount = lua_gettop(state);
    int returnCount = 1;
    
    id block = VMKCheckObject(state, 1);
    
    if (VMKIsKindOfClass(block, sNSBlockClass))
    {
        LuaClosureType clouserID = LuaInternalGetClosureIDOfBlock(block);
        
        lua_rawgeti(state, LUA_REGISTRYINDEX, clouserID);
        
        for (int iLooper = 2; iLooper < argCount + 1; ++iLooper)
        {
            switch (lua_type(state, iLooper))
            {
                case LUA_TNIL:
                {
                    lua_pushnil(state);
                    break;
                }
                case LUA_TBOOLEAN:
                {
                    lua_pushboolean(state, lua_toboolean(state, iLooper));
                    break;
                }
                case LUA_TLIGHTUSERDATA:
                case LUA_TUSERDATA:
                {
                    lua_pushlightuserdata(state, lua_touserdata(state, iLooper));
                    break;
                }
                case LUA_TNUMBER:
                {
                    lua_pushnumber(state, lua_tonumber(state, iLooper));
                    break;
                }
                case LUA_TSTRING:
                {
                    lua_pushstring(state, lua_tostring(state, iLooper));
                    break;
                }
                case LUA_TTABLE:
                case LUA_TFUNCTION:
                case LUA_TTHREAD:
                {
                    lua_pushvalue(state, iLooper);
                    break;
                }
                default:
                {
                    break;
                }
            }
        }
        
        if(lua_pcall(state, argCount - 1, returnCount, 0) != LUA_OK)
        {
            luaL_error(state, "error in call block object: %p", block);
        }
        
    }else
    {
        luaL_error(state, "exception: expect block object: %p!", block);
    }
    return returnCount;
}

// `__gc'
//
static int _VMKObjectGarbageCollection(VMKLuaStateRef state)
{
    VMKObjectRef objRef = lua_touserdata(state, 1);
        
    if (objRef)
    {
#if VMK_DEBUG
        //id obj = objRef->_obj;
        //NSLog(@"gc object: %p className: %s isClass: %s\n", obj, objRef->_className, objRef->_isClass ? "YES" : "NO");
#endif
    }
    
    return 0;
}

static const luaL_Reg LuaNS_ObjectMethods[] =
{
    {"__tostring", _VMKObjectDescription},
    {"__gc", _VMKObjectGarbageCollection},
    {"__index", _VMKObjectIndex},
    {"__newindex", _VMKObjectNewIndex},
    {"__len", _VMKObjectGetLength},
    {"__eq", _VMKObjectIsEqual},
    {"__add", _VMKObjectUnion},
    {"__sub", _VMKObjectSubtract},
    {"__concat", _VMKObjectConcat},
    {"__call", _VMKObjectCall},
    
    {NULL, NULL}
};

static const luaL_Reg LuaNS_ClassMethods[] =
{
    {"__tostring", _VMKObjectDescription},
    {"__eq", _VMKObjectIsEqual},
    
    {NULL, NULL}
};


int VMKOpenNSObjectExtensionSupport(VMKLuaStateRef state)
{
    if (!sNSBlockClass)
    {        
        sNSBlockClass = objc_getClass("NSBlock");
    }
    
    VMKTypeEncodingInitialize();
    
    VMKOpenNSFunctions(state);
    
    VMKCreateMetatable(state, kVMKNSObjectMetaTableName, LuaNS_ObjectMethods);
    
    VMKCreateMetatable(state, kVMKClassMetaTableName, LuaNS_ClassMethods);
    
    return 0;
}

