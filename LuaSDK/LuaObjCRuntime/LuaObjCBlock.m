//
//  LuaObjCBlock.m
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//
#import "LuaObjCBlock.h"

static NSMutableDictionary *__LuaObjC_clouserBlockDictionary = nil;

void _luaObjC_insertClouserIDOfBlock(int clouserID, void *block)
{
    if (block)
    {
        [__LuaObjC_clouserBlockDictionary setObject: [NSNumber numberWithInteger: clouserID]
                                             forKey: [NSValue valueWithPointer: block]];
    }
}

int _luaObjC_getClouserIDOfBlock(void *block)
{
    NSNumber *clouser = [__LuaObjC_clouserBlockDictionary objectForKey: [NSValue valueWithPointer: block]];
    if (clouser)
    {
        return [clouser intValue];
    }
    return LuaObjCInvalidClouserID;
}

void _luaObjC_initializeBlockSupport(void)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, (^
                               {
                                   __LuaObjC_clouserBlockDictionary = [[NSMutableDictionary alloc] init];
                               }));
}
