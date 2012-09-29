//
//  LuaObjCProperty.h
//  LuaIOS
//
//  Created by LeixSnake on 8/9/12.
//
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

//lua function <---> Objective-C property bridge
VK_EXPORT const char *LuaClassGetPropertyNameWithGetter(Class theClass, SEL getter);

VK_EXPORT const char *LuaClassGetPropertyNameWithSetter(Class theClass, SEL setter);

VK_EXPORT int LuaIMPAddPropertyToClass(struct lua_State *L);

__END_DECLS
