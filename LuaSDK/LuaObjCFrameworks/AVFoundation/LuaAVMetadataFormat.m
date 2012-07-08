//
//  LuaAVMetadataFormat.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVMetadataFormat.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVMetadataFormatQuickTimeUserData(lua_State *L)
{
    AVMetadataFormatQuickTimeUserData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataFormatQuickTimeMetadata(lua_State *L)
{
    AVMetadataFormatQuickTimeMetadata(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataFormatiTunesMetadata(lua_State *L)
{
    AVMetadataFormatiTunesMetadata(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMetadataFormatID3Metadata(lua_State *L)
{
    AVMetadataFormatID3Metadata(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVMetadataFormatAPIs[] = {
    {"AVMetadataFormatQuickTimeUserData", lua_AVMetadataFormatQuickTimeUserData},
    {"AVMetadataFormatQuickTimeMetadata", lua_AVMetadataFormatQuickTimeMetadata},
    {"AVMetadataFormatiTunesMetadata", lua_AVMetadataFormatiTunesMetadata},
    {"AVMetadataFormatID3Metadata", lua_AVMetadataFormatID3Metadata},
    {NULL, NULL},
};

int LuaOpenAVMetadataFormat(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVMetadataFormatAPIs);
    return 0;
}
