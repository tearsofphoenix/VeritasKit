//
//  LuaNSCoder.m
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaNSCoder.h"
#import "LuaObjCAccelerator.h"
#import "LuaObjCInternal.h"

static int _luaObjC_NSCoder_encodeValuesOfObjCTypes(id obj, SEL sel, lua_State *L)
{
    NSInteger iLooper = LuaObjCArgumentStart;
   const char* encoding = lua_tostring(L, iLooper);
    if (encoding) 
    {
        //TODO
    }
    return 0;
}

static int _luaObjC_NSCoder_decodeValuesOfObjCTypes(id obj, SEL sel, lua_State *L)
{
    NSInteger iLooper = LuaObjCArgumentStart;
    const char* encoding = lua_tostring(L, iLooper);
    if (encoding) 
    {
        //TODO
    }

    return 0;
}

int LuaOpenNSCoder(lua_State *L)
{
    luaObjC_registerAccelerator(@selector(encodeValuesOfObjCTypes:), _luaObjC_NSCoder_encodeValuesOfObjCTypes);
    luaObjC_registerAccelerator(@selector(decodeValuesOfObjCTypes:), _luaObjC_NSCoder_decodeValuesOfObjCTypes);
    return 0;
}
