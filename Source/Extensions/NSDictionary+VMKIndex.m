//
//  VMKIndex.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+VMKIndex.h"
#import "VMKAuxiliary.h"
#import "VMKObject.h"

@implementation NSDictionary (VMKIndex)

- (void)indexObjectWithState: (VMKLuaStateRef)state
{
    id key = VMKCheckObject(state, 2);
    VMKPushObject(state, CFDictionaryGetValue((CFDictionaryRef)self, key), true, false);
}

- (void)concatObjectWithState: (VMKLuaStateRef)state
{
    NSDictionary *dict = VMKCheckObject(state, 2);
    
    NSMutableDictionary *ret = [[[NSMutableDictionary alloc] initWithDictionary: self] autorelease];
    [ret addEntriesFromDictionary: dict];
    
    VMKPushObject(state, ret, true, false);
}

- (void)getLengthOfObjectWithState: (VMKLuaStateRef)state
{
    lua_pushinteger(state, CFDictionaryGetCount((CFDictionaryRef)self) );
}


static NSArray * __keys = nil;
static NSInteger __keyIndex = 0;

static int luaObjC_NSDictionary_luaEnumerator(VMKLuaStateRef state)
{
    VMKObjectRef obj = lua_touserdata(state, lua_upvalueindex(1));
    NSDictionary *dict = VMKObjectGetObject(obj);
    if (!__keys)
    {
        __keys = [dict allKeys];
    }
    
    if (__keyIndex < [__keys count])
    {
        id key = CFArrayGetValueAtIndex((CFArrayRef)__keys, __keyIndex);
        
        VMKPushObject(state, key, true, false);
        
        VMKPushObject(state, CFDictionaryGetValue((CFDictionaryRef)dict, key), true, false);
        
        ++__keyIndex;
        
        return 2;
    }else 
    {
        __keys = nil;
        __keyIndex = 0;
        return 0;
    }
}

- (lua_CFunction)luaEnumerator
{
    return luaObjC_NSDictionary_luaEnumerator;
}

@end

@implementation NSMutableDictionary (VMKIndex)

- (void)addObjectAtIndexWithState: (VMKLuaStateRef)state
{
    id key = VMKCheckObject(state, 2);
    id value = VMKCheckObject(state, 3);
    
    CFDictionarySetValue((CFMutableDictionaryRef)self, key, value);
}
@end