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

const char * LuaBridgeFuncotrMetaName = "com.veritas.luaobjc.internal.bridge-functor";

struct LuaBridgeFuncotr 
{
    void *_functionPointer;
    ffi_type **_argumentTypes;
    char *_argumentTypeEncodings;
    void **_arguments;
    NSUInteger _argumentCount;
    ffi_type *_returnType;
    void *_returnValue;
    char _returnValueEncoding;
    ffi_cif _cif;
    
};

static void _luaBridgeFunctor_parseStructEncoding(const char *encoding)
{
    const char* charLooper = encoding;
    while (*charLooper != '=')
    {
        ++charLooper;
    }
    
    ++charLooper;
    
    while (*charLooper)
    {
        switch (*charLooper)
        {
            case '\'':
            {
                while (*charLooper != '\'')
                {
                    ++charLooper;
                }
                
                ++charLooper;
                
                break;
            }
            case 'c':
            {

                break;
            }
            case 'i':
            {

                break;
            }
            case 's':
            {

                break;
            }
            case 'l':
            {

                break;
            }
            case 'q':
            {

                break;
            }
            case 'C':
            {

                break;
            }
            case 'I':
            {

                break;
            }
            case 'S':
            {

                break;
            }
            case 'L':
            {

                break;
            }
            case 'Q':
            {
                //Notice here, but this will be rarely used
                //
                break;
            }
            case 'B':
            {
                break;
            }
            case 'f':
            {
                break;
            }
            case 'd':
            {
                break;
            }
            case '*':
            case '#':
            case '@':
            case ':':
            case '^':
            case '[':
            {
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
                ++charLooper;
                break;
            }
        }
    }
}

LuaBridgeFuncotrRef LuaBridgeFuncotrCreate(lua_State *L,
                                           NSString * name, 
                                           NSArray *argumentTypeEncodings, 
                                           NSString *returnEncoding)
{
    LuaBridgeFuncotrRef returnValue = lua_newuserdata(L, sizeof(struct LuaBridgeFuncotr));
    returnValue->_functionPointer = dlsym(RTLD_DEFAULT, [name UTF8String]);
    NSUInteger argumentCount = [argumentTypeEncodings count];
    returnValue->_argumentCount = argumentCount;
    if (argumentCount > 0)
    {
        ffi_type ** argumentTypes = malloc(sizeof(ffi_type *) * argumentCount);
        void **args = malloc(sizeof(void *) * argumentCount);
        char *argEncodings = malloc(sizeof(char) * argumentCount);
        
        [argumentTypeEncodings enumerateObjectsUsingBlock: (^(LuaBridgeArgumentInfo *encoding, NSUInteger idx, BOOL *stop) 
                                                    {
                                                        const char *encodingLooper = [[encoding type] UTF8String];
                                                        switch (*encodingLooper) 
                                                        {
                                                            case 'c':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_schar;
                                                                break;
                                                            }
                                                            case 'i':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_sint;
                                                                break;
                                                            }
                                                            case 's':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_sshort;
                                                                break;
                                                            }
                                                            case 'l':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_slong;
                                                                break;
                                                            }
                                                            case 'q':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_longdouble;
                                                                break;
                                                            }
                                                            case 'C':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_uchar;
                                                                break;
                                                            }
                                                            case 'I':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_uint;
                                                                break;
                                                            }
                                                            case 'S':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_ushort;
                                                                break;
                                                            }
                                                            case 'L':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_ulong;
                                                                break;
                                                            }
                                                            case 'Q':
                                                            {
                                                                //Notice here, but this will be rarely used
                                                                //
                                                                argumentTypes[idx] = &ffi_type_longdouble;
                                                                break;
                                                            }
                                                            case 'B':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_uchar;
                                                                break;
                                                            }
                                                            case 'f':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_float;
                                                                break;
                                                            }
                                                            case 'd':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_double;
                                                                break;
                                                            }
                                                            case '*':
                                                            case '#':
                                                            case '@':
                                                            case ':':
                                                            case '^':
                                                            case '[':
                                                            {
                                                                argumentTypes[idx] = &ffi_type_pointer;
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
                                                                argumentTypes[idx] = &ffi_type_void;
                                                                break;
                                                            }
                                                            default:
                                                            {
                                                                break;
                                                            }
                                                        }
                                                        args[idx] = malloc(argumentTypes[idx]->size);
                                                        argEncodings[idx] = *encodingLooper;
                                                    })];
        returnValue->_arguments = args;
        returnValue->_argumentTypes = argumentTypes;   
        returnValue->_argumentTypeEncodings = argEncodings;
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
    }else 
    {
        const char* returnTypeEncoding = [returnEncoding UTF8String];
        returnValue->_returnValueEncoding = *returnTypeEncoding;
        switch (*returnTypeEncoding) 
        {
            case 'c':
            {
                returnValue->_returnType = &ffi_type_schar;
                break;
            }
            case 'i':
            {
                returnValue->_returnType = &ffi_type_sint;
                break;
            }
            case 's':
            {
                returnValue->_returnType = &ffi_type_sshort;
                break;
            }
            case 'l':
            {
                returnValue->_returnType = &ffi_type_slong;
                break;
            }
            case 'q':
            {
                returnValue->_returnType = &ffi_type_longdouble;
                break;
            }
            case 'C':
            {
                returnValue->_returnType = &ffi_type_uchar;
                break;
            }
            case 'I':
            {
                returnValue->_returnType = &ffi_type_uint;
                break;
            }
            case 'S':
            {
                returnValue->_returnType = &ffi_type_ushort;
                break;
            }
            case 'L':
            {
                returnValue->_returnType = &ffi_type_ulong;
                break;
            }
            case 'Q':
            {
                //Notice here, but this will be rarely used
                //
                returnValue->_returnType = &ffi_type_longdouble;
                break;
            }
            case 'B':
            {
                returnValue->_returnType = &ffi_type_uchar;
                break;
            }
            case 'f':
            {
                returnValue->_returnType = &ffi_type_float;
                break;
            }
            case 'd':
            {
                returnValue->_returnType = &ffi_type_double;
                break;
            }
            case '*':
            case '#':
            case '@':
            case ':':
            case '^':
            case '[':
            {
                returnValue->_returnType = &ffi_type_pointer;
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
                returnValue->_returnType = &ffi_type_void;
                break;
            }
            default:
            {
                break;
            }
        }
        
        returnValue->_returnValue = malloc(returnValue->_returnType->size);
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
    
    luaL_getmetatable(L, LuaBridgeFuncotrMetaName);
    lua_setmetatable(L, -2);
    
    return returnValue;
}

static int LuaBridgeFunctorInvoke(lua_State *L)
{
    LuaBridgeFuncotrRef ref = luaL_checkudata(L, 1, LuaBridgeFuncotrMetaName);
    if (ref)
    {
        NSUInteger argumentCount = ref->_argumentCount;
        char encodingLooper = 0;
        const char *encodings = ref->_argumentTypeEncodings;
        void **arguments = ref->_arguments;
        
        for (NSUInteger iLooper = 0; iLooper < argumentCount; ++iLooper)
        {
            encodingLooper = encodings[iLooper];
            switch (encodingLooper) 
            {
                case 'c':
                {
                    *(char*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 'i':
                {
                    *(int*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 's':
                {
                    *(short*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 'l':
                {
                    *(long*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 'q':
                {
                    *(long double*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 'C':
                {
                    *(unsigned char*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 'I':
                {
                    *(unsigned int*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 'S':
                {
                    *(unsigned short*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 'L':
                {
                    *(unsigned long*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 'Q':
                {
                    //Notice here, but this will be rarely used
                    //
                    *(long double*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 'B':
                {
                    *(unsigned char*)arguments[iLooper] = lua_tointeger(L, iLooper + 1);
                    break;
                }
                case 'f':
                {
                    *(float*)arguments[iLooper] = lua_tonumber(L, iLooper + 1);
                    break;
                }
                case 'd':
                {
                    *(double*)arguments[iLooper] = lua_tonumber(L, iLooper + 1);
                    break;
                }
                case '*':
                case '#':
                case '@':
                case ':':
                case '^':
                case '[':
                {
                    arguments[iLooper] = lua_touserdata(L, iLooper + 1);
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
        
        ffi_call(&(ref->_cif), ref->_functionPointer, ref->_returnValue, arguments);
        
        NSUInteger returnCount = ref->_argumentCount;
        char returnValueEncoding = ref->_returnValueEncoding;
        switch (returnValueEncoding) 
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

        return returnCount;
    }
    return 1;
}

static int LuaBridgeFunctorFinalize(lua_State *L)
{
    LuaBridgeFuncotrRef ref = luaL_checkudata(L, 1, LuaBridgeFuncotrMetaName);
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