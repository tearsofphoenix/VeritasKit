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
#import "LuaBridgeFunctor.h"
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
            LuaBridgeFunctorCreate(state,
                                   _name, 
                                   [_info objectForKey: @"arg"],
                                   [[(LuaBridgeArgumentInfo *)[_info objectForKey: @"retval"] type] UTF8String]);
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

