//
//  LuaBridgeInfo.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaBridgeInfo.h"
#import "lua.h"
#import "LuaObjCAuxiliary.h"
#import "LuaBridgeFunctor.h"
#import "LuaObjCClass.h"
#import "LuaObjCCacheTable.h"

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
            LuaObjCClassRef classRef = LuaObjCClassInitialize(state, theClass, nil, false);
            _luaObjCCacheTableInsertObjectForKey(state, classRef, className);
            luaObjC_pushNSObject(state, theClass);
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
            LuaObjCClassRef classRef = LuaObjCClassInitialize(state, value, nil, true);
            _luaObjCCacheTableInsertObjectForKey(state, classRef, className);
            luaObjC_pushNSObject(state, value);
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
            _luaObjCCacheTableInsertObjectForKey(state, functorRef, [_name UTF8String]);
            
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

