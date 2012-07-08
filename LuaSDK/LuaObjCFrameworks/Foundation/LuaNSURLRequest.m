//
//  LuaNSURLRequest.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSURLRequest.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSURLRequestConstants[] = 
{
    {"NSURLRequestUseProtocolCachePolicy", NSURLRequestUseProtocolCachePolicy},
    {"NSURLRequestReloadIgnoringLocalCacheData", NSURLRequestReloadIgnoringLocalCacheData},
    {"NSURLRequestReloadIgnoringLocalAndRemoteCacheData", NSURLRequestReloadIgnoringLocalAndRemoteCacheData},
    {"NSURLRequestReloadIgnoringCacheData", NSURLRequestReloadIgnoringCacheData},
    {"NSURLRequestReturnCacheDataElseLoad", NSURLRequestReturnCacheDataElseLoad},
    {"NSURLRequestReturnCacheDataDontLoad", NSURLRequestReturnCacheDataDontLoad},
    {"NSURLRequestReloadRevalidatingCacheData", NSURLRequestReloadRevalidatingCacheData},
    {"NSURLNetworkServiceTypeDefault", NSURLNetworkServiceTypeDefault},
    {"NSURLNetworkServiceTypeVoIP", NSURLNetworkServiceTypeVoIP},
    {"NSURLNetworkServiceTypeVideo", NSURLNetworkServiceTypeVideo},
    {"NSURLNetworkServiceTypeBackground", NSURLNetworkServiceTypeBackground},
    {"NSURLNetworkServiceTypeVoice", NSURLNetworkServiceTypeVoice},
    {NULL, 0},
};

int LuaOpenNSURLRequest(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSURLRequestConstants);
    return 0;
}
