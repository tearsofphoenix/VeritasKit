//
//  LuaBridgeInfo.m
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaBridgeInfo.h"
#import "LuaObjCAuxiliary.h"
#import "LuaBridgeFunctor.h"
#import "LuaObjCClass.h"
#import "LuaNSObjectSupport.h"

#import <objc/runtime.h>


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

- (BOOL)resolveIntoLuaState: (struct lua_State *)state
{
    switch (_type)
    {
        case LuaBridgeClassType:
        {
            const char *className = [_name UTF8String];
            Class theClass = objc_getClass(className);
            LuaObjectRef classRef = LuaObjectCreate(state, theClass, true);
            
            NSLog(@"in func: %s %@ %s", __func__, theClass, className);
            
            //luaObjC_addValueInCacheTable(state, classRef, className);
            
            return YES;
        }
        case LuaBridgeEnumType:
        {
            lua_pushinteger(state, [[_info objectForKey: @"value"] intValue]);
            return YES;
        }
        case LuaBridgeConstantType:
        {
            const char *className = [_name UTF8String];
            id value = [_info objectForKey: @"value"];
            LuaObjectRef classRef = LuaObjectCreate(state, value, false);
            
            NSLog(@"in func: %s %@ %s", __func__, value, className);

            //luaObjC_addValueInCacheTable(state, classRef, className);

            return YES;
        }
        case LuaBridgeFunctionType:
        {
            NSArray *args = [_info objectForKey: @"arg"];
            NSMutableArray *encodings = [[NSMutableArray alloc] init];
            
            [args enumerateObjectsUsingBlock: (^(LuaBridgeArgumentInfo *obj, NSUInteger idx, BOOL *stop)
                                               {
                                                   [encodings addObject: [obj type]];
                                               })];
            
            const char *returnTypeEncoding = [[_info objectForKey: @"retval"] UTF8String];
            
            LuaBridgeFuncotrRef functorRef = LuaBridgeFunctorCreate(state, _name, encodings, returnTypeEncoding);
            
            NSLog(@"in func: %s %@", __func__, _name);

            //luaObjC_addValueInCacheTable(state, functorRef, [_name UTF8String]);
            
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


@implementation LuaBridgeArgumentInfo

@synthesize type = _type;
@synthesize type64 = _type64;

@end

