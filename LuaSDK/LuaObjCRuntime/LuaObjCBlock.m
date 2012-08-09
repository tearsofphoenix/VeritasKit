//
//  LuaObjCBlock.m
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//
#import "LuaObjCBlock.h"
#import <objc/runtime.h>

static NSMutableDictionary *__LuaObjC_clouserBlockDictionary = nil;

LuaClosureType LuaObjCInvalidClouserID = -1;

Class LuaObjCNSBlockClass = Nil;

void LuaObjCBlockSetClosureID(LuaClosureType clouserID, id block)
{
    if (block)
    {
        [__LuaObjC_clouserBlockDictionary setObject: [NSNumber numberWithInteger: clouserID]
                                             forKey: [NSValue valueWithPointer: block]];
    }
}

LuaClosureType LuaObjCBlockGetClosureID(id block)
{
    NSNumber *clouser = [__LuaObjC_clouserBlockDictionary objectForKey: [NSValue valueWithPointer: block]];
    if (clouser)
    {
        return [clouser intValue];
    }
    return LuaObjCInvalidClouserID;
}

void LuaObjCBlockSupportInitialize(void)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, (^
                               {
                                   __LuaObjC_clouserBlockDictionary = [[NSMutableDictionary alloc] init];
                                   LuaObjCNSBlockClass = objc_getClass("NSBlock");                                   
                               }));
}
