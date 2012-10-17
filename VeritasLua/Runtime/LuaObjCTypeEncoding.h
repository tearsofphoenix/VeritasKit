//
//  LuaObjCTypeEncoding.h
//  LuaIOS
//
//  Created by tearsofphoenix on 8/1/12.
//
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

VK_EXPORT const char * LuaObjCTypeEncodingOfType(const char *typeName);

VK_EXPORT void luaObjC_addEncodingForPredeclearClass(const char *className);

VK_EXPORT void LuaObjCTypeEncodingInitialize(void);

VK_EXPORT Boolean luaInternal_CStringEqual(const void *value1, const void *value2);

VK_EXPORT void luaInternal_freeCallback(CFAllocatorRef allocator, const void *value);

__END_DECLS
