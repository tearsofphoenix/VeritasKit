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
    
#define _AddTypeEncoding(dict, type) CFDictionaryAddValue(dict, #type, @encode(type))
    
    _AddTypeEncoding(dict, NSInteger);
    _AddTypeEncoding(dict, NSUInteger);
    _AddTypeEncoding(dict, BOOL);
    _AddTypeEncoding(dict, id);
    _AddTypeEncoding(dict, SEL);
    _AddTypeEncoding(dict, CGFloat);
    _AddTypeEncoding(dict, int);
    _AddTypeEncoding(dict, float);
    _AddTypeEncoding(dict, double);
    _AddTypeEncoding(dict, char);
    _AddTypeEncoding(dict, void);
    _AddTypeEncoding(dict, CGRect);
    _AddTypeEncoding(dict, CGSize);
    _AddTypeEncoding(dict, CGPoint);
    _AddTypeEncoding(dict, CGAffineTransform);
    _AddTypeEncoding(dict, NSRange);
    _AddTypeEncoding(dict, CATransform3D);
#if TARGET_OS_IPHONE
    _AddTypeEncoding(dict, UIEdgeInsets);
    _AddTypeEncoding(dict, UIOffset);
#endif
    
#undef _AddTypeEncoding
}

void LuaObjCTypeEncodingAddPredeclearedClass(const char *className)
{
    CFDictionaryAddValue((CFMutableDictionaryRef)__LuaObjC_TypeEncodingDictionary, strdup(className), @encode(id));
}

const char * LuaObjCTypeEncodingOfType(const char *typeName)
{
    const char *typeEncoding = CFDictionaryGetValue((CFDictionaryRef)__LuaObjC_TypeEncodingDictionary, typeName);
    if (!typeEncoding)
    {
        typeEncoding = @encode(id);
    }
        
    return typeEncoding;
}

static Boolean _luaObjCCStringEqual(const void *value1, const void *value2)
{
    const char *str1 = value1;
    const char *str2 = value2;

    if(!strcmp(str1, str2))
    {
        return YES;
    }
    
    return NO;
}

static CFHashCode _luaObjCCStringHash(const void *value1)
{
    return strlen(value1);
}

void LuaObjCTypeEncodingInitialize(void)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, (^
                               {
                                   __LuaObjC_KeyCallbacks.equal = _luaObjCCStringEqual;
                                   __LuaObjC_KeyCallbacks.hash = _luaObjCCStringHash;
                                   
                                   __LuaObjC_ValueCallbacks.equal = _luaObjCCStringEqual;
                                   
                                   __LuaObjC_TypeEncodingDictionary = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 3, &__LuaObjC_KeyCallbacks, &__LuaObjC_ValueCallbacks);
                                   _LuaObjC_initTypeEncodingDictionary(__LuaObjC_TypeEncodingDictionary);
                               }));
}