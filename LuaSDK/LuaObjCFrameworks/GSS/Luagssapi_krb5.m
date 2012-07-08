//
//  Luagssapi_krb5.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "Luagssapi_krb5.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luagssapi_krb5APIs[] = {
    {NULL, NULL},
};

int LuaOpengssapi_krb5(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __Luagssapi_krb5APIs);
    return 0;
}
