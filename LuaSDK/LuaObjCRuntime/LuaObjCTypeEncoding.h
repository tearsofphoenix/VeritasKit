//
//  LuaObjCTypeEncoding.h
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//

extern NSString * LuaObjCTypeEncodingOfType(const char *typeName);

extern NSString * LuaObjCTypeEncodingOfTypeName(NSString *typeName);

extern void LuaObjCTypeEncodingAddPredeclearedClass(NSString *className);

extern void LuaObjCTypeEncodingInitialize(void);