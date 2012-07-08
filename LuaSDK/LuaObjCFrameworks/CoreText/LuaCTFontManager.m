//
//  LuaCTFontManager.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTFontManager.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTFontManagerErrors(lua_State *L)
{
    CTFontManagerErrors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCopyAvailablePostScriptNames(lua_State *L)
{
    CTFontManagerCopyAvailablePostScriptNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCopyAvailablePostScriptNames(lua_State *L)
{
    CTFontManagerCopyAvailablePostScriptNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCopyAvailableFontFamilyNames(lua_State *L)
{
    CTFontManagerCopyAvailableFontFamilyNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCopyAvailableFontFamilyNames(lua_State *L)
{
    CTFontManagerCopyAvailableFontFamilyNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCopyAvailableFontURLs(lua_State *L)
{
    CTFontManagerCopyAvailableFontURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCopyAvailableFontURLs(lua_State *L)
{
    CTFontManagerCopyAvailableFontURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCompareFontFamilyNames(lua_State *L)
{
    CTFontManagerCompareFontFamilyNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCompareFontFamilyNames(lua_State *L)
{
    CTFontManagerCompareFontFamilyNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCreateFontDescriptorsFromURL(lua_State *L)
{
    CTFontManagerCreateFontDescriptorsFromURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCreateFontDescriptorsFromURL(lua_State *L)
{
    CTFontManagerCreateFontDescriptorsFromURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScope(lua_State *L)
{
    CTFontManagerScope(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScopeProcess(lua_State *L)
{
    CTFontManagerScopeProcess(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScopeUser(lua_State *L)
{
    CTFontManagerScopeUser(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScopeSession(lua_State *L)
{
    CTFontManagerScopeSession(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScopeNone(lua_State *L)
{
    CTFontManagerScopeNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScopeProcess(lua_State *L)
{
    CTFontManagerScopeProcess(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScopeUser(lua_State *L)
{
    CTFontManagerScopeUser(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScopeSession(lua_State *L)
{
    CTFontManagerScopeSession(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScope(lua_State *L)
{
    CTFontManagerScope(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisterFontsForURL(lua_State *L)
{
    CTFontManagerRegisterFontsForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisterFontsForURL(lua_State *L)
{
    CTFontManagerRegisterFontsForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScope(lua_State *L)
{
    CTFontManagerScope(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerUnregisterFontsForURL(lua_State *L)
{
    CTFontManagerUnregisterFontsForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisterFontsForURL(lua_State *L)
{
    CTFontManagerRegisterFontsForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerUnregisterFontsForURL(lua_State *L)
{
    CTFontManagerUnregisterFontsForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScope(lua_State *L)
{
    CTFontManagerScope(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisterGraphicsFont(lua_State *L)
{
    CTFontManagerRegisterGraphicsFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisterFontsForURL(lua_State *L)
{
    CTFontManagerRegisterFontsForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisterGraphicsFont(lua_State *L)
{
    CTFontManagerRegisterGraphicsFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerUnregisterGraphicsFont(lua_State *L)
{
    CTFontManagerUnregisterGraphicsFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerUnregisterGraphicsFont(lua_State *L)
{
    CTFontManagerUnregisterGraphicsFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisterFontsForURLs(lua_State *L)
{
    CTFontManagerRegisterFontsForURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerErrorFontURLsKey(lua_State *L)
{
    CTFontManagerErrorFontURLsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisterFontsForURLs(lua_State *L)
{
    CTFontManagerRegisterFontsForURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScope(lua_State *L)
{
    CTFontManagerScope(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerUnregisterFontsForURLs(lua_State *L)
{
    CTFontManagerUnregisterFontsForURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisterFontsForURL(lua_State *L)
{
    CTFontManagerRegisterFontsForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerErrorFontURLsKey(lua_State *L)
{
    CTFontManagerErrorFontURLsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerUnregisterFontsForURLs(lua_State *L)
{
    CTFontManagerUnregisterFontsForURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScope(lua_State *L)
{
    CTFontManagerScope(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerEnableFontDescriptors(lua_State *L)
{
    CTFontManagerEnableFontDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerEnableFontDescriptors(lua_State *L)
{
    CTFontManagerEnableFontDescriptors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerGetScopeForURL(lua_State *L)
{
    CTFontManagerGetScopeForURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScopeNone(lua_State *L)
{
    CTFontManagerScopeNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerScope(lua_State *L)
{
    CTFontManagerScope(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerIsSupportedFontFile(lua_State *L)
{
    CTFontManagerIsSupportedFontFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerIsSupportedFont(lua_State *L)
{
    CTFontManagerIsSupportedFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCreateFontRequestRunLoopSource(lua_State *L)
{
    CTFontManagerCreateFontRequestRunLoopSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerCreateFontRequestRunLoopSource(lua_State *L)
{
    CTFontManagerCreateFontRequestRunLoopSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerBundleIdentifier(lua_State *L)
{
    CTFontManagerBundleIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerBundleIdentifier(lua_State *L)
{
    CTFontManagerBundleIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationDefault(lua_State *L)
{
    CTFontManagerAutoActivationDefault(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationDisabled(lua_State *L)
{
    CTFontManagerAutoActivationDisabled(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationEnabled(lua_State *L)
{
    CTFontManagerAutoActivationEnabled(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationPromptUser(lua_State *L)
{
    CTFontManagerAutoActivationPromptUser(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationDefault(lua_State *L)
{
    CTFontManagerAutoActivationDefault(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationDisabled(lua_State *L)
{
    CTFontManagerAutoActivationDisabled(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationEnabled(lua_State *L)
{
    CTFontManagerAutoActivationEnabled(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationPromptUser(lua_State *L)
{
    CTFontManagerAutoActivationPromptUser(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationSetting(lua_State *L)
{
    CTFontManagerAutoActivationSetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerSetAutoActivationSetting(lua_State *L)
{
    CTFontManagerSetAutoActivationSetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerBundleIdentifier(lua_State *L)
{
    CTFontManagerBundleIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerSetAutoActivationSetting(lua_State *L)
{
    CTFontManagerSetAutoActivationSetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationSetting(lua_State *L)
{
    CTFontManagerAutoActivationSetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerGetAutoActivationSetting(lua_State *L)
{
    CTFontManagerGetAutoActivationSetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerBundleIdentifier(lua_State *L)
{
    CTFontManagerBundleIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerAutoActivationSetting(lua_State *L)
{
    CTFontManagerAutoActivationSetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisteredFontsChangedNotification(lua_State *L)
{
    CTFontManagerRegisteredFontsChangedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManagerRegisteredFontsChangedNotification(lua_State *L)
{
    CTFontManagerRegisteredFontsChangedNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTFontManagerAPIs[] = {
    {"CTFontManagerErrors", lua_CTFontManagerErrors},
    {"CTFontManagerCopyAvailablePostScriptNames", lua_CTFontManagerCopyAvailablePostScriptNames},
    {"CTFontManagerCopyAvailablePostScriptNames", lua_CTFontManagerCopyAvailablePostScriptNames},
    {"CTFontManagerCopyAvailableFontFamilyNames", lua_CTFontManagerCopyAvailableFontFamilyNames},
    {"CTFontManagerCopyAvailableFontFamilyNames", lua_CTFontManagerCopyAvailableFontFamilyNames},
    {"CTFontManagerCopyAvailableFontURLs", lua_CTFontManagerCopyAvailableFontURLs},
    {"CTFontManagerCopyAvailableFontURLs", lua_CTFontManagerCopyAvailableFontURLs},
    {"CTFontManagerCompareFontFamilyNames", lua_CTFontManagerCompareFontFamilyNames},
    {"CTFontManagerCompareFontFamilyNames", lua_CTFontManagerCompareFontFamilyNames},
    {"CTFontManagerCreateFontDescriptorsFromURL", lua_CTFontManagerCreateFontDescriptorsFromURL},
    {"CTFontManagerCreateFontDescriptorsFromURL", lua_CTFontManagerCreateFontDescriptorsFromURL},
    {"CTFontManagerScope", lua_CTFontManagerScope},
    {"CTFontManagerScopeProcess", lua_CTFontManagerScopeProcess},
    {"CTFontManagerScopeUser", lua_CTFontManagerScopeUser},
    {"CTFontManagerScopeSession", lua_CTFontManagerScopeSession},
    {"CTFontManagerScopeNone", lua_CTFontManagerScopeNone},
    {"CTFontManagerScopeProcess", lua_CTFontManagerScopeProcess},
    {"CTFontManagerScopeUser", lua_CTFontManagerScopeUser},
    {"CTFontManagerScopeSession", lua_CTFontManagerScopeSession},
    {"CTFontManagerScope", lua_CTFontManagerScope},
    {"CTFontManagerRegisterFontsForURL", lua_CTFontManagerRegisterFontsForURL},
    {"CTFontManagerRegisterFontsForURL", lua_CTFontManagerRegisterFontsForURL},
    {"CTFontManagerScope", lua_CTFontManagerScope},
    {"CTFontManagerUnregisterFontsForURL", lua_CTFontManagerUnregisterFontsForURL},
    {"CTFontManagerRegisterFontsForURL", lua_CTFontManagerRegisterFontsForURL},
    {"CTFontManagerUnregisterFontsForURL", lua_CTFontManagerUnregisterFontsForURL},
    {"CTFontManagerScope", lua_CTFontManagerScope},
    {"CTFontManagerRegisterGraphicsFont", lua_CTFontManagerRegisterGraphicsFont},
    {"CTFontManagerRegisterFontsForURL", lua_CTFontManagerRegisterFontsForURL},
    {"CTFontManagerRegisterGraphicsFont", lua_CTFontManagerRegisterGraphicsFont},
    {"CTFontManagerUnregisterGraphicsFont", lua_CTFontManagerUnregisterGraphicsFont},
    {"CTFontManagerUnregisterGraphicsFont", lua_CTFontManagerUnregisterGraphicsFont},
    {"CTFontManagerRegisterFontsForURLs", lua_CTFontManagerRegisterFontsForURLs},
    {"CTFontManagerErrorFontURLsKey", lua_CTFontManagerErrorFontURLsKey},
    {"CTFontManagerRegisterFontsForURLs", lua_CTFontManagerRegisterFontsForURLs},
    {"CTFontManagerScope", lua_CTFontManagerScope},
    {"CTFontManagerUnregisterFontsForURLs", lua_CTFontManagerUnregisterFontsForURLs},
    {"CTFontManagerRegisterFontsForURL", lua_CTFontManagerRegisterFontsForURL},
    {"CTFontManagerErrorFontURLsKey", lua_CTFontManagerErrorFontURLsKey},
    {"CTFontManagerUnregisterFontsForURLs", lua_CTFontManagerUnregisterFontsForURLs},
    {"CTFontManagerScope", lua_CTFontManagerScope},
    {"CTFontManagerEnableFontDescriptors", lua_CTFontManagerEnableFontDescriptors},
    {"CTFontManagerEnableFontDescriptors", lua_CTFontManagerEnableFontDescriptors},
    {"CTFontManagerGetScopeForURL", lua_CTFontManagerGetScopeForURL},
    {"CTFontManagerScopeNone", lua_CTFontManagerScopeNone},
    {"CTFontManagerScope", lua_CTFontManagerScope},
    {"CTFontManagerIsSupportedFontFile", lua_CTFontManagerIsSupportedFontFile},
    {"CTFontManagerIsSupportedFont", lua_CTFontManagerIsSupportedFont},
    {"CTFontManagerCreateFontRequestRunLoopSource", lua_CTFontManagerCreateFontRequestRunLoopSource},
    {"CTFontManagerCreateFontRequestRunLoopSource", lua_CTFontManagerCreateFontRequestRunLoopSource},
    {"CTFontManagerBundleIdentifier", lua_CTFontManagerBundleIdentifier},
    {"CTFontManagerBundleIdentifier", lua_CTFontManagerBundleIdentifier},
    {"CTFontManagerAutoActivationDefault", lua_CTFontManagerAutoActivationDefault},
    {"CTFontManagerAutoActivationDisabled", lua_CTFontManagerAutoActivationDisabled},
    {"CTFontManagerAutoActivationEnabled", lua_CTFontManagerAutoActivationEnabled},
    {"CTFontManagerAutoActivationPromptUser", lua_CTFontManagerAutoActivationPromptUser},
    {"CTFontManagerAutoActivationDefault", lua_CTFontManagerAutoActivationDefault},
    {"CTFontManagerAutoActivationDisabled", lua_CTFontManagerAutoActivationDisabled},
    {"CTFontManagerAutoActivationEnabled", lua_CTFontManagerAutoActivationEnabled},
    {"CTFontManagerAutoActivationPromptUser", lua_CTFontManagerAutoActivationPromptUser},
    {"CTFontManagerAutoActivationSetting", lua_CTFontManagerAutoActivationSetting},
    {"CTFontManagerSetAutoActivationSetting", lua_CTFontManagerSetAutoActivationSetting},
    {"CTFontManagerBundleIdentifier", lua_CTFontManagerBundleIdentifier},
    {"CTFontManagerSetAutoActivationSetting", lua_CTFontManagerSetAutoActivationSetting},
    {"CTFontManagerAutoActivationSetting", lua_CTFontManagerAutoActivationSetting},
    {"CTFontManagerGetAutoActivationSetting", lua_CTFontManagerGetAutoActivationSetting},
    {"CTFontManagerBundleIdentifier", lua_CTFontManagerBundleIdentifier},
    {"CTFontManagerAutoActivationSetting", lua_CTFontManagerAutoActivationSetting},
    {"CTFontManagerRegisteredFontsChangedNotification", lua_CTFontManagerRegisteredFontsChangedNotification},
    {"CTFontManagerRegisteredFontsChangedNotification", lua_CTFontManagerRegisteredFontsChangedNotification},
    {NULL, NULL},
};

int LuaOpenCTFontManager(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTFontManagerAPIs);
    return 0;
}
