//
//  LuaNSData.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSData.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"


static const LuaSDKConst __luaNSDataConstants[] = 
{
    {"NSDataReadingMappedIfSafe", NSDataReadingMappedIfSafe},
    {"NSDataReadingUncached", NSDataReadingUncached},
    {"NSDataReadingMappedAlways", NSDataReadingMappedAlways},
    {"NSDataWritingAtomic", NSDataWritingAtomic},
#if TARGET_OS_IPHONE || TARGET_OS_EMBEDDED
    {"NSDataWritingFileProtectionNone", NSDataWritingFileProtectionNone},
    {"NSDataWritingFileProtectionComplete", NSDataWritingFileProtectionComplete},
    {"NSDataWritingFileProtectionCompleteUnlessOpen", NSDataWritingFileProtectionCompleteUnlessOpen},    
    {"NSDataWritingFileProtectionCompleteUntilFirstUserAuthentication", NSDataWritingFileProtectionCompleteUntilFirstUserAuthentication},
    {"NSDataWritingFileProtectionMask", NSDataWritingFileProtectionMask},
#endif
    {"NSDataReadingMapped", NSDataReadingMapped},
    {"NSMappedRead", NSMappedRead},
    {"NSUncachedRead", NSUncachedRead},
    {"NSAtomicWrite", NSAtomicWrite},
    {"NSDataSearchBackwards", NSDataSearchBackwards},
    {"NSDataSearchAnchored", NSDataSearchAnchored},
    {NULL, 0},
};

int LuaOpenNSData(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSDataConstants);
    return 0;
}
