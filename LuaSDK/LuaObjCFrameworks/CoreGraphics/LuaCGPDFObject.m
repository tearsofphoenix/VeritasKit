//
//  LuaCGPDFObject.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFObject.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGContextConstants[] = 
{
    {"kCGPDFObjectTypeNull", kCGPDFObjectTypeNull},
    {"kCGPDFObjectTypeBoolean", kCGPDFObjectTypeBoolean},
    {"kCGPDFObjectTypeInteger", kCGPDFObjectTypeInteger},
    {"kCGPDFObjectTypeReal", kCGPDFObjectTypeReal},
    {"kCGPDFObjectTypeName", kCGPDFObjectTypeName},
    {"kCGPDFObjectTypeString", kCGPDFObjectTypeString},
    {"kCGPDFObjectTypeArray", kCGPDFObjectTypeArray},
    {"kCGPDFObjectTypeDictionary", kCGPDFObjectTypeDictionary},
    {"kCGPDFObjectTypeStream", kCGPDFObjectTypeStream},
    {NULL, 0},
};


static int lua_CGPDFObjectGetType(lua_State *L)
{
    lua_pushinteger(L, CGPDFObjectGetType(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFObjectGetValue(lua_State *L)
{
    //TODO
    CGPDFObjectType type = lua_tointeger(L, 2);
    switch (type)
    {
        case kCGPDFObjectTypeBoolean:
        {
            CGPDFBoolean boolObj;
            lua_pushboolean(L, CGPDFObjectGetValue(lua_touserdata(L, 1), type, &boolObj));
            lua_pushboolean(L, boolObj);
            break;            
        }
        case kCGPDFObjectTypeInteger:
        case kCGPDFObjectTypeReal:
        {
            CGPDFReal real;
            lua_pushboolean(L, CGPDFObjectGetValue(lua_touserdata(L, 1), type, &real));
            lua_pushnumber(L, real);
            break;            
        }
        case kCGPDFObjectTypeName:
        case kCGPDFObjectTypeString:
        {
            CGPDFStringRef stringValue;
            lua_pushboolean(L, CGPDFObjectGetValue(lua_touserdata(L, 1), type, &stringValue));
            lua_pushlightuserdata(L, stringValue);
            break;            
        }
        case kCGPDFObjectTypeArray:
        {
            CGPDFArrayRef arrayValue;
            lua_pushboolean(L, CGPDFObjectGetValue(lua_touserdata(L, 1), type, &arrayValue));
            lua_pushlightuserdata(L, arrayValue);
            break;            
        }
        case kCGPDFObjectTypeDictionary:
        {
            CGPDFDictionaryRef dictValue;
            lua_pushboolean(L, CGPDFObjectGetValue(lua_touserdata(L, 1), type, &dictValue));
            lua_pushlightuserdata(L, dictValue);
            break;            
        }
        case kCGPDFObjectTypeStream:
        {
            CGPDFStreamRef streamValue;
            lua_pushboolean(L, CGPDFObjectGetValue(lua_touserdata(L, 1), type, &streamValue));
            lua_pushlightuserdata(L, streamValue);
            break;
        }   
        default:
        {
            lua_pushboolean(L, false);
            lua_pushnil(L);
            break;
        }
    }
    return 2;
}

static const luaL_Reg __LuaCGPDFObjectAPIs[] = {
    {"CGPDFObjectGetType", lua_CGPDFObjectGetType},
    {"CGPDFObjectGetValue", lua_CGPDFObjectGetValue},
    {NULL, NULL},
};


int LuaOpenCGPDFObject(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGContextConstants);
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFObjectAPIs);
    return 0;
}
