//
//  LuaObjCProperty.h
//  LuaIOS
//
//  Created by LeixSnake on 8/9/12.
//
//

struct lua_State;

//lua function <---> Objective-C property bridge
extern const char *LuaClassGetPropertyNameWithGetter(Class theClass, SEL getter);

extern const char *LuaClassGetPropertyNameWithSetter(Class theClass, SEL setter);

extern int LuaIMPAddPropertyToClass(struct lua_State *L);
