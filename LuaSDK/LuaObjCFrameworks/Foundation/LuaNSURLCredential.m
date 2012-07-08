//
//  LuaNSURLCredential.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSURLCredential.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSURLCredentialConstants[] = 
{
    {"NSURLCredentialPersistenceNone", NSURLCredentialPersistenceNone},
    {"NSURLCredentialPersistenceForSession", NSURLCredentialPersistenceForSession},
    {"NSURLCredentialPersistencePermanent", NSURLCredentialPersistencePermanent},
    {NULL, 0},
};

int LuaOpenNSURLCredential(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSURLCredentialConstants);
    return 0;
}
