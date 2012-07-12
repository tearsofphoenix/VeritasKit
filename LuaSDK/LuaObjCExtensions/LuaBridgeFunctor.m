//
//  LuaBridgeFunctor.m
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaBridgeFunctor.h"
#import "ffi.h"
#import "lua.h"
#import "lauxlib.h"
#import "LuaBridgeInfo.h"
#import "LuaObjCAuxiliary.h"
#import <dlfcn.h>

static ffi_type * _luaBridgeInternal_typeOfEncoding(const char *encoding)
{
    switch (*encoding)
    {
        case 'c':
        {
            return  &ffi_type_schar;
        }
        case 'i':
        {
            return &ffi_type_sint;
        }
        case 's':
        {
            return &ffi_type_sshort;
        }
        case 'l':
        {
            return &ffi_type_slong;
        }
        case 'q':
        {
            return &ffi_type_longdouble;
        }
        case 'C':
        {
            return &ffi_type_uchar;
        }
        case 'I':
        {
            return &ffi_type_uint;
        }
        case 'S':
        {
            return &ffi_type_ushort;
        }
        case 'L':
        {
            return &ffi_type_ulong;
        }
        case 'Q':
        {
            //Notice here, but this will be rarely used
            //
            return &ffi_type_longdouble;
        }
        case 'B':
        {
            return &ffi_type_uchar;
        }
        case 'f':
        {
            return &ffi_type_float;
        }
        case 'd':
        {
            return &ffi_type_double;
        }
        case '*':
        case '#':
        case '@':
        case ':':
        case '^':
        case '[':
        {
            return &ffi_type_pointer;
        }
        case '{':
        {
            //TODO
            //
        }
        case 'v':
        case 'V': //"Vv"
        {
            return &ffi_type_void;
        }
        default:
        {
            return NULL;
        }
    }
}

const char * LuaBridgeFuncotrMetaName = "com.veritas.luaobjc.internal.bridge-functor";

struct LuaBridgeFuncotr
{
    void *_functionPointer;
    
    ffi_type **_argumentTypes;
    NSArray *_argumentTypeEncodings;
    void **_arguments;
    NSUInteger _argumentCount;
    
    ffi_type *_returnType;
    const char *_returnValueEncoding;
    void *_returnValue;
    NSUInteger _returnCount;
    
    ffi_cif _cif;
    
};

LuaBridgeFuncotrRef LuaBridgeFunctorCreate(lua_State *L,
                                           NSString * name,
                                           NSArray *argumentTypeEncodings,
                                           const char *returnEncoding)
{
    LuaBridgeFuncotrRef returnValue = lua_newuserdata(L, sizeof(struct LuaBridgeFuncotr));
    returnValue->_functionPointer = dlsym(RTLD_DEFAULT, [name UTF8String]);
    
    LuaBridgeFunctorInitialize(returnValue, argumentTypeEncodings, returnEncoding);
    
    luaL_getmetatable(L, LuaBridgeFuncotrMetaName);
    lua_setmetatable(L, -2);
    
    return returnValue;
}

static int LuaBridgeFunctorInvoke(lua_State *L)
{
    LuaBridgeFuncotrRef ref = luaL_checkudata(L, 1, LuaBridgeFuncotrMetaName);
    
    [ref->_argumentTypeEncodings enumerateObjectsUsingBlock: (^(NSString *encoding, NSUInteger idx, BOOL *stop)
                                                              {
                                                                  LuaObjCInvocationSetArgumentFromLuaStateAtInex(ref, L, idx, [encoding UTF8String], idx + 1 + 1);
                                                              })];
    
    LuaObjCInvoke(L, ref);
    return ref->_returnCount;
}

static int LuaBridgeFunctorFinalize(lua_State *L)
{
    LuaBridgeFuncotrRef ref = luaL_checkudata(L, 1, LuaBridgeFuncotrMetaName);
    LuaObjCFunctorFinalize(ref);
    return 0;
}

static const luaL_Reg __LuaObjCBridgeSupportFunctions[] =
{
    {NULL, NULL}
};

static const luaL_Reg __LuaObjCBridgeSupportMetaMethods[] =
{
    {"__gc", LuaBridgeFunctorFinalize},
    {"__call", LuaBridgeFunctorInvoke},
    {NULL, NULL}
};

int luaObjCInternal_openBridgeFunctor(struct lua_State *L)
{
    luaL_newlib(L, __LuaObjCBridgeSupportFunctions);
    luaObjCInternal_createmeta(L, LuaBridgeFuncotrMetaName, __LuaObjCBridgeSupportMetaMethods);
    return 1;
}

#pragma mark - objc

void LuaBridgeFunctorInitialize(LuaBridgeFuncotrRef returnValue,
                               NSArray *argumentTypeEncodings,
                               const char *returnEncoding)
{
    if (returnValue)
    {
        NSUInteger argumentCount = [argumentTypeEncodings count];
        returnValue->_argumentCount = argumentCount;
        if (argumentCount > 0)
        {
            ffi_type ** argumentTypes = malloc(sizeof(ffi_type *) * argumentCount);
            void **args = malloc(sizeof(void *) * argumentCount);
            
            [argumentTypeEncodings enumerateObjectsUsingBlock: (^(LuaBridgeArgumentInfo *encoding, NSUInteger idx, BOOL *stop)
                                                                {
                                                                    const char *encodingLooper = [[encoding type] UTF8String];
                                                                    argumentTypes[idx] = _luaBridgeInternal_typeOfEncoding(encodingLooper);
                                                                    args[idx] = malloc(argumentTypes[idx]->size);
                                                                })];
            returnValue->_arguments = args;
            returnValue->_argumentTypes = argumentTypes;
            returnValue->_argumentTypeEncodings = [argumentTypeEncodings retain];
        }else
        {
            returnValue->_arguments = NULL;
            returnValue->_argumentTypes = NULL;
            returnValue->_argumentTypes[0] = &ffi_type_void;
        }
        
        if (!returnEncoding)
        {
            returnValue->_returnType = &ffi_type_void;
            returnValue->_returnValue = NULL;
            returnValue->_returnCount = 0;
        }else
        {
            returnValue->_returnValueEncoding = strdup(returnEncoding);
            returnValue->_returnType = _luaBridgeInternal_typeOfEncoding(returnEncoding);
            returnValue->_returnValue = malloc(returnValue->_returnType->size);
            returnValue->_returnCount = 1;
            if (returnValue->_returnType == &ffi_type_void)
            {
                returnValue->_returnCount = 0;
            }
        }
        
        ffi_status status = ffi_prep_cif(&(returnValue->_cif),
                                         FFI_DEFAULT_ABI,
                                         argumentCount,
                                         returnValue->_returnType,
                                         returnValue->_argumentTypes);
        if (status == FFI_OK)
        {
            NSLog(@"ok");
        }

    }
}

LuaBridgeFuncotrRef LuaObjCInvocationCreate(void *functionPointer)
{
    LuaBridgeFuncotrRef functor = malloc(sizeof(struct LuaBridgeFuncotr));
    functor->_functionPointer = functionPointer;
    return functor;
}

void LuaObjCInvoke(struct lua_State *L,
                   LuaBridgeFuncotrRef ref)
{
    if (ref)
    {
        ffi_call(&(ref->_cif), ref->_functionPointer, ref->_returnValue, ref->_arguments);
        
        const char *returnValueEncoding = ref->_returnValueEncoding;
        switch (*returnValueEncoding)
        {
            case 'c':
            {
                lua_pushinteger(L, *(char*)ref->_returnValue);
                break;
            }
            case 'i':
            {
                lua_pushinteger(L, *(int*)ref->_returnValue);
                break;
            }
            case 's':
            {
                lua_pushinteger(L, *(short*)ref->_returnValue);
                break;
            }
            case 'l':
            {
                lua_pushinteger(L, *(long*)ref->_returnValue);
                break;
            }
            case 'q':
            {
                lua_pushnumber(L, *(long double*)ref->_returnValue);
                break;
            }
            case 'C':
            {
                lua_pushinteger(L, *(unsigned char*)ref->_returnValue);
                break;
            }
            case 'I':
            {
                lua_pushinteger(L, *(unsigned int*)ref->_returnValue);
                break;
            }
            case 'S':
            {
                lua_pushinteger(L, *(unsigned short*)ref->_returnValue);
                break;
            }
            case 'L':
            {
                lua_pushinteger(L, *(unsigned long*)ref->_returnValue);
                break;
            }
            case 'Q':
            {
                //Notice here, but this will be rarely used
                //
                lua_pushnumber(L, *(long double*)ref->_returnValue);
                break;
            }
            case 'B':
            {
                lua_pushboolean(L, *(char*)ref->_returnValue);
                break;
            }
            case 'f':
            {
                lua_pushnumber(L, *(float*)ref->_returnValue);
                break;
            }
            case 'd':
            {
                lua_pushnumber(L, *(double*)ref->_returnValue);
                break;
            }
            case '*':
            case '#':
            case '@':
            case ':':
            case '^':
            case '[':
            {
                lua_pushlightuserdata(L, ref->_returnValue);
                break;
            }
            case '{':
            {
                //TODO
                //
            }
            case 'v':
            case 'V': //"Vv"
            {
                break;
            }
            default:
            {
                break;
            }
        }
    }
}

void LuaObjCFunctorFinalize(LuaBridgeFuncotrRef ref)
{
    if (ref)
    {
        printf("in function: %s line: %d\n", __func__, __LINE__);
        
        if (ref->_argumentTypes)
        {
            free(ref->_argumentTypes);
        }
        
        void **arguments = ref->_arguments;
        if (arguments)
        {
            NSUInteger argumentCount = ref->_argumentCount;
            for (NSUInteger iLooper = 0; iLooper < argumentCount; ++iLooper)
            {
                free(arguments[iLooper]);
            }
            free(arguments);
        }
        
        if (ref->_argumentTypeEncodings)
        {
            free(ref->_argumentTypeEncodings);
        }
        
        if (ref->_returnValue)
        {
            free(ref->_returnValue);
        }
        
        //free(ref);
    }
}

void LuaObjCInvocationSetArgumentAtInex(LuaBridgeFuncotrRef ref, int index, void *value)
{
    ref->_arguments[index] = value;
}

void LuaObjCInvocationSetArgumentFromLuaStateAtInex(LuaBridgeFuncotrRef ref,
                                                    struct lua_State *L,
                                                    int index,
                                                    const char *encoding,
                                                    NSUInteger iLooper)
{
    void **arguments = ref->_arguments;
    switch (*encoding)
    {
        case 'c':
        {
            *(char*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'i':
        {
            *(int*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 's':
        {
            *(short*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'l':
        {
            *(long*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'q':
        {
            *(long double*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'C':
        {
            *(unsigned char*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'I':
        {
            *(unsigned int*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'S':
        {
            *(unsigned short*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'L':
        {
            *(unsigned long*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'Q':
        {
            //Notice here, but this will be rarely used
            //
            *(long double*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'B':
        {
            *(unsigned char*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'f':
        {
            *(float*)arguments[iLooper] = lua_tonumber(L, index);
            break;
        }
        case 'd':
        {
            *(double*)arguments[iLooper] = lua_tonumber(L, index);
            break;
        }
        case '*':
        case ':':
        {
            *(const char **)arguments[iLooper] = lua_tostring(L, index);
            break;
        }
        case '#':
        {
            arguments[iLooper] = luaObjC_checkNSObject(L, index);
            break;
        }
        case '@':
        {
            id obj = luaObjC_checkNSObject(L, index);
            arguments[iLooper] = [obj retain];
            break;
        }
        case '^':
        case '[':
        {
            arguments[iLooper] = lua_touserdata(L, index);
            break;
        }
        case '{':
        {
            //TODO
            //
            break;
        }
        default:
        {
            break;
        }
    }
}
