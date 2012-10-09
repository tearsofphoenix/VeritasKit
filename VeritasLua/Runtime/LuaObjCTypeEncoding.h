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

VK_EXPORT void LuaObjCTypeEncodingAddPredeclearedClass(const char *className);

VK_EXPORT void LuaObjCTypeEncodingInitialize(void);

VK_EXPORT Boolean _luaObjCCStringEqual(const void *value1, const void *value2);

__END_DECLS
