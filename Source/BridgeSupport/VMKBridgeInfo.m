//
//  VMKBridgeInfo.m
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKBridgeInfo.h"
#import "VMKAuxiliary.h"
#import "VMKBridgeFunctor.h"
#import "VMKClass.h"
#import "VMKObject.h"
#include "VMKInternal.h"
#include "CFRuntime.h"

#import <objc/runtime.h>

struct __VMKBridgeInfo
{
    CFRuntimeBase base;
    VMKBridgeType _type;
    CFStringRef _name;
    CFDictionaryRef _info;
};

VMKBridgeType VMKBridgeInfoGetType(VMKBridgeInfoRef info)
{
    assert(info);
    return info->_type;
}
void VMKBridgeInfoSetType(VMKBridgeInfoRef info, VMKBridgeType type)
{
    assert(info);
    info->_type = type;
}

CFStringRef VMKBridgeInfoGetName(VMKBridgeInfoRef info)
{
    assert(info);
    return info->_name;
}
void VMKBridgeInfoSetName(VMKBridgeInfoRef info, CFStringRef name)
{
    assert(info);
    _VMKCFSetValue(info->_name, name);
}

id VMKBridgeInfoGetInfo(VMKBridgeInfoRef info)
{
    assert(info);
    return (id)info->_info;
}
void VMKBridgeInfoSetInfo(VMKBridgeInfoRef info, id value)
{
    assert(info);
    _VMKCFSetValue(info->_info, value);
}



Boolean VMKBridgeInfoResolveIntoLuaState(VMKBridgeInfoRef info, struct lua_State *state)
{
    switch (info->_type)
    {
        case VMKBridgeClassType:
        {
            const char *className = [(NSString *)info->_name UTF8String];
            Class theClass = objc_getClass(className);
            
            VMKPushObject(state, theClass, true, true);
            
            return YES;
        }
        case VMKBridgeEnumType:
        {
            lua_pushinteger(state, [(id)CFDictionaryGetValue(info->_info, CFSTR("value")) intValue]);
            return YES;
        }
        case VMKBridgeConstantType:
        {
            id value = CFDictionaryGetValue(info->_info, CFSTR("value"));
            
            VMKPushObject(state, value, true, false);
            
            return YES;
        }
        case VMKBridgeFunctionType:
        {
            NSArray *args = CFDictionaryGetValue(info->_info, CFSTR("arg"));
            NSMutableArray *encodings = [[NSMutableArray alloc] init];
            
            for (VMKBridgeArgumentInfo *obj in args)
            {
                [encodings addObject: [obj type]];
            }
            
            const char *returnTypeEncoding = [(id)CFDictionaryGetValue(info->_info, CFSTR("retval")) UTF8String];
            
            VMKBridgeFunctorCreate(state, (NSString *)info->_name, encodings, returnTypeEncoding);
            
            [encodings release];
            
            return YES;
        }
        default:
        {
            return NO;
        }
    }
}

@implementation VMKBridgeInfo

- (BOOL)resolveIntoLuaState: (struct lua_State *)state
{
    switch (_type)
    {
        case VMKBridgeClassType:
        {
            const char *className = [_name UTF8String];
            Class theClass = objc_getClass(className);
            
            VMKPushObject(state, theClass, true, true);
            
            return YES;
        }
        case VMKBridgeEnumType:
        {
            lua_pushinteger(state, [[_info objectForKey: @"value"] intValue]);
            return YES;
        }
        case VMKBridgeConstantType:
        {
            id value = [_info objectForKey: @"value"];
            
            VMKPushObject(state, value, true, false);
            
            return YES;
        }
        case VMKBridgeFunctionType:
        {
            NSArray *args = [_info objectForKey: @"arg"];
            NSMutableArray *encodings = [[NSMutableArray alloc] init];
            
            for (VMKBridgeArgumentInfo *obj in args)
            {
                [encodings addObject: [obj type]];
            }
            
            const char *returnTypeEncoding = [[_info objectForKey: @"retval"] UTF8String];
            
            VMKBridgeFunctorCreate(state, _name, encodings, returnTypeEncoding);
            
            [encodings release];
            
            return YES;
        }
        default:
        {
            return NO;
        }
    }
}

@end


@implementation VMKBridgeArgumentInfo

@synthesize type = _type;
@synthesize type64 = _type64;

@end

