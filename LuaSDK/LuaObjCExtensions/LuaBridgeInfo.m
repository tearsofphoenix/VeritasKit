//
//  LuaBridgeInfo.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaBridgeInfo.h"
#import "lstate.h"
#import "LuaObjCAuxiliary.h"
#import <objc/runtime.h>

#import <dlfcn.h>
#import "ffi.h"

struct LuaBridgeFuncotr 
{
void *_functionPointer;
ffi_type **_arguments;
NSUInteger _argumentCount;
ffi_type *_returnType;
ffi_cif _cif;

};

//FFI_EXTERN ffi_type ffi_type_void;
//FFI_EXTERN ffi_type ffi_type_uint8;
//FFI_EXTERN ffi_type ffi_type_sint8;
//FFI_EXTERN ffi_type ffi_type_uint16;
//FFI_EXTERN ffi_type ffi_type_sint16;
//FFI_EXTERN ffi_type ffi_type_uint32;
//FFI_EXTERN ffi_type ffi_type_sint32;
//FFI_EXTERN ffi_type ffi_type_uint64;
//FFI_EXTERN ffi_type ffi_type_sint64;
//FFI_EXTERN ffi_type ffi_type_float;
//FFI_EXTERN ffi_type ffi_type_double;
//FFI_EXTERN ffi_type ffi_type_pointer;

LuaBridgeFuncotrRef LuaBridgeFuncotrCreate(NSString * name, 
                                           NSArray *argumentTypes, 
                                           NSString *returnEncoding)
{
    LuaBridgeFuncotrRef returnValue = malloc(sizeof(struct LuaBridgeFuncotr));
    returnValue->_functionPointer = dlsym(RTLD_DEFAULT, [name UTF8String]);
    NSUInteger argumentCount = [argumentTypes count];
    returnValue->_argumentCount = argumentCount;
    if (argumentCount > 0)
    {
        ffi_type ** arguments = malloc(sizeof(ffi_type *) * [argumentTypes count]);
        [argumentTypes enumerateObjectsUsingBlock: (^(NSString *encoding, NSUInteger idx, BOOL *stop) 
                                                    {
                                                        switch (*[encoding UTF8String]) 
                                                        {
                                                            case 'c':
                                                            {
                                                                arguments[idx] = &ffi_type_schar;
                                                                break;
                                                            }
                                                            case 'i':
                                                            {
                                                                arguments[idx] = &ffi_type_uint;
                                                                break;
                                                            }
                                                            case 's':
                                                            {
                                                                arguments[idx] = &ffi_type_sshort;
                                                                break;
                                                            }
                                                            case 'l':
                                                            {
                                                                arguments[idx] = &ffi_type_slong;
                                                                break;
                                                            }
                                                            case 'q':
                                                            {
                                                                arguments[idx] = &ffi_type_longdouble;
                                                                break;
                                                            }
                                                            case 'C':
                                                            {
                                                                arguments[idx] = &ffi_type_uchar;
                                                                break;
                                                            }
                                                            case 'I':
                                                            {
                                                                arguments[idx] = &ffi_type_uint;
                                                                break;
                                                            }
                                                            case 'S':
                                                            {
                                                                arguments[idx] = &ffi_type_ushort;
                                                                break;
                                                            }
                                                            case 'L':
                                                            {
                                                                arguments[idx] = &ffi_type_ulong;
                                                                break;
                                                            }
                                                            case 'Q':
                                                            {
                                                                //Notice here, but this will be rarely used
                                                                //
                                                                arguments[idx] = &ffi_type_longdouble;
                                                                break;
                                                            }
                                                            case 'B':
                                                            {
                                                                arguments[idx] = &ffi_type_uchar;
                                                                break;
                                                            }
                                                            case 'f':
                                                            {
                                                                arguments[idx] = &ffi_type_float;
                                                                break;
                                                            }
                                                            case 'd':
                                                            {
                                                                arguments[idx] = &ffi_type_double;
                                                                break;
                                                            }
                                                            case '*':
                                                            case '#':
                                                            case '@':
                                                            case ':':
                                                            case '^':
                                                            case '[':
                                                            {
                                                                arguments[idx] = &ffi_type_pointer;
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
                                                                arguments[idx] = &ffi_type_void;
                                                                break;
                                                            }
                                                            default:
                                                            {
                                                                break;
                                                            }
                                                        }
                                                    })];
        returnValue->_arguments = arguments;        
    }else 
    {
        returnValue->_arguments[0] = &ffi_type_void;
    }
    
    if (returnEncoding)
    {
        returnValue->_returnType = &ffi_type_void;
    }else 
    {
        const char* returnTypeEncoding = [returnEncoding UTF8String];
        switch (*returnTypeEncoding) 
        {
            case 'c':
            {
                returnValue->_returnType = &ffi_type_schar;
                break;
            }
            case 'i':
            {
                returnValue->_returnType = &ffi_type_uint;
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
    }
    
    ffi_status status = ffi_prep_cif(&(returnValue->_cif),
                                     FFI_DEFAULT_ABI, 
                                     argumentCount, 
                                     returnValue->_returnType, 
                                     returnValue->_arguments);
    if (status == FFI_OK)
    {
        NSLog(@"ok");
    }
    return returnValue;
}

void LuaBridgeFunctorInvoke(LuaBridgeFuncotrRef aFunctorRef)
{
    
}

void LuaBridgeFunctorFinalize(LuaBridgeFuncotrRef aFunctorRef)
{
    
}


LuaBridgeType LuaBridgeTypeFromString(NSString *aString)
{
    if ([aString isEqualToString: @"constant"])
    {
        return LuaBridgeConstantType;
    }
    if ([aString isEqualToString: @"enum"])
    {
        return LuaBridgeEnumType;
    }
    if ([aString isEqualToString: @"function"])
    {
        return LuaBridgeFunctionType;
    }
    if ([aString isEqualToString: @"class"])
    {
        return LuaBridgeClassType;
    }
    
    return LuaBridgeInvalidType;
}

@implementation LuaBridgeInfo

@synthesize type = _type;
@synthesize name = _name;
@synthesize info = _info;

- (void)resolveIntoLuaState: (struct lua_State *)state
{
    switch (_type)
    {
        case LuaBridgeClassType:
        {
            Class theClass = objc_getClass([_name UTF8String]);
            luaObjC_pushNSObject(state, theClass);
            break;
        }   
        case LuaBridgeEnumType:
        {
            lua_pushinteger(state, [[_info objectForKey: @"value"] intValue]);
            break;
        }
        case LuaBridgeFunctionType:
        {
            
            break;
        }
        default:
        {
            break;
        }
    }
}

@end


@implementation LuaBridgeArgumentInfo

@synthesize type = _type;
@synthesize type64 = _type64;

@end

