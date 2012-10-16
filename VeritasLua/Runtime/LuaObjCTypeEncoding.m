//
//  LuaObjCTypeEncoding.m
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//

#import "LuaObjCTypeEncoding.h"

static CFDictionaryKeyCallBacks __LuaObjC_KeyCallbacks;
static CFDictionaryValueCallBacks __LuaObjC_ValueCallbacks;

static CFMutableDictionaryRef __LuaObjC_TypeEncodingDictionary = NULL;

static void _LuaObjC_initTypeEncodingDictionary(CFMutableDictionaryRef dict)
{
    
#define _AddTypeEncoding(type) CFDictionaryAddValue(__LuaObjC_TypeEncodingDictionary, #type, @encode(type))
    
    _AddTypeEncoding(NSInteger);
    _AddTypeEncoding(NSUInteger);
    _AddTypeEncoding(BOOL);
    _AddTypeEncoding(id);
    _AddTypeEncoding(SEL);
    _AddTypeEncoding(CGFloat);
    _AddTypeEncoding(int);
    _AddTypeEncoding(float);
    _AddTypeEncoding(double);
    _AddTypeEncoding(char);
    _AddTypeEncoding(void);
    _AddTypeEncoding(CGRect);
    _AddTypeEncoding(CGSize);
    _AddTypeEncoding(CGPoint);
    _AddTypeEncoding(CGAffineTransform);
    _AddTypeEncoding(NSRange);
    _AddTypeEncoding(CATransform3D);
#if TARGET_OS_IPHONE
    _AddTypeEncoding(UIEdgeInsets);
    _AddTypeEncoding(UIOffset);
#endif
    
#undef _AddTypeEncoding
}

void LuaObjCTypeEncodingAddPredeclearedClass(const char *className)
{
    CFDictionaryAddValue(__LuaObjC_TypeEncodingDictionary, strdup(className), @encode(id));
}

const char * LuaObjCTypeEncodingOfType(const char *typeName)
{
    const char *typeEncoding = CFDictionaryGetValue(__LuaObjC_TypeEncodingDictionary, typeName);
    if (!typeEncoding)
    {
        typeEncoding = @encode(id);
    }
    
    return typeEncoding;
}

void _luaObjCFreeCallback(CFAllocatorRef allocator, const void *value)
{
    free((void *)value);
}

Boolean _luaObjCCStringEqual(const void *value1, const void *value2)
{
    const char *str1 = value1;
    const char *str2 = value2;
    
    if(!strcmp(str1, str2))
    {
        return YES;
    }
    
    return NO;
}

void LuaObjCTypeEncodingInitialize(void)
{
    __LuaObjC_KeyCallbacks.equal = _luaObjCCStringEqual;
    __LuaObjC_KeyCallbacks.release = _luaObjCFreeCallback;
    __LuaObjC_KeyCallbacks.hash = (CFDictionaryHashCallBack)strlen;
    
    __LuaObjC_ValueCallbacks.equal = _luaObjCCStringEqual;
    
    __LuaObjC_TypeEncodingDictionary = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 32,
                                                                 &__LuaObjC_KeyCallbacks,
                                                                 &__LuaObjC_ValueCallbacks);
    _LuaObjC_initTypeEncodingDictionary(__LuaObjC_TypeEncodingDictionary);
    
}