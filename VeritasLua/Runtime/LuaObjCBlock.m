//
//  LuaObjCBlock.m
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//
#import "LuaObjCBlock.h"
#import <objc/runtime.h>

static CFMutableDictionaryRef __LuaObjC_clouserBlockDictionary = NULL;

Class LuaObjCNSBlockClass = Nil;

static inline void LuaObjCBlockSupportInitialize(void)
{
    if (!__LuaObjC_clouserBlockDictionary)
    {
        __LuaObjC_clouserBlockDictionary = CFDictionaryCreateMutable(CFAllocatorGetDefault(),
                                                                     1024,
                                                                     &kCFTypeDictionaryKeyCallBacks,
                                                                     NULL);
        LuaObjCNSBlockClass = objc_getClass("NSBlock");
    }
}

void LuaObjCBlockSetClosureID(LuaClosureType clouserID, id block)
{
    if (!LuaObjCNSBlockClass)
    {
        LuaObjCBlockSupportInitialize();
    }
    
    if (block)
    {
        CFDictionaryAddValue(__LuaObjC_clouserBlockDictionary, block, (const void *)clouserID);
    }
}

LuaClosureType LuaObjCBlockGetClosureID(id block)
{
    LuaClosureType closureID = (LuaClosureType) CFDictionaryGetValue(__LuaObjC_clouserBlockDictionary, block);

    if (closureID)
    {
        return closureID;
    }
    return LuaObjCInvalidClouserID;
}
