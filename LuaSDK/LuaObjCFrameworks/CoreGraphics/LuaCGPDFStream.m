//
//  LuaCGPDFStream.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFStream.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGContextConstants[] = 
{
    {"CGPDFDataFormatRaw", CGPDFDataFormatRaw},
    {"CGPDFDataFormatJPEGEncoded", CGPDFDataFormatJPEGEncoded},
    {"CGPDFDataFormatJPEG2000", CGPDFDataFormatJPEG2000},
    {NULL, 0},
};


static int lua_CGPDFStreamGetDictionary(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFStreamGetDictionary(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFStreamCopyData(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGPDFStreamCopyData(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static const luaL_Reg __LuaCGPDFStreamAPIs[] = {
    {"CGPDFStreamGetDictionary", lua_CGPDFStreamGetDictionary},
    {"CGPDFStreamCopyData", lua_CGPDFStreamCopyData},
    {NULL, NULL},
};


int LuaOpenCGPDFStream(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFStreamAPIs);
    return 0;
}
