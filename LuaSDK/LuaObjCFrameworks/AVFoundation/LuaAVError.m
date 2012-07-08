//
//  LuaAVError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVErrorDeviceKey(lua_State *L)
{
    AVErrorDeviceKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorTimeKey(lua_State *L)
{
    AVErrorTimeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorFileSizeKey(lua_State *L)
{
    AVErrorFileSizeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorPIDKey(lua_State *L)
{
    AVErrorPIDKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorRecordingSuccessfullyFinishedKey(lua_State *L)
{
    AVErrorRecordingSuccessfullyFinishedKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorMediaTypeKey(lua_State *L)
{
    AVErrorMediaTypeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorMediaSubTypeKey(lua_State *L)
{
    AVErrorMediaSubTypeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDiscontinuityFlagsKey(lua_State *L)
{
    AVErrorDiscontinuityFlagsKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorUnknown(lua_State *L)
{
    AVErrorUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorOutOfMemory(lua_State *L)
{
    AVErrorOutOfMemory(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorSessionNotRunning(lua_State *L)
{
    AVErrorSessionNotRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDeviceAlreadyUsedByAnotherSession(lua_State *L)
{
    AVErrorDeviceAlreadyUsedByAnotherSession(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorNoDataCaptured(lua_State *L)
{
    AVErrorNoDataCaptured(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorSessionConfigurationChanged(lua_State *L)
{
    AVErrorSessionConfigurationChanged(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDiskFull(lua_State *L)
{
    AVErrorDiskFull(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDeviceWasDisconnected(lua_State *L)
{
    AVErrorDeviceWasDisconnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorMediaChanged(lua_State *L)
{
    AVErrorMediaChanged(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorMaximumDurationReached(lua_State *L)
{
    AVErrorMaximumDurationReached(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorMaximumFileSizeReached(lua_State *L)
{
    AVErrorMaximumFileSizeReached(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorMediaDiscontinuity(lua_State *L)
{
    AVErrorMediaDiscontinuity(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorMaximumNumberOfSamplesForFileFormatReached(lua_State *L)
{
    AVErrorMaximumNumberOfSamplesForFileFormatReached(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDeviceNotConnected(lua_State *L)
{
    AVErrorDeviceNotConnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDeviceInUseByAnotherApplication(lua_State *L)
{
    AVErrorDeviceInUseByAnotherApplication(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDeviceLockedForConfigurationByAnotherProcess(lua_State *L)
{
    AVErrorDeviceLockedForConfigurationByAnotherProcess(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorSessionWasInterrupted(lua_State *L)
{
    AVErrorSessionWasInterrupted(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorMediaServicesWereReset(lua_State *L)
{
    AVErrorMediaServicesWereReset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorExportFailed(lua_State *L)
{
    AVErrorExportFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDecodeFailed(lua_State *L)
{
    AVErrorDecodeFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorInvalidSourceMedia(lua_State *L)
{
    AVErrorInvalidSourceMedia(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorFileAlreadyExists(lua_State *L)
{
    AVErrorFileAlreadyExists(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorCompositionTrackSegmentsNotContiguous(lua_State *L)
{
    AVErrorCompositionTrackSegmentsNotContiguous(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorInvalidCompositionTrackSegmentDuration(lua_State *L)
{
    AVErrorInvalidCompositionTrackSegmentDuration(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorInvalidCompositionTrackSegmentSourceStartTime(lua_State *L)
{
    AVErrorInvalidCompositionTrackSegmentSourceStartTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorInvalidCompositionTrackSegmentSourceDuration(lua_State *L)
{
    AVErrorInvalidCompositionTrackSegmentSourceDuration(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorFileFormatNotRecognized(lua_State *L)
{
    AVErrorFileFormatNotRecognized(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorFileFailedToParse(lua_State *L)
{
    AVErrorFileFailedToParse(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorMaximumStillImageCaptureRequestsExceeded(lua_State *L)
{
    AVErrorMaximumStillImageCaptureRequestsExceeded(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorContentIsProtected(lua_State *L)
{
    AVErrorContentIsProtected(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorNoImageAtTime(lua_State *L)
{
    AVErrorNoImageAtTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDecoderNotFound(lua_State *L)
{
    AVErrorDecoderNotFound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorEncoderNotFound(lua_State *L)
{
    AVErrorEncoderNotFound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorContentIsNotAuthorized(lua_State *L)
{
    AVErrorContentIsNotAuthorized(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorApplicationIsNotAuthorized(lua_State *L)
{
    AVErrorApplicationIsNotAuthorized(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDeviceIsNotAvailableInBackground(lua_State *L)
{
    AVErrorDeviceIsNotAvailableInBackground(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorOperationNotSupportedForAsset(lua_State *L)
{
    AVErrorOperationNotSupportedForAsset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorDecoderTemporarilyUnavailable(lua_State *L)
{
    AVErrorDecoderTemporarilyUnavailable(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorEncoderTemporarilyUnavailable(lua_State *L)
{
    AVErrorEncoderTemporarilyUnavailable(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorInvalidVideoComposition(lua_State *L)
{
    AVErrorInvalidVideoComposition(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorReferenceForbiddenByReferencePolicy(lua_State *L)
{
    AVErrorReferenceForbiddenByReferencePolicy(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVErrorInvalidOutputURLPathExtension(lua_State *L)
{
    AVErrorInvalidOutputURLPathExtension(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVErrorAPIs[] = {
    {"AVErrorDeviceKey", lua_AVErrorDeviceKey},
    {"AVErrorTimeKey", lua_AVErrorTimeKey},
    {"AVErrorFileSizeKey", lua_AVErrorFileSizeKey},
    {"AVErrorPIDKey", lua_AVErrorPIDKey},
    {"AVErrorRecordingSuccessfullyFinishedKey", lua_AVErrorRecordingSuccessfullyFinishedKey},
    {"AVErrorMediaTypeKey", lua_AVErrorMediaTypeKey},
    {"AVErrorMediaSubTypeKey", lua_AVErrorMediaSubTypeKey},
    {"AVErrorDiscontinuityFlagsKey", lua_AVErrorDiscontinuityFlagsKey},
    {"AVErrorUnknown", lua_AVErrorUnknown},
    {"AVErrorOutOfMemory", lua_AVErrorOutOfMemory},
    {"AVErrorSessionNotRunning", lua_AVErrorSessionNotRunning},
    {"AVErrorDeviceAlreadyUsedByAnotherSession", lua_AVErrorDeviceAlreadyUsedByAnotherSession},
    {"AVErrorNoDataCaptured", lua_AVErrorNoDataCaptured},
    {"AVErrorSessionConfigurationChanged", lua_AVErrorSessionConfigurationChanged},
    {"AVErrorDiskFull", lua_AVErrorDiskFull},
    {"AVErrorDeviceWasDisconnected", lua_AVErrorDeviceWasDisconnected},
    {"AVErrorMediaChanged", lua_AVErrorMediaChanged},
    {"AVErrorMaximumDurationReached", lua_AVErrorMaximumDurationReached},
    {"AVErrorMaximumFileSizeReached", lua_AVErrorMaximumFileSizeReached},
    {"AVErrorMediaDiscontinuity", lua_AVErrorMediaDiscontinuity},
    {"AVErrorMaximumNumberOfSamplesForFileFormatReached", lua_AVErrorMaximumNumberOfSamplesForFileFormatReached},
    {"AVErrorDeviceNotConnected", lua_AVErrorDeviceNotConnected},
    {"AVErrorDeviceInUseByAnotherApplication", lua_AVErrorDeviceInUseByAnotherApplication},
    {"AVErrorDeviceLockedForConfigurationByAnotherProcess", lua_AVErrorDeviceLockedForConfigurationByAnotherProcess},
    {"AVErrorSessionWasInterrupted", lua_AVErrorSessionWasInterrupted},
    {"AVErrorMediaServicesWereReset", lua_AVErrorMediaServicesWereReset},
    {"AVErrorExportFailed", lua_AVErrorExportFailed},
    {"AVErrorDecodeFailed", lua_AVErrorDecodeFailed},
    {"AVErrorInvalidSourceMedia", lua_AVErrorInvalidSourceMedia},
    {"AVErrorFileAlreadyExists", lua_AVErrorFileAlreadyExists},
    {"AVErrorCompositionTrackSegmentsNotContiguous", lua_AVErrorCompositionTrackSegmentsNotContiguous},
    {"AVErrorInvalidCompositionTrackSegmentDuration", lua_AVErrorInvalidCompositionTrackSegmentDuration},
    {"AVErrorInvalidCompositionTrackSegmentSourceStartTime", lua_AVErrorInvalidCompositionTrackSegmentSourceStartTime},
    {"AVErrorInvalidCompositionTrackSegmentSourceDuration", lua_AVErrorInvalidCompositionTrackSegmentSourceDuration},
    {"AVErrorFileFormatNotRecognized", lua_AVErrorFileFormatNotRecognized},
    {"AVErrorFileFailedToParse", lua_AVErrorFileFailedToParse},
    {"AVErrorMaximumStillImageCaptureRequestsExceeded", lua_AVErrorMaximumStillImageCaptureRequestsExceeded},
    {"AVErrorContentIsProtected", lua_AVErrorContentIsProtected},
    {"AVErrorNoImageAtTime", lua_AVErrorNoImageAtTime},
    {"AVErrorDecoderNotFound", lua_AVErrorDecoderNotFound},
    {"AVErrorEncoderNotFound", lua_AVErrorEncoderNotFound},
    {"AVErrorContentIsNotAuthorized", lua_AVErrorContentIsNotAuthorized},
    {"AVErrorApplicationIsNotAuthorized", lua_AVErrorApplicationIsNotAuthorized},
    {"AVErrorDeviceIsNotAvailableInBackground", lua_AVErrorDeviceIsNotAvailableInBackground},
    {"AVErrorOperationNotSupportedForAsset", lua_AVErrorOperationNotSupportedForAsset},
    {"AVErrorDecoderTemporarilyUnavailable", lua_AVErrorDecoderTemporarilyUnavailable},
    {"AVErrorEncoderTemporarilyUnavailable", lua_AVErrorEncoderTemporarilyUnavailable},
    {"AVErrorInvalidVideoComposition", lua_AVErrorInvalidVideoComposition},
    {"AVErrorReferenceForbiddenByReferencePolicy", lua_AVErrorReferenceForbiddenByReferencePolicy},
    {"AVErrorInvalidOutputURLPathExtension", lua_AVErrorInvalidOutputURLPathExtension},
    {NULL, NULL},
};

int LuaOpenAVError(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVErrorAPIs);
    return 0;
}
