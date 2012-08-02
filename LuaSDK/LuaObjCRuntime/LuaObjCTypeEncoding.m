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
    _AddTypeEncoding(dict, void);
    
#undef _AddTypeEncoding
}

void _luaObjC_registerClassPredeclearation(NSString *className)
{
    [__LuaObjC_TypeEncodingDictionary setObject: [NSString stringWithUTF8String: @encode(id)]
                                         forKey: className];
}

NSString * _LuaObjC_getTypeEncoding(NSString *typeName)
{
    NSString *typeEncoding = [__LuaObjC_TypeEncodingDictionary objectForKey: typeName];
    if (!typeEncoding)
    {
        typeEncoding = [NSString stringWithUTF8String: @encode(id)];
    }
    return typeEncoding;
}

NSString * _LuaObjC_getTypeEncodingOfType(const char *typeName)
{
    return _LuaObjC_getTypeEncoding([NSString stringWithUTF8String: typeName]);
}

void _luaObjC_initializeTypeEncoding(void)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, (^
                               {
                                   __LuaObjC_TypeEncodingDictionary = [[NSMutableDictionary alloc] init];
                                   _LuaObjC_initTypeEncodingDictionary(__LuaObjC_TypeEncodingDictionary);
                               }));
}