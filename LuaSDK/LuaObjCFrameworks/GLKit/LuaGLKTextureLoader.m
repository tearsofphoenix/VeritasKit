//
//  LuaGLKTextureLoader.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKTextureLoader.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaGLKTextureLoaderConstants[] = 
{
    {"GLKTextureLoaderErrorFileOrURLNotFound", GLKTextureLoaderErrorFileOrURLNotFound},
    {"GLKTextureLoaderErrorInvalidNSData", GLKTextureLoaderErrorInvalidNSData},
    {"GLKTextureLoaderErrorInvalidCGImage", GLKTextureLoaderErrorInvalidCGImage},
    {"GLKTextureLoaderErrorUnknownPathType", GLKTextureLoaderErrorUnknownPathType},
    {"GLKTextureLoaderErrorUnknownFileType", GLKTextureLoaderErrorUnknownFileType},
    {"GLKTextureLoaderErrorPVRAtlasUnsupported", GLKTextureLoaderErrorPVRAtlasUnsupported},
    {"GLKTextureLoaderErrorCubeMapInvalidNumFiles", GLKTextureLoaderErrorCubeMapInvalidNumFiles},
    {"GLKTextureLoaderErrorCompressedTextureUpload", GLKTextureLoaderErrorCompressedTextureUpload},
    {"GLKTextureLoaderErrorUncompressedTextureUpload", GLKTextureLoaderErrorUncompressedTextureUpload},
    {"GLKTextureLoaderErrorUnsupportedCubeMapDimensions", GLKTextureLoaderErrorUnsupportedCubeMapDimensions},
    {"GLKTextureLoaderErrorUnsupportedBitDepth", GLKTextureLoaderErrorUnsupportedBitDepth},
    {"GLKTextureLoaderErrorUnsupportedPVRFormat", GLKTextureLoaderErrorUnsupportedPVRFormat},
    {"GLKTextureLoaderErrorDataPreprocessingFailure", GLKTextureLoaderErrorDataPreprocessingFailure},
    {"GLKTextureLoaderErrorMipmapUnsupported", GLKTextureLoaderErrorMipmapUnsupported},
    {"GLKTextureLoaderErrorUnsupportedOrientation", GLKTextureLoaderErrorUnsupportedOrientation},
    {"GLKTextureLoaderErrorReorientationFailure", GLKTextureLoaderErrorReorientationFailure},
    {"GLKTextureLoaderErrorAlphaPremultiplicationFailure", GLKTextureLoaderErrorAlphaPremultiplicationFailure},
    {"GLKTextureLoaderErrorInvalidEAGLContext", GLKTextureLoaderErrorInvalidEAGLContext},
    {"GLKTextureInfoAlphaStateNone", GLKTextureInfoAlphaStateNone},
    {"GLKTextureInfoAlphaStateNonPremultiplied", GLKTextureInfoAlphaStateNonPremultiplied},
    {"GLKTextureInfoAlphaStatePremultiplied", GLKTextureInfoAlphaStatePremultiplied},
    {"GLKTextureInfoOriginUnknown", GLKTextureInfoOriginUnknown},
    {"GLKTextureInfoOriginTopLeft", GLKTextureInfoOriginTopLeft},
    {"GLKTextureInfoOriginBottomLeft", GLKTextureInfoOriginBottomLeft},
    {NULL, 0},
};

int LuaOpenGLKTextureLoader(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaGLKTextureLoaderConstants);
    return 0;
}
