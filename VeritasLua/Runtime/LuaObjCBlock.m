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

Class LuaObjCNSBlockClass = Nil;

static void LuaObjCBlockSupportInitialize(void)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, (^
                               {
                                   __LuaObjC_clouserBlockDictionary = [[NSMutableDictionary alloc] init];
                                   LuaObjCNSBlockClass = objc_getClass("NSBlock");
                               }));
}

void LuaObjCBlockSetClosureID(LuaClosureType clouserID, id block)
{
    if (!LuaObjCNSBlockClass)
    {
        LuaObjCBlockSupportInitialize();
    }
    
    if (block)
    {
        [__LuaObjC_clouserBlockDictionary setObject: [NSNumber numberWithInteger: clouserID]
                                             forKey: block];
    }
}

LuaClosureType LuaObjCBlockGetClosureID(id block)
{
    NSNumber *clouser = [__LuaObjC_clouserBlockDictionary objectForKey: block];
    if (clouser)
    {
        return [clouser intValue];
    }
    return LuaObjCInvalidClouserID;
}
