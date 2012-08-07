//
//  LuaBridgeFunctor.m
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaBridgeFunctor.h"

#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE
#import "ffi.h"
#else
#import <ffi.h>
#endif

#import "lua.h"
#import "lauxlib.h"
#import "LuaBridgeInfo.h"
#import "LuaObjCAuxiliary.h"
#import "LuaObjCInternal.h"
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
    int _returnCount;
    
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
        uint argumentCount = (uint)[argumentTypeEncodings count];
        returnValue->_argumentCount = argumentCount;
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
            returnValue->_returnValueEncoding = NULL;
        }else
        {
            char *dupString = malloc(sizeof(char) * strlen(returnEncoding));
            strcpy(dupString, returnEncoding);
            returnValue->_returnValueEncoding = dupString;
            returnValue->_returnType = _luaBridgeInternal_typeOfEncoding(returnEncoding);
            if (returnValue->_returnType == &ffi_type_void)
            {
                returnValue->_returnCount = 0;
                returnValue->_returnValue = NULL;
            }else 
            {
                returnValue->_returnValue = malloc(returnValue->_returnType->size);
                returnValue->_returnCount = 1;
            }
        }
        
        ffi_status status = ffi_prep_cif(&(returnValue->_cif),
                                         FFI_DEFAULT_ABI,
                                         argumentCount,
                                         returnValue->_returnType,
                                         returnValue->_argumentTypes);
        switch (status)
        {
            case FFI_OK:
            {
                printf("\t\t\t--------------ok-------------\n");
                break;
            }   
            case FFI_BAD_ABI:
            {
                printf("\t\t\t----------bad-abi-------------\n");
                break;
            }
            case FFI_BAD_TYPEDEF:
            {
                printf("\t\t\t----------bad-typedef-------------\n");
                break;
            }
            default:
            {
                break;
            }
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
            {
                lua_pushstring(L, *(const char**)ref->_returnValue);
                break;
            }
            case ':':
            {
                SEL selector = *(SEL *)ref->_returnValue;
                luaObjC_pushSelector(L, selector);
                break;
            }
            case '#':
            case '@':
            {
                luaObjC_pushNSObject(L, *(id *)ref->_returnValue);
                break;
            }
            case '^':
            case '[':
            {
                lua_pushlightuserdata(L,  *(void* *)ref->_returnValue);
                break;
            }
            case '{':
            {
                //TODO
                //
                break;
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
        case 'c':
        {
            *(char*)arguments[iLooper] = lua_tointeger(L, index);
            break;
        }
        case 'i':
        {
            *(int*)arguments[iLooper] = (int)lua_tointeger(L, index);
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
            *(unsigned int*)arguments[iLooper] = (unsigned int)lua_tointeger(L, index);
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
        {
            const char *str = lua_tostring(L, index);
            //printf("in function: %s line: %d string: %s\n", __FUNCTION__, __LINE__, str);
            *(const char **)arguments[iLooper] = strdup(str);
            break;
        }
        case ':':
        {
            const char *str = lua_tostring(L, index);
            //printf("in function: %s line: %d string: %s\n", __FUNCTION__, __LINE__, str);
            *(SEL *)arguments[iLooper] = sel_getUid(str);
            break;
        }
        case '#':
        {
            *(id *)arguments[iLooper] = luaObjC_checkNSObject(L, index);
            break;
        }
        case '@':
        {
            id obj = luaObjC_checkNSObject(L, index);
            *(id *)arguments[iLooper] = [obj retain];
            break;
        }
        case '^':
        case '[':
        {
            *(void **)arguments[iLooper] = lua_touserdata(L, index);
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
