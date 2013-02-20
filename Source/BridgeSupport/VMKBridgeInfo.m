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

#import <objc/runtime.h>


VMKBridgeType VMKBridgeTypeFromString(NSString *aString)
{
    if ([aString isEqualToString: @"constant"])
    {
        return VMKBridgeConstantType;
    }
    if ([aString isEqualToString: @"enum"])
    {
        return VMKBridgeEnumType;
    }
    if ([aString isEqualToString: @"function"])
    {
        return VMKBridgeFunctionType;
    }
    if ([aString isEqualToString: @"class"])
    {
        return VMKBridgeClassType;
    }
    
    return VMKBridgeInvalidType;
}

@implementation VMKBridgeInfo

- (BOOL)resolveIntoLuaState: (VMKLuaStateRef)state
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

