//
//  LuaCFAttributedString.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFAttributedString.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFAttributedStringRef(lua_State *L)
{
    CFAttributedStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetTypeID(lua_State *L)
{
    CFAttributedStringGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetTypeID(lua_State *L)
{
    CFAttributedStringGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringCreate(lua_State *L)
{
    CFAttributedStringCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringRef(lua_State *L)
{
    CFAttributedStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringCreateWithSubstring(lua_State *L)
{
    CFAttributedStringCreateWithSubstring(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringRef(lua_State *L)
{
    CFAttributedStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringCreateCopy(lua_State *L)
{
    CFAttributedStringCreateCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringRef(lua_State *L)
{
    CFAttributedStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetString(lua_State *L)
{
    CFAttributedStringGetString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetString(lua_State *L)
{
    CFAttributedStringGetString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetLength(lua_State *L)
{
    CFAttributedStringGetLength(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetString(lua_State *L)
{
    CFAttributedStringGetString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetLength(lua_State *L)
{
    CFAttributedStringGetLength(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetAttributes(lua_State *L)
{
    CFAttributedStringGetAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetAttributesAndLongestEffectiveRange(lua_State *L)
{
    CFAttributedStringGetAttributesAndLongestEffectiveRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetAttributes(lua_State *L)
{
    CFAttributedStringGetAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetAttribute(lua_State *L)
{
    CFAttributedStringGetAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetAttributeAndLongestEffectiveRange(lua_State *L)
{
    CFAttributedStringGetAttributeAndLongestEffectiveRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetAttribute(lua_State *L)
{
    CFAttributedStringGetAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetAttributesAndLongestEffectiveRange(lua_State *L)
{
    CFAttributedStringGetAttributesAndLongestEffectiveRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetAttributesAndLongestEffectiveRange(lua_State *L)
{
    CFAttributedStringGetAttributesAndLongestEffectiveRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetAttributeAndLongestEffectiveRange(lua_State *L)
{
    CFAttributedStringGetAttributeAndLongestEffectiveRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetAttributeAndLongestEffectiveRange(lua_State *L)
{
    CFAttributedStringGetAttributeAndLongestEffectiveRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringCreateMutableCopy(lua_State *L)
{
    CFAttributedStringCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringCreateMutableCopy(lua_State *L)
{
    CFAttributedStringCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringCreateMutable(lua_State *L)
{
    CFAttributedStringCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringCreateMutable(lua_State *L)
{
    CFAttributedStringCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringReplaceString(lua_State *L)
{
    CFAttributedStringReplaceString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetMutableString(lua_State *L)
{
    CFAttributedStringGetMutableString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringReplaceString(lua_State *L)
{
    CFAttributedStringReplaceString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetMutableString(lua_State *L)
{
    CFAttributedStringGetMutableString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringGetMutableString(lua_State *L)
{
    CFAttributedStringGetMutableString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringSetAttributes(lua_State *L)
{
    CFAttributedStringSetAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringSetAttributes(lua_State *L)
{
    CFAttributedStringSetAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringSetAttribute(lua_State *L)
{
    CFAttributedStringSetAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringSetAttribute(lua_State *L)
{
    CFAttributedStringSetAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringRemoveAttribute(lua_State *L)
{
    CFAttributedStringRemoveAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringRemoveAttribute(lua_State *L)
{
    CFAttributedStringRemoveAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringReplaceAttributedString(lua_State *L)
{
    CFAttributedStringReplaceAttributedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringReplaceString(lua_State *L)
{
    CFAttributedStringReplaceString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringReplaceAttributedString(lua_State *L)
{
    CFAttributedStringReplaceAttributedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringBeginEditing(lua_State *L)
{
    CFAttributedStringBeginEditing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringBeginEditing(lua_State *L)
{
    CFAttributedStringBeginEditing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringBeginEditing(lua_State *L)
{
    CFAttributedStringBeginEditing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringEndEditing(lua_State *L)
{
    CFAttributedStringEndEditing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringBeginEditing(lua_State *L)
{
    CFAttributedStringBeginEditing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFAttributedStringEndEditing(lua_State *L)
{
    CFAttributedStringEndEditing(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFAttributedStringAPIs[] = {
    {"CFAttributedStringRef", lua_CFAttributedStringRef},
    {"CFAttributedStringGetTypeID", lua_CFAttributedStringGetTypeID},
    {"CFAttributedStringGetTypeID", lua_CFAttributedStringGetTypeID},
    {"CFAttributedStringCreate", lua_CFAttributedStringCreate},
    {"CFAttributedStringRef", lua_CFAttributedStringRef},
    {"CFAttributedStringCreateWithSubstring", lua_CFAttributedStringCreateWithSubstring},
    {"CFAttributedStringRef", lua_CFAttributedStringRef},
    {"CFAttributedStringCreateCopy", lua_CFAttributedStringCreateCopy},
    {"CFAttributedStringRef", lua_CFAttributedStringRef},
    {"CFAttributedStringGetString", lua_CFAttributedStringGetString},
    {"CFAttributedStringGetString", lua_CFAttributedStringGetString},
    {"CFAttributedStringGetLength", lua_CFAttributedStringGetLength},
    {"CFAttributedStringGetString", lua_CFAttributedStringGetString},
    {"CFAttributedStringGetLength", lua_CFAttributedStringGetLength},
    {"CFAttributedStringGetAttributes", lua_CFAttributedStringGetAttributes},
    {"CFAttributedStringGetAttributesAndLongestEffectiveRange", lua_CFAttributedStringGetAttributesAndLongestEffectiveRange},
    {"CFAttributedStringGetAttributes", lua_CFAttributedStringGetAttributes},
    {"CFAttributedStringGetAttribute", lua_CFAttributedStringGetAttribute},
    {"CFAttributedStringGetAttributeAndLongestEffectiveRange", lua_CFAttributedStringGetAttributeAndLongestEffectiveRange},
    {"CFAttributedStringGetAttribute", lua_CFAttributedStringGetAttribute},
    {"CFAttributedStringGetAttributesAndLongestEffectiveRange", lua_CFAttributedStringGetAttributesAndLongestEffectiveRange},
    {"CFAttributedStringGetAttributesAndLongestEffectiveRange", lua_CFAttributedStringGetAttributesAndLongestEffectiveRange},
    {"CFAttributedStringGetAttributeAndLongestEffectiveRange", lua_CFAttributedStringGetAttributeAndLongestEffectiveRange},
    {"CFAttributedStringGetAttributeAndLongestEffectiveRange", lua_CFAttributedStringGetAttributeAndLongestEffectiveRange},
    {"CFAttributedStringCreateMutableCopy", lua_CFAttributedStringCreateMutableCopy},
    {"CFAttributedStringCreateMutableCopy", lua_CFAttributedStringCreateMutableCopy},
    {"CFAttributedStringCreateMutable", lua_CFAttributedStringCreateMutable},
    {"CFAttributedStringCreateMutable", lua_CFAttributedStringCreateMutable},
    {"CFAttributedStringReplaceString", lua_CFAttributedStringReplaceString},
    {"CFAttributedStringGetMutableString", lua_CFAttributedStringGetMutableString},
    {"CFAttributedStringReplaceString", lua_CFAttributedStringReplaceString},
    {"CFAttributedStringGetMutableString", lua_CFAttributedStringGetMutableString},
    {"CFAttributedStringGetMutableString", lua_CFAttributedStringGetMutableString},
    {"CFAttributedStringSetAttributes", lua_CFAttributedStringSetAttributes},
    {"CFAttributedStringSetAttributes", lua_CFAttributedStringSetAttributes},
    {"CFAttributedStringSetAttribute", lua_CFAttributedStringSetAttribute},
    {"CFAttributedStringSetAttribute", lua_CFAttributedStringSetAttribute},
    {"CFAttributedStringRemoveAttribute", lua_CFAttributedStringRemoveAttribute},
    {"CFAttributedStringRemoveAttribute", lua_CFAttributedStringRemoveAttribute},
    {"CFAttributedStringReplaceAttributedString", lua_CFAttributedStringReplaceAttributedString},
    {"CFAttributedStringReplaceString", lua_CFAttributedStringReplaceString},
    {"CFAttributedStringReplaceAttributedString", lua_CFAttributedStringReplaceAttributedString},
    {"CFAttributedStringBeginEditing", lua_CFAttributedStringBeginEditing},
    {"CFAttributedStringBeginEditing", lua_CFAttributedStringBeginEditing},
    {"CFAttributedStringBeginEditing", lua_CFAttributedStringBeginEditing},
    {"CFAttributedStringEndEditing", lua_CFAttributedStringEndEditing},
    {"CFAttributedStringBeginEditing", lua_CFAttributedStringBeginEditing},
    {"CFAttributedStringEndEditing", lua_CFAttributedStringEndEditing},
    {NULL, NULL},
};

int LuaOpenCFAttributedString(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFAttributedStringAPIs);
    return 0;
}
