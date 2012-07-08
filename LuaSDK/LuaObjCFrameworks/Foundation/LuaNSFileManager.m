//
//  LuaNSFileManager.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSFileManager.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"


static const LuaSDKConst __luaNSFileManagerConstants[] = 
{
    {"NSVolumeEnumerationSkipHiddenVolumes", NSVolumeEnumerationSkipHiddenVolumes},
    {"NSVolumeEnumerationProduceFileReferenceURLs", NSVolumeEnumerationProduceFileReferenceURLs},
    {"NSDirectoryEnumerationSkipsSubdirectoryDescendants", NSDirectoryEnumerationSkipsSubdirectoryDescendants},
    {"NSDirectoryEnumerationSkipsPackageDescendants", NSDirectoryEnumerationSkipsPackageDescendants},
    {"NSDirectoryEnumerationSkipsHiddenFiles", NSDirectoryEnumerationSkipsHiddenFiles},
    {"NSFileManagerItemReplacementUsingNewMetadataOnly", NSFileManagerItemReplacementUsingNewMetadataOnly},
    {"NSFileManagerItemReplacementWithoutDeletingBackupItem", NSFileManagerItemReplacementWithoutDeletingBackupItem},
    {NULL, 0},
};

int LuaOpenNSFileManager(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSFileManagerConstants);
    return 0;
}
