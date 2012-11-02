//
//  LuaBridgeFunctor.m
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaBridgeFunctor.h"
#import "LuaObjCBase.h"

#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE
#import "ffi.h"
#else
#import <ffi/ffi.h>
#endif

#import "LuaBridgeInfo.h"
#import "LuaObjCAuxiliary.h"

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

const char * LuaBridgeFuncotrMetaName = "com.veritas.luaobjc.internal.bridge-functor";

struct LuaBridgeFuncotr
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
    
    [ref->_argumentTypeEncodings enumerateObjectsUsingBlock:
     (^(NSString *encoding, NSUInteger idx, BOOL *stop)
      {
          LuaObjCInvocationSetArgumentFromLuaStateAtInex(ref, L, (int)idx + 1 + 1, [encoding UTF8String], idx);
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
    //not gc bridge functor yet
    //
    //{"__gc", LuaBridgeFunctorFinalize},
    {"__call", LuaBridgeFunctorInvoke},
    {NULL, NULL}
};

int LuaInternalOpenBridgeFunctorSupport(struct lua_State *L)
{
    luaL_newlib(L, __LuaObjCBridgeSupportFunctions);
    LuaObjCLoadCreateMetatable(L, LuaBridgeFuncotrMetaName, __LuaObjCBridgeSupportMetaMethods);
    return 1;
}

#pragma mark - objc

void LuaBridgeFunctorInitialize(LuaBridgeFuncotrRef functorRef,
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
        if (!returnValueEncoding)
        {
            return;
        }
        
        switch (*returnValueEncoding)
        {
            case _C_CHR:
            {
                lua_pushinteger(L, *(char*)ref->_returnValue);
                break;
            }
            case _C_INT:
            {
                lua_pushinteger(L, *(int*)ref->_returnValue);
                break;
            }
            case _C_SHT:
            {
                lua_pushinteger(L, *(short*)ref->_returnValue);
                break;
            }
            case _C_LNG:
            {
                lua_pushinteger(L, *(long*)ref->_returnValue);
                break;
            }
            case _C_LNG_LNG:
            {
                lua_pushnumber(L, *(long double*)ref->_returnValue);
                break;
            }
            case _C_UCHR:
            {
                lua_pushinteger(L, *(unsigned char*)ref->_returnValue);
                break;
            }
            case _C_UINT:
            {
                lua_pushinteger(L, *(unsigned int*)ref->_returnValue);
                break;
            }
            case _C_USHT:
            {
                lua_pushinteger(L, *(unsigned short*)ref->_returnValue);
                break;
            }
            case _C_ULNG:
            {
                lua_pushinteger(L, *(unsigned long*)ref->_returnValue);
                break;
            }
            case _C_ULNG_LNG:
            {
                //Notice here, but this will be rarely used
                //
                lua_pushnumber(L, *(long double*)ref->_returnValue);
                break;
            }
            case _C_BOOL:
            {
                lua_pushboolean(L, *(char*)ref->_returnValue);
                break;
            }
            case _C_FLT:
            {
                lua_pushnumber(L, *(float*)ref->_returnValue);
                break;
            }
            case _C_DBL:
            {
                lua_pushnumber(L, *(double*)ref->_returnValue);
                break;
            }
            case _C_CHARPTR:
            {
                lua_pushstring(L, *(const char**)ref->_returnValue);
                break;
            }
            case _C_SEL:
            {
                SEL selector = *(SEL *)ref->_returnValue;
                LuaObjCPushSelector(L, selector);
                break;
            }
            case _C_CLASS:
            {
                LuaObjCPushObject(L, *(id *)ref->_returnValue, true, true);
                break;
            }
            case _C_ID:
            {
                LuaObjCPushObject(L, *(id *)ref->_returnValue, true, false);
                break;
            }
            case _C_PTR:
            case _C_ARY_B:
            {
                lua_pushlightuserdata(L,  *(void* *)ref->_returnValue);
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

void LuaObjCFunctorFinalize(LuaBridgeFuncotrRef ref)
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

void LuaObjCInvocationSetArgumentAtInex(LuaBridgeFuncotrRef ref, int index, void *value)
{
    *(void **)ref->_arguments[index] = value;
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
        case _C_CHR:
        {
            *(char*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case _C_INT:
        {
            *(int*)arguments[iLooper] = (int)lua_tointeger(L, index);
            break;
        }
        case _C_SHT:
        {
            *(short*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case _C_LNG:
        {
            *(long*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case _C_LNG_LNG:
        {
            *(long double*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case _C_UCHR:
        {
            *(unsigned char*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case _C_UINT:
        {
            *(unsigned int*)arguments[iLooper] = (unsigned int)lua_tointeger(L, index);
            break;
        }
        case _C_USHT:
        {
            *(unsigned short*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case _C_ULNG:
        {
            *(unsigned long*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case _C_ULNG_LNG:
        {
            //Notice here, but this will be rarely used
            //
            *(long double*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case _C_BOOL:
        {
            *(unsigned char*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case _C_FLT:
        {
            *(float*)arguments[iLooper] = lua_tonumber(L, index);
            break;
        }
        case _C_DBL:
        {
            *(double*)arguments[iLooper] = lua_tonumber(L, index);
            break;
        }
        case _C_CHARPTR:
        case _C_SEL:
        {
            *(const char **)arguments[iLooper] = lua_tostring(L, index);
            break;
        }
        case _C_CLASS:
        {
            *(id *)arguments[iLooper] = LuaObjCCheckObject(L, index);
            break;
        }
        case _C_ID:
        {
            id obj = LuaObjCCheckObject(L, index);
            *(id *)arguments[iLooper] = [obj retain];
            break;
        }
        case _C_PTR:
        case _C_ARY_B:
        {
            *(void **)arguments[iLooper] = lua_touserdata(L, index);
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
