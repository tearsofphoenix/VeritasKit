//
//  LuaObjCTypeEncoding.h
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//

extern NSString * _LuaObjC_getTypeEncodingOfType(const char *typeName);

extern NSString * _LuaObjC_getTypeEncoding(NSString *typeName);

extern void _luaObjC_registerClassPredeclearation(NSString *className);

extern void _luaObjC_initializeTypeEncoding(void);