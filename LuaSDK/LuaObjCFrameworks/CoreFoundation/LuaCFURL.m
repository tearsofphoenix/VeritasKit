//
//  LuaCFURL.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFURL.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFURL__(lua_State *L)
{
    CFURL__(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURL__(lua_State *L)
{
    CFURL__(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLPOSIXPathStyle(lua_State *L)
{
    CFURLPOSIXPathStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLHFSPathStyle(lua_State *L)
{
    CFURLHFSPathStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLWindowsPathStyle(lua_State *L)
{
    CFURLWindowsPathStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLPathStyle(lua_State *L)
{
    CFURLPathStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLs(lua_State *L)
{
    CFURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLs(lua_State *L)
{
    CFURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyAbsoluteURL(lua_State *L)
{
    CFURLCopyAbsoluteURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLGetTypeID(lua_State *L)
{
    CFURLGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateData(lua_State *L)
{
    CFURLCreateData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyAbsoluteURL(lua_State *L)
{
    CFURLCopyAbsoluteURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLPosixPathStyle(lua_State *L)
{
    CFURLPosixPathStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLHFSPathStyle(lua_State *L)
{
    CFURLHFSPathStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLWindowsPathStyle(lua_State *L)
{
    CFURLWindowsPathStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLGetFileSystemRepresentation(lua_State *L)
{
    CFURLGetFileSystemRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLGetString(lua_State *L)
{
    CFURLGetString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateStringByReplacingPercentEscapes(lua_State *L)
{
    CFURLCreateStringByReplacingPercentEscapes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyHostName(lua_State *L)
{
    CFURLCopyHostName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLGetPortNumber(lua_State *L)
{
    CFURLGetPortNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyPassword(lua_State *L)
{
    CFURLCopyPassword(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyFragment(lua_State *L)
{
    CFURLCopyFragment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyParameters(lua_State *L)
{
    CFURLCopyParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCanBeDecomposed(lua_State *L)
{
    CFURLCanBeDecomposed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyScheme(lua_State *L)
{
    CFURLCopyScheme(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCanBeDecomposed(lua_State *L)
{
    CFURLCanBeDecomposed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyNetLocation(lua_State *L)
{
    CFURLCopyNetLocation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCanBeDecomposed(lua_State *L)
{
    CFURLCanBeDecomposed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyAbsoluteURL(lua_State *L)
{
    CFURLCopyAbsoluteURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyPath(lua_State *L)
{
    CFURLCopyPath(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyStrictPath(lua_State *L)
{
    CFURLCopyStrictPath(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyFileSystemPath(lua_State *L)
{
    CFURLCopyFileSystemPath(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyPath(lua_State *L)
{
    CFURLCopyPath(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyStrictPath(lua_State *L)
{
    CFURLCopyStrictPath(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyFileSystemPath(lua_State *L)
{
    CFURLCopyFileSystemPath(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLHasDirectoryPath(lua_State *L)
{
    CFURLHasDirectoryPath(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyResourceSpecifier(lua_State *L)
{
    CFURLCopyResourceSpecifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyHostName(lua_State *L)
{
    CFURLCopyHostName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLGetPortNumber(lua_State *L)
{
    CFURLGetPortNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyUserName(lua_State *L)
{
    CFURLCopyUserName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyPassword(lua_State *L)
{
    CFURLCopyPassword(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyParameterString(lua_State *L)
{
    CFURLCopyParameterString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyQueryString(lua_State *L)
{
    CFURLCopyQueryString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyFragment(lua_State *L)
{
    CFURLCopyFragment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyLastPathComponent(lua_State *L)
{
    CFURLCopyLastPathComponent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyPathExtension(lua_State *L)
{
    CFURLCopyPathExtension(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLGetBytes(lua_State *L)
{
    CFURLGetBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentScheme(lua_State *L)
{
    CFURLComponentScheme(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentNetLocation(lua_State *L)
{
    CFURLComponentNetLocation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentPath(lua_State *L)
{
    CFURLComponentPath(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentResourceSpecifier(lua_State *L)
{
    CFURLComponentResourceSpecifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentUser(lua_State *L)
{
    CFURLComponentUser(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentPassword(lua_State *L)
{
    CFURLComponentPassword(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentUserInfo(lua_State *L)
{
    CFURLComponentUserInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentHost(lua_State *L)
{
    CFURLComponentHost(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentPort(lua_State *L)
{
    CFURLComponentPort(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentParameterString(lua_State *L)
{
    CFURLComponentParameterString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentQuery(lua_State *L)
{
    CFURLComponentQuery(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentFragment(lua_State *L)
{
    CFURLComponentFragment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLComponentType(lua_State *L)
{
    CFURLComponentType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLGetBytes(lua_State *L)
{
    CFURLGetBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLGetBytes(lua_State *L)
{
    CFURLGetBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLGetByteRangeForComponent(lua_State *L)
{
    CFURLGetByteRangeForComponent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateStringByReplacingPercentEscapes(lua_State *L)
{
    CFURLCreateStringByReplacingPercentEscapes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateStringByReplacingPercentEscapesUsingEncoding(lua_State *L)
{
    CFURLCreateStringByReplacingPercentEscapesUsingEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateStringByAddingPercentEscapes(lua_State *L)
{
    CFURLCreateStringByAddingPercentEscapes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateStringByAddingPercentEscapes(lua_State *L)
{
    CFURLCreateStringByAddingPercentEscapes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLGetFSRef(lua_State *L)
{
    CFURLGetFSRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyResourcePropertyForKey(lua_State *L)
{
    CFURLCopyResourcePropertyForKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyResourcePropertiesForKeys(lua_State *L)
{
    CFURLCopyResourcePropertiesForKeys(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLSetResourcePropertyForKey(lua_State *L)
{
    CFURLSetResourcePropertyForKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLKeysOfUnsetValuesKey(lua_State *L)
{
    CFURLKeysOfUnsetValuesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLSetResourcePropertiesForKeys(lua_State *L)
{
    CFURLSetResourcePropertiesForKeys(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLKeysOfUnsetValuesKey(lua_State *L)
{
    CFURLKeysOfUnsetValuesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLSetResourcePropertiesForKeys(lua_State *L)
{
    CFURLSetResourcePropertiesForKeys(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLClearResourcePropertyCacheForKey(lua_State *L)
{
    CFURLClearResourcePropertyCacheForKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLClearResourcePropertyCache(lua_State *L)
{
    CFURLClearResourcePropertyCache(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCopyResourcePropertyForKey(lua_State *L)
{
    CFURLCopyResourcePropertyForKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLClearResourcePropertyCacheForKey(lua_State *L)
{
    CFURLClearResourcePropertyCacheForKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLSetTemporaryResourcePropertyForKey(lua_State *L)
{
    CFURLSetTemporaryResourcePropertyForKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLResourceIsReachable(lua_State *L)
{
    CFURLResourceIsReachable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLNameKey(lua_State *L)
{
    CFURLNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLLocalizedNameKey(lua_State *L)
{
    CFURLLocalizedNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsRegularFileKey(lua_State *L)
{
    CFURLIsRegularFileKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsDirectoryKey(lua_State *L)
{
    CFURLIsDirectoryKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsSymbolicLinkKey(lua_State *L)
{
    CFURLIsSymbolicLinkKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsVolumeKey(lua_State *L)
{
    CFURLIsVolumeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsPackageKey(lua_State *L)
{
    CFURLIsPackageKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsSystemImmutableKey(lua_State *L)
{
    CFURLIsSystemImmutableKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsUserImmutableKey(lua_State *L)
{
    CFURLIsUserImmutableKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsHiddenKey(lua_State *L)
{
    CFURLIsHiddenKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLHasHiddenExtensionKey(lua_State *L)
{
    CFURLHasHiddenExtensionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreationDateKey(lua_State *L)
{
    CFURLCreationDateKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLContentAccessDateKey(lua_State *L)
{
    CFURLContentAccessDateKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLContentModificationDateKey(lua_State *L)
{
    CFURLContentModificationDateKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLAttributeModificationDateKey(lua_State *L)
{
    CFURLAttributeModificationDateKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLLinkCountKey(lua_State *L)
{
    CFURLLinkCountKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLParentDirectoryURLKey(lua_State *L)
{
    CFURLParentDirectoryURLKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeURLKey(lua_State *L)
{
    CFURLVolumeURLKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLTypeIdentifierKey(lua_State *L)
{
    CFURLTypeIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLLocalizedTypeDescriptionKey(lua_State *L)
{
    CFURLLocalizedTypeDescriptionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLLabelNumberKey(lua_State *L)
{
    CFURLLabelNumberKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLLabelColorKey(lua_State *L)
{
    CFURLLabelColorKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLLocalizedLabelKey(lua_State *L)
{
    CFURLLocalizedLabelKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLEffectiveIconKey(lua_State *L)
{
    CFURLEffectiveIconKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCustomIconKey(lua_State *L)
{
    CFURLCustomIconKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceIdentifierKey(lua_State *L)
{
    CFURLFileResourceIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeIdentifierKey(lua_State *L)
{
    CFURLVolumeIdentifierKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLPreferredIOBlockSizeKey(lua_State *L)
{
    CFURLPreferredIOBlockSizeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsReadableKey(lua_State *L)
{
    CFURLIsReadableKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsWritableKey(lua_State *L)
{
    CFURLIsWritableKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsExecutableKey(lua_State *L)
{
    CFURLIsExecutableKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileSecurityKey(lua_State *L)
{
    CFURLFileSecurityKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsExcludedFromBackupKey(lua_State *L)
{
    CFURLIsExcludedFromBackupKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceTypeKey(lua_State *L)
{
    CFURLFileResourceTypeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceTypeKey(lua_State *L)
{
    CFURLFileResourceTypeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceTypeNamedPipe(lua_State *L)
{
    CFURLFileResourceTypeNamedPipe(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceTypeCharacterSpecial(lua_State *L)
{
    CFURLFileResourceTypeCharacterSpecial(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceTypeDirectory(lua_State *L)
{
    CFURLFileResourceTypeDirectory(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceTypeBlockSpecial(lua_State *L)
{
    CFURLFileResourceTypeBlockSpecial(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceTypeRegular(lua_State *L)
{
    CFURLFileResourceTypeRegular(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceTypeSymbolicLink(lua_State *L)
{
    CFURLFileResourceTypeSymbolicLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceTypeSocket(lua_State *L)
{
    CFURLFileResourceTypeSocket(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileResourceTypeUnknown(lua_State *L)
{
    CFURLFileResourceTypeUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileSizeKey(lua_State *L)
{
    CFURLFileSizeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLFileAllocatedSizeKey(lua_State *L)
{
    CFURLFileAllocatedSizeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLTotalFileSizeKey(lua_State *L)
{
    CFURLTotalFileSizeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLTotalFileAllocatedSizeKey(lua_State *L)
{
    CFURLTotalFileAllocatedSizeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLTotalFileSizeKey(lua_State *L)
{
    CFURLTotalFileSizeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsAliasFileKey(lua_State *L)
{
    CFURLIsAliasFileKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsMountTriggerKey(lua_State *L)
{
    CFURLIsMountTriggerKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeLocalizedFormatDescriptionKey(lua_State *L)
{
    CFURLVolumeLocalizedFormatDescriptionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeTotalCapacityKey(lua_State *L)
{
    CFURLVolumeTotalCapacityKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeAvailableCapacityKey(lua_State *L)
{
    CFURLVolumeAvailableCapacityKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeResourceCountKey(lua_State *L)
{
    CFURLVolumeResourceCountKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsPersistentIDsKey(lua_State *L)
{
    CFURLVolumeSupportsPersistentIDsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsSymbolicLinksKey(lua_State *L)
{
    CFURLVolumeSupportsSymbolicLinksKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsHardLinksKey(lua_State *L)
{
    CFURLVolumeSupportsHardLinksKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsJournalingKey(lua_State *L)
{
    CFURLVolumeSupportsJournalingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeIsJournalingKey(lua_State *L)
{
    CFURLVolumeIsJournalingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsSparseFilesKey(lua_State *L)
{
    CFURLVolumeSupportsSparseFilesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsZeroRunsKey(lua_State *L)
{
    CFURLVolumeSupportsZeroRunsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsCaseSensitiveNamesKey(lua_State *L)
{
    CFURLVolumeSupportsCaseSensitiveNamesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsCasePreservedNamesKey(lua_State *L)
{
    CFURLVolumeSupportsCasePreservedNamesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsRootDirectoryDatesKey(lua_State *L)
{
    CFURLVolumeSupportsRootDirectoryDatesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsVolumeSizesKey(lua_State *L)
{
    CFURLVolumeSupportsVolumeSizesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeTotalCapacityKey(lua_State *L)
{
    CFURLVolumeTotalCapacityKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsRenamingKey(lua_State *L)
{
    CFURLVolumeSupportsRenamingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsAdvisoryFileLockingKey(lua_State *L)
{
    CFURLVolumeSupportsAdvisoryFileLockingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsExtendedSecurityKey(lua_State *L)
{
    CFURLVolumeSupportsExtendedSecurityKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeIsBrowsableKey(lua_State *L)
{
    CFURLVolumeIsBrowsableKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeMaximumFileSizeKey(lua_State *L)
{
    CFURLVolumeMaximumFileSizeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeIsEjectableKey(lua_State *L)
{
    CFURLVolumeIsEjectableKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeIsRemovableKey(lua_State *L)
{
    CFURLVolumeIsRemovableKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeIsInternalKey(lua_State *L)
{
    CFURLVolumeIsInternalKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeIsAutomountedKey(lua_State *L)
{
    CFURLVolumeIsAutomountedKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsBrowsingKey(lua_State *L)
{
    CFURLVolumeSupportsBrowsingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeIsLocalKey(lua_State *L)
{
    CFURLVolumeIsLocalKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeIsReadOnlyKey(lua_State *L)
{
    CFURLVolumeIsReadOnlyKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeCreationDateKey(lua_State *L)
{
    CFURLVolumeCreationDateKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeURLForRemountingKey(lua_State *L)
{
    CFURLVolumeURLForRemountingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeUUIDStringKey(lua_State *L)
{
    CFURLVolumeUUIDStringKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeNameKey(lua_State *L)
{
    CFURLVolumeNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeSupportsRenamingKey(lua_State *L)
{
    CFURLVolumeSupportsRenamingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLVolumeLocalizedNameKey(lua_State *L)
{
    CFURLVolumeLocalizedNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLIsUbiquitousItemKey(lua_State *L)
{
    CFURLIsUbiquitousItemKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLUbiquitousItemHasUnresolvedConflictsKey(lua_State *L)
{
    CFURLUbiquitousItemHasUnresolvedConflictsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLUbiquitousItemIsDownloadedKey(lua_State *L)
{
    CFURLUbiquitousItemIsDownloadedKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLUbiquitousItemIsDownloadingKey(lua_State *L)
{
    CFURLUbiquitousItemIsDownloadingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLUbiquitousItemIsUploadedKey(lua_State *L)
{
    CFURLUbiquitousItemIsUploadedKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLUbiquitousItemIsUploadingKey(lua_State *L)
{
    CFURLUbiquitousItemIsUploadingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLUbiquitousItemPercentDownloadedKey(lua_State *L)
{
    CFURLUbiquitousItemPercentDownloadedKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLUbiquitousItemPercentUploadedKey(lua_State *L)
{
    CFURLUbiquitousItemPercentUploadedKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLBookmarkCreationPreferFileIDResolutionMask(lua_State *L)
{
    CFURLBookmarkCreationPreferFileIDResolutionMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLBookmarkCreationMinimalBookmarkMask(lua_State *L)
{
    CFURLBookmarkCreationMinimalBookmarkMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLBookmarkCreationSuitableForBookmarkFile(lua_State *L)
{
    CFURLBookmarkCreationSuitableForBookmarkFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLBookmarkCreationOptions(lua_State *L)
{
    CFURLBookmarkCreationOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLBookmarkResolutionOptions(lua_State *L)
{
    CFURLBookmarkResolutionOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLBookmarkFileCreationOptions(lua_State *L)
{
    CFURLBookmarkFileCreationOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkData(lua_State *L)
{
    CFURLCreateBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateByResolvingBookmarkData(lua_State *L)
{
    CFURLCreateByResolvingBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkData(lua_State *L)
{
    CFURLCreateBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateByResolvingBookmarkData(lua_State *L)
{
    CFURLCreateByResolvingBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkRepresentation(lua_State *L)
{
    CFURLCreateBookmarkRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkData(lua_State *L)
{
    CFURLCreateBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreatePropertiesForKeysFromBookmarkData(lua_State *L)
{
    CFURLCreatePropertiesForKeysFromBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkData(lua_State *L)
{
    CFURLCreateBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateResourcePropertiesForKeysFromBookmarkData(lua_State *L)
{
    CFURLCreateResourcePropertiesForKeysFromBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreatePropertyForKeyFromBookmarkData(lua_State *L)
{
    CFURLCreatePropertyForKeyFromBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkData(lua_State *L)
{
    CFURLCreateBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateResourcePropertyForKeyFromBookmarkData(lua_State *L)
{
    CFURLCreateResourcePropertyForKeyFromBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkDataFromFile(lua_State *L)
{
    CFURLCreateBookmarkDataFromFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLRef(lua_State *L)
{
    CFURLRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkDataFromFile(lua_State *L)
{
    CFURLCreateBookmarkDataFromFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLWriteBookmarkDataToFile(lua_State *L)
{
    CFURLWriteBookmarkDataToFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLBookmarkCreationSuitableForBookmarkFile(lua_State *L)
{
    CFURLBookmarkCreationSuitableForBookmarkFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkData(lua_State *L)
{
    CFURLCreateBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLWriteBookmarkDataToFile(lua_State *L)
{
    CFURLWriteBookmarkDataToFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkDataFromAliasRecord(lua_State *L)
{
    CFURLCreateBookmarkDataFromAliasRecord(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateByResolvingBookmarkData(lua_State *L)
{
    CFURLCreateByResolvingBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateResourcePropertiesForKeysFromBookmarkData(lua_State *L)
{
    CFURLCreateResourcePropertiesForKeysFromBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateByResolvingBookmarkData(lua_State *L)
{
    CFURLCreateByResolvingBookmarkData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURLCreateBookmarkDataFromAliasRecord(lua_State *L)
{
    CFURLCreateBookmarkDataFromAliasRecord(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFURL__(lua_State *L)
{
    CFURL__(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFURLAPIs[] = {
    {"CFURL__", lua_CFURL__},
    {"CFURL__", lua_CFURL__},
    {"CFURLPOSIXPathStyle", lua_CFURLPOSIXPathStyle},
    {"CFURLHFSPathStyle", lua_CFURLHFSPathStyle},
    {"CFURLWindowsPathStyle", lua_CFURLWindowsPathStyle},
    {"CFURLPathStyle", lua_CFURLPathStyle},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLs", lua_CFURLs},
    {"CFURLs", lua_CFURLs},
    {"CFURLCopyAbsoluteURL", lua_CFURLCopyAbsoluteURL},
    {"CFURLGetTypeID", lua_CFURLGetTypeID},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLCreateData", lua_CFURLCreateData},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLCopyAbsoluteURL", lua_CFURLCopyAbsoluteURL},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLPosixPathStyle", lua_CFURLPosixPathStyle},
    {"CFURLHFSPathStyle", lua_CFURLHFSPathStyle},
    {"CFURLWindowsPathStyle", lua_CFURLWindowsPathStyle},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLGetFileSystemRepresentation", lua_CFURLGetFileSystemRepresentation},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLGetString", lua_CFURLGetString},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLCreateStringByReplacingPercentEscapes", lua_CFURLCreateStringByReplacingPercentEscapes},
    {"CFURLCopyHostName", lua_CFURLCopyHostName},
    {"CFURLGetPortNumber", lua_CFURLGetPortNumber},
    {"CFURLCopyPassword", lua_CFURLCopyPassword},
    {"CFURLCopyFragment", lua_CFURLCopyFragment},
    {"CFURLCopyParameters", lua_CFURLCopyParameters},
    {"CFURLCanBeDecomposed", lua_CFURLCanBeDecomposed},
    {"CFURLCopyScheme", lua_CFURLCopyScheme},
    {"CFURLCanBeDecomposed", lua_CFURLCanBeDecomposed},
    {"CFURLCopyNetLocation", lua_CFURLCopyNetLocation},
    {"CFURLCanBeDecomposed", lua_CFURLCanBeDecomposed},
    {"CFURLCopyAbsoluteURL", lua_CFURLCopyAbsoluteURL},
    {"CFURLCopyPath", lua_CFURLCopyPath},
    {"CFURLCopyStrictPath", lua_CFURLCopyStrictPath},
    {"CFURLCopyFileSystemPath", lua_CFURLCopyFileSystemPath},
    {"CFURLCopyPath", lua_CFURLCopyPath},
    {"CFURLCopyStrictPath", lua_CFURLCopyStrictPath},
    {"CFURLCopyFileSystemPath", lua_CFURLCopyFileSystemPath},
    {"CFURLHasDirectoryPath", lua_CFURLHasDirectoryPath},
    {"CFURLCopyResourceSpecifier", lua_CFURLCopyResourceSpecifier},
    {"CFURLCopyHostName", lua_CFURLCopyHostName},
    {"CFURLGetPortNumber", lua_CFURLGetPortNumber},
    {"CFURLCopyUserName", lua_CFURLCopyUserName},
    {"CFURLCopyPassword", lua_CFURLCopyPassword},
    {"CFURLCopyParameterString", lua_CFURLCopyParameterString},
    {"CFURLCopyQueryString", lua_CFURLCopyQueryString},
    {"CFURLCopyFragment", lua_CFURLCopyFragment},
    {"CFURLCopyLastPathComponent", lua_CFURLCopyLastPathComponent},
    {"CFURLCopyPathExtension", lua_CFURLCopyPathExtension},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLGetBytes", lua_CFURLGetBytes},
    {"CFURLComponentScheme", lua_CFURLComponentScheme},
    {"CFURLComponentNetLocation", lua_CFURLComponentNetLocation},
    {"CFURLComponentPath", lua_CFURLComponentPath},
    {"CFURLComponentResourceSpecifier", lua_CFURLComponentResourceSpecifier},
    {"CFURLComponentUser", lua_CFURLComponentUser},
    {"CFURLComponentPassword", lua_CFURLComponentPassword},
    {"CFURLComponentUserInfo", lua_CFURLComponentUserInfo},
    {"CFURLComponentHost", lua_CFURLComponentHost},
    {"CFURLComponentPort", lua_CFURLComponentPort},
    {"CFURLComponentParameterString", lua_CFURLComponentParameterString},
    {"CFURLComponentQuery", lua_CFURLComponentQuery},
    {"CFURLComponentFragment", lua_CFURLComponentFragment},
    {"CFURLComponentType", lua_CFURLComponentType},
    {"CFURLGetBytes", lua_CFURLGetBytes},
    {"CFURLGetBytes", lua_CFURLGetBytes},
    {"CFURLGetByteRangeForComponent", lua_CFURLGetByteRangeForComponent},
    {"CFURLCreateStringByReplacingPercentEscapes", lua_CFURLCreateStringByReplacingPercentEscapes},
    {"CFURLCreateStringByReplacingPercentEscapesUsingEncoding", lua_CFURLCreateStringByReplacingPercentEscapesUsingEncoding},
    {"CFURLCreateStringByAddingPercentEscapes", lua_CFURLCreateStringByAddingPercentEscapes},
    {"CFURLCreateStringByAddingPercentEscapes", lua_CFURLCreateStringByAddingPercentEscapes},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLGetFSRef", lua_CFURLGetFSRef},
    {"CFURLCopyResourcePropertyForKey", lua_CFURLCopyResourcePropertyForKey},
    {"CFURLCopyResourcePropertiesForKeys", lua_CFURLCopyResourcePropertiesForKeys},
    {"CFURLSetResourcePropertyForKey", lua_CFURLSetResourcePropertyForKey},
    {"CFURLKeysOfUnsetValuesKey", lua_CFURLKeysOfUnsetValuesKey},
    {"CFURLSetResourcePropertiesForKeys", lua_CFURLSetResourcePropertiesForKeys},
    {"CFURLKeysOfUnsetValuesKey", lua_CFURLKeysOfUnsetValuesKey},
    {"CFURLSetResourcePropertiesForKeys", lua_CFURLSetResourcePropertiesForKeys},
    {"CFURLClearResourcePropertyCacheForKey", lua_CFURLClearResourcePropertyCacheForKey},
    {"CFURLClearResourcePropertyCache", lua_CFURLClearResourcePropertyCache},
    {"CFURLCopyResourcePropertyForKey", lua_CFURLCopyResourcePropertyForKey},
    {"CFURLClearResourcePropertyCacheForKey", lua_CFURLClearResourcePropertyCacheForKey},
    {"CFURLSetTemporaryResourcePropertyForKey", lua_CFURLSetTemporaryResourcePropertyForKey},
    {"CFURLResourceIsReachable", lua_CFURLResourceIsReachable},
    {"CFURLNameKey", lua_CFURLNameKey},
    {"CFURLLocalizedNameKey", lua_CFURLLocalizedNameKey},
    {"CFURLIsRegularFileKey", lua_CFURLIsRegularFileKey},
    {"CFURLIsDirectoryKey", lua_CFURLIsDirectoryKey},
    {"CFURLIsSymbolicLinkKey", lua_CFURLIsSymbolicLinkKey},
    {"CFURLIsVolumeKey", lua_CFURLIsVolumeKey},
    {"CFURLIsPackageKey", lua_CFURLIsPackageKey},
    {"CFURLIsSystemImmutableKey", lua_CFURLIsSystemImmutableKey},
    {"CFURLIsUserImmutableKey", lua_CFURLIsUserImmutableKey},
    {"CFURLIsHiddenKey", lua_CFURLIsHiddenKey},
    {"CFURLHasHiddenExtensionKey", lua_CFURLHasHiddenExtensionKey},
    {"CFURLCreationDateKey", lua_CFURLCreationDateKey},
    {"CFURLContentAccessDateKey", lua_CFURLContentAccessDateKey},
    {"CFURLContentModificationDateKey", lua_CFURLContentModificationDateKey},
    {"CFURLAttributeModificationDateKey", lua_CFURLAttributeModificationDateKey},
    {"CFURLLinkCountKey", lua_CFURLLinkCountKey},
    {"CFURLParentDirectoryURLKey", lua_CFURLParentDirectoryURLKey},
    {"CFURLVolumeURLKey", lua_CFURLVolumeURLKey},
    {"CFURLTypeIdentifierKey", lua_CFURLTypeIdentifierKey},
    {"CFURLLocalizedTypeDescriptionKey", lua_CFURLLocalizedTypeDescriptionKey},
    {"CFURLLabelNumberKey", lua_CFURLLabelNumberKey},
    {"CFURLLabelColorKey", lua_CFURLLabelColorKey},
    {"CFURLLocalizedLabelKey", lua_CFURLLocalizedLabelKey},
    {"CFURLEffectiveIconKey", lua_CFURLEffectiveIconKey},
    {"CFURLCustomIconKey", lua_CFURLCustomIconKey},
    {"CFURLFileResourceIdentifierKey", lua_CFURLFileResourceIdentifierKey},
    {"CFURLVolumeIdentifierKey", lua_CFURLVolumeIdentifierKey},
    {"CFURLPreferredIOBlockSizeKey", lua_CFURLPreferredIOBlockSizeKey},
    {"CFURLIsReadableKey", lua_CFURLIsReadableKey},
    {"CFURLIsWritableKey", lua_CFURLIsWritableKey},
    {"CFURLIsExecutableKey", lua_CFURLIsExecutableKey},
    {"CFURLFileSecurityKey", lua_CFURLFileSecurityKey},
    {"CFURLIsExcludedFromBackupKey", lua_CFURLIsExcludedFromBackupKey},
    {"CFURLFileResourceTypeKey", lua_CFURLFileResourceTypeKey},
    {"CFURLFileResourceTypeKey", lua_CFURLFileResourceTypeKey},
    {"CFURLFileResourceTypeNamedPipe", lua_CFURLFileResourceTypeNamedPipe},
    {"CFURLFileResourceTypeCharacterSpecial", lua_CFURLFileResourceTypeCharacterSpecial},
    {"CFURLFileResourceTypeDirectory", lua_CFURLFileResourceTypeDirectory},
    {"CFURLFileResourceTypeBlockSpecial", lua_CFURLFileResourceTypeBlockSpecial},
    {"CFURLFileResourceTypeRegular", lua_CFURLFileResourceTypeRegular},
    {"CFURLFileResourceTypeSymbolicLink", lua_CFURLFileResourceTypeSymbolicLink},
    {"CFURLFileResourceTypeSocket", lua_CFURLFileResourceTypeSocket},
    {"CFURLFileResourceTypeUnknown", lua_CFURLFileResourceTypeUnknown},
    {"CFURLFileSizeKey", lua_CFURLFileSizeKey},
    {"CFURLFileAllocatedSizeKey", lua_CFURLFileAllocatedSizeKey},
    {"CFURLTotalFileSizeKey", lua_CFURLTotalFileSizeKey},
    {"CFURLTotalFileAllocatedSizeKey", lua_CFURLTotalFileAllocatedSizeKey},
    {"CFURLTotalFileSizeKey", lua_CFURLTotalFileSizeKey},
    {"CFURLIsAliasFileKey", lua_CFURLIsAliasFileKey},
    {"CFURLIsMountTriggerKey", lua_CFURLIsMountTriggerKey},
    {"CFURLVolumeLocalizedFormatDescriptionKey", lua_CFURLVolumeLocalizedFormatDescriptionKey},
    {"CFURLVolumeTotalCapacityKey", lua_CFURLVolumeTotalCapacityKey},
    {"CFURLVolumeAvailableCapacityKey", lua_CFURLVolumeAvailableCapacityKey},
    {"CFURLVolumeResourceCountKey", lua_CFURLVolumeResourceCountKey},
    {"CFURLVolumeSupportsPersistentIDsKey", lua_CFURLVolumeSupportsPersistentIDsKey},
    {"CFURLVolumeSupportsSymbolicLinksKey", lua_CFURLVolumeSupportsSymbolicLinksKey},
    {"CFURLVolumeSupportsHardLinksKey", lua_CFURLVolumeSupportsHardLinksKey},
    {"CFURLVolumeSupportsJournalingKey", lua_CFURLVolumeSupportsJournalingKey},
    {"CFURLVolumeIsJournalingKey", lua_CFURLVolumeIsJournalingKey},
    {"CFURLVolumeSupportsSparseFilesKey", lua_CFURLVolumeSupportsSparseFilesKey},
    {"CFURLVolumeSupportsZeroRunsKey", lua_CFURLVolumeSupportsZeroRunsKey},
    {"CFURLVolumeSupportsCaseSensitiveNamesKey", lua_CFURLVolumeSupportsCaseSensitiveNamesKey},
    {"CFURLVolumeSupportsCasePreservedNamesKey", lua_CFURLVolumeSupportsCasePreservedNamesKey},
    {"CFURLVolumeSupportsRootDirectoryDatesKey", lua_CFURLVolumeSupportsRootDirectoryDatesKey},
    {"CFURLVolumeSupportsVolumeSizesKey", lua_CFURLVolumeSupportsVolumeSizesKey},
    {"CFURLVolumeTotalCapacityKey", lua_CFURLVolumeTotalCapacityKey},
    {"CFURLVolumeSupportsRenamingKey", lua_CFURLVolumeSupportsRenamingKey},
    {"CFURLVolumeSupportsAdvisoryFileLockingKey", lua_CFURLVolumeSupportsAdvisoryFileLockingKey},
    {"CFURLVolumeSupportsExtendedSecurityKey", lua_CFURLVolumeSupportsExtendedSecurityKey},
    {"CFURLVolumeIsBrowsableKey", lua_CFURLVolumeIsBrowsableKey},
    {"CFURLVolumeMaximumFileSizeKey", lua_CFURLVolumeMaximumFileSizeKey},
    {"CFURLVolumeIsEjectableKey", lua_CFURLVolumeIsEjectableKey},
    {"CFURLVolumeIsRemovableKey", lua_CFURLVolumeIsRemovableKey},
    {"CFURLVolumeIsInternalKey", lua_CFURLVolumeIsInternalKey},
    {"CFURLVolumeIsAutomountedKey", lua_CFURLVolumeIsAutomountedKey},
    {"CFURLVolumeSupportsBrowsingKey", lua_CFURLVolumeSupportsBrowsingKey},
    {"CFURLVolumeIsLocalKey", lua_CFURLVolumeIsLocalKey},
    {"CFURLVolumeIsReadOnlyKey", lua_CFURLVolumeIsReadOnlyKey},
    {"CFURLVolumeCreationDateKey", lua_CFURLVolumeCreationDateKey},
    {"CFURLVolumeURLForRemountingKey", lua_CFURLVolumeURLForRemountingKey},
    {"CFURLVolumeUUIDStringKey", lua_CFURLVolumeUUIDStringKey},
    {"CFURLVolumeNameKey", lua_CFURLVolumeNameKey},
    {"CFURLVolumeSupportsRenamingKey", lua_CFURLVolumeSupportsRenamingKey},
    {"CFURLVolumeLocalizedNameKey", lua_CFURLVolumeLocalizedNameKey},
    {"CFURLIsUbiquitousItemKey", lua_CFURLIsUbiquitousItemKey},
    {"CFURLUbiquitousItemHasUnresolvedConflictsKey", lua_CFURLUbiquitousItemHasUnresolvedConflictsKey},
    {"CFURLUbiquitousItemIsDownloadedKey", lua_CFURLUbiquitousItemIsDownloadedKey},
    {"CFURLUbiquitousItemIsDownloadingKey", lua_CFURLUbiquitousItemIsDownloadingKey},
    {"CFURLUbiquitousItemIsUploadedKey", lua_CFURLUbiquitousItemIsUploadedKey},
    {"CFURLUbiquitousItemIsUploadingKey", lua_CFURLUbiquitousItemIsUploadingKey},
    {"CFURLUbiquitousItemPercentDownloadedKey", lua_CFURLUbiquitousItemPercentDownloadedKey},
    {"CFURLUbiquitousItemPercentUploadedKey", lua_CFURLUbiquitousItemPercentUploadedKey},
    {"CFURLBookmarkCreationPreferFileIDResolutionMask", lua_CFURLBookmarkCreationPreferFileIDResolutionMask},
    {"CFURLBookmarkCreationMinimalBookmarkMask", lua_CFURLBookmarkCreationMinimalBookmarkMask},
    {"CFURLBookmarkCreationSuitableForBookmarkFile", lua_CFURLBookmarkCreationSuitableForBookmarkFile},
    {"CFURLBookmarkCreationOptions", lua_CFURLBookmarkCreationOptions},
    {"CFURLBookmarkResolutionOptions", lua_CFURLBookmarkResolutionOptions},
    {"CFURLBookmarkFileCreationOptions", lua_CFURLBookmarkFileCreationOptions},
    {"CFURLCreateBookmarkData", lua_CFURLCreateBookmarkData},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLCreateByResolvingBookmarkData", lua_CFURLCreateByResolvingBookmarkData},
    {"CFURLCreateBookmarkData", lua_CFURLCreateBookmarkData},
    {"CFURLCreateByResolvingBookmarkData", lua_CFURLCreateByResolvingBookmarkData},
    {"CFURLCreateBookmarkRepresentation", lua_CFURLCreateBookmarkRepresentation},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLCreateBookmarkData", lua_CFURLCreateBookmarkData},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLCreatePropertiesForKeysFromBookmarkData", lua_CFURLCreatePropertiesForKeysFromBookmarkData},
    {"CFURLCreateBookmarkData", lua_CFURLCreateBookmarkData},
    {"CFURLCreateResourcePropertiesForKeysFromBookmarkData", lua_CFURLCreateResourcePropertiesForKeysFromBookmarkData},
    {"CFURLCreatePropertyForKeyFromBookmarkData", lua_CFURLCreatePropertyForKeyFromBookmarkData},
    {"CFURLCreateBookmarkData", lua_CFURLCreateBookmarkData},
    {"CFURLCreateResourcePropertyForKeyFromBookmarkData", lua_CFURLCreateResourcePropertyForKeyFromBookmarkData},
    {"CFURLCreateBookmarkDataFromFile", lua_CFURLCreateBookmarkDataFromFile},
    {"CFURLRef", lua_CFURLRef},
    {"CFURLCreateBookmarkDataFromFile", lua_CFURLCreateBookmarkDataFromFile},
    {"CFURLWriteBookmarkDataToFile", lua_CFURLWriteBookmarkDataToFile},
    {"CFURLBookmarkCreationSuitableForBookmarkFile", lua_CFURLBookmarkCreationSuitableForBookmarkFile},
    {"CFURLCreateBookmarkData", lua_CFURLCreateBookmarkData},
    {"CFURLWriteBookmarkDataToFile", lua_CFURLWriteBookmarkDataToFile},
    {"CFURLCreateBookmarkDataFromAliasRecord", lua_CFURLCreateBookmarkDataFromAliasRecord},
    {"CFURLCreateByResolvingBookmarkData", lua_CFURLCreateByResolvingBookmarkData},
    {"CFURLCreateResourcePropertiesForKeysFromBookmarkData", lua_CFURLCreateResourcePropertiesForKeysFromBookmarkData},
    {"CFURLCreateByResolvingBookmarkData", lua_CFURLCreateByResolvingBookmarkData},
    {"CFURLCreateBookmarkDataFromAliasRecord", lua_CFURLCreateBookmarkDataFromAliasRecord},
    {"CFURL__", lua_CFURL__},
    {NULL, NULL},
};

int LuaOpenCFURL(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFURLAPIs);
    return 0;
}
