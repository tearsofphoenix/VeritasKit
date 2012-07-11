//
//  LuaUIImagePickerController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIImagePickerController.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIImagePickerControllerConstants[] = 
{
    {"UIImagePickerControllerSourceTypePhotoLibrary", UIImagePickerControllerSourceTypePhotoLibrary},
    {"UIImagePickerControllerSourceTypeCamera", UIImagePickerControllerSourceTypeCamera},
    {"UIImagePickerControllerSourceTypeSavedPhotosAlbum", UIImagePickerControllerSourceTypeSavedPhotosAlbum},
    {"UIImagePickerControllerQualityTypeHigh", UIImagePickerControllerQualityTypeHigh},
    {"UIImagePickerControllerQualityTypeMedium", UIImagePickerControllerQualityTypeMedium},
    {"UIImagePickerControllerQualityTypeLow", UIImagePickerControllerQualityTypeLow},
    {"UIImagePickerControllerQualityType640x480", UIImagePickerControllerQualityType640x480},
    {"UIImagePickerControllerQualityTypeIFrame1280x720", UIImagePickerControllerQualityTypeIFrame1280x720},
    {"UIImagePickerControllerQualityTypeIFrame960x540", UIImagePickerControllerQualityTypeIFrame960x540},
    {"UIImagePickerControllerCameraCaptureModePhoto", UIImagePickerControllerCameraCaptureModePhoto},
    {"UIImagePickerControllerCameraCaptureModeVideo", UIImagePickerControllerCameraCaptureModeVideo},
    {"UIImagePickerControllerCameraDeviceRear", UIImagePickerControllerCameraDeviceRear},
    {"UIImagePickerControllerCameraDeviceFront", UIImagePickerControllerCameraDeviceFront},
    {"UIImagePickerControllerCameraFlashModeOff", UIImagePickerControllerCameraFlashModeOff},
    {"UIImagePickerControllerCameraFlashModeAuto", UIImagePickerControllerCameraFlashModeAuto},
    {"UIImagePickerControllerCameraFlashModeOn", UIImagePickerControllerCameraFlashModeOn},
    {NULL, 0},
};


int LuaOpenUIImagePickerController(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIImagePickerControllerConstants);
    return 0;
}
