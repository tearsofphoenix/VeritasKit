//
//  LuaCVPixelBuffer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCVPixelBuffer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CVPixelBuffers(lua_State *L)
{
    CVPixelBuffers(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferLockBaseAddress(lua_State *L)
{
    CVPixelBufferLockBaseAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferLock_ReadOnly(lua_State *L)
{
    CVPixelBufferLock_ReadOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferLockFlags(lua_State *L)
{
    CVPixelBufferLockFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferLock_ReadOnly(lua_State *L)
{
    CVPixelBufferLock_ReadOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetBaseAddressOfPlane(lua_State *L)
{
    CVPixelBufferGetBaseAddressOfPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetBytesPerRowOfPlane(lua_State *L)
{
    CVPixelBufferGetBytesPerRowOfPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPixelFormatTypeKey(lua_State *L)
{
    CVPixelBufferPixelFormatTypeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferMemoryAllocatorKey(lua_State *L)
{
    CVPixelBufferMemoryAllocatorKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferWidthKey(lua_State *L)
{
    CVPixelBufferWidthKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferHeightKey(lua_State *L)
{
    CVPixelBufferHeightKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferExtendedPixelsLeftKey(lua_State *L)
{
    CVPixelBufferExtendedPixelsLeftKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferExtendedPixelsTopKey(lua_State *L)
{
    CVPixelBufferExtendedPixelsTopKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferExtendedPixelsRightKey(lua_State *L)
{
    CVPixelBufferExtendedPixelsRightKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferExtendedPixelsBottomKey(lua_State *L)
{
    CVPixelBufferExtendedPixelsBottomKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferBytesPerRowAlignmentKey(lua_State *L)
{
    CVPixelBufferBytesPerRowAlignmentKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCGBitmapContextCompatibilityKey(lua_State *L)
{
    CVPixelBufferCGBitmapContextCompatibilityKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCGImageCompatibilityKey(lua_State *L)
{
    CVPixelBufferCGImageCompatibilityKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferOpenGLCompatibilityKey(lua_State *L)
{
    CVPixelBufferOpenGLCompatibilityKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPlaneAlignmentKey(lua_State *L)
{
    CVPixelBufferPlaneAlignmentKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferIOSurfacePropertiesKey(lua_State *L)
{
    CVPixelBufferIOSurfacePropertiesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRef(lua_State *L)
{
    CVPixelBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRef(lua_State *L)
{
    CVPixelBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetTypeID(lua_State *L)
{
    CVPixelBufferGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRetain(lua_State *L)
{
    CVPixelBufferRetain(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRef(lua_State *L)
{
    CVPixelBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRelease(lua_State *L)
{
    CVPixelBufferRelease(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRelease(lua_State *L)
{
    CVPixelBufferRelease(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCreateResolvedAttributesDictionary(lua_State *L)
{
    CVPixelBufferCreateResolvedAttributesDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCreateResolvedAttributesDictionary(lua_State *L)
{
    CVPixelBufferCreateResolvedAttributesDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCreate(lua_State *L)
{
    CVPixelBufferCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCreate(lua_State *L)
{
    CVPixelBufferCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRef(lua_State *L)
{
    CVPixelBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferReleaseBytesCallback(lua_State *L)
{
    CVPixelBufferReleaseBytesCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCreateWithBytes(lua_State *L)
{
    CVPixelBufferCreateWithBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferReleaseBytePointerCallback(lua_State *L)
{
    CVPixelBufferReleaseBytePointerCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCreateWithBytes(lua_State *L)
{
    CVPixelBufferCreateWithBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferReleaseBytesCallback(lua_State *L)
{
    CVPixelBufferReleaseBytesCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRef(lua_State *L)
{
    CVPixelBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferReleasePlanarBytesCallback(lua_State *L)
{
    CVPixelBufferReleasePlanarBytesCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCreateWithPlanarBytes(lua_State *L)
{
    CVPixelBufferCreateWithPlanarBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferReleaseBytePointerCallback(lua_State *L)
{
    CVPixelBufferReleaseBytePointerCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCreateWithPlanarBytes(lua_State *L)
{
    CVPixelBufferCreateWithPlanarBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferReleasePlanarBytesCallback(lua_State *L)
{
    CVPixelBufferReleasePlanarBytesCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRef(lua_State *L)
{
    CVPixelBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferLockBaseAddress(lua_State *L)
{
    CVPixelBufferLockBaseAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferLockFlags(lua_State *L)
{
    CVPixelBufferLockFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferLockBaseAddress(lua_State *L)
{
    CVPixelBufferLockBaseAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferUnlockBaseAddress(lua_State *L)
{
    CVPixelBufferUnlockBaseAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferLockFlags(lua_State *L)
{
    CVPixelBufferLockFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferUnlockBaseAddress(lua_State *L)
{
    CVPixelBufferUnlockBaseAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetWidth(lua_State *L)
{
    CVPixelBufferGetWidth(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetWidth(lua_State *L)
{
    CVPixelBufferGetWidth(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetHeight(lua_State *L)
{
    CVPixelBufferGetHeight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetHeight(lua_State *L)
{
    CVPixelBufferGetHeight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetPixelFormatType(lua_State *L)
{
    CVPixelBufferGetPixelFormatType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetPixelFormatType(lua_State *L)
{
    CVPixelBufferGetPixelFormatType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetBaseAddress(lua_State *L)
{
    CVPixelBufferGetBaseAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferLockBaseAddress(lua_State *L)
{
    CVPixelBufferLockBaseAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetBaseAddress(lua_State *L)
{
    CVPixelBufferGetBaseAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetBytesPerRow(lua_State *L)
{
    CVPixelBufferGetBytesPerRow(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetBytesPerRow(lua_State *L)
{
    CVPixelBufferGetBytesPerRow(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetDataSize(lua_State *L)
{
    CVPixelBufferGetDataSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCreateWithPlanarBytes(lua_State *L)
{
    CVPixelBufferCreateWithPlanarBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetDataSize(lua_State *L)
{
    CVPixelBufferGetDataSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferIsPlanar(lua_State *L)
{
    CVPixelBufferIsPlanar(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferCreateWithPlanarBytes(lua_State *L)
{
    CVPixelBufferCreateWithPlanarBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferIsPlanar(lua_State *L)
{
    CVPixelBufferIsPlanar(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetPlaneCount(lua_State *L)
{
    CVPixelBufferGetPlaneCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRefs(lua_State *L)
{
    CVPixelBufferRefs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetPlaneCount(lua_State *L)
{
    CVPixelBufferGetPlaneCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetWidthOfPlane(lua_State *L)
{
    CVPixelBufferGetWidthOfPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRefs(lua_State *L)
{
    CVPixelBufferRefs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetWidthOfPlane(lua_State *L)
{
    CVPixelBufferGetWidthOfPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetHeightOfPlane(lua_State *L)
{
    CVPixelBufferGetHeightOfPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRefs(lua_State *L)
{
    CVPixelBufferRefs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetHeightOfPlane(lua_State *L)
{
    CVPixelBufferGetHeightOfPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetBaseAddressOfPlane(lua_State *L)
{
    CVPixelBufferGetBaseAddressOfPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferLockBaseAddress(lua_State *L)
{
    CVPixelBufferLockBaseAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRefs(lua_State *L)
{
    CVPixelBufferRefs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetBaseAddressOfPlane(lua_State *L)
{
    CVPixelBufferGetBaseAddressOfPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetBytesPerRowOfPlane(lua_State *L)
{
    CVPixelBufferGetBytesPerRowOfPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferRefs(lua_State *L)
{
    CVPixelBufferRefs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetBytesPerRowOfPlane(lua_State *L)
{
    CVPixelBufferGetBytesPerRowOfPlane(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetExtendedPixels(lua_State *L)
{
    CVPixelBufferGetExtendedPixels(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferGetExtendedPixels(lua_State *L)
{
    CVPixelBufferGetExtendedPixels(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferFillExtendedPixels(lua_State *L)
{
    CVPixelBufferFillExtendedPixels(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferFillExtendedPixels(lua_State *L)
{
    CVPixelBufferFillExtendedPixels(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferIOSurface(lua_State *L)
{
    CVPixelBufferIOSurface(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCVPixelBufferAPIs[] = {
    {"CVPixelBuffers", lua_CVPixelBuffers},
    {"CVPixelBufferLockBaseAddress", lua_CVPixelBufferLockBaseAddress},
    {"CVPixelBufferLock_ReadOnly", lua_CVPixelBufferLock_ReadOnly},
    {"CVPixelBufferLockFlags", lua_CVPixelBufferLockFlags},
    {"CVPixelBufferLock_ReadOnly", lua_CVPixelBufferLock_ReadOnly},
    {"CVPixelBufferGetBaseAddressOfPlane", lua_CVPixelBufferGetBaseAddressOfPlane},
    {"CVPixelBufferGetBytesPerRowOfPlane", lua_CVPixelBufferGetBytesPerRowOfPlane},
    {"CVPixelBufferPixelFormatTypeKey", lua_CVPixelBufferPixelFormatTypeKey},
    {"CVPixelBufferMemoryAllocatorKey", lua_CVPixelBufferMemoryAllocatorKey},
    {"CVPixelBufferWidthKey", lua_CVPixelBufferWidthKey},
    {"CVPixelBufferHeightKey", lua_CVPixelBufferHeightKey},
    {"CVPixelBufferExtendedPixelsLeftKey", lua_CVPixelBufferExtendedPixelsLeftKey},
    {"CVPixelBufferExtendedPixelsTopKey", lua_CVPixelBufferExtendedPixelsTopKey},
    {"CVPixelBufferExtendedPixelsRightKey", lua_CVPixelBufferExtendedPixelsRightKey},
    {"CVPixelBufferExtendedPixelsBottomKey", lua_CVPixelBufferExtendedPixelsBottomKey},
    {"CVPixelBufferBytesPerRowAlignmentKey", lua_CVPixelBufferBytesPerRowAlignmentKey},
    {"CVPixelBufferCGBitmapContextCompatibilityKey", lua_CVPixelBufferCGBitmapContextCompatibilityKey},
    {"CVPixelBufferCGImageCompatibilityKey", lua_CVPixelBufferCGImageCompatibilityKey},
    {"CVPixelBufferOpenGLCompatibilityKey", lua_CVPixelBufferOpenGLCompatibilityKey},
    {"CVPixelBufferPlaneAlignmentKey", lua_CVPixelBufferPlaneAlignmentKey},
    {"CVPixelBufferIOSurfacePropertiesKey", lua_CVPixelBufferIOSurfacePropertiesKey},
    {"CVPixelBufferRef", lua_CVPixelBufferRef},
    {"CVPixelBufferRef", lua_CVPixelBufferRef},
    {"CVPixelBufferGetTypeID", lua_CVPixelBufferGetTypeID},
    {"CVPixelBufferRetain", lua_CVPixelBufferRetain},
    {"CVPixelBufferRef", lua_CVPixelBufferRef},
    {"CVPixelBufferRelease", lua_CVPixelBufferRelease},
    {"CVPixelBufferRelease", lua_CVPixelBufferRelease},
    {"CVPixelBufferCreateResolvedAttributesDictionary", lua_CVPixelBufferCreateResolvedAttributesDictionary},
    {"CVPixelBufferCreateResolvedAttributesDictionary", lua_CVPixelBufferCreateResolvedAttributesDictionary},
    {"CVPixelBufferCreate", lua_CVPixelBufferCreate},
    {"CVPixelBufferCreate", lua_CVPixelBufferCreate},
    {"CVPixelBufferRef", lua_CVPixelBufferRef},
    {"CVPixelBufferReleaseBytesCallback", lua_CVPixelBufferReleaseBytesCallback},
    {"CVPixelBufferCreateWithBytes", lua_CVPixelBufferCreateWithBytes},
    {"CVPixelBufferReleaseBytePointerCallback", lua_CVPixelBufferReleaseBytePointerCallback},
    {"CVPixelBufferCreateWithBytes", lua_CVPixelBufferCreateWithBytes},
    {"CVPixelBufferReleaseBytesCallback", lua_CVPixelBufferReleaseBytesCallback},
    {"CVPixelBufferRef", lua_CVPixelBufferRef},
    {"CVPixelBufferReleasePlanarBytesCallback", lua_CVPixelBufferReleasePlanarBytesCallback},
    {"CVPixelBufferCreateWithPlanarBytes", lua_CVPixelBufferCreateWithPlanarBytes},
    {"CVPixelBufferReleaseBytePointerCallback", lua_CVPixelBufferReleaseBytePointerCallback},
    {"CVPixelBufferCreateWithPlanarBytes", lua_CVPixelBufferCreateWithPlanarBytes},
    {"CVPixelBufferReleasePlanarBytesCallback", lua_CVPixelBufferReleasePlanarBytesCallback},
    {"CVPixelBufferRef", lua_CVPixelBufferRef},
    {"CVPixelBufferLockBaseAddress", lua_CVPixelBufferLockBaseAddress},
    {"CVPixelBufferLockFlags", lua_CVPixelBufferLockFlags},
    {"CVPixelBufferLockBaseAddress", lua_CVPixelBufferLockBaseAddress},
    {"CVPixelBufferUnlockBaseAddress", lua_CVPixelBufferUnlockBaseAddress},
    {"CVPixelBufferLockFlags", lua_CVPixelBufferLockFlags},
    {"CVPixelBufferUnlockBaseAddress", lua_CVPixelBufferUnlockBaseAddress},
    {"CVPixelBufferGetWidth", lua_CVPixelBufferGetWidth},
    {"CVPixelBufferGetWidth", lua_CVPixelBufferGetWidth},
    {"CVPixelBufferGetHeight", lua_CVPixelBufferGetHeight},
    {"CVPixelBufferGetHeight", lua_CVPixelBufferGetHeight},
    {"CVPixelBufferGetPixelFormatType", lua_CVPixelBufferGetPixelFormatType},
    {"CVPixelBufferGetPixelFormatType", lua_CVPixelBufferGetPixelFormatType},
    {"CVPixelBufferGetBaseAddress", lua_CVPixelBufferGetBaseAddress},
    {"CVPixelBufferLockBaseAddress", lua_CVPixelBufferLockBaseAddress},
    {"CVPixelBufferGetBaseAddress", lua_CVPixelBufferGetBaseAddress},
    {"CVPixelBufferGetBytesPerRow", lua_CVPixelBufferGetBytesPerRow},
    {"CVPixelBufferGetBytesPerRow", lua_CVPixelBufferGetBytesPerRow},
    {"CVPixelBufferGetDataSize", lua_CVPixelBufferGetDataSize},
    {"CVPixelBufferCreateWithPlanarBytes", lua_CVPixelBufferCreateWithPlanarBytes},
    {"CVPixelBufferGetDataSize", lua_CVPixelBufferGetDataSize},
    {"CVPixelBufferIsPlanar", lua_CVPixelBufferIsPlanar},
    {"CVPixelBufferCreateWithPlanarBytes", lua_CVPixelBufferCreateWithPlanarBytes},
    {"CVPixelBufferIsPlanar", lua_CVPixelBufferIsPlanar},
    {"CVPixelBufferGetPlaneCount", lua_CVPixelBufferGetPlaneCount},
    {"CVPixelBufferRefs", lua_CVPixelBufferRefs},
    {"CVPixelBufferGetPlaneCount", lua_CVPixelBufferGetPlaneCount},
    {"CVPixelBufferGetWidthOfPlane", lua_CVPixelBufferGetWidthOfPlane},
    {"CVPixelBufferRefs", lua_CVPixelBufferRefs},
    {"CVPixelBufferGetWidthOfPlane", lua_CVPixelBufferGetWidthOfPlane},
    {"CVPixelBufferGetHeightOfPlane", lua_CVPixelBufferGetHeightOfPlane},
    {"CVPixelBufferRefs", lua_CVPixelBufferRefs},
    {"CVPixelBufferGetHeightOfPlane", lua_CVPixelBufferGetHeightOfPlane},
    {"CVPixelBufferGetBaseAddressOfPlane", lua_CVPixelBufferGetBaseAddressOfPlane},
    {"CVPixelBufferLockBaseAddress", lua_CVPixelBufferLockBaseAddress},
    {"CVPixelBufferRefs", lua_CVPixelBufferRefs},
    {"CVPixelBufferGetBaseAddressOfPlane", lua_CVPixelBufferGetBaseAddressOfPlane},
    {"CVPixelBufferGetBytesPerRowOfPlane", lua_CVPixelBufferGetBytesPerRowOfPlane},
    {"CVPixelBufferRefs", lua_CVPixelBufferRefs},
    {"CVPixelBufferGetBytesPerRowOfPlane", lua_CVPixelBufferGetBytesPerRowOfPlane},
    {"CVPixelBufferGetExtendedPixels", lua_CVPixelBufferGetExtendedPixels},
    {"CVPixelBufferGetExtendedPixels", lua_CVPixelBufferGetExtendedPixels},
    {"CVPixelBufferFillExtendedPixels", lua_CVPixelBufferFillExtendedPixels},
    {"CVPixelBufferFillExtendedPixels", lua_CVPixelBufferFillExtendedPixels},
    {"CVPixelBufferIOSurface", lua_CVPixelBufferIOSurface},
    {NULL, NULL},
};

int LuaOpenCVPixelBuffer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCVPixelBufferAPIs);
    return 0;
}
