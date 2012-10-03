//
//  LuaObjCTypeEncoding.m
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//

#import "LuaObjCTypeEncoding.h"

static NSMutableDictionary *__LuaObjC_TypeEncodingDictionary = nil;

static void _LuaObjC_initTypeEncodingDictionary(NSMutableDictionary *dict)
{
#define _AddTypeEncoding(dict, type) [dict setObject: [NSString stringWithUTF8String: @encode(type)] \
forKey: [NSString stringWithUTF8String: #type]];
    
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

void LuaObjCTypeEncodingAddPredeclearedClass(NSString *className)
{
    CFDictionarySetValue((CFMutableDictionaryRef)__LuaObjC_TypeEncodingDictionary, className, [NSString stringWithUTF8String: @encode(id)]);
}

NSString * LuaObjCTypeEncodingOfTypeName(NSString *typeName)
{
    NSString *typeEncoding = CFDictionaryGetValue((CFDictionaryRef)__LuaObjC_TypeEncodingDictionary, typeName);
    if (!typeEncoding)
    {
        typeEncoding = [NSString stringWithUTF8String: @encode(id)];
    }
    return typeEncoding;
}

NSString * LuaObjCTypeEncodingOfType(const char *typeName)
{
    return LuaObjCTypeEncodingOfTypeName([NSString stringWithUTF8String: typeName]);
}

void LuaObjCTypeEncodingInitialize(void)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, (^
                               {
                                   __LuaObjC_TypeEncodingDictionary = [[NSMutableDictionary alloc] init];
                                   _LuaObjC_initTypeEncodingDictionary(__LuaObjC_TypeEncodingDictionary);
                               }));
}