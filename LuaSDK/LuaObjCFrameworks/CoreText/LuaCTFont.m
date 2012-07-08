//
//  LuaCTFont.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTFont.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTFontDescriptor(lua_State *L)
{
    CTFontDescriptor(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetTypeID(lua_State *L)
{
    CTFontGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetTypeID(lua_State *L)
{
    CTFontGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyrightNameKey(lua_State *L)
{
    CTFontCopyrightNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyrightNameKey(lua_State *L)
{
    CTFontCopyrightNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFamilyNameKey(lua_State *L)
{
    CTFontFamilyNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFamilyNameKey(lua_State *L)
{
    CTFontFamilyNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSubFamilyNameKey(lua_State *L)
{
    CTFontSubFamilyNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSubFamilyNameKey(lua_State *L)
{
    CTFontSubFamilyNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontStyleNameKey(lua_State *L)
{
    CTFontStyleNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontStyleNameKey(lua_State *L)
{
    CTFontStyleNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontUniqueNameKey(lua_State *L)
{
    CTFontUniqueNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontUniqueNameKey(lua_State *L)
{
    CTFontUniqueNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFullNameKey(lua_State *L)
{
    CTFontFullNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFullNameKey(lua_State *L)
{
    CTFontFullNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVersionNameKey(lua_State *L)
{
    CTFontVersionNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVersionNameKey(lua_State *L)
{
    CTFontVersionNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontPostScriptNameKey(lua_State *L)
{
    CTFontPostScriptNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontPostScriptNameKey(lua_State *L)
{
    CTFontPostScriptNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTrademarkNameKey(lua_State *L)
{
    CTFontTrademarkNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTrademarkNameKey(lua_State *L)
{
    CTFontTrademarkNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManufacturerNameKey(lua_State *L)
{
    CTFontManufacturerNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontManufacturerNameKey(lua_State *L)
{
    CTFontManufacturerNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDesignerNameKey(lua_State *L)
{
    CTFontDesignerNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDesignerNameKey(lua_State *L)
{
    CTFontDesignerNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptionNameKey(lua_State *L)
{
    CTFontDescriptionNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptionNameKey(lua_State *L)
{
    CTFontDescriptionNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVendorURLNameKey(lua_State *L)
{
    CTFontVendorURLNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVendorURLNameKey(lua_State *L)
{
    CTFontVendorURLNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDesignerURLNameKey(lua_State *L)
{
    CTFontDesignerURLNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDesignerURLNameKey(lua_State *L)
{
    CTFontDesignerURLNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontLicenseNameKey(lua_State *L)
{
    CTFontLicenseNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontLicenseNameKey(lua_State *L)
{
    CTFontLicenseNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontLicenseURLNameKey(lua_State *L)
{
    CTFontLicenseURLNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontLicenseURLNameKey(lua_State *L)
{
    CTFontLicenseURLNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSampleTextNameKey(lua_State *L)
{
    CTFontSampleTextNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSampleTextNameKey(lua_State *L)
{
    CTFontSampleTextNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontPostScriptCIDNameKey(lua_State *L)
{
    CTFontPostScriptCIDNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontPostScriptCIDNameKey(lua_State *L)
{
    CTFontPostScriptCIDNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateWithName(lua_State *L)
{
    CTFontCreateWithName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateWithFontDescriptor(lua_State *L)
{
    CTFontCreateWithFontDescriptor(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOptions(lua_State *L)
{
    CTFontOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOptionsPreventAutoActivation(lua_State *L)
{
    CTFontOptionsPreventAutoActivation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOptionsPreferSystemFont(lua_State *L)
{
    CTFontOptionsPreferSystemFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOptionsDefault(lua_State *L)
{
    CTFontOptionsDefault(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOptionsPreventAutoActivation(lua_State *L)
{
    CTFontOptionsPreventAutoActivation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOptionsPreferSystemFont(lua_State *L)
{
    CTFontOptionsPreferSystemFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOptions(lua_State *L)
{
    CTFontOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateWithNameAndOptions(lua_State *L)
{
    CTFontCreateWithNameAndOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOptions(lua_State *L)
{
    CTFontOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateWithFontDescriptorAndOptions(lua_State *L)
{
    CTFontCreateWithFontDescriptorAndOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOptions(lua_State *L)
{
    CTFontOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateUIFontForLanguage(lua_State *L)
{
    CTFontCreateUIFontForLanguage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontNoFontType(lua_State *L)
{
    CTFontNoFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontUserFontType(lua_State *L)
{
    CTFontUserFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontUserFixedPitchFontType(lua_State *L)
{
    CTFontUserFixedPitchFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSystemFontType(lua_State *L)
{
    CTFontSystemFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontEmphasizedSystemFontType(lua_State *L)
{
    CTFontEmphasizedSystemFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSmallSystemFontType(lua_State *L)
{
    CTFontSmallSystemFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSmallEmphasizedSystemFontType(lua_State *L)
{
    CTFontSmallEmphasizedSystemFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontMiniSystemFontType(lua_State *L)
{
    CTFontMiniSystemFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontMiniEmphasizedSystemFontType(lua_State *L)
{
    CTFontMiniEmphasizedSystemFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontViewsFontType(lua_State *L)
{
    CTFontViewsFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontApplicationFontType(lua_State *L)
{
    CTFontApplicationFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontLabelFontType(lua_State *L)
{
    CTFontLabelFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontMenuTitleFontType(lua_State *L)
{
    CTFontMenuTitleFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontMenuItemFontType(lua_State *L)
{
    CTFontMenuItemFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontMenuItemMarkFontType(lua_State *L)
{
    CTFontMenuItemMarkFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontMenuItemCmdKeyFontType(lua_State *L)
{
    CTFontMenuItemCmdKeyFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontWindowTitleFontType(lua_State *L)
{
    CTFontWindowTitleFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontPushButtonFontType(lua_State *L)
{
    CTFontPushButtonFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontUtilityWindowTitleFontType(lua_State *L)
{
    CTFontUtilityWindowTitleFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontAlertHeaderFontType(lua_State *L)
{
    CTFontAlertHeaderFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSystemDetailFontType(lua_State *L)
{
    CTFontSystemDetailFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontEmphasizedSystemDetailFontType(lua_State *L)
{
    CTFontEmphasizedSystemDetailFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontToolbarFontType(lua_State *L)
{
    CTFontToolbarFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSmallToolbarFontType(lua_State *L)
{
    CTFontSmallToolbarFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontMessageFontType(lua_State *L)
{
    CTFontMessageFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontPaletteFontType(lua_State *L)
{
    CTFontPaletteFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontToolTipFontType(lua_State *L)
{
    CTFontToolTipFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontControlContentFontType(lua_State *L)
{
    CTFontControlContentFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontUIFontType(lua_State *L)
{
    CTFontUIFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateUIFontForLanguage(lua_State *L)
{
    CTFontCreateUIFontForLanguage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontUIFontType(lua_State *L)
{
    CTFontUIFontType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateCopyWithAttributes(lua_State *L)
{
    CTFontCreateCopyWithAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateCopyWithSymbolicTraits(lua_State *L)
{
    CTFontCreateCopyWithSymbolicTraits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSymbolicTraits(lua_State *L)
{
    CTFontSymbolicTraits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSymbolicTraits(lua_State *L)
{
    CTFontSymbolicTraits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateCopyWithFamily(lua_State *L)
{
    CTFontCreateCopyWithFamily(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateForString(lua_State *L)
{
    CTFontCreateForString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyFontDescriptor(lua_State *L)
{
    CTFontCopyFontDescriptor(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyAttribute(lua_State *L)
{
    CTFontCopyAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyAttribute(lua_State *L)
{
    CTFontCopyAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetSize(lua_State *L)
{
    CTFontGetSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetSize(lua_State *L)
{
    CTFontGetSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetMatrix(lua_State *L)
{
    CTFontGetMatrix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetMatrix(lua_State *L)
{
    CTFontGetMatrix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetSymbolicTraits(lua_State *L)
{
    CTFontGetSymbolicTraits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSymbolicTrait(lua_State *L)
{
    CTFontSymbolicTrait(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontSymbolicTraits(lua_State *L)
{
    CTFontSymbolicTraits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyTraits(lua_State *L)
{
    CTFontCopyTraits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTraits(lua_State *L)
{
    CTFontTraits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyTraits(lua_State *L)
{
    CTFontCopyTraits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyPostScriptName(lua_State *L)
{
    CTFontCopyPostScriptName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyPostScriptName(lua_State *L)
{
    CTFontCopyPostScriptName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyFamilyName(lua_State *L)
{
    CTFontCopyFamilyName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyFamilyName(lua_State *L)
{
    CTFontCopyFamilyName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyFullName(lua_State *L)
{
    CTFontCopyFullName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyFullName(lua_State *L)
{
    CTFontCopyFullName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyDisplayName(lua_State *L)
{
    CTFontCopyDisplayName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyDisplayName(lua_State *L)
{
    CTFontCopyDisplayName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyName(lua_State *L)
{
    CTFontCopyName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyName(lua_State *L)
{
    CTFontCopyName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyLocalizedName(lua_State *L)
{
    CTFontCopyLocalizedName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyLocalizedName(lua_State *L)
{
    CTFontCopyLocalizedName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyCharacterSet(lua_State *L)
{
    CTFontCopyCharacterSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyCharacterSet(lua_State *L)
{
    CTFontCopyCharacterSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetStringEncoding(lua_State *L)
{
    CTFontGetStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetStringEncoding(lua_State *L)
{
    CTFontGetStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopySupportedLanguages(lua_State *L)
{
    CTFontCopySupportedLanguages(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopySupportedLanguages(lua_State *L)
{
    CTFontCopySupportedLanguages(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetGlyphsForCharacters(lua_State *L)
{
    CTFontGetGlyphsForCharacters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyCharacterSet(lua_State *L)
{
    CTFontCopyCharacterSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetGlyphsForCharacters(lua_State *L)
{
    CTFontGetGlyphsForCharacters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetAscent(lua_State *L)
{
    CTFontGetAscent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetAscent(lua_State *L)
{
    CTFontGetAscent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetDescent(lua_State *L)
{
    CTFontGetDescent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetDescent(lua_State *L)
{
    CTFontGetDescent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetLeading(lua_State *L)
{
    CTFontGetLeading(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetLeading(lua_State *L)
{
    CTFontGetLeading(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetUnitsPerEm(lua_State *L)
{
    CTFontGetUnitsPerEm(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetUnitsPerEm(lua_State *L)
{
    CTFontGetUnitsPerEm(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetGlyphCount(lua_State *L)
{
    CTFontGetGlyphCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetGlyphCount(lua_State *L)
{
    CTFontGetGlyphCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetBoundingBox(lua_State *L)
{
    CTFontGetBoundingBox(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetBoundingBox(lua_State *L)
{
    CTFontGetBoundingBox(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetUnderlinePosition(lua_State *L)
{
    CTFontGetUnderlinePosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetUnderlinePosition(lua_State *L)
{
    CTFontGetUnderlinePosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetUnderlineThickness(lua_State *L)
{
    CTFontGetUnderlineThickness(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetUnderlineThickness(lua_State *L)
{
    CTFontGetUnderlineThickness(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetSlantAngle(lua_State *L)
{
    CTFontGetSlantAngle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetSlantAngle(lua_State *L)
{
    CTFontGetSlantAngle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetCapHeight(lua_State *L)
{
    CTFontGetCapHeight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetCapHeight(lua_State *L)
{
    CTFontGetCapHeight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetXHeight(lua_State *L)
{
    CTFontGetXHeight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetXHeight(lua_State *L)
{
    CTFontGetXHeight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetGlyphWithName(lua_State *L)
{
    CTFontGetGlyphWithName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetGlyphWithName(lua_State *L)
{
    CTFontGetGlyphWithName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetBoundingRectsForGlyphs(lua_State *L)
{
    CTFontGetBoundingRectsForGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetBoundingRectsForGlyphs(lua_State *L)
{
    CTFontGetBoundingRectsForGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOrientation(lua_State *L)
{
    CTFontOrientation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetAdvancesForGlyphs(lua_State *L)
{
    CTFontGetAdvancesForGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetAdvancesForGlyphs(lua_State *L)
{
    CTFontGetAdvancesForGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontOrientation(lua_State *L)
{
    CTFontOrientation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetVerticalTranslationsForGlyphs(lua_State *L)
{
    CTFontGetVerticalTranslationsForGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetVerticalTranslationsForGlyphs(lua_State *L)
{
    CTFontGetVerticalTranslationsForGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreatePathForGlyph(lua_State *L)
{
    CTFontCreatePathForGlyph(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreatePathForGlyph(lua_State *L)
{
    CTFontCreatePathForGlyph(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVariationAxisIdentifierKey(lua_State *L)
{
    CTFontVariationAxisIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVariationAxisIdentifierKey(lua_State *L)
{
    CTFontVariationAxisIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVariationAxisMinimumValueKey(lua_State *L)
{
    CTFontVariationAxisMinimumValueKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVariationAxisMinimumValueKey(lua_State *L)
{
    CTFontVariationAxisMinimumValueKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVariationAxisMaximumValueKey(lua_State *L)
{
    CTFontVariationAxisMaximumValueKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVariationAxisMaximumValueKey(lua_State *L)
{
    CTFontVariationAxisMaximumValueKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVariationAxisDefaultValueKey(lua_State *L)
{
    CTFontVariationAxisDefaultValueKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVariationAxisDefaultValueKey(lua_State *L)
{
    CTFontVariationAxisDefaultValueKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVariationAxisNameKey(lua_State *L)
{
    CTFontVariationAxisNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontVariationAxisNameKey(lua_State *L)
{
    CTFontVariationAxisNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyVariationAxes(lua_State *L)
{
    CTFontCopyVariationAxes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyVariationAxes(lua_State *L)
{
    CTFontCopyVariationAxes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyVariation(lua_State *L)
{
    CTFontCopyVariation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyVariation(lua_State *L)
{
    CTFontCopyVariation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureTypeIdentifierKey(lua_State *L)
{
    CTFontFeatureTypeIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureTypeIdentifierKey(lua_State *L)
{
    CTFontFeatureTypeIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureTypeNameKey(lua_State *L)
{
    CTFontFeatureTypeNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureTypeNameKey(lua_State *L)
{
    CTFontFeatureTypeNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureTypeExclusiveKey(lua_State *L)
{
    CTFontFeatureTypeExclusiveKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureTypeExclusiveKey(lua_State *L)
{
    CTFontFeatureTypeExclusiveKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureTypeSelectorsKey(lua_State *L)
{
    CTFontFeatureTypeSelectorsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureTypeSelectorsKey(lua_State *L)
{
    CTFontFeatureTypeSelectorsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureSelectorIdentifierKey(lua_State *L)
{
    CTFontFeatureSelectorIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureSelectorIdentifierKey(lua_State *L)
{
    CTFontFeatureSelectorIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureSelectorNameKey(lua_State *L)
{
    CTFontFeatureSelectorNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureSelectorNameKey(lua_State *L)
{
    CTFontFeatureSelectorNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureSelectorDefaultKey(lua_State *L)
{
    CTFontFeatureSelectorDefaultKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureSelectorDefaultKey(lua_State *L)
{
    CTFontFeatureSelectorDefaultKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureSelectorSettingKey(lua_State *L)
{
    CTFontFeatureSelectorSettingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureSelectorSettingKey(lua_State *L)
{
    CTFontFeatureSelectorSettingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyFeatures(lua_State *L)
{
    CTFontCopyFeatures(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyFeatures(lua_State *L)
{
    CTFontCopyFeatures(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyFeatureSettings(lua_State *L)
{
    CTFontCopyFeatureSettings(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontFeatureTypeIdentifierKey(lua_State *L)
{
    CTFontFeatureTypeIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyFeatureSettings(lua_State *L)
{
    CTFontCopyFeatureSettings(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyGraphicsFont(lua_State *L)
{
    CTFontCopyGraphicsFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyGraphicsFont(lua_State *L)
{
    CTFontCopyGraphicsFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateWithGraphicsFont(lua_State *L)
{
    CTFontCreateWithGraphicsFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetPlatformFont(lua_State *L)
{
    CTFontGetPlatformFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetPlatformFont(lua_State *L)
{
    CTFontGetPlatformFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateWithPlatformFont(lua_State *L)
{
    CTFontCreateWithPlatformFont(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDescriptorRef(lua_State *L)
{
    CTFontDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCreateWithQuickdrawInstance(lua_State *L)
{
    CTFontCreateWithQuickdrawInstance(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableBASE(lua_State *L)
{
    CTFontTableBASE(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableCFF(lua_State *L)
{
    CTFontTableCFF(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableDSIG(lua_State *L)
{
    CTFontTableDSIG(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableEBDT(lua_State *L)
{
    CTFontTableEBDT(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableEBLC(lua_State *L)
{
    CTFontTableEBLC(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableEBSC(lua_State *L)
{
    CTFontTableEBSC(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableGDEF(lua_State *L)
{
    CTFontTableGDEF(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableGPOS(lua_State *L)
{
    CTFontTableGPOS(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableGSUB(lua_State *L)
{
    CTFontTableGSUB(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableJSTF(lua_State *L)
{
    CTFontTableJSTF(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableLTSH(lua_State *L)
{
    CTFontTableLTSH(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableOS2(lua_State *L)
{
    CTFontTableOS2(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTablePCLT(lua_State *L)
{
    CTFontTablePCLT(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableVDMX(lua_State *L)
{
    CTFontTableVDMX(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableVORG(lua_State *L)
{
    CTFontTableVORG(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableZapf(lua_State *L)
{
    CTFontTableZapf(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableAcnt(lua_State *L)
{
    CTFontTableAcnt(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableAvar(lua_State *L)
{
    CTFontTableAvar(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableBdat(lua_State *L)
{
    CTFontTableBdat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableBhed(lua_State *L)
{
    CTFontTableBhed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableBloc(lua_State *L)
{
    CTFontTableBloc(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableBsln(lua_State *L)
{
    CTFontTableBsln(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableCmap(lua_State *L)
{
    CTFontTableCmap(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableCvar(lua_State *L)
{
    CTFontTableCvar(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableCvt(lua_State *L)
{
    CTFontTableCvt(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableFdsc(lua_State *L)
{
    CTFontTableFdsc(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableFeat(lua_State *L)
{
    CTFontTableFeat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableFmtx(lua_State *L)
{
    CTFontTableFmtx(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableFpgm(lua_State *L)
{
    CTFontTableFpgm(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableFvar(lua_State *L)
{
    CTFontTableFvar(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableGasp(lua_State *L)
{
    CTFontTableGasp(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableGlyf(lua_State *L)
{
    CTFontTableGlyf(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableGvar(lua_State *L)
{
    CTFontTableGvar(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableHdmx(lua_State *L)
{
    CTFontTableHdmx(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableHead(lua_State *L)
{
    CTFontTableHead(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableHhea(lua_State *L)
{
    CTFontTableHhea(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableHmtx(lua_State *L)
{
    CTFontTableHmtx(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableHsty(lua_State *L)
{
    CTFontTableHsty(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableJust(lua_State *L)
{
    CTFontTableJust(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableKern(lua_State *L)
{
    CTFontTableKern(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableKerx(lua_State *L)
{
    CTFontTableKerx(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableLcar(lua_State *L)
{
    CTFontTableLcar(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableLoca(lua_State *L)
{
    CTFontTableLoca(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableMaxp(lua_State *L)
{
    CTFontTableMaxp(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableMort(lua_State *L)
{
    CTFontTableMort(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableMorx(lua_State *L)
{
    CTFontTableMorx(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableName(lua_State *L)
{
    CTFontTableName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableOpbd(lua_State *L)
{
    CTFontTableOpbd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTablePost(lua_State *L)
{
    CTFontTablePost(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTablePrep(lua_State *L)
{
    CTFontTablePrep(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableProp(lua_State *L)
{
    CTFontTableProp(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableSbit(lua_State *L)
{
    CTFontTableSbit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableSbix(lua_State *L)
{
    CTFontTableSbix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableTrak(lua_State *L)
{
    CTFontTableTrak(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableVhea(lua_State *L)
{
    CTFontTableVhea(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableVmtx(lua_State *L)
{
    CTFontTableVmtx(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableTag(lua_State *L)
{
    CTFontTableTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableOptionNoOptions(lua_State *L)
{
    CTFontTableOptionNoOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableOptionExcludeSynthetic(lua_State *L)
{
    CTFontTableOptionExcludeSynthetic(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableOptions(lua_State *L)
{
    CTFontTableOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyAvailableTables(lua_State *L)
{
    CTFontCopyAvailableTables(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableTag(lua_State *L)
{
    CTFontTableTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableTag(lua_State *L)
{
    CTFontTableTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyAvailableTables(lua_State *L)
{
    CTFontCopyAvailableTables(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableOptions(lua_State *L)
{
    CTFontTableOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyTable(lua_State *L)
{
    CTFontCopyTable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableTag(lua_State *L)
{
    CTFontTableTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontCopyTable(lua_State *L)
{
    CTFontCopyTable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableTag(lua_State *L)
{
    CTFontTableTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontTableOptions(lua_State *L)
{
    CTFontTableOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDrawGlyphs(lua_State *L)
{
    CTFontDrawGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetGlyphsForCharacters(lua_State *L)
{
    CTFontGetGlyphsForCharacters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontDrawGlyphs(lua_State *L)
{
    CTFontDrawGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetLigatureCaretPositions(lua_State *L)
{
    CTFontGetLigatureCaretPositions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontGetLigatureCaretPositions(lua_State *L)
{
    CTFontGetLigatureCaretPositions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFontRef(lua_State *L)
{
    CTFontRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTFontAPIs[] = {
    {"CTFontDescriptor", lua_CTFontDescriptor},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontGetTypeID", lua_CTFontGetTypeID},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontGetTypeID", lua_CTFontGetTypeID},
    {"CTFontCopyrightNameKey", lua_CTFontCopyrightNameKey},
    {"CTFontCopyrightNameKey", lua_CTFontCopyrightNameKey},
    {"CTFontFamilyNameKey", lua_CTFontFamilyNameKey},
    {"CTFontFamilyNameKey", lua_CTFontFamilyNameKey},
    {"CTFontSubFamilyNameKey", lua_CTFontSubFamilyNameKey},
    {"CTFontSubFamilyNameKey", lua_CTFontSubFamilyNameKey},
    {"CTFontStyleNameKey", lua_CTFontStyleNameKey},
    {"CTFontStyleNameKey", lua_CTFontStyleNameKey},
    {"CTFontUniqueNameKey", lua_CTFontUniqueNameKey},
    {"CTFontUniqueNameKey", lua_CTFontUniqueNameKey},
    {"CTFontFullNameKey", lua_CTFontFullNameKey},
    {"CTFontFullNameKey", lua_CTFontFullNameKey},
    {"CTFontVersionNameKey", lua_CTFontVersionNameKey},
    {"CTFontVersionNameKey", lua_CTFontVersionNameKey},
    {"CTFontPostScriptNameKey", lua_CTFontPostScriptNameKey},
    {"CTFontPostScriptNameKey", lua_CTFontPostScriptNameKey},
    {"CTFontTrademarkNameKey", lua_CTFontTrademarkNameKey},
    {"CTFontTrademarkNameKey", lua_CTFontTrademarkNameKey},
    {"CTFontManufacturerNameKey", lua_CTFontManufacturerNameKey},
    {"CTFontManufacturerNameKey", lua_CTFontManufacturerNameKey},
    {"CTFontDesignerNameKey", lua_CTFontDesignerNameKey},
    {"CTFontDesignerNameKey", lua_CTFontDesignerNameKey},
    {"CTFontDescriptionNameKey", lua_CTFontDescriptionNameKey},
    {"CTFontDescriptionNameKey", lua_CTFontDescriptionNameKey},
    {"CTFontVendorURLNameKey", lua_CTFontVendorURLNameKey},
    {"CTFontVendorURLNameKey", lua_CTFontVendorURLNameKey},
    {"CTFontDesignerURLNameKey", lua_CTFontDesignerURLNameKey},
    {"CTFontDesignerURLNameKey", lua_CTFontDesignerURLNameKey},
    {"CTFontLicenseNameKey", lua_CTFontLicenseNameKey},
    {"CTFontLicenseNameKey", lua_CTFontLicenseNameKey},
    {"CTFontLicenseURLNameKey", lua_CTFontLicenseURLNameKey},
    {"CTFontLicenseURLNameKey", lua_CTFontLicenseURLNameKey},
    {"CTFontSampleTextNameKey", lua_CTFontSampleTextNameKey},
    {"CTFontSampleTextNameKey", lua_CTFontSampleTextNameKey},
    {"CTFontPostScriptCIDNameKey", lua_CTFontPostScriptCIDNameKey},
    {"CTFontPostScriptCIDNameKey", lua_CTFontPostScriptCIDNameKey},
    {"CTFontCreateWithName", lua_CTFontCreateWithName},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontCreateWithFontDescriptor", lua_CTFontCreateWithFontDescriptor},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontOptions", lua_CTFontOptions},
    {"CTFontOptionsPreventAutoActivation", lua_CTFontOptionsPreventAutoActivation},
    {"CTFontOptionsPreferSystemFont", lua_CTFontOptionsPreferSystemFont},
    {"CTFontOptionsDefault", lua_CTFontOptionsDefault},
    {"CTFontOptionsPreventAutoActivation", lua_CTFontOptionsPreventAutoActivation},
    {"CTFontOptionsPreferSystemFont", lua_CTFontOptionsPreferSystemFont},
    {"CTFontOptions", lua_CTFontOptions},
    {"CTFontCreateWithNameAndOptions", lua_CTFontCreateWithNameAndOptions},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontOptions", lua_CTFontOptions},
    {"CTFontCreateWithFontDescriptorAndOptions", lua_CTFontCreateWithFontDescriptorAndOptions},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontOptions", lua_CTFontOptions},
    {"CTFontCreateUIFontForLanguage", lua_CTFontCreateUIFontForLanguage},
    {"CTFontNoFontType", lua_CTFontNoFontType},
    {"CTFontUserFontType", lua_CTFontUserFontType},
    {"CTFontUserFixedPitchFontType", lua_CTFontUserFixedPitchFontType},
    {"CTFontSystemFontType", lua_CTFontSystemFontType},
    {"CTFontEmphasizedSystemFontType", lua_CTFontEmphasizedSystemFontType},
    {"CTFontSmallSystemFontType", lua_CTFontSmallSystemFontType},
    {"CTFontSmallEmphasizedSystemFontType", lua_CTFontSmallEmphasizedSystemFontType},
    {"CTFontMiniSystemFontType", lua_CTFontMiniSystemFontType},
    {"CTFontMiniEmphasizedSystemFontType", lua_CTFontMiniEmphasizedSystemFontType},
    {"CTFontViewsFontType", lua_CTFontViewsFontType},
    {"CTFontApplicationFontType", lua_CTFontApplicationFontType},
    {"CTFontLabelFontType", lua_CTFontLabelFontType},
    {"CTFontMenuTitleFontType", lua_CTFontMenuTitleFontType},
    {"CTFontMenuItemFontType", lua_CTFontMenuItemFontType},
    {"CTFontMenuItemMarkFontType", lua_CTFontMenuItemMarkFontType},
    {"CTFontMenuItemCmdKeyFontType", lua_CTFontMenuItemCmdKeyFontType},
    {"CTFontWindowTitleFontType", lua_CTFontWindowTitleFontType},
    {"CTFontPushButtonFontType", lua_CTFontPushButtonFontType},
    {"CTFontUtilityWindowTitleFontType", lua_CTFontUtilityWindowTitleFontType},
    {"CTFontAlertHeaderFontType", lua_CTFontAlertHeaderFontType},
    {"CTFontSystemDetailFontType", lua_CTFontSystemDetailFontType},
    {"CTFontEmphasizedSystemDetailFontType", lua_CTFontEmphasizedSystemDetailFontType},
    {"CTFontToolbarFontType", lua_CTFontToolbarFontType},
    {"CTFontSmallToolbarFontType", lua_CTFontSmallToolbarFontType},
    {"CTFontMessageFontType", lua_CTFontMessageFontType},
    {"CTFontPaletteFontType", lua_CTFontPaletteFontType},
    {"CTFontToolTipFontType", lua_CTFontToolTipFontType},
    {"CTFontControlContentFontType", lua_CTFontControlContentFontType},
    {"CTFontUIFontType", lua_CTFontUIFontType},
    {"CTFontCreateUIFontForLanguage", lua_CTFontCreateUIFontForLanguage},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontUIFontType", lua_CTFontUIFontType},
    {"CTFontCreateCopyWithAttributes", lua_CTFontCreateCopyWithAttributes},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontCreateCopyWithSymbolicTraits", lua_CTFontCreateCopyWithSymbolicTraits},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontSymbolicTraits", lua_CTFontSymbolicTraits},
    {"CTFontSymbolicTraits", lua_CTFontSymbolicTraits},
    {"CTFontCreateCopyWithFamily", lua_CTFontCreateCopyWithFamily},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontCreateForString", lua_CTFontCreateForString},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontCopyFontDescriptor", lua_CTFontCopyFontDescriptor},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontCopyAttribute", lua_CTFontCopyAttribute},
    {"CTFontCopyAttribute", lua_CTFontCopyAttribute},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontGetSize", lua_CTFontGetSize},
    {"CTFontGetSize", lua_CTFontGetSize},
    {"CTFontGetMatrix", lua_CTFontGetMatrix},
    {"CTFontGetMatrix", lua_CTFontGetMatrix},
    {"CTFontGetSymbolicTraits", lua_CTFontGetSymbolicTraits},
    {"CTFontSymbolicTrait", lua_CTFontSymbolicTrait},
    {"CTFontSymbolicTraits", lua_CTFontSymbolicTraits},
    {"CTFontCopyTraits", lua_CTFontCopyTraits},
    {"CTFontTraits", lua_CTFontTraits},
    {"CTFontCopyTraits", lua_CTFontCopyTraits},
    {"CTFontCopyPostScriptName", lua_CTFontCopyPostScriptName},
    {"CTFontCopyPostScriptName", lua_CTFontCopyPostScriptName},
    {"CTFontCopyFamilyName", lua_CTFontCopyFamilyName},
    {"CTFontCopyFamilyName", lua_CTFontCopyFamilyName},
    {"CTFontCopyFullName", lua_CTFontCopyFullName},
    {"CTFontCopyFullName", lua_CTFontCopyFullName},
    {"CTFontCopyDisplayName", lua_CTFontCopyDisplayName},
    {"CTFontCopyDisplayName", lua_CTFontCopyDisplayName},
    {"CTFontCopyName", lua_CTFontCopyName},
    {"CTFontCopyName", lua_CTFontCopyName},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontCopyLocalizedName", lua_CTFontCopyLocalizedName},
    {"CTFontCopyLocalizedName", lua_CTFontCopyLocalizedName},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontCopyCharacterSet", lua_CTFontCopyCharacterSet},
    {"CTFontCopyCharacterSet", lua_CTFontCopyCharacterSet},
    {"CTFontGetStringEncoding", lua_CTFontGetStringEncoding},
    {"CTFontGetStringEncoding", lua_CTFontGetStringEncoding},
    {"CTFontCopySupportedLanguages", lua_CTFontCopySupportedLanguages},
    {"CTFontCopySupportedLanguages", lua_CTFontCopySupportedLanguages},
    {"CTFontGetGlyphsForCharacters", lua_CTFontGetGlyphsForCharacters},
    {"CTFontCopyCharacterSet", lua_CTFontCopyCharacterSet},
    {"CTFontGetGlyphsForCharacters", lua_CTFontGetGlyphsForCharacters},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontGetAscent", lua_CTFontGetAscent},
    {"CTFontGetAscent", lua_CTFontGetAscent},
    {"CTFontGetDescent", lua_CTFontGetDescent},
    {"CTFontGetDescent", lua_CTFontGetDescent},
    {"CTFontGetLeading", lua_CTFontGetLeading},
    {"CTFontGetLeading", lua_CTFontGetLeading},
    {"CTFontGetUnitsPerEm", lua_CTFontGetUnitsPerEm},
    {"CTFontGetUnitsPerEm", lua_CTFontGetUnitsPerEm},
    {"CTFontGetGlyphCount", lua_CTFontGetGlyphCount},
    {"CTFontGetGlyphCount", lua_CTFontGetGlyphCount},
    {"CTFontGetBoundingBox", lua_CTFontGetBoundingBox},
    {"CTFontGetBoundingBox", lua_CTFontGetBoundingBox},
    {"CTFontGetUnderlinePosition", lua_CTFontGetUnderlinePosition},
    {"CTFontGetUnderlinePosition", lua_CTFontGetUnderlinePosition},
    {"CTFontGetUnderlineThickness", lua_CTFontGetUnderlineThickness},
    {"CTFontGetUnderlineThickness", lua_CTFontGetUnderlineThickness},
    {"CTFontGetSlantAngle", lua_CTFontGetSlantAngle},
    {"CTFontGetSlantAngle", lua_CTFontGetSlantAngle},
    {"CTFontGetCapHeight", lua_CTFontGetCapHeight},
    {"CTFontGetCapHeight", lua_CTFontGetCapHeight},
    {"CTFontGetXHeight", lua_CTFontGetXHeight},
    {"CTFontGetXHeight", lua_CTFontGetXHeight},
    {"CTFontGetGlyphWithName", lua_CTFontGetGlyphWithName},
    {"CTFontGetGlyphWithName", lua_CTFontGetGlyphWithName},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontGetBoundingRectsForGlyphs", lua_CTFontGetBoundingRectsForGlyphs},
    {"CTFontGetBoundingRectsForGlyphs", lua_CTFontGetBoundingRectsForGlyphs},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontOrientation", lua_CTFontOrientation},
    {"CTFontGetAdvancesForGlyphs", lua_CTFontGetAdvancesForGlyphs},
    {"CTFontGetAdvancesForGlyphs", lua_CTFontGetAdvancesForGlyphs},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontOrientation", lua_CTFontOrientation},
    {"CTFontGetVerticalTranslationsForGlyphs", lua_CTFontGetVerticalTranslationsForGlyphs},
    {"CTFontGetVerticalTranslationsForGlyphs", lua_CTFontGetVerticalTranslationsForGlyphs},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontCreatePathForGlyph", lua_CTFontCreatePathForGlyph},
    {"CTFontCreatePathForGlyph", lua_CTFontCreatePathForGlyph},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontVariationAxisIdentifierKey", lua_CTFontVariationAxisIdentifierKey},
    {"CTFontVariationAxisIdentifierKey", lua_CTFontVariationAxisIdentifierKey},
    {"CTFontVariationAxisMinimumValueKey", lua_CTFontVariationAxisMinimumValueKey},
    {"CTFontVariationAxisMinimumValueKey", lua_CTFontVariationAxisMinimumValueKey},
    {"CTFontVariationAxisMaximumValueKey", lua_CTFontVariationAxisMaximumValueKey},
    {"CTFontVariationAxisMaximumValueKey", lua_CTFontVariationAxisMaximumValueKey},
    {"CTFontVariationAxisDefaultValueKey", lua_CTFontVariationAxisDefaultValueKey},
    {"CTFontVariationAxisDefaultValueKey", lua_CTFontVariationAxisDefaultValueKey},
    {"CTFontVariationAxisNameKey", lua_CTFontVariationAxisNameKey},
    {"CTFontVariationAxisNameKey", lua_CTFontVariationAxisNameKey},
    {"CTFontCopyVariationAxes", lua_CTFontCopyVariationAxes},
    {"CTFontCopyVariationAxes", lua_CTFontCopyVariationAxes},
    {"CTFontCopyVariation", lua_CTFontCopyVariation},
    {"CTFontCopyVariation", lua_CTFontCopyVariation},
    {"CTFontFeatureTypeIdentifierKey", lua_CTFontFeatureTypeIdentifierKey},
    {"CTFontFeatureTypeIdentifierKey", lua_CTFontFeatureTypeIdentifierKey},
    {"CTFontFeatureTypeNameKey", lua_CTFontFeatureTypeNameKey},
    {"CTFontFeatureTypeNameKey", lua_CTFontFeatureTypeNameKey},
    {"CTFontFeatureTypeExclusiveKey", lua_CTFontFeatureTypeExclusiveKey},
    {"CTFontFeatureTypeExclusiveKey", lua_CTFontFeatureTypeExclusiveKey},
    {"CTFontFeatureTypeSelectorsKey", lua_CTFontFeatureTypeSelectorsKey},
    {"CTFontFeatureTypeSelectorsKey", lua_CTFontFeatureTypeSelectorsKey},
    {"CTFontFeatureSelectorIdentifierKey", lua_CTFontFeatureSelectorIdentifierKey},
    {"CTFontFeatureSelectorIdentifierKey", lua_CTFontFeatureSelectorIdentifierKey},
    {"CTFontFeatureSelectorNameKey", lua_CTFontFeatureSelectorNameKey},
    {"CTFontFeatureSelectorNameKey", lua_CTFontFeatureSelectorNameKey},
    {"CTFontFeatureSelectorDefaultKey", lua_CTFontFeatureSelectorDefaultKey},
    {"CTFontFeatureSelectorDefaultKey", lua_CTFontFeatureSelectorDefaultKey},
    {"CTFontFeatureSelectorSettingKey", lua_CTFontFeatureSelectorSettingKey},
    {"CTFontFeatureSelectorSettingKey", lua_CTFontFeatureSelectorSettingKey},
    {"CTFontCopyFeatures", lua_CTFontCopyFeatures},
    {"CTFontCopyFeatures", lua_CTFontCopyFeatures},
    {"CTFontCopyFeatureSettings", lua_CTFontCopyFeatureSettings},
    {"CTFontFeatureTypeIdentifierKey", lua_CTFontFeatureTypeIdentifierKey},
    {"CTFontCopyFeatureSettings", lua_CTFontCopyFeatureSettings},
    {"CTFontCopyGraphicsFont", lua_CTFontCopyGraphicsFont},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontCopyGraphicsFont", lua_CTFontCopyGraphicsFont},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontCreateWithGraphicsFont", lua_CTFontCreateWithGraphicsFont},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontGetPlatformFont", lua_CTFontGetPlatformFont},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontGetPlatformFont", lua_CTFontGetPlatformFont},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontCreateWithPlatformFont", lua_CTFontCreateWithPlatformFont},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontDescriptorRef", lua_CTFontDescriptorRef},
    {"CTFontCreateWithQuickdrawInstance", lua_CTFontCreateWithQuickdrawInstance},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontTableBASE", lua_CTFontTableBASE},
    {"CTFontTableCFF", lua_CTFontTableCFF},
    {"CTFontTableDSIG", lua_CTFontTableDSIG},
    {"CTFontTableEBDT", lua_CTFontTableEBDT},
    {"CTFontTableEBLC", lua_CTFontTableEBLC},
    {"CTFontTableEBSC", lua_CTFontTableEBSC},
    {"CTFontTableGDEF", lua_CTFontTableGDEF},
    {"CTFontTableGPOS", lua_CTFontTableGPOS},
    {"CTFontTableGSUB", lua_CTFontTableGSUB},
    {"CTFontTableJSTF", lua_CTFontTableJSTF},
    {"CTFontTableLTSH", lua_CTFontTableLTSH},
    {"CTFontTableOS2", lua_CTFontTableOS2},
    {"CTFontTablePCLT", lua_CTFontTablePCLT},
    {"CTFontTableVDMX", lua_CTFontTableVDMX},
    {"CTFontTableVORG", lua_CTFontTableVORG},
    {"CTFontTableZapf", lua_CTFontTableZapf},
    {"CTFontTableAcnt", lua_CTFontTableAcnt},
    {"CTFontTableAvar", lua_CTFontTableAvar},
    {"CTFontTableBdat", lua_CTFontTableBdat},
    {"CTFontTableBhed", lua_CTFontTableBhed},
    {"CTFontTableBloc", lua_CTFontTableBloc},
    {"CTFontTableBsln", lua_CTFontTableBsln},
    {"CTFontTableCmap", lua_CTFontTableCmap},
    {"CTFontTableCvar", lua_CTFontTableCvar},
    {"CTFontTableCvt", lua_CTFontTableCvt},
    {"CTFontTableFdsc", lua_CTFontTableFdsc},
    {"CTFontTableFeat", lua_CTFontTableFeat},
    {"CTFontTableFmtx", lua_CTFontTableFmtx},
    {"CTFontTableFpgm", lua_CTFontTableFpgm},
    {"CTFontTableFvar", lua_CTFontTableFvar},
    {"CTFontTableGasp", lua_CTFontTableGasp},
    {"CTFontTableGlyf", lua_CTFontTableGlyf},
    {"CTFontTableGvar", lua_CTFontTableGvar},
    {"CTFontTableHdmx", lua_CTFontTableHdmx},
    {"CTFontTableHead", lua_CTFontTableHead},
    {"CTFontTableHhea", lua_CTFontTableHhea},
    {"CTFontTableHmtx", lua_CTFontTableHmtx},
    {"CTFontTableHsty", lua_CTFontTableHsty},
    {"CTFontTableJust", lua_CTFontTableJust},
    {"CTFontTableKern", lua_CTFontTableKern},
    {"CTFontTableKerx", lua_CTFontTableKerx},
    {"CTFontTableLcar", lua_CTFontTableLcar},
    {"CTFontTableLoca", lua_CTFontTableLoca},
    {"CTFontTableMaxp", lua_CTFontTableMaxp},
    {"CTFontTableMort", lua_CTFontTableMort},
    {"CTFontTableMorx", lua_CTFontTableMorx},
    {"CTFontTableName", lua_CTFontTableName},
    {"CTFontTableOpbd", lua_CTFontTableOpbd},
    {"CTFontTablePost", lua_CTFontTablePost},
    {"CTFontTablePrep", lua_CTFontTablePrep},
    {"CTFontTableProp", lua_CTFontTableProp},
    {"CTFontTableSbit", lua_CTFontTableSbit},
    {"CTFontTableSbix", lua_CTFontTableSbix},
    {"CTFontTableTrak", lua_CTFontTableTrak},
    {"CTFontTableVhea", lua_CTFontTableVhea},
    {"CTFontTableVmtx", lua_CTFontTableVmtx},
    {"CTFontTableTag", lua_CTFontTableTag},
    {"CTFontTableOptionNoOptions", lua_CTFontTableOptionNoOptions},
    {"CTFontTableOptionExcludeSynthetic", lua_CTFontTableOptionExcludeSynthetic},
    {"CTFontTableOptions", lua_CTFontTableOptions},
    {"CTFontCopyAvailableTables", lua_CTFontCopyAvailableTables},
    {"CTFontTableTag", lua_CTFontTableTag},
    {"CTFontTableTag", lua_CTFontTableTag},
    {"CTFontCopyAvailableTables", lua_CTFontCopyAvailableTables},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontTableOptions", lua_CTFontTableOptions},
    {"CTFontCopyTable", lua_CTFontCopyTable},
    {"CTFontTableTag", lua_CTFontTableTag},
    {"CTFontCopyTable", lua_CTFontCopyTable},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontTableTag", lua_CTFontTableTag},
    {"CTFontTableOptions", lua_CTFontTableOptions},
    {"CTFontDrawGlyphs", lua_CTFontDrawGlyphs},
    {"CTFontGetGlyphsForCharacters", lua_CTFontGetGlyphsForCharacters},
    {"CTFontDrawGlyphs", lua_CTFontDrawGlyphs},
    {"CTFontRef", lua_CTFontRef},
    {"CTFontGetLigatureCaretPositions", lua_CTFontGetLigatureCaretPositions},
    {"CTFontGetLigatureCaretPositions", lua_CTFontGetLigatureCaretPositions},
    {"CTFontRef", lua_CTFontRef},
    {NULL, NULL},
};

int LuaOpenCTFont(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTFontAPIs);
    return 0;
}
