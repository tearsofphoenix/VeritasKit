//
//  LuaCVImageBuffer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCVImageBuffer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CVImageBufferRef(lua_State *L)
{
    CVImageBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferRef(lua_State *L)
{
    CVImageBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferCGColorSpaceKey(lua_State *L)
{
    CVImageBufferCGColorSpaceKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferCleanApertureKey(lua_State *L)
{
    CVImageBufferCleanApertureKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferCleanApertureWidthKey(lua_State *L)
{
    CVImageBufferCleanApertureWidthKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferCleanApertureHeightKey(lua_State *L)
{
    CVImageBufferCleanApertureHeightKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferCleanApertureHorizontalOffsetKey(lua_State *L)
{
    CVImageBufferCleanApertureHorizontalOffsetKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferCleanApertureVerticalOffsetKey(lua_State *L)
{
    CVImageBufferCleanApertureVerticalOffsetKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferPreferredCleanApertureKey(lua_State *L)
{
    CVImageBufferPreferredCleanApertureKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferFieldCountKey(lua_State *L)
{
    CVImageBufferFieldCountKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferFieldDetailKey(lua_State *L)
{
    CVImageBufferFieldDetailKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferFieldDetailTemporalTopFirst(lua_State *L)
{
    CVImageBufferFieldDetailTemporalTopFirst(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferFieldDetailTemporalBottomFirst(lua_State *L)
{
    CVImageBufferFieldDetailTemporalBottomFirst(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferFieldDetailSpatialFirstLineEarly(lua_State *L)
{
    CVImageBufferFieldDetailSpatialFirstLineEarly(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferFieldDetailSpatialFirstLineLate(lua_State *L)
{
    CVImageBufferFieldDetailSpatialFirstLineLate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferPixelAspectRatioKey(lua_State *L)
{
    CVImageBufferPixelAspectRatioKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferPixelAspectRatioHorizontalSpacingKey(lua_State *L)
{
    CVImageBufferPixelAspectRatioHorizontalSpacingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferPixelAspectRatioVerticalSpacingKey(lua_State *L)
{
    CVImageBufferPixelAspectRatioVerticalSpacingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferDisplayDimensionsKey(lua_State *L)
{
    CVImageBufferDisplayDimensionsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferDisplayWidthKey(lua_State *L)
{
    CVImageBufferDisplayWidthKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferDisplayHeightKey(lua_State *L)
{
    CVImageBufferDisplayHeightKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferGammaLevelKey(lua_State *L)
{
    CVImageBufferGammaLevelKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferICCProfileKey(lua_State *L)
{
    CVImageBufferICCProfileKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferYCbCrMatrixKey(lua_State *L)
{
    CVImageBufferYCbCrMatrixKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferYCbCrMatrix_ITU_R_709_2(lua_State *L)
{
    CVImageBufferYCbCrMatrix_ITU_R_709_2(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferYCbCrMatrix_ITU_R_601_4(lua_State *L)
{
    CVImageBufferYCbCrMatrix_ITU_R_601_4(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferYCbCrMatrix_SMPTE_240M_1995(lua_State *L)
{
    CVImageBufferYCbCrMatrix_SMPTE_240M_1995(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferColorPrimariesKey(lua_State *L)
{
    CVImageBufferColorPrimariesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferColorPrimaries_ITU_R_709_2(lua_State *L)
{
    CVImageBufferColorPrimaries_ITU_R_709_2(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferColorPrimaries_EBU_3213(lua_State *L)
{
    CVImageBufferColorPrimaries_EBU_3213(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferColorPrimaries_SMPTE_C(lua_State *L)
{
    CVImageBufferColorPrimaries_SMPTE_C(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferTransferFunctionKey(lua_State *L)
{
    CVImageBufferTransferFunctionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferTransferFunction_ITU_R_709_2(lua_State *L)
{
    CVImageBufferTransferFunction_ITU_R_709_2(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferTransferFunction_SMPTE_240M_1995(lua_State *L)
{
    CVImageBufferTransferFunction_SMPTE_240M_1995(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferTransferFunction_UseGamma(lua_State *L)
{
    CVImageBufferTransferFunction_UseGamma(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferTransferFunction_EBU_3213(lua_State *L)
{
    CVImageBufferTransferFunction_EBU_3213(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferTransferFunction_SMPTE_C(lua_State *L)
{
    CVImageBufferTransferFunction_SMPTE_C(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaLocationTopFieldKey(lua_State *L)
{
    CVImageBufferChromaLocationTopFieldKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaLocationBottomFieldKey(lua_State *L)
{
    CVImageBufferChromaLocationBottomFieldKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaLocation_Left(lua_State *L)
{
    CVImageBufferChromaLocation_Left(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaLocation_Center(lua_State *L)
{
    CVImageBufferChromaLocation_Center(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaLocation_TopLeft(lua_State *L)
{
    CVImageBufferChromaLocation_TopLeft(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaLocation_Top(lua_State *L)
{
    CVImageBufferChromaLocation_Top(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaLocation_BottomLeft(lua_State *L)
{
    CVImageBufferChromaLocation_BottomLeft(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaLocation_Bottom(lua_State *L)
{
    CVImageBufferChromaLocation_Bottom(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaLocation_DV420(lua_State *L)
{
    CVImageBufferChromaLocation_DV420(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaSubsamplingKey(lua_State *L)
{
    CVImageBufferChromaSubsamplingKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaSubsampling_420(lua_State *L)
{
    CVImageBufferChromaSubsampling_420(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaSubsampling_422(lua_State *L)
{
    CVImageBufferChromaSubsampling_422(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferChromaSubsampling_411(lua_State *L)
{
    CVImageBufferChromaSubsampling_411(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferRef(lua_State *L)
{
    CVImageBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferRef(lua_State *L)
{
    CVImageBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferRef(lua_State *L)
{
    CVImageBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferGetEncodedSize(lua_State *L)
{
    CVImageBufferGetEncodedSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferRef(lua_State *L)
{
    CVImageBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferGetEncodedSize(lua_State *L)
{
    CVImageBufferGetEncodedSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferGetDisplaySize(lua_State *L)
{
    CVImageBufferGetDisplaySize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferRef(lua_State *L)
{
    CVImageBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferGetDisplaySize(lua_State *L)
{
    CVImageBufferGetDisplaySize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferGetCleanRect(lua_State *L)
{
    CVImageBufferGetCleanRect(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferRef(lua_State *L)
{
    CVImageBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferGetCleanRect(lua_State *L)
{
    CVImageBufferGetCleanRect(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferGetColorSpace(lua_State *L)
{
    CVImageBufferGetColorSpace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferRef(lua_State *L)
{
    CVImageBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVImageBufferGetColorSpace(lua_State *L)
{
    CVImageBufferGetColorSpace(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCVImageBufferAPIs[] = {
    {"CVImageBufferRef", lua_CVImageBufferRef},
    {"CVImageBufferRef", lua_CVImageBufferRef},
    {"CVImageBufferCGColorSpaceKey", lua_CVImageBufferCGColorSpaceKey},
    {"CVImageBufferCleanApertureKey", lua_CVImageBufferCleanApertureKey},
    {"CVImageBufferCleanApertureWidthKey", lua_CVImageBufferCleanApertureWidthKey},
    {"CVImageBufferCleanApertureHeightKey", lua_CVImageBufferCleanApertureHeightKey},
    {"CVImageBufferCleanApertureHorizontalOffsetKey", lua_CVImageBufferCleanApertureHorizontalOffsetKey},
    {"CVImageBufferCleanApertureVerticalOffsetKey", lua_CVImageBufferCleanApertureVerticalOffsetKey},
    {"CVImageBufferPreferredCleanApertureKey", lua_CVImageBufferPreferredCleanApertureKey},
    {"CVImageBufferFieldCountKey", lua_CVImageBufferFieldCountKey},
    {"CVImageBufferFieldDetailKey", lua_CVImageBufferFieldDetailKey},
    {"CVImageBufferFieldDetailTemporalTopFirst", lua_CVImageBufferFieldDetailTemporalTopFirst},
    {"CVImageBufferFieldDetailTemporalBottomFirst", lua_CVImageBufferFieldDetailTemporalBottomFirst},
    {"CVImageBufferFieldDetailSpatialFirstLineEarly", lua_CVImageBufferFieldDetailSpatialFirstLineEarly},
    {"CVImageBufferFieldDetailSpatialFirstLineLate", lua_CVImageBufferFieldDetailSpatialFirstLineLate},
    {"CVImageBufferPixelAspectRatioKey", lua_CVImageBufferPixelAspectRatioKey},
    {"CVImageBufferPixelAspectRatioHorizontalSpacingKey", lua_CVImageBufferPixelAspectRatioHorizontalSpacingKey},
    {"CVImageBufferPixelAspectRatioVerticalSpacingKey", lua_CVImageBufferPixelAspectRatioVerticalSpacingKey},
    {"CVImageBufferDisplayDimensionsKey", lua_CVImageBufferDisplayDimensionsKey},
    {"CVImageBufferDisplayWidthKey", lua_CVImageBufferDisplayWidthKey},
    {"CVImageBufferDisplayHeightKey", lua_CVImageBufferDisplayHeightKey},
    {"CVImageBufferGammaLevelKey", lua_CVImageBufferGammaLevelKey},
    {"CVImageBufferICCProfileKey", lua_CVImageBufferICCProfileKey},
    {"CVImageBufferYCbCrMatrixKey", lua_CVImageBufferYCbCrMatrixKey},
    {"CVImageBufferYCbCrMatrix_ITU_R_709_2", lua_CVImageBufferYCbCrMatrix_ITU_R_709_2},
    {"CVImageBufferYCbCrMatrix_ITU_R_601_4", lua_CVImageBufferYCbCrMatrix_ITU_R_601_4},
    {"CVImageBufferYCbCrMatrix_SMPTE_240M_1995", lua_CVImageBufferYCbCrMatrix_SMPTE_240M_1995},
    {"CVImageBufferColorPrimariesKey", lua_CVImageBufferColorPrimariesKey},
    {"CVImageBufferColorPrimaries_ITU_R_709_2", lua_CVImageBufferColorPrimaries_ITU_R_709_2},
    {"CVImageBufferColorPrimaries_EBU_3213", lua_CVImageBufferColorPrimaries_EBU_3213},
    {"CVImageBufferColorPrimaries_SMPTE_C", lua_CVImageBufferColorPrimaries_SMPTE_C},
    {"CVImageBufferTransferFunctionKey", lua_CVImageBufferTransferFunctionKey},
    {"CVImageBufferTransferFunction_ITU_R_709_2", lua_CVImageBufferTransferFunction_ITU_R_709_2},
    {"CVImageBufferTransferFunction_SMPTE_240M_1995", lua_CVImageBufferTransferFunction_SMPTE_240M_1995},
    {"CVImageBufferTransferFunction_UseGamma", lua_CVImageBufferTransferFunction_UseGamma},
    {"CVImageBufferTransferFunction_EBU_3213", lua_CVImageBufferTransferFunction_EBU_3213},
    {"CVImageBufferTransferFunction_SMPTE_C", lua_CVImageBufferTransferFunction_SMPTE_C},
    {"CVImageBufferChromaLocationTopFieldKey", lua_CVImageBufferChromaLocationTopFieldKey},
    {"CVImageBufferChromaLocationBottomFieldKey", lua_CVImageBufferChromaLocationBottomFieldKey},
    {"CVImageBufferChromaLocation_Left", lua_CVImageBufferChromaLocation_Left},
    {"CVImageBufferChromaLocation_Center", lua_CVImageBufferChromaLocation_Center},
    {"CVImageBufferChromaLocation_TopLeft", lua_CVImageBufferChromaLocation_TopLeft},
    {"CVImageBufferChromaLocation_Top", lua_CVImageBufferChromaLocation_Top},
    {"CVImageBufferChromaLocation_BottomLeft", lua_CVImageBufferChromaLocation_BottomLeft},
    {"CVImageBufferChromaLocation_Bottom", lua_CVImageBufferChromaLocation_Bottom},
    {"CVImageBufferChromaLocation_DV420", lua_CVImageBufferChromaLocation_DV420},
    {"CVImageBufferChromaSubsamplingKey", lua_CVImageBufferChromaSubsamplingKey},
    {"CVImageBufferChromaSubsampling_420", lua_CVImageBufferChromaSubsampling_420},
    {"CVImageBufferChromaSubsampling_422", lua_CVImageBufferChromaSubsampling_422},
    {"CVImageBufferChromaSubsampling_411", lua_CVImageBufferChromaSubsampling_411},
    {"CVImageBufferRef", lua_CVImageBufferRef},
    {"CVImageBufferRef", lua_CVImageBufferRef},
    {"CVImageBufferRef", lua_CVImageBufferRef},
    {"CVImageBufferGetEncodedSize", lua_CVImageBufferGetEncodedSize},
    {"CVImageBufferRef", lua_CVImageBufferRef},
    {"CVImageBufferGetEncodedSize", lua_CVImageBufferGetEncodedSize},
    {"CVImageBufferGetDisplaySize", lua_CVImageBufferGetDisplaySize},
    {"CVImageBufferRef", lua_CVImageBufferRef},
    {"CVImageBufferGetDisplaySize", lua_CVImageBufferGetDisplaySize},
    {"CVImageBufferGetCleanRect", lua_CVImageBufferGetCleanRect},
    {"CVImageBufferRef", lua_CVImageBufferRef},
    {"CVImageBufferGetCleanRect", lua_CVImageBufferGetCleanRect},
    {"CVImageBufferGetColorSpace", lua_CVImageBufferGetColorSpace},
    {"CVImageBufferRef", lua_CVImageBufferRef},
    {"CVImageBufferGetColorSpace", lua_CVImageBufferGetColorSpace},
    {NULL, NULL},
};

int LuaOpenCVImageBuffer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCVImageBufferAPIs);
    return 0;
}
