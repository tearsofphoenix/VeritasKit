//
//  LuaCFBundle.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFBundle.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFBundleRef(lua_State *L)
{
    CFBundleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleInfoDictionaryVersionKey(lua_State *L)
{
    CFBundleInfoDictionaryVersionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleExecutableKey(lua_State *L)
{
    CFBundleExecutableKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleIdentifierKey(lua_State *L)
{
    CFBundleIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetBundleWithIdentifier(lua_State *L)
{
    CFBundleGetBundleWithIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleVersionKey(lua_State *L)
{
    CFBundleVersionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetVersionNumber(lua_State *L)
{
    CFBundleGetVersionNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleDevelopmentRegionKey(lua_State *L)
{
    CFBundleDevelopmentRegionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleNameKey(lua_State *L)
{
    CFBundleNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleLocalizationsKey(lua_State *L)
{
    CFBundleLocalizationsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleRef(lua_State *L)
{
    CFBundleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleRef(lua_State *L)
{
    CFBundleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetAllBundles(lua_State *L)
{
    CFBundleGetAllBundles(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetTypeID(lua_State *L)
{
    CFBundleGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleRef(lua_State *L)
{
    CFBundleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCreateBundlesFromDirectory(lua_State *L)
{
    CFBundleCreateBundlesFromDirectory(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCreate(lua_State *L)
{
    CFBundleCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyBundleURL(lua_State *L)
{
    CFBundleCopyBundleURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetValueForInfoDictionaryKey(lua_State *L)
{
    CFBundleGetValueForInfoDictionaryKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetInfoDictionary(lua_State *L)
{
    CFBundleGetInfoDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetLocalInfoDictionary(lua_State *L)
{
    CFBundleGetLocalInfoDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetPackageInfo(lua_State *L)
{
    CFBundleGetPackageInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetIdentifier(lua_State *L)
{
    CFBundleGetIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetVersionNumber(lua_State *L)
{
    CFBundleGetVersionNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetDevelopmentRegion(lua_State *L)
{
    CFBundleGetDevelopmentRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopySupportFilesDirectoryURL(lua_State *L)
{
    CFBundleCopySupportFilesDirectoryURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyResourcesDirectoryURL(lua_State *L)
{
    CFBundleCopyResourcesDirectoryURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyPrivateFrameworksURL(lua_State *L)
{
    CFBundleCopyPrivateFrameworksURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopySharedFrameworksURL(lua_State *L)
{
    CFBundleCopySharedFrameworksURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopySharedSupportURL(lua_State *L)
{
    CFBundleCopySharedSupportURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyBuiltInPlugInsURL(lua_State *L)
{
    CFBundleCopyBuiltInPlugInsURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyInfoDictionaryInDirectory(lua_State *L)
{
    CFBundleCopyInfoDictionaryInDirectory(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetPackageInfoInDirectory(lua_State *L)
{
    CFBundleGetPackageInfoInDirectory(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyResourceURL(lua_State *L)
{
    CFBundleCopyResourceURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyResourceURLsOfType(lua_State *L)
{
    CFBundleCopyResourceURLsOfType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyLocalizedString(lua_State *L)
{
    CFBundleCopyLocalizedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyLocalizedString(lua_State *L)
{
    CFBundleCopyLocalizedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyLocalizedString(lua_State *L)
{
    CFBundleCopyLocalizedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyLocalizedString(lua_State *L)
{
    CFBundleCopyLocalizedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyLocalizedString(lua_State *L)
{
    CFBundleCopyLocalizedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyResourceURLInDirectory(lua_State *L)
{
    CFBundleCopyResourceURLInDirectory(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyResourceURLsOfTypeInDirectory(lua_State *L)
{
    CFBundleCopyResourceURLsOfTypeInDirectory(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyBundleLocalizations(lua_State *L)
{
    CFBundleCopyBundleLocalizations(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyPreferredLocalizationsFromArray(lua_State *L)
{
    CFBundleCopyPreferredLocalizationsFromArray(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyBundleLocalizations(lua_State *L)
{
    CFBundleCopyBundleLocalizations(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyLocalizationsForPreferences(lua_State *L)
{
    CFBundleCopyLocalizationsForPreferences(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyPreferredLocalizationsFromArray(lua_State *L)
{
    CFBundleCopyPreferredLocalizationsFromArray(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyBundleLocalizations(lua_State *L)
{
    CFBundleCopyBundleLocalizations(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyResourceURLForLocalization(lua_State *L)
{
    CFBundleCopyResourceURLForLocalization(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyResourceURLsOfTypeForLocalization(lua_State *L)
{
    CFBundleCopyResourceURLsOfTypeForLocalization(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyResourceURLForLocalization(lua_State *L)
{
    CFBundleCopyResourceURLForLocalization(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyResourceURLsOfTypeForLocalization(lua_State *L)
{
    CFBundleCopyResourceURLsOfTypeForLocalization(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyBundleLocalizations(lua_State *L)
{
    CFBundleCopyBundleLocalizations(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyPreferredLocalizationsFromArray(lua_State *L)
{
    CFBundleCopyPreferredLocalizationsFromArray(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyLocalizationsForPreferences(lua_State *L)
{
    CFBundleCopyLocalizationsForPreferences(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyInfoDictionaryForURL(lua_State *L)
{
    CFBundleCopyInfoDictionaryForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyInfoDictionaryInDirectory(lua_State *L)
{
    CFBundleCopyInfoDictionaryInDirectory(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyLocalizationsForURL(lua_State *L)
{
    CFBundleCopyLocalizationsForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyBundleLocalizations(lua_State *L)
{
    CFBundleCopyBundleLocalizations(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleLocalizations(lua_State *L)
{
    CFBundleLocalizations(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleDevelopmentRegion(lua_State *L)
{
    CFBundleDevelopmentRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyExecutableArchitecturesForURL(lua_State *L)
{
    CFBundleCopyExecutableArchitecturesForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyExecutableArchitectures(lua_State *L)
{
    CFBundleCopyExecutableArchitectures(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyExecutableURL(lua_State *L)
{
    CFBundleCopyExecutableURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleExecutableArchitectureI386(lua_State *L)
{
    CFBundleExecutableArchitectureI386(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleExecutableArchitecturePPC(lua_State *L)
{
    CFBundleExecutableArchitecturePPC(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleExecutableArchitectureX86_64(lua_State *L)
{
    CFBundleExecutableArchitectureX86_64(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleExecutableArchitecturePPC64(lua_State *L)
{
    CFBundleExecutableArchitecturePPC64(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyExecutableArchitectures(lua_State *L)
{
    CFBundleCopyExecutableArchitectures(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundlePreflightExecutable(lua_State *L)
{
    CFBundlePreflightExecutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleLoadExecutableAndReturnError(lua_State *L)
{
    CFBundleLoadExecutableAndReturnError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleLoadExecutable(lua_State *L)
{
    CFBundleLoadExecutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleIsExecutableLoaded(lua_State *L)
{
    CFBundleIsExecutableLoaded(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleUnloadExecutable(lua_State *L)
{
    CFBundleUnloadExecutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetFunctionPointerForName(lua_State *L)
{
    CFBundleGetFunctionPointerForName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetFunctionPointersForNames(lua_State *L)
{
    CFBundleGetFunctionPointersForNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetDataPointerForName(lua_State *L)
{
    CFBundleGetDataPointerForName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetDataPointersForNames(lua_State *L)
{
    CFBundleGetDataPointersForNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCopyAuxiliaryExecutableURL(lua_State *L)
{
    CFBundleCopyAuxiliaryExecutableURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleGetPlugIn(lua_State *L)
{
    CFBundleGetPlugIn(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleRefNum(lua_State *L)
{
    CFBundleRefNum(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleRefNum(lua_State *L)
{
    CFBundleRefNum(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleRefNum(lua_State *L)
{
    CFBundleRefNum(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleOpenBundleResourceFiles(lua_State *L)
{
    CFBundleOpenBundleResourceFiles(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleOpenBundleResourceMap(lua_State *L)
{
    CFBundleOpenBundleResourceMap(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFBundleCloseBundleResourceMap(lua_State *L)
{
    CFBundleCloseBundleResourceMap(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFBundleAPIs[] = {
    {"CFBundleRef", lua_CFBundleRef},
    {"CFBundleInfoDictionaryVersionKey", lua_CFBundleInfoDictionaryVersionKey},
    {"CFBundleExecutableKey", lua_CFBundleExecutableKey},
    {"CFBundleIdentifierKey", lua_CFBundleIdentifierKey},
    {"CFBundleGetBundleWithIdentifier", lua_CFBundleGetBundleWithIdentifier},
    {"CFBundleVersionKey", lua_CFBundleVersionKey},
    {"CFBundleGetVersionNumber", lua_CFBundleGetVersionNumber},
    {"CFBundleDevelopmentRegionKey", lua_CFBundleDevelopmentRegionKey},
    {"CFBundleNameKey", lua_CFBundleNameKey},
    {"CFBundleLocalizationsKey", lua_CFBundleLocalizationsKey},
    {"CFBundleRef", lua_CFBundleRef},
    {"CFBundleRef", lua_CFBundleRef},
    {"CFBundleGetAllBundles", lua_CFBundleGetAllBundles},
    {"CFBundleGetTypeID", lua_CFBundleGetTypeID},
    {"CFBundleRef", lua_CFBundleRef},
    {"CFBundleCreateBundlesFromDirectory", lua_CFBundleCreateBundlesFromDirectory},
    {"CFBundleCreate", lua_CFBundleCreate},
    {"CFBundleCopyBundleURL", lua_CFBundleCopyBundleURL},
    {"CFBundleGetValueForInfoDictionaryKey", lua_CFBundleGetValueForInfoDictionaryKey},
    {"CFBundleGetInfoDictionary", lua_CFBundleGetInfoDictionary},
    {"CFBundleGetLocalInfoDictionary", lua_CFBundleGetLocalInfoDictionary},
    {"CFBundleGetPackageInfo", lua_CFBundleGetPackageInfo},
    {"CFBundleGetIdentifier", lua_CFBundleGetIdentifier},
    {"CFBundleGetVersionNumber", lua_CFBundleGetVersionNumber},
    {"CFBundleGetDevelopmentRegion", lua_CFBundleGetDevelopmentRegion},
    {"CFBundleCopySupportFilesDirectoryURL", lua_CFBundleCopySupportFilesDirectoryURL},
    {"CFBundleCopyResourcesDirectoryURL", lua_CFBundleCopyResourcesDirectoryURL},
    {"CFBundleCopyPrivateFrameworksURL", lua_CFBundleCopyPrivateFrameworksURL},
    {"CFBundleCopySharedFrameworksURL", lua_CFBundleCopySharedFrameworksURL},
    {"CFBundleCopySharedSupportURL", lua_CFBundleCopySharedSupportURL},
    {"CFBundleCopyBuiltInPlugInsURL", lua_CFBundleCopyBuiltInPlugInsURL},
    {"CFBundleCopyInfoDictionaryInDirectory", lua_CFBundleCopyInfoDictionaryInDirectory},
    {"CFBundleGetPackageInfoInDirectory", lua_CFBundleGetPackageInfoInDirectory},
    {"CFBundleCopyResourceURL", lua_CFBundleCopyResourceURL},
    {"CFBundleCopyResourceURLsOfType", lua_CFBundleCopyResourceURLsOfType},
    {"CFBundleCopyLocalizedString", lua_CFBundleCopyLocalizedString},
    {"CFBundleCopyLocalizedString", lua_CFBundleCopyLocalizedString},
    {"CFBundleCopyLocalizedString", lua_CFBundleCopyLocalizedString},
    {"CFBundleCopyLocalizedString", lua_CFBundleCopyLocalizedString},
    {"CFBundleCopyLocalizedString", lua_CFBundleCopyLocalizedString},
    {"CFBundleCopyResourceURLInDirectory", lua_CFBundleCopyResourceURLInDirectory},
    {"CFBundleCopyResourceURLsOfTypeInDirectory", lua_CFBundleCopyResourceURLsOfTypeInDirectory},
    {"CFBundleCopyBundleLocalizations", lua_CFBundleCopyBundleLocalizations},
    {"CFBundleCopyPreferredLocalizationsFromArray", lua_CFBundleCopyPreferredLocalizationsFromArray},
    {"CFBundleCopyBundleLocalizations", lua_CFBundleCopyBundleLocalizations},
    {"CFBundleCopyLocalizationsForPreferences", lua_CFBundleCopyLocalizationsForPreferences},
    {"CFBundleCopyPreferredLocalizationsFromArray", lua_CFBundleCopyPreferredLocalizationsFromArray},
    {"CFBundleCopyBundleLocalizations", lua_CFBundleCopyBundleLocalizations},
    {"CFBundleCopyResourceURLForLocalization", lua_CFBundleCopyResourceURLForLocalization},
    {"CFBundleCopyResourceURLsOfTypeForLocalization", lua_CFBundleCopyResourceURLsOfTypeForLocalization},
    {"CFBundleCopyResourceURLForLocalization", lua_CFBundleCopyResourceURLForLocalization},
    {"CFBundleCopyResourceURLsOfTypeForLocalization", lua_CFBundleCopyResourceURLsOfTypeForLocalization},
    {"CFBundleCopyBundleLocalizations", lua_CFBundleCopyBundleLocalizations},
    {"CFBundleCopyPreferredLocalizationsFromArray", lua_CFBundleCopyPreferredLocalizationsFromArray},
    {"CFBundleCopyLocalizationsForPreferences", lua_CFBundleCopyLocalizationsForPreferences},
    {"CFBundleCopyInfoDictionaryForURL", lua_CFBundleCopyInfoDictionaryForURL},
    {"CFBundleCopyInfoDictionaryInDirectory", lua_CFBundleCopyInfoDictionaryInDirectory},
    {"CFBundleCopyLocalizationsForURL", lua_CFBundleCopyLocalizationsForURL},
    {"CFBundleCopyBundleLocalizations", lua_CFBundleCopyBundleLocalizations},
    {"CFBundleLocalizations", lua_CFBundleLocalizations},
    {"CFBundleDevelopmentRegion", lua_CFBundleDevelopmentRegion},
    {"CFBundleCopyExecutableArchitecturesForURL", lua_CFBundleCopyExecutableArchitecturesForURL},
    {"CFBundleCopyExecutableArchitectures", lua_CFBundleCopyExecutableArchitectures},
    {"CFBundleCopyExecutableURL", lua_CFBundleCopyExecutableURL},
    {"CFBundleExecutableArchitectureI386", lua_CFBundleExecutableArchitectureI386},
    {"CFBundleExecutableArchitecturePPC", lua_CFBundleExecutableArchitecturePPC},
    {"CFBundleExecutableArchitectureX86_64", lua_CFBundleExecutableArchitectureX86_64},
    {"CFBundleExecutableArchitecturePPC64", lua_CFBundleExecutableArchitecturePPC64},
    {"CFBundleCopyExecutableArchitectures", lua_CFBundleCopyExecutableArchitectures},
    {"CFBundlePreflightExecutable", lua_CFBundlePreflightExecutable},
    {"CFBundleLoadExecutableAndReturnError", lua_CFBundleLoadExecutableAndReturnError},
    {"CFBundleLoadExecutable", lua_CFBundleLoadExecutable},
    {"CFBundleIsExecutableLoaded", lua_CFBundleIsExecutableLoaded},
    {"CFBundleUnloadExecutable", lua_CFBundleUnloadExecutable},
    {"CFBundleGetFunctionPointerForName", lua_CFBundleGetFunctionPointerForName},
    {"CFBundleGetFunctionPointersForNames", lua_CFBundleGetFunctionPointersForNames},
    {"CFBundleGetDataPointerForName", lua_CFBundleGetDataPointerForName},
    {"CFBundleGetDataPointersForNames", lua_CFBundleGetDataPointersForNames},
    {"CFBundleCopyAuxiliaryExecutableURL", lua_CFBundleCopyAuxiliaryExecutableURL},
    {"CFBundleGetPlugIn", lua_CFBundleGetPlugIn},
    {"CFBundleRefNum", lua_CFBundleRefNum},
    {"CFBundleRefNum", lua_CFBundleRefNum},
    {"CFBundleRefNum", lua_CFBundleRefNum},
    {"CFBundleOpenBundleResourceFiles", lua_CFBundleOpenBundleResourceFiles},
    {"CFBundleOpenBundleResourceMap", lua_CFBundleOpenBundleResourceMap},
    {"CFBundleCloseBundleResourceMap", lua_CFBundleCloseBundleResourceMap},
    {NULL, NULL},
};

int LuaOpenCFBundle(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFBundleAPIs);
    return 0;
}
