//
//  LuaCFCharacterSet.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFCharacterSet.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFCharacterSetCreateWithBitmapRepresentation(lua_State *L)
{
    CFCharacterSetCreateWithBitmapRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRef(lua_State *L)
{
    CFCharacterSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSets(lua_State *L)
{
    CFCharacterSets(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRef(lua_State *L)
{
    CFCharacterSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetPredefinedSet(lua_State *L)
{
    CFCharacterSetPredefinedSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetControl(lua_State *L)
{
    CFCharacterSetControl(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetWhitespace(lua_State *L)
{
    CFCharacterSetWhitespace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetWhitespaceAndNewline(lua_State *L)
{
    CFCharacterSetWhitespaceAndNewline(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetDecimalDigit(lua_State *L)
{
    CFCharacterSetDecimalDigit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetLetter(lua_State *L)
{
    CFCharacterSetLetter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetLowercaseLetter(lua_State *L)
{
    CFCharacterSetLowercaseLetter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetUppercaseLetter(lua_State *L)
{
    CFCharacterSetUppercaseLetter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetNonBase(lua_State *L)
{
    CFCharacterSetNonBase(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetDecomposable(lua_State *L)
{
    CFCharacterSetDecomposable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetAlphaNumeric(lua_State *L)
{
    CFCharacterSetAlphaNumeric(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetPunctuation(lua_State *L)
{
    CFCharacterSetPunctuation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCapitalizedLetter(lua_State *L)
{
    CFCharacterSetCapitalizedLetter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetSymbol(lua_State *L)
{
    CFCharacterSetSymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetNewline(lua_State *L)
{
    CFCharacterSetNewline(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetIllegal(lua_State *L)
{
    CFCharacterSetIllegal(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetPredefinedSet(lua_State *L)
{
    CFCharacterSetPredefinedSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetGetTypeID(lua_State *L)
{
    CFCharacterSetGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetGetTypeID(lua_State *L)
{
    CFCharacterSetGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetGetPredefined(lua_State *L)
{
    CFCharacterSetGetPredefined(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetPredefinedSet(lua_State *L)
{
    CFCharacterSetPredefinedSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetPredefinedSet(lua_State *L)
{
    CFCharacterSetPredefinedSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRef(lua_State *L)
{
    CFCharacterSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateWithCharactersInRange(lua_State *L)
{
    CFCharacterSetCreateWithCharactersInRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRef(lua_State *L)
{
    CFCharacterSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateWithCharactersInString(lua_State *L)
{
    CFCharacterSetCreateWithCharactersInString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRef(lua_State *L)
{
    CFCharacterSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateWithBitmapRepresentation(lua_State *L)
{
    CFCharacterSetCreateWithBitmapRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRef(lua_State *L)
{
    CFCharacterSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateInvertedSet(lua_State *L)
{
    CFCharacterSetCreateInvertedSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRef(lua_State *L)
{
    CFCharacterSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetIsSupersetOfSet(lua_State *L)
{
    CFCharacterSetIsSupersetOfSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetIsSupersetOfSet(lua_State *L)
{
    CFCharacterSetIsSupersetOfSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetHasMemberInPlane(lua_State *L)
{
    CFCharacterSetHasMemberInPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetHasMemberInPlane(lua_State *L)
{
    CFCharacterSetHasMemberInPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateMutable(lua_State *L)
{
    CFCharacterSetCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateMutable(lua_State *L)
{
    CFCharacterSetCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateCopy(lua_State *L)
{
    CFCharacterSetCreateCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRef(lua_State *L)
{
    CFCharacterSetRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateMutableCopy(lua_State *L)
{
    CFCharacterSetCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateMutableCopy(lua_State *L)
{
    CFCharacterSetCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetIsCharacterMember(lua_State *L)
{
    CFCharacterSetIsCharacterMember(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetIsCharacterMember(lua_State *L)
{
    CFCharacterSetIsCharacterMember(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetIsLongCharacterMember(lua_State *L)
{
    CFCharacterSetIsLongCharacterMember(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetIsLongCharacterMember(lua_State *L)
{
    CFCharacterSetIsLongCharacterMember(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateBitmapRepresentation(lua_State *L)
{
    CFCharacterSetCreateBitmapRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateWithBitmapRepresentation(lua_State *L)
{
    CFCharacterSetCreateWithBitmapRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetCreateBitmapRepresentation(lua_State *L)
{
    CFCharacterSetCreateBitmapRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetAddCharactersInRange(lua_State *L)
{
    CFCharacterSetAddCharactersInRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetAddCharactersInRange(lua_State *L)
{
    CFCharacterSetAddCharactersInRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRemoveCharactersInRange(lua_State *L)
{
    CFCharacterSetRemoveCharactersInRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRemoveCharactersInRange(lua_State *L)
{
    CFCharacterSetRemoveCharactersInRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetAddCharactersInString(lua_State *L)
{
    CFCharacterSetAddCharactersInString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetAddCharactersInString(lua_State *L)
{
    CFCharacterSetAddCharactersInString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRemoveCharactersInString(lua_State *L)
{
    CFCharacterSetRemoveCharactersInString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetRemoveCharactersInString(lua_State *L)
{
    CFCharacterSetRemoveCharactersInString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetUnion(lua_State *L)
{
    CFCharacterSetUnion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetUnion(lua_State *L)
{
    CFCharacterSetUnion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetIntersect(lua_State *L)
{
    CFCharacterSetIntersect(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetIntersect(lua_State *L)
{
    CFCharacterSetIntersect(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetInvert(lua_State *L)
{
    CFCharacterSetInvert(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCharacterSetInvert(lua_State *L)
{
    CFCharacterSetInvert(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFCharacterSetAPIs[] = {
    {"CFCharacterSetCreateWithBitmapRepresentation", lua_CFCharacterSetCreateWithBitmapRepresentation},
    {"CFCharacterSetRef", lua_CFCharacterSetRef},
    {"CFCharacterSets", lua_CFCharacterSets},
    {"CFCharacterSetRef", lua_CFCharacterSetRef},
    {"CFCharacterSetPredefinedSet", lua_CFCharacterSetPredefinedSet},
    {"CFCharacterSetControl", lua_CFCharacterSetControl},
    {"CFCharacterSetWhitespace", lua_CFCharacterSetWhitespace},
    {"CFCharacterSetWhitespaceAndNewline", lua_CFCharacterSetWhitespaceAndNewline},
    {"CFCharacterSetDecimalDigit", lua_CFCharacterSetDecimalDigit},
    {"CFCharacterSetLetter", lua_CFCharacterSetLetter},
    {"CFCharacterSetLowercaseLetter", lua_CFCharacterSetLowercaseLetter},
    {"CFCharacterSetUppercaseLetter", lua_CFCharacterSetUppercaseLetter},
    {"CFCharacterSetNonBase", lua_CFCharacterSetNonBase},
    {"CFCharacterSetDecomposable", lua_CFCharacterSetDecomposable},
    {"CFCharacterSetAlphaNumeric", lua_CFCharacterSetAlphaNumeric},
    {"CFCharacterSetPunctuation", lua_CFCharacterSetPunctuation},
    {"CFCharacterSetCapitalizedLetter", lua_CFCharacterSetCapitalizedLetter},
    {"CFCharacterSetSymbol", lua_CFCharacterSetSymbol},
    {"CFCharacterSetNewline", lua_CFCharacterSetNewline},
    {"CFCharacterSetIllegal", lua_CFCharacterSetIllegal},
    {"CFCharacterSetPredefinedSet", lua_CFCharacterSetPredefinedSet},
    {"CFCharacterSetGetTypeID", lua_CFCharacterSetGetTypeID},
    {"CFCharacterSetGetTypeID", lua_CFCharacterSetGetTypeID},
    {"CFCharacterSetGetPredefined", lua_CFCharacterSetGetPredefined},
    {"CFCharacterSetPredefinedSet", lua_CFCharacterSetPredefinedSet},
    {"CFCharacterSetPredefinedSet", lua_CFCharacterSetPredefinedSet},
    {"CFCharacterSetRef", lua_CFCharacterSetRef},
    {"CFCharacterSetCreateWithCharactersInRange", lua_CFCharacterSetCreateWithCharactersInRange},
    {"CFCharacterSetRef", lua_CFCharacterSetRef},
    {"CFCharacterSetCreateWithCharactersInString", lua_CFCharacterSetCreateWithCharactersInString},
    {"CFCharacterSetRef", lua_CFCharacterSetRef},
    {"CFCharacterSetCreateWithBitmapRepresentation", lua_CFCharacterSetCreateWithBitmapRepresentation},
    {"CFCharacterSetRef", lua_CFCharacterSetRef},
    {"CFCharacterSetCreateInvertedSet", lua_CFCharacterSetCreateInvertedSet},
    {"CFCharacterSetRef", lua_CFCharacterSetRef},
    {"CFCharacterSetIsSupersetOfSet", lua_CFCharacterSetIsSupersetOfSet},
    {"CFCharacterSetIsSupersetOfSet", lua_CFCharacterSetIsSupersetOfSet},
    {"CFCharacterSetHasMemberInPlane", lua_CFCharacterSetHasMemberInPlane},
    {"CFCharacterSetHasMemberInPlane", lua_CFCharacterSetHasMemberInPlane},
    {"CFCharacterSetCreateMutable", lua_CFCharacterSetCreateMutable},
    {"CFCharacterSetCreateMutable", lua_CFCharacterSetCreateMutable},
    {"CFCharacterSetCreateCopy", lua_CFCharacterSetCreateCopy},
    {"CFCharacterSetRef", lua_CFCharacterSetRef},
    {"CFCharacterSetCreateMutableCopy", lua_CFCharacterSetCreateMutableCopy},
    {"CFCharacterSetCreateMutableCopy", lua_CFCharacterSetCreateMutableCopy},
    {"CFCharacterSetIsCharacterMember", lua_CFCharacterSetIsCharacterMember},
    {"CFCharacterSetIsCharacterMember", lua_CFCharacterSetIsCharacterMember},
    {"CFCharacterSetIsLongCharacterMember", lua_CFCharacterSetIsLongCharacterMember},
    {"CFCharacterSetIsLongCharacterMember", lua_CFCharacterSetIsLongCharacterMember},
    {"CFCharacterSetCreateBitmapRepresentation", lua_CFCharacterSetCreateBitmapRepresentation},
    {"CFCharacterSetCreateWithBitmapRepresentation", lua_CFCharacterSetCreateWithBitmapRepresentation},
    {"CFCharacterSetCreateBitmapRepresentation", lua_CFCharacterSetCreateBitmapRepresentation},
    {"CFCharacterSetAddCharactersInRange", lua_CFCharacterSetAddCharactersInRange},
    {"CFCharacterSetAddCharactersInRange", lua_CFCharacterSetAddCharactersInRange},
    {"CFCharacterSetRemoveCharactersInRange", lua_CFCharacterSetRemoveCharactersInRange},
    {"CFCharacterSetRemoveCharactersInRange", lua_CFCharacterSetRemoveCharactersInRange},
    {"CFCharacterSetAddCharactersInString", lua_CFCharacterSetAddCharactersInString},
    {"CFCharacterSetAddCharactersInString", lua_CFCharacterSetAddCharactersInString},
    {"CFCharacterSetRemoveCharactersInString", lua_CFCharacterSetRemoveCharactersInString},
    {"CFCharacterSetRemoveCharactersInString", lua_CFCharacterSetRemoveCharactersInString},
    {"CFCharacterSetUnion", lua_CFCharacterSetUnion},
    {"CFCharacterSetUnion", lua_CFCharacterSetUnion},
    {"CFCharacterSetIntersect", lua_CFCharacterSetIntersect},
    {"CFCharacterSetIntersect", lua_CFCharacterSetIntersect},
    {"CFCharacterSetInvert", lua_CFCharacterSetInvert},
    {"CFCharacterSetInvert", lua_CFCharacterSetInvert},
    {NULL, NULL},
};

int LuaOpenCFCharacterSet(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFCharacterSetAPIs);
    return 0;
}
