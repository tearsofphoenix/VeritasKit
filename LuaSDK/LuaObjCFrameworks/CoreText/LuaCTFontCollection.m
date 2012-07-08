//
//  LuaCTFontCollection.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTFontCollection.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionGetTypeID(lua_State *L)
{
    CTFontCollectionGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionGetTypeID(lua_State *L)
{
    CTFontCollectionGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionSortDescriptorsCallback(lua_State *L)
{
    CTFontCollectionSortDescriptorsCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionSortDescriptorsCallback(lua_State *L)
{
    CTFontCollectionSortDescriptorsCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRemoveDuplicatesOption(lua_State *L)
{
    CTFontCollectionRemoveDuplicatesOption(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRemoveDuplicatesOption(lua_State *L)
{
    CTFontCollectionRemoveDuplicatesOption(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionIncludeDisabledOption(lua_State *L)
{
    CTFontCollectionIncludeDisabledOption(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionIncludeDisabledFontsOption(lua_State *L)
{
    CTFontCollectionIncludeDisabledFontsOption(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionDisallowAutoActivationOption(lua_State *L)
{
    CTFontCollectionDisallowAutoActivationOption(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionDisallowAutoActivationOption(lua_State *L)
{
    CTFontCollectionDisallowAutoActivationOption(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateFromAvailableFonts(lua_State *L)
{
    CTFontCollectionCreateFromAvailableFonts(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateWithFontDescriptors(lua_State *L)
{
    CTFontCollectionCreateWithFontDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateCopyWithFontDescriptors(lua_State *L)
{
    CTFontCollectionCreateCopyWithFontDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMutableCopy(lua_State *L)
{
    CTFontCollectionCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMutableCopy(lua_State *L)
{
    CTFontCollectionCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyQueryDescriptors(lua_State *L)
{
    CTFontCollectionCopyQueryDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateFromAvailableFonts(lua_State *L)
{
    CTFontCollectionCreateFromAvailableFonts(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyQueryDescriptors(lua_State *L)
{
    CTFontCollectionCopyQueryDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionSetQueryDescriptors(lua_State *L)
{
    CTFontCollectionSetQueryDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionSetQueryDescriptors(lua_State *L)
{
    CTFontCollectionSetQueryDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyExclusionDescriptors(lua_State *L)
{
    CTFontCollectionCopyExclusionDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyExclusionDescriptors(lua_State *L)
{
    CTFontCollectionCopyExclusionDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionSetExclusionDescriptors(lua_State *L)
{
    CTFontCollectionSetExclusionDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionSetExclusionDescriptors(lua_State *L)
{
    CTFontCollectionSetExclusionDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingFontDescriptors(lua_State *L)
{
    CTFontCollectionCreateMatchingFontDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingFontDescriptors(lua_State *L)
{
    CTFontCollectionCreateMatchingFontDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback(lua_State *L)
{
    CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback(lua_State *L)
{
    CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionSortDescriptorsCallback(lua_State *L)
{
    CTFontCollectionSortDescriptorsCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingFontDescriptorsWithOptions(lua_State *L)
{
    CTFontCollectionCreateMatchingFontDescriptorsWithOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingFontDescriptors(lua_State *L)
{
    CTFontCollectionCreateMatchingFontDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingFontDescriptorsWithOptions(lua_State *L)
{
    CTFontCollectionCreateMatchingFontDescriptorsWithOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingFontDescriptorsForFamily(lua_State *L)
{
    CTFontCollectionCreateMatchingFontDescriptorsForFamily(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingFontDescriptorsForFamily(lua_State *L)
{
    CTFontCollectionCreateMatchingFontDescriptorsForFamily(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyOptions(lua_State *L)
{
    CTFontCollectionCopyOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyFontAttribute(lua_State *L)
{
    CTFontCollectionCopyFontAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyStandardSort(lua_State *L)
{
    CTFontCollectionCopyStandardSort(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyUnique(lua_State *L)
{
    CTFontCollectionCopyUnique(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyDefaultOptions(lua_State *L)
{
    CTFontCollectionCopyDefaultOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyUnique(lua_State *L)
{
    CTFontCollectionCopyUnique(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyStandardSort(lua_State *L)
{
    CTFontCollectionCopyStandardSort(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyOptions(lua_State *L)
{
    CTFontCollectionCopyOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyFontAttribute(lua_State *L)
{
    CTFontCollectionCopyFontAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingDescriptors(lua_State *L)
{
    CTFontCollectionCreateMatchingDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyFontAttribute(lua_State *L)
{
    CTFontCollectionCopyFontAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyOptions(lua_State *L)
{
    CTFontCollectionCopyOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyFontAttributes(lua_State *L)
{
    CTFontCollectionCopyFontAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCreateMatchingDescriptors(lua_State *L)
{
    CTFontCollectionCreateMatchingDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyFontAttributes(lua_State *L)
{
    CTFontCollectionCopyFontAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionRef(lua_State *L)
{
    CTFontCollectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCollectionCopyOptions(lua_State *L)
{
    CTFontCollectionCopyOptions(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTFontCollectionAPIs[] = {
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionGetTypeID", lua_CTFontCollectionGetTypeID},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionGetTypeID", lua_CTFontCollectionGetTypeID},
    {"CTFontCollectionSortDescriptorsCallback", lua_CTFontCollectionSortDescriptorsCallback},
    {"CTFontCollectionSortDescriptorsCallback", lua_CTFontCollectionSortDescriptorsCallback},
    {"CTFontCollectionRemoveDuplicatesOption", lua_CTFontCollectionRemoveDuplicatesOption},
    {"CTFontCollectionRemoveDuplicatesOption", lua_CTFontCollectionRemoveDuplicatesOption},
    {"CTFontCollectionIncludeDisabledOption", lua_CTFontCollectionIncludeDisabledOption},
    {"CTFontCollectionIncludeDisabledFontsOption", lua_CTFontCollectionIncludeDisabledFontsOption},
    {"CTFontCollectionDisallowAutoActivationOption", lua_CTFontCollectionDisallowAutoActivationOption},
    {"CTFontCollectionDisallowAutoActivationOption", lua_CTFontCollectionDisallowAutoActivationOption},
    {"CTFontCollectionCreateFromAvailableFonts", lua_CTFontCollectionCreateFromAvailableFonts},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionCreateWithFontDescriptors", lua_CTFontCollectionCreateWithFontDescriptors},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionCreateCopyWithFontDescriptors", lua_CTFontCollectionCreateCopyWithFontDescriptors},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionCreateMutableCopy", lua_CTFontCollectionCreateMutableCopy},
    {"CTFontCollectionCreateMutableCopy", lua_CTFontCollectionCreateMutableCopy},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionCopyQueryDescriptors", lua_CTFontCollectionCopyQueryDescriptors},
    {"CTFontCollectionCreateFromAvailableFonts", lua_CTFontCollectionCreateFromAvailableFonts},
    {"CTFontCollectionCopyQueryDescriptors", lua_CTFontCollectionCopyQueryDescriptors},
    {"CTFontCollectionSetQueryDescriptors", lua_CTFontCollectionSetQueryDescriptors},
    {"CTFontCollectionSetQueryDescriptors", lua_CTFontCollectionSetQueryDescriptors},
    {"CTFontCollectionCopyExclusionDescriptors", lua_CTFontCollectionCopyExclusionDescriptors},
    {"CTFontCollectionCopyExclusionDescriptors", lua_CTFontCollectionCopyExclusionDescriptors},
    {"CTFontCollectionSetExclusionDescriptors", lua_CTFontCollectionSetExclusionDescriptors},
    {"CTFontCollectionSetExclusionDescriptors", lua_CTFontCollectionSetExclusionDescriptors},
    {"CTFontCollectionCreateMatchingFontDescriptors", lua_CTFontCollectionCreateMatchingFontDescriptors},
    {"CTFontCollectionCreateMatchingFontDescriptors", lua_CTFontCollectionCreateMatchingFontDescriptors},
    {"CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback", lua_CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback},
    {"CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback", lua_CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionSortDescriptorsCallback", lua_CTFontCollectionSortDescriptorsCallback},
    {"CTFontCollectionCreateMatchingFontDescriptorsWithOptions", lua_CTFontCollectionCreateMatchingFontDescriptorsWithOptions},
    {"CTFontCollectionCreateMatchingFontDescriptors", lua_CTFontCollectionCreateMatchingFontDescriptors},
    {"CTFontCollectionCreateMatchingFontDescriptorsWithOptions", lua_CTFontCollectionCreateMatchingFontDescriptorsWithOptions},
    {"CTFontCollectionCreateMatchingFontDescriptorsForFamily", lua_CTFontCollectionCreateMatchingFontDescriptorsForFamily},
    {"CTFontCollectionCreateMatchingFontDescriptorsForFamily", lua_CTFontCollectionCreateMatchingFontDescriptorsForFamily},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionCopyOptions", lua_CTFontCollectionCopyOptions},
    {"CTFontCollectionCopyFontAttribute", lua_CTFontCollectionCopyFontAttribute},
    {"CTFontCollectionCopyStandardSort", lua_CTFontCollectionCopyStandardSort},
    {"CTFontCollectionCopyUnique", lua_CTFontCollectionCopyUnique},
    {"CTFontCollectionCopyDefaultOptions", lua_CTFontCollectionCopyDefaultOptions},
    {"CTFontCollectionCopyUnique", lua_CTFontCollectionCopyUnique},
    {"CTFontCollectionCopyStandardSort", lua_CTFontCollectionCopyStandardSort},
    {"CTFontCollectionCopyOptions", lua_CTFontCollectionCopyOptions},
    {"CTFontCollectionCopyFontAttribute", lua_CTFontCollectionCopyFontAttribute},
    {"CTFontCollectionCreateMatchingDescriptors", lua_CTFontCollectionCreateMatchingDescriptors},
    {"CTFontCollectionCopyFontAttribute", lua_CTFontCollectionCopyFontAttribute},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionCopyOptions", lua_CTFontCollectionCopyOptions},
    {"CTFontCollectionCopyFontAttributes", lua_CTFontCollectionCopyFontAttributes},
    {"CTFontCollectionCreateMatchingDescriptors", lua_CTFontCollectionCreateMatchingDescriptors},
    {"CTFontCollectionCopyFontAttributes", lua_CTFontCollectionCopyFontAttributes},
    {"CTFontCollectionRef", lua_CTFontCollectionRef},
    {"CTFontCollectionCopyOptions", lua_CTFontCollectionCopyOptions},
    {NULL, NULL},
};

int LuaOpenCTFontCollection(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTFontCollectionAPIs);
    return 0;
}
