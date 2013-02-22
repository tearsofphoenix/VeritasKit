//
//  VMKBridgeFunctor.m
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKBridgeFunctor.h"
#import "VMKBase.h"

#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE
#import "ffi.h"
#else
#import <ffi/ffi.h>
#endif

#import "VMKBridgeInfo.h"
#import "VMKAuxiliary.h"

#import <dlfcn.h>
#import <objc/runtime.h>

static ffi_type * _luaBridgeInternal_typeOfEncoding(const char *encoding)
{
    switch (*encoding)
    {
        case _C_CHR:
        {
            return  &ffi_type_schar;
        }
        case _C_INT:
        {
            return &ffi_type_sint;
        }
        case _C_SHT:
        {
            return &ffi_type_sshort;
        }
        case _C_LNG:
        {
            return &ffi_type_slong;
        }
        case _C_LNG_LNG:
        {
            return &ffi_type_longdouble;
        }
        case _C_UCHR:
        {
            return &ffi_type_uchar;
        }
        case _C_UINT:
        {
            return &ffi_type_uint;
        }
        case _C_USHT:
        {
            return &ffi_type_ushort;
        }
        case _C_ULNG:
        {
            return &ffi_type_ulong;
        }
        case _C_ULNG_LNG:
        {
            //Notice here, but this will be rarely used
            //
            return &ffi_type_longdouble;
        }
        case _C_BOOL:
        {
            return &ffi_type_uchar;
        }
        case _C_FLT:
        {
            return &ffi_type_float;
        }
        case _C_DBL:
        {
            return &ffi_type_double;
        }
        case _C_CHARPTR:
        case _C_CLASS:
        case _C_ID:
        case _C_SEL:
        case _C_PTR:
        case _C_ARY_B:
        {
            return &ffi_type_pointer;
        }
        case _C_STRUCT_B:
        {
            //TODO
            //
        }
        case _C_VOID:
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

const char * VMKBridgeFuncotrMetaName = "com.veritas.luaobjc.internal.bridge-functor";

struct VMKBridgeFuncotr
{
    //real function pointer
    //
    void *_functionPointer;
    
    //arguments
    //
    ffi_type **_argumentTypes;
    NSArray *_argumentTypeEncodings;
    void **_arguments;
    NSUInteger _argumentCount;
    
    //return type
    //
    ffi_type *_returnType;
    const char *_returnValueEncoding;
    void *_returnValue;
    int _returnCount;
    
    //c-interface
    //
    ffi_cif _cif;
    
};

VMKBridgeFuncotrRef VMKBridgeFunctorCreate(VMKLuaStateRef state,
                                           NSString * name,
                                           NSArray *argumentTypeEncodings,
                                           const char *returnEncoding)
{
    VMKBridgeFuncotrRef returnValue = lua_newuserdata(state, sizeof(struct VMKBridgeFuncotr));
    returnValue->_functionPointer = dlsym(RTLD_DEFAULT, [name UTF8String]);
    
    VMKBridgeFunctorInitialize(returnValue, argumentTypeEncodings, returnEncoding);
    
    luaL_getmetatable(state, VMKBridgeFuncotrMetaName);
    lua_setmetatable(state, -2);
    
    return returnValue;
}

static int VMKBridgeFunctorInvoke(VMKLuaStateRef state)
{
    VMKBridgeFuncotrRef ref = luaL_checkudata(state, 1, VMKBridgeFuncotrMetaName);
    
    [ref->_argumentTypeEncodings enumerateObjectsUsingBlock:
     (^(NSString *encoding, NSUInteger idx, BOOL *stop)
      {
          VMKInvocationSetArgumentFromLuaStateAtInex(ref, state, (int)idx + 1 + 1, [encoding UTF8String], idx);
      })];
    
    VMKInvoke(state, ref);
    
    return ref->_returnCount;
}

static int VMKBridgeFunctorFinalize(VMKLuaStateRef state)
{
    VMKBridgeFuncotrRef ref = luaL_checkudata(state, 1, VMKBridgeFuncotrMetaName);
    VMKFunctorFinalize(ref);
    return 0;
}

static const luaL_Reg __LuaObjCBridgeSupportFunctions[] =
{
    {NULL, NULL}
};

static const luaL_Reg __LuaObjCBridgeSupportMetaMethods[] =
{
    //not gc bridge functor yet
    //
    //{"__gc", VMKBridgeFunctorFinalize},
    {"__call", VMKBridgeFunctorInvoke},
    {NULL, NULL}
};

int LuaInternalOpenBridgeFunctorSupport(VMKLuaStateRef state)
{
    luaL_newlib(state, __LuaObjCBridgeSupportFunctions);
    VMKLoadCreateMetatable(state, VMKBridgeFuncotrMetaName, __LuaObjCBridgeSupportMetaMethods);
    return 1;
}

#pragma mark - objc

void VMKBridgeFunctorInitialize(VMKBridgeFuncotrRef functorRef,
                                NSArray *argumentTypeEncodings,
                                const char *returnEncoding)
{
    if (functorRef)
    {
        uint argumentCount = (uint)[argumentTypeEncodings count];
        functorRef->_argumentCount = argumentCount;
        if (argumentCount > 0)
        {
            ffi_type ** argumentTypes = malloc(sizeof(ffi_type *) * argumentCount);
            void **args = malloc(sizeof(void *) * argumentCount);
            
            [argumentTypeEncodings enumerateObjectsUsingBlock: (^(NSString *encoding, NSUInteger idx, BOOL *stop)
                                                                {
                                                                    const char *encodingLooper = [encoding UTF8String];
                                                                    argumentTypes[idx] = _luaBridgeInternal_typeOfEncoding(encodingLooper);
                                                                    args[idx] = malloc(argumentTypes[idx]->size);
                                                                })];
            functorRef->_arguments = args;
            functorRef->_argumentTypes = argumentTypes;
            functorRef->_argumentTypeEncodings = [argumentTypeEncodings retain];
        }else
        {
            functorRef->_arguments = NULL;
            functorRef->_argumentTypes[0] = &ffi_type_void;
            functorRef->_argumentTypeEncodings = @[@"v"];
        }
        
        if (!returnEncoding)
        {
            functorRef->_returnType = &ffi_type_void;
            functorRef->_returnValue = NULL;
            functorRef->_returnCount = 0;
            functorRef->_returnValueEncoding = NULL;
        }else
        {
            functorRef->_returnValueEncoding = strdup(returnEncoding);
            functorRef->_returnType = _luaBridgeInternal_typeOfEncoding(returnEncoding);
            functorRef->_returnValue = malloc(functorRef->_returnType->size);
            functorRef->_returnCount = 1;
            if (functorRef->_returnType == &ffi_type_void)
            {
                functorRef->_returnCount = 0;
            }
        }
        
        ffi_status status = ffi_prep_cif(&(functorRef->_cif),
                                         FFI_DEFAULT_ABI,
                                         argumentCount,
                                         functorRef->_returnType,
                                         functorRef->_argumentTypes);
        if (status != FFI_OK)
        {
            printf("fail to create c interface.\n");
        }
        
    }
}

VMKBridgeFuncotrRef VMKInvocationCreate(void *functionPointer)
{
    VMKBridgeFuncotrRef functor = malloc(sizeof(struct VMKBridgeFuncotr));
    functor->_functionPointer = functionPointer;
    return functor;
}

void VMKInvoke(VMKLuaStateRef state, VMKBridgeFuncotrRef ref)
{
    if (ref)
    {
        ffi_call(&(ref->_cif), ref->_functionPointer, ref->_returnValue, ref->_arguments);
        
        const char *returnValueEncoding = ref->_returnValueEncoding;
        if (!returnValueEncoding)
        {
            return;
        }
        
        switch (*returnValueEncoding)
        {
            case _C_CHR:
            {
                lua_pushinteger(state, *(char*)ref->_returnValue);
                break;
            }
            case _C_INT:
            {
                lua_pushinteger(state, *(int*)ref->_returnValue);
                break;
            }
            case _C_SHT:
            {
                lua_pushinteger(state, *(short*)ref->_returnValue);
                break;
            }
            case _C_LNG:
            {
                lua_pushinteger(state, *(long*)ref->_returnValue);
                break;
            }
            case _C_LNG_LNG:
            {
                lua_pushnumber(state, *(long double*)ref->_returnValue);
                break;
            }
            case _C_UCHR:
            {
                lua_pushinteger(state, *(unsigned char*)ref->_returnValue);
                break;
            }
            case _C_UINT:
            {
                lua_pushinteger(state, *(unsigned int*)ref->_returnValue);
                break;
            }
            case _C_USHT:
            {
                lua_pushinteger(state, *(unsigned short*)ref->_returnValue);
                break;
            }
            case _C_ULNG:
            {
                lua_pushinteger(state, *(unsigned long*)ref->_returnValue);
                break;
            }
            case _C_ULNG_LNG:
            {
                //Notice here, but this will be rarely used
                //
                lua_pushnumber(state, *(long double*)ref->_returnValue);
                break;
            }
            case _C_BOOL:
            {
                lua_pushboolean(state, *(char*)ref->_returnValue);
                break;
            }
            case _C_FLT:
            {
                lua_pushnumber(state, *(float*)ref->_returnValue);
                break;
            }
            case _C_DBL:
            {
                lua_pushnumber(state, *(double*)ref->_returnValue);
                break;
            }
            case _C_CHARPTR:
            {
                lua_pushstring(state, *(const char**)ref->_returnValue);
                break;
            }
            case _C_SEL:
            {
                SEL selector = *(SEL *)ref->_returnValue;
                VMKPushSelector(state, selector);
                break;
            }
            case _C_CLASS:
            {
                VMKPushObject(state, *(id *)ref->_returnValue, true, true);
                break;
            }
            case _C_ID:
            {
                VMKPushObject(state, *(id *)ref->_returnValue, true, false);
                break;
            }
            case _C_PTR:
            case _C_ARY_B:
            {
                lua_pushlightuserdata(state,  *(void* *)ref->_returnValue);
                break;
            }
            case _C_STRUCT_B:
            {
                //TODO
                //
            }
            case _C_VOID:
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

void VMKFunctorFinalize(VMKBridgeFuncotrRef ref)
{
    if (ref)
    {
        free(ref->_argumentTypes);
        
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
        
        [ref->_argumentTypeEncodings release];
        
        free(ref->_returnValue);
        
        free((void *)ref->_returnValueEncoding);
        
    }
}

void VMKInvocationSetArgumentAtInex(VMKBridgeFuncotrRef ref, int index, void *value)
{
    *(void **)ref->_arguments[index] = value;
}

void VMKInvocationSetArgumentFromLuaStateAtInex(VMKBridgeFuncotrRef ref,
                                                    VMKLuaStateRef state,
                                                    int index,
                                                    const char *encoding,
                                                    NSUInteger iLooper)
{
    void **arguments = ref->_arguments;
    switch (*encoding)
    {
        case _C_CHR:
        {
            *(char*)arguments[iLooper] = lua_tointeger(state, index);
            break;
        }
        case _C_INT:
        {
            *(int*)arguments[iLooper] = (int)lua_tointeger(state, index);
            break;
        }
        case _C_SHT:
        {
            *(short*)arguments[iLooper] = lua_tointeger(state, index);
            break;
        }
        case _C_LNG:
        {
            *(long*)arguments[iLooper] = lua_tointeger(state, index);
            break;
        }
        case _C_LNG_LNG:
        {
            *(long double*)arguments[iLooper] = lua_tointeger(state, index);
            break;
        }
        case _C_UCHR:
        {
            *(unsigned char*)arguments[iLooper] = lua_tointeger(state, index);
            break;
        }
        case _C_UINT:
        {
            *(unsigned int*)arguments[iLooper] = (unsigned int)lua_tointeger(state, index);
            break;
        }
        case _C_USHT:
        {
            *(unsigned short*)arguments[iLooper] = lua_tointeger(state, index);
            break;
        }
        case _C_ULNG:
        {
            *(unsigned long*)arguments[iLooper] = lua_tointeger(state, index);
            break;
        }
        case _C_ULNG_LNG:
        {
            //Notice here, but this will be rarely used
            //
            *(long double*)arguments[iLooper] = lua_tointeger(state, index);
            break;
        }
        case _C_BOOL:
        {
            *(unsigned char*)arguments[iLooper] = lua_tointeger(state, index);
            break;
        }
        case _C_FLT:
        {
            *(float*)arguments[iLooper] = lua_tonumber(state, index);
            break;
        }
        case _C_DBL:
        {
            *(double*)arguments[iLooper] = lua_tonumber(state, index);
            break;
        }
        case _C_CHARPTR:
        case _C_SEL:
        {
            *(const char **)arguments[iLooper] = lua_tostring(state, index);
            break;
        }
        case _C_CLASS:
        {
            *(id *)arguments[iLooper] = VMKCheckObject(state, index);
            break;
        }
        case _C_ID:
        {
            id obj = VMKCheckObject(state, index);
            *(id *)arguments[iLooper] = [obj retain];
            break;
        }
        case _C_PTR:
        case _C_ARY_B:
        {
            *(void **)arguments[iLooper] = lua_touserdata(state, index);
            break;
        }
        case _C_STRUCT_B:
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
