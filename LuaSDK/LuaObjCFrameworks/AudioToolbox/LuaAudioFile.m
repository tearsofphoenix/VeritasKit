//
//  LuaAudioFile.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioFile.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AudioFile_h__(lua_State *L)
{
    AudioFile_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_h__(lua_State *L)
{
    AudioFile_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileAIFFType(lua_State *L)
{
    AudioFileAIFFType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileAIFCType(lua_State *L)
{
    AudioFileAIFCType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileWAVEType(lua_State *L)
{
    AudioFileWAVEType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileSoundDesigner2Type(lua_State *L)
{
    AudioFileSoundDesigner2Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileNextType(lua_State *L)
{
    AudioFileNextType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMP3Type(lua_State *L)
{
    AudioFileMP3Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMP2Type(lua_State *L)
{
    AudioFileMP2Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMP1Type(lua_State *L)
{
    AudioFileMP1Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileAC3Type(lua_State *L)
{
    AudioFileAC3Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileAAC_ADTSType(lua_State *L)
{
    AudioFileAAC_ADTSType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMPEG4Type(lua_State *L)
{
    AudioFileMPEG4Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileM4AType(lua_State *L)
{
    AudioFileM4AType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCAFType(lua_State *L)
{
    AudioFileCAFType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileAIFFType(lua_State *L)
{
    AudioFileAIFFType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileAIFCType(lua_State *L)
{
    AudioFileAIFCType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileWAVEType(lua_State *L)
{
    AudioFileWAVEType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileSoundDesigner2Type(lua_State *L)
{
    AudioFileSoundDesigner2Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileNextType(lua_State *L)
{
    AudioFileNextType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMP3Type(lua_State *L)
{
    AudioFileMP3Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMP2Type(lua_State *L)
{
    AudioFileMP2Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMP1Type(lua_State *L)
{
    AudioFileMP1Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileAC3Type(lua_State *L)
{
    AudioFileAC3Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileAAC_ADTSType(lua_State *L)
{
    AudioFileAAC_ADTSType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMPEG4Type(lua_State *L)
{
    AudioFileMPEG4Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileM4AType(lua_State *L)
{
    AudioFileM4AType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCAFType(lua_State *L)
{
    AudioFileCAFType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile3GPType(lua_State *L)
{
    AudioFile3GPType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile3GP2Type(lua_State *L)
{
    AudioFile3GP2Type(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileAMRType(lua_State *L)
{
    AudioFileAMRType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileUnspecifiedError(lua_State *L)
{
    AudioFileUnspecifiedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileUnsupportedFileTypeError(lua_State *L)
{
    AudioFileUnsupportedFileTypeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileUnsupportedDataFormatError(lua_State *L)
{
    AudioFileUnsupportedDataFormatError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileUnsupportedPropertyError(lua_State *L)
{
    AudioFileUnsupportedPropertyError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileBadPropertySizeError(lua_State *L)
{
    AudioFileBadPropertySizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePermissionsError(lua_State *L)
{
    AudioFilePermissionsError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileReadPermission(lua_State *L)
{
    AudioFileReadPermission(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileNotOptimizedError(lua_State *L)
{
    AudioFileNotOptimizedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInvalidChunkError(lua_State *L)
{
    AudioFileInvalidChunkError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileDoesNotAllow64BitDataSizeError(lua_State *L)
{
    AudioFileDoesNotAllow64BitDataSizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInvalidPacketOffsetError(lua_State *L)
{
    AudioFileInvalidPacketOffsetError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInvalidFileError(lua_State *L)
{
    AudioFileInvalidFileError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOperationNotSupportedError(lua_State *L)
{
    AudioFileOperationNotSupportedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyAudioDataByteCount(lua_State *L)
{
    AudioFilePropertyAudioDataByteCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileNotOpenError(lua_State *L)
{
    AudioFileNotOpenError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileEndOfFileError(lua_State *L)
{
    AudioFileEndOfFileError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePositionError(lua_State *L)
{
    AudioFilePositionError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileFileNotFoundError(lua_State *L)
{
    AudioFileFileNotFoundError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileUnspecifiedError(lua_State *L)
{
    AudioFileUnspecifiedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileUnsupportedFileTypeError(lua_State *L)
{
    AudioFileUnsupportedFileTypeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileUnsupportedDataFormatError(lua_State *L)
{
    AudioFileUnsupportedDataFormatError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileUnsupportedPropertyError(lua_State *L)
{
    AudioFileUnsupportedPropertyError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileBadPropertySizeError(lua_State *L)
{
    AudioFileBadPropertySizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePermissionsError(lua_State *L)
{
    AudioFilePermissionsError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileNotOptimizedError(lua_State *L)
{
    AudioFileNotOptimizedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInvalidChunkError(lua_State *L)
{
    AudioFileInvalidChunkError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileDoesNotAllow64BitDataSizeError(lua_State *L)
{
    AudioFileDoesNotAllow64BitDataSizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInvalidPacketOffsetError(lua_State *L)
{
    AudioFileInvalidPacketOffsetError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInvalidFileError(lua_State *L)
{
    AudioFileInvalidFileError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOperationNotSupportedError(lua_State *L)
{
    AudioFileOperationNotSupportedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileNotOpenError(lua_State *L)
{
    AudioFileNotOpenError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileEndOfFileError(lua_State *L)
{
    AudioFileEndOfFileError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePositionError(lua_State *L)
{
    AudioFilePositionError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileFileNotFoundError(lua_State *L)
{
    AudioFileFileNotFoundError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCreateWithURL(lua_State *L)
{
    AudioFileCreateWithURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileFlags_EraseFile(lua_State *L)
{
    AudioFileFlags_EraseFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileFlags_DontPageAlignAudioData(lua_State *L)
{
    AudioFileFlags_DontPageAlignAudioData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileFlags_EraseFile(lua_State *L)
{
    AudioFileFlags_EraseFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileFlags_DontPageAlignAudioData(lua_State *L)
{
    AudioFileFlags_DontPageAlignAudioData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileReadPermission(lua_State *L)
{
    AudioFileReadPermission(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileWritePermission(lua_State *L)
{
    AudioFileWritePermission(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileReadWritePermission(lua_State *L)
{
    AudioFileReadWritePermission(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyID(lua_State *L)
{
    AudioFilePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyID(lua_State *L)
{
    AudioFilePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileLoopDirection(lua_State *L)
{
    AudioFileLoopDirection(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileLoopDirection_NoLooping(lua_State *L)
{
    AudioFileLoopDirection_NoLooping(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileLoopDirection_Forward(lua_State *L)
{
    AudioFileLoopDirection_Forward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileLoopDirection_Backward(lua_State *L)
{
    AudioFileLoopDirection_Backward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileLoopDirection_ForwardAndBackward(lua_State *L)
{
    AudioFileLoopDirection_ForwardAndBackward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileLoopDirection_NoLooping(lua_State *L)
{
    AudioFileLoopDirection_NoLooping(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileLoopDirection_Forward(lua_State *L)
{
    AudioFileLoopDirection_Forward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileLoopDirection_ForwardAndBackward(lua_State *L)
{
    AudioFileLoopDirection_ForwardAndBackward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileLoopDirection_Backward(lua_State *L)
{
    AudioFileLoopDirection_Backward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_SMPTE_Time(lua_State *L)
{
    AudioFile_SMPTE_Time(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_SMPTE_Time(lua_State *L)
{
    AudioFile_SMPTE_Time(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_SMPTE_Time(lua_State *L)
{
    AudioFile_SMPTE_Time(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkerType(lua_State *L)
{
    AudioFileMarkerType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarker(lua_State *L)
{
    AudioFileMarker(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkerType_Generic(lua_State *L)
{
    AudioFileMarkerType_Generic(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkerType_Generic(lua_State *L)
{
    AudioFileMarkerType_Generic(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarker(lua_State *L)
{
    AudioFileMarker(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarker(lua_State *L)
{
    AudioFileMarker(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_SMPTE_Time(lua_State *L)
{
    AudioFile_SMPTE_Time(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarker(lua_State *L)
{
    AudioFileMarker(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkerList(lua_State *L)
{
    AudioFileMarkerList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkerList(lua_State *L)
{
    AudioFileMarkerList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarker(lua_State *L)
{
    AudioFileMarker(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkerList(lua_State *L)
{
    AudioFileMarkerList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkers(lua_State *L)
{
    AudioFileMarkers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkers(lua_State *L)
{
    AudioFileMarkers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyMarkerList(lua_State *L)
{
    AudioFilePropertyMarkerList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkers(lua_State *L)
{
    AudioFileMarkers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkers(lua_State *L)
{
    AudioFileMarkers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkerList(lua_State *L)
{
    AudioFileMarkerList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkersToNumBytes(lua_State *L)
{
    AudioFileMarkersToNumBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkers(lua_State *L)
{
    AudioFileMarkers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyMarkerList(lua_State *L)
{
    AudioFilePropertyMarkerList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkers(lua_State *L)
{
    AudioFileMarkers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkers(lua_State *L)
{
    AudioFileMarkers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkers(lua_State *L)
{
    AudioFileMarkers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkersToNumBytes(lua_State *L)
{
    AudioFileMarkersToNumBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkerList(lua_State *L)
{
    AudioFileMarkerList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlags(lua_State *L)
{
    AudioFileRegionFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegion(lua_State *L)
{
    AudioFileRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlag_LoopEnable(lua_State *L)
{
    AudioFileRegionFlag_LoopEnable(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlag_PlayForward(lua_State *L)
{
    AudioFileRegionFlag_PlayForward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlag_PlayForward(lua_State *L)
{
    AudioFileRegionFlag_PlayForward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlag_LoopEnable(lua_State *L)
{
    AudioFileRegionFlag_LoopEnable(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlag_PlayForward(lua_State *L)
{
    AudioFileRegionFlag_PlayForward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlag_PlayBackward(lua_State *L)
{
    AudioFileRegionFlag_PlayBackward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlag_LoopEnable(lua_State *L)
{
    AudioFileRegionFlag_LoopEnable(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlag_PlayForward(lua_State *L)
{
    AudioFileRegionFlag_PlayForward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlag_PlayBackward(lua_State *L)
{
    AudioFileRegionFlag_PlayBackward(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegion(lua_State *L)
{
    AudioFileRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegion(lua_State *L)
{
    AudioFileRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionFlags(lua_State *L)
{
    AudioFileRegionFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkers(lua_State *L)
{
    AudioFileMarkers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegion(lua_State *L)
{
    AudioFileRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarker(lua_State *L)
{
    AudioFileMarker(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegion(lua_State *L)
{
    AudioFileRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionList(lua_State *L)
{
    AudioFileRegionList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegions(lua_State *L)
{
    AudioFileRegions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyRegionList(lua_State *L)
{
    AudioFilePropertyRegionList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegions(lua_State *L)
{
    AudioFileRegions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegion(lua_State *L)
{
    AudioFileRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionList(lua_State *L)
{
    AudioFileRegionList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegion(lua_State *L)
{
    AudioFileRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegionList(lua_State *L)
{
    AudioFileRegionList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegion(lua_State *L)
{
    AudioFileRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegions(lua_State *L)
{
    AudioFileRegions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegion(lua_State *L)
{
    AudioFileRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegion(lua_State *L)
{
    AudioFileRegion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyPacketToFrame(lua_State *L)
{
    AudioFilePropertyPacketToFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyPacketToFrame(lua_State *L)
{
    AudioFilePropertyPacketToFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileByteToPacket(lua_State *L)
{
    AudioFileByteToPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileByteToPacket(lua_State *L)
{
    AudioFileByteToPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePacketTableInfo(lua_State *L)
{
    AudioFilePacketTableInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePacketTableInfo(lua_State *L)
{
    AudioFilePacketTableInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePacketTableInfo(lua_State *L)
{
    AudioFilePacketTableInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCreateWithURL(lua_State *L)
{
    AudioFileCreateWithURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileFlags_EraseFile(lua_State *L)
{
    AudioFileFlags_EraseFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCreateWithURL(lua_State *L)
{
    AudioFileCreateWithURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpenURL(lua_State *L)
{
    AudioFileOpenURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpenURL(lua_State *L)
{
    AudioFileOpenURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_ReadProc(lua_State *L)
{
    AudioFile_ReadProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpenWithCallbacks(lua_State *L)
{
    AudioFileOpenWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileXXXWithCallbacks(lua_State *L)
{
    AudioFileXXXWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_ReadProc(lua_State *L)
{
    AudioFile_ReadProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_WriteProc(lua_State *L)
{
    AudioFile_WriteProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpenWithCallbacks(lua_State *L)
{
    AudioFileOpenWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileXXXWithCallbacks(lua_State *L)
{
    AudioFileXXXWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_WriteProc(lua_State *L)
{
    AudioFile_WriteProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_GetSizeProc(lua_State *L)
{
    AudioFile_GetSizeProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpenWithCallbacks(lua_State *L)
{
    AudioFileOpenWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileXXXWithCallbacks(lua_State *L)
{
    AudioFileXXXWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_GetSizeProc(lua_State *L)
{
    AudioFile_GetSizeProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_SetSizeProc(lua_State *L)
{
    AudioFile_SetSizeProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpenWithCallbacks(lua_State *L)
{
    AudioFileOpenWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileXXXWithCallbacks(lua_State *L)
{
    AudioFileXXXWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_SetSizeProc(lua_State *L)
{
    AudioFile_SetSizeProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInitializeWithCallbacks(lua_State *L)
{
    AudioFileInitializeWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInitializeWithCallbacks(lua_State *L)
{
    AudioFileInitializeWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_ReadProc(lua_State *L)
{
    AudioFile_ReadProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_WriteProc(lua_State *L)
{
    AudioFile_WriteProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_GetSizeProc(lua_State *L)
{
    AudioFile_GetSizeProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_SetSizeProc(lua_State *L)
{
    AudioFile_SetSizeProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpenWithCallbacks(lua_State *L)
{
    AudioFileOpenWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpenWithCallbacks(lua_State *L)
{
    AudioFileOpenWithCallbacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_ReadProc(lua_State *L)
{
    AudioFile_ReadProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_WriteProc(lua_State *L)
{
    AudioFile_WriteProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_GetSizeProc(lua_State *L)
{
    AudioFile_GetSizeProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFile_SetSizeProc(lua_State *L)
{
    AudioFile_SetSizeProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileClose(lua_State *L)
{
    AudioFileClose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileClose(lua_State *L)
{
    AudioFileClose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOptimize(lua_State *L)
{
    AudioFileOptimize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyIsOptimized(lua_State *L)
{
    AudioFilePropertyIsOptimized(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOptimize(lua_State *L)
{
    AudioFileOptimize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileReadBytes(lua_State *L)
{
    AudioFileReadBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileEndOfFileError(lua_State *L)
{
    AudioFileEndOfFileError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileReadBytes(lua_State *L)
{
    AudioFileReadBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileWriteBytes(lua_State *L)
{
    AudioFileWriteBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileWriteBytes(lua_State *L)
{
    AudioFileWriteBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileReadPacketData(lua_State *L)
{
    AudioFileReadPacketData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileEndOfFileError(lua_State *L)
{
    AudioFileEndOfFileError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileReadPacketData(lua_State *L)
{
    AudioFileReadPacketData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileReadPackets(lua_State *L)
{
    AudioFileReadPackets(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileReadPackets(lua_State *L)
{
    AudioFileReadPackets(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileWritePackets(lua_State *L)
{
    AudioFileWritePackets(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileWritePackets(lua_State *L)
{
    AudioFileWritePackets(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCountUserData(lua_State *L)
{
    AudioFileCountUserData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCountUserData(lua_State *L)
{
    AudioFileCountUserData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetUserDataSize(lua_State *L)
{
    AudioFileGetUserDataSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetUserDataSize(lua_State *L)
{
    AudioFileGetUserDataSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetUserData(lua_State *L)
{
    AudioFileGetUserData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetUserData(lua_State *L)
{
    AudioFileGetUserData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileSetUserData(lua_State *L)
{
    AudioFileSetUserData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileSetUserData(lua_State *L)
{
    AudioFileSetUserData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRemoveUserData(lua_State *L)
{
    AudioFileRemoveUserData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRemoveUserData(lua_State *L)
{
    AudioFileRemoveUserData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyFileFormat(lua_State *L)
{
    AudioFilePropertyFileFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyDataFormat(lua_State *L)
{
    AudioFilePropertyDataFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyFormatList(lua_State *L)
{
    AudioFilePropertyFormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyDataFormat(lua_State *L)
{
    AudioFilePropertyDataFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyIsOptimized(lua_State *L)
{
    AudioFilePropertyIsOptimized(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyMagicCookieData(lua_State *L)
{
    AudioFilePropertyMagicCookieData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileWriteBytes(lua_State *L)
{
    AudioFileWriteBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyAudioDataByteCount(lua_State *L)
{
    AudioFilePropertyAudioDataByteCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyAudioDataPacketCount(lua_State *L)
{
    AudioFilePropertyAudioDataPacketCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyMaximumPacketSize(lua_State *L)
{
    AudioFilePropertyMaximumPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyDataOffset(lua_State *L)
{
    AudioFilePropertyDataOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyChannelLayout(lua_State *L)
{
    AudioFilePropertyChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyDeferSizeUpdates(lua_State *L)
{
    AudioFilePropertyDeferSizeUpdates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyDataFormatName(lua_State *L)
{
    AudioFilePropertyDataFormatName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyMarkerList(lua_State *L)
{
    AudioFilePropertyMarkerList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileMarkerList(lua_State *L)
{
    AudioFileMarkerList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyRegionList(lua_State *L)
{
    AudioFilePropertyRegionList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileRegions(lua_State *L)
{
    AudioFileRegions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyPacketToFrame(lua_State *L)
{
    AudioFilePropertyPacketToFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyFrameToPacket(lua_State *L)
{
    AudioFilePropertyFrameToPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyPacketToByte(lua_State *L)
{
    AudioFilePropertyPacketToByte(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyByteToPacket(lua_State *L)
{
    AudioFilePropertyByteToPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyChunkIDs(lua_State *L)
{
    AudioFilePropertyChunkIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyInfoDictionary(lua_State *L)
{
    AudioFilePropertyInfoDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileComponents(lua_State *L)
{
    AudioFileComponents(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyPacketTableInfo(lua_State *L)
{
    AudioFilePropertyPacketTableInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePacketTableInfo(lua_State *L)
{
    AudioFilePacketTableInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyPacketSizeUpperBound(lua_State *L)
{
    AudioFilePropertyPacketSizeUpperBound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyMaximumPacketSize(lua_State *L)
{
    AudioFilePropertyMaximumPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyReserveDuration(lua_State *L)
{
    AudioFilePropertyReserveDuration(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyEstimatedDuration(lua_State *L)
{
    AudioFilePropertyEstimatedDuration(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyBitRate(lua_State *L)
{
    AudioFilePropertyBitRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyID3Tag(lua_State *L)
{
    AudioFilePropertyID3Tag(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileWritePackets(lua_State *L)
{
    AudioFileWritePackets(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertySourceBitDepth(lua_State *L)
{
    AudioFilePropertySourceBitDepth(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyAlbumArtwork(lua_State *L)
{
    AudioFilePropertyAlbumArtwork(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyFileFormat(lua_State *L)
{
    AudioFilePropertyFileFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyDataFormat(lua_State *L)
{
    AudioFilePropertyDataFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyIsOptimized(lua_State *L)
{
    AudioFilePropertyIsOptimized(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyMagicCookieData(lua_State *L)
{
    AudioFilePropertyMagicCookieData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyAudioDataByteCount(lua_State *L)
{
    AudioFilePropertyAudioDataByteCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyAudioDataPacketCount(lua_State *L)
{
    AudioFilePropertyAudioDataPacketCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyMaximumPacketSize(lua_State *L)
{
    AudioFilePropertyMaximumPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyDataOffset(lua_State *L)
{
    AudioFilePropertyDataOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyChannelLayout(lua_State *L)
{
    AudioFilePropertyChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyDeferSizeUpdates(lua_State *L)
{
    AudioFilePropertyDeferSizeUpdates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyDataFormatName(lua_State *L)
{
    AudioFilePropertyDataFormatName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyMarkerList(lua_State *L)
{
    AudioFilePropertyMarkerList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyRegionList(lua_State *L)
{
    AudioFilePropertyRegionList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyPacketToFrame(lua_State *L)
{
    AudioFilePropertyPacketToFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyFrameToPacket(lua_State *L)
{
    AudioFilePropertyFrameToPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyPacketToByte(lua_State *L)
{
    AudioFilePropertyPacketToByte(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyByteToPacket(lua_State *L)
{
    AudioFilePropertyByteToPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyChunkIDs(lua_State *L)
{
    AudioFilePropertyChunkIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyInfoDictionary(lua_State *L)
{
    AudioFilePropertyInfoDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyPacketTableInfo(lua_State *L)
{
    AudioFilePropertyPacketTableInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyFormatList(lua_State *L)
{
    AudioFilePropertyFormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyPacketSizeUpperBound(lua_State *L)
{
    AudioFilePropertyPacketSizeUpperBound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyReserveDuration(lua_State *L)
{
    AudioFilePropertyReserveDuration(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyEstimatedDuration(lua_State *L)
{
    AudioFilePropertyEstimatedDuration(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyBitRate(lua_State *L)
{
    AudioFilePropertyBitRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyID3Tag(lua_State *L)
{
    AudioFilePropertyID3Tag(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertySourceBitDepth(lua_State *L)
{
    AudioFilePropertySourceBitDepth(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyAlbumArtwork(lua_State *L)
{
    AudioFilePropertyAlbumArtwork(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetPropertyInfo(lua_State *L)
{
    AudioFileGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileProperty(lua_State *L)
{
    AudioFileProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetPropertyInfo(lua_State *L)
{
    AudioFileGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyID(lua_State *L)
{
    AudioFilePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetProperty(lua_State *L)
{
    AudioFileGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileProperty(lua_State *L)
{
    AudioFileProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetProperty(lua_State *L)
{
    AudioFileGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyID(lua_State *L)
{
    AudioFilePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileSetProperty(lua_State *L)
{
    AudioFileSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileProperty(lua_State *L)
{
    AudioFileProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileSetProperty(lua_State *L)
{
    AudioFileSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFilePropertyID(lua_State *L)
{
    AudioFilePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetGlobalInfo(lua_State *L)
{
    AudioFileGetGlobalInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_ReadableTypes(lua_State *L)
{
    AudioFileGlobalInfo_ReadableTypes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_WritableTypes(lua_State *L)
{
    AudioFileGlobalInfo_WritableTypes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_FileTypeName(lua_State *L)
{
    AudioFileGlobalInfo_FileTypeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AvailableFormatIDs(lua_State *L)
{
    AudioFileGlobalInfo_AvailableFormatIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AvailableStreamDescriptionsForFormat(lua_State *L)
{
    AudioFileGlobalInfo_AvailableStreamDescriptionsForFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeAndFormatID(lua_State *L)
{
    AudioFileTypeAndFormatID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AllExtensions(lua_State *L)
{
    AudioFileGlobalInfo_AllExtensions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AllHFSTypeCodes(lua_State *L)
{
    AudioFileGlobalInfo_AllHFSTypeCodes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AllUTIs(lua_State *L)
{
    AudioFileGlobalInfo_AllUTIs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AllMIMETypes(lua_State *L)
{
    AudioFileGlobalInfo_AllMIMETypes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_ExtensionsForType(lua_State *L)
{
    AudioFileGlobalInfo_ExtensionsForType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_HFSTypeCodesForType(lua_State *L)
{
    AudioFileGlobalInfo_HFSTypeCodesForType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_UTIsForType(lua_State *L)
{
    AudioFileGlobalInfo_UTIsForType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_MIMETypesForType(lua_State *L)
{
    AudioFileGlobalInfo_MIMETypesForType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_TypesForExtension(lua_State *L)
{
    AudioFileGlobalInfo_TypesForExtension(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeIDs(lua_State *L)
{
    AudioFileTypeIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_TypesForHFSTypeCode(lua_State *L)
{
    AudioFileGlobalInfo_TypesForHFSTypeCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeIDs(lua_State *L)
{
    AudioFileTypeIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_TypesForUTI(lua_State *L)
{
    AudioFileGlobalInfo_TypesForUTI(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeIDs(lua_State *L)
{
    AudioFileTypeIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_TypesForMIMEType(lua_State *L)
{
    AudioFileGlobalInfo_TypesForMIMEType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeIDs(lua_State *L)
{
    AudioFileTypeIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_ReadableTypes(lua_State *L)
{
    AudioFileGlobalInfo_ReadableTypes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_WritableTypes(lua_State *L)
{
    AudioFileGlobalInfo_WritableTypes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_FileTypeName(lua_State *L)
{
    AudioFileGlobalInfo_FileTypeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AvailableStreamDescriptionsForFormat(lua_State *L)
{
    AudioFileGlobalInfo_AvailableStreamDescriptionsForFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AvailableFormatIDs(lua_State *L)
{
    AudioFileGlobalInfo_AvailableFormatIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AllExtensions(lua_State *L)
{
    AudioFileGlobalInfo_AllExtensions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AllHFSTypeCodes(lua_State *L)
{
    AudioFileGlobalInfo_AllHFSTypeCodes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AllUTIs(lua_State *L)
{
    AudioFileGlobalInfo_AllUTIs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AllMIMETypes(lua_State *L)
{
    AudioFileGlobalInfo_AllMIMETypes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_ExtensionsForType(lua_State *L)
{
    AudioFileGlobalInfo_ExtensionsForType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_HFSTypeCodesForType(lua_State *L)
{
    AudioFileGlobalInfo_HFSTypeCodesForType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_UTIsForType(lua_State *L)
{
    AudioFileGlobalInfo_UTIsForType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_MIMETypesForType(lua_State *L)
{
    AudioFileGlobalInfo_MIMETypesForType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_TypesForMIMEType(lua_State *L)
{
    AudioFileGlobalInfo_TypesForMIMEType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_TypesForUTI(lua_State *L)
{
    AudioFileGlobalInfo_TypesForUTI(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_TypesForHFSTypeCode(lua_State *L)
{
    AudioFileGlobalInfo_TypesForHFSTypeCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_TypesForExtension(lua_State *L)
{
    AudioFileGlobalInfo_TypesForExtension(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeAndFormatID(lua_State *L)
{
    AudioFileTypeAndFormatID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo_AvailableStreamDescriptions(lua_State *L)
{
    AudioFileGlobalInfo_AvailableStreamDescriptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileAIFFType(lua_State *L)
{
    AudioFileAIFFType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeAndFormatID(lua_State *L)
{
    AudioFileTypeAndFormatID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeAndFormatID(lua_State *L)
{
    AudioFileTypeAndFormatID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetGlobalInfoSize(lua_State *L)
{
    AudioFileGetGlobalInfoSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo(lua_State *L)
{
    AudioFileGlobalInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetGlobalInfoSize(lua_State *L)
{
    AudioFileGetGlobalInfoSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetGlobalInfo(lua_State *L)
{
    AudioFileGetGlobalInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGlobalInfo(lua_State *L)
{
    AudioFileGlobalInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileGetGlobalInfo(lua_State *L)
{
    AudioFileGetGlobalInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCreate(lua_State *L)
{
    AudioFileCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCreateWithURL(lua_State *L)
{
    AudioFileCreateWithURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCreate(lua_State *L)
{
    AudioFileCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInitialize(lua_State *L)
{
    AudioFileInitialize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInitialize(lua_State *L)
{
    AudioFileInitialize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileCreateWithURL(lua_State *L)
{
    AudioFileCreateWithURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileInitialize(lua_State *L)
{
    AudioFileInitialize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpen(lua_State *L)
{
    AudioFileOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpenURL(lua_State *L)
{
    AudioFileOpenURL(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileOpen(lua_State *L)
{
    AudioFileOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileTypeID(lua_State *L)
{
    AudioFileTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileID(lua_State *L)
{
    AudioFileID(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAudioFileAPIs[] = {
    {"AudioFile_h__", lua_AudioFile_h__},
    {"AudioFile_h__", lua_AudioFile_h__},
    {"AudioFileAIFFType", lua_AudioFileAIFFType},
    {"AudioFileAIFCType", lua_AudioFileAIFCType},
    {"AudioFileWAVEType", lua_AudioFileWAVEType},
    {"AudioFileSoundDesigner2Type", lua_AudioFileSoundDesigner2Type},
    {"AudioFileNextType", lua_AudioFileNextType},
    {"AudioFileMP3Type", lua_AudioFileMP3Type},
    {"AudioFileMP2Type", lua_AudioFileMP2Type},
    {"AudioFileMP1Type", lua_AudioFileMP1Type},
    {"AudioFileAC3Type", lua_AudioFileAC3Type},
    {"AudioFileAAC_ADTSType", lua_AudioFileAAC_ADTSType},
    {"AudioFileMPEG4Type", lua_AudioFileMPEG4Type},
    {"AudioFileM4AType", lua_AudioFileM4AType},
    {"AudioFileCAFType", lua_AudioFileCAFType},
    {"AudioFileAIFFType", lua_AudioFileAIFFType},
    {"AudioFileAIFCType", lua_AudioFileAIFCType},
    {"AudioFileWAVEType", lua_AudioFileWAVEType},
    {"AudioFileSoundDesigner2Type", lua_AudioFileSoundDesigner2Type},
    {"AudioFileNextType", lua_AudioFileNextType},
    {"AudioFileMP3Type", lua_AudioFileMP3Type},
    {"AudioFileMP2Type", lua_AudioFileMP2Type},
    {"AudioFileMP1Type", lua_AudioFileMP1Type},
    {"AudioFileAC3Type", lua_AudioFileAC3Type},
    {"AudioFileAAC_ADTSType", lua_AudioFileAAC_ADTSType},
    {"AudioFileMPEG4Type", lua_AudioFileMPEG4Type},
    {"AudioFileM4AType", lua_AudioFileM4AType},
    {"AudioFileCAFType", lua_AudioFileCAFType},
    {"AudioFile3GPType", lua_AudioFile3GPType},
    {"AudioFile3GP2Type", lua_AudioFile3GP2Type},
    {"AudioFileAMRType", lua_AudioFileAMRType},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileUnspecifiedError", lua_AudioFileUnspecifiedError},
    {"AudioFileUnsupportedFileTypeError", lua_AudioFileUnsupportedFileTypeError},
    {"AudioFileUnsupportedDataFormatError", lua_AudioFileUnsupportedDataFormatError},
    {"AudioFileUnsupportedPropertyError", lua_AudioFileUnsupportedPropertyError},
    {"AudioFileBadPropertySizeError", lua_AudioFileBadPropertySizeError},
    {"AudioFilePermissionsError", lua_AudioFilePermissionsError},
    {"AudioFileReadPermission", lua_AudioFileReadPermission},
    {"AudioFileNotOptimizedError", lua_AudioFileNotOptimizedError},
    {"AudioFileInvalidChunkError", lua_AudioFileInvalidChunkError},
    {"AudioFileDoesNotAllow64BitDataSizeError", lua_AudioFileDoesNotAllow64BitDataSizeError},
    {"AudioFileInvalidPacketOffsetError", lua_AudioFileInvalidPacketOffsetError},
    {"AudioFileInvalidFileError", lua_AudioFileInvalidFileError},
    {"AudioFileOperationNotSupportedError", lua_AudioFileOperationNotSupportedError},
    {"AudioFilePropertyAudioDataByteCount", lua_AudioFilePropertyAudioDataByteCount},
    {"AudioFileNotOpenError", lua_AudioFileNotOpenError},
    {"AudioFileEndOfFileError", lua_AudioFileEndOfFileError},
    {"AudioFilePositionError", lua_AudioFilePositionError},
    {"AudioFileFileNotFoundError", lua_AudioFileFileNotFoundError},
    {"AudioFileUnspecifiedError", lua_AudioFileUnspecifiedError},
    {"AudioFileUnsupportedFileTypeError", lua_AudioFileUnsupportedFileTypeError},
    {"AudioFileUnsupportedDataFormatError", lua_AudioFileUnsupportedDataFormatError},
    {"AudioFileUnsupportedPropertyError", lua_AudioFileUnsupportedPropertyError},
    {"AudioFileBadPropertySizeError", lua_AudioFileBadPropertySizeError},
    {"AudioFilePermissionsError", lua_AudioFilePermissionsError},
    {"AudioFileNotOptimizedError", lua_AudioFileNotOptimizedError},
    {"AudioFileInvalidChunkError", lua_AudioFileInvalidChunkError},
    {"AudioFileDoesNotAllow64BitDataSizeError", lua_AudioFileDoesNotAllow64BitDataSizeError},
    {"AudioFileInvalidPacketOffsetError", lua_AudioFileInvalidPacketOffsetError},
    {"AudioFileInvalidFileError", lua_AudioFileInvalidFileError},
    {"AudioFileOperationNotSupportedError", lua_AudioFileOperationNotSupportedError},
    {"AudioFileNotOpenError", lua_AudioFileNotOpenError},
    {"AudioFileEndOfFileError", lua_AudioFileEndOfFileError},
    {"AudioFilePositionError", lua_AudioFilePositionError},
    {"AudioFileFileNotFoundError", lua_AudioFileFileNotFoundError},
    {"AudioFileCreateWithURL", lua_AudioFileCreateWithURL},
    {"AudioFileFlags_EraseFile", lua_AudioFileFlags_EraseFile},
    {"AudioFileFlags_DontPageAlignAudioData", lua_AudioFileFlags_DontPageAlignAudioData},
    {"AudioFileFlags_EraseFile", lua_AudioFileFlags_EraseFile},
    {"AudioFileFlags_DontPageAlignAudioData", lua_AudioFileFlags_DontPageAlignAudioData},
    {"AudioFileReadPermission", lua_AudioFileReadPermission},
    {"AudioFileWritePermission", lua_AudioFileWritePermission},
    {"AudioFileReadWritePermission", lua_AudioFileReadWritePermission},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFilePropertyID", lua_AudioFilePropertyID},
    {"AudioFilePropertyID", lua_AudioFilePropertyID},
    {"AudioFileLoopDirection", lua_AudioFileLoopDirection},
    {"AudioFileLoopDirection_NoLooping", lua_AudioFileLoopDirection_NoLooping},
    {"AudioFileLoopDirection_Forward", lua_AudioFileLoopDirection_Forward},
    {"AudioFileLoopDirection_Backward", lua_AudioFileLoopDirection_Backward},
    {"AudioFileLoopDirection_ForwardAndBackward", lua_AudioFileLoopDirection_ForwardAndBackward},
    {"AudioFileLoopDirection_NoLooping", lua_AudioFileLoopDirection_NoLooping},
    {"AudioFileLoopDirection_Forward", lua_AudioFileLoopDirection_Forward},
    {"AudioFileLoopDirection_ForwardAndBackward", lua_AudioFileLoopDirection_ForwardAndBackward},
    {"AudioFileLoopDirection_Backward", lua_AudioFileLoopDirection_Backward},
    {"AudioFile_SMPTE_Time", lua_AudioFile_SMPTE_Time},
    {"AudioFile_SMPTE_Time", lua_AudioFile_SMPTE_Time},
    {"AudioFile_SMPTE_Time", lua_AudioFile_SMPTE_Time},
    {"AudioFileMarkerType", lua_AudioFileMarkerType},
    {"AudioFileMarker", lua_AudioFileMarker},
    {"AudioFileMarkerType_Generic", lua_AudioFileMarkerType_Generic},
    {"AudioFileMarkerType_Generic", lua_AudioFileMarkerType_Generic},
    {"AudioFileMarker", lua_AudioFileMarker},
    {"AudioFileMarker", lua_AudioFileMarker},
    {"AudioFile_SMPTE_Time", lua_AudioFile_SMPTE_Time},
    {"AudioFileMarker", lua_AudioFileMarker},
    {"AudioFileMarkerList", lua_AudioFileMarkerList},
    {"AudioFileMarkerList", lua_AudioFileMarkerList},
    {"AudioFileMarker", lua_AudioFileMarker},
    {"AudioFileMarkerList", lua_AudioFileMarkerList},
    {"AudioFileMarkers", lua_AudioFileMarkers},
    {"AudioFileMarkers", lua_AudioFileMarkers},
    {"AudioFilePropertyMarkerList", lua_AudioFilePropertyMarkerList},
    {"AudioFileMarkers", lua_AudioFileMarkers},
    {"AudioFileMarkers", lua_AudioFileMarkers},
    {"AudioFileMarkerList", lua_AudioFileMarkerList},
    {"AudioFileMarkersToNumBytes", lua_AudioFileMarkersToNumBytes},
    {"AudioFileMarkers", lua_AudioFileMarkers},
    {"AudioFilePropertyMarkerList", lua_AudioFilePropertyMarkerList},
    {"AudioFileMarkers", lua_AudioFileMarkers},
    {"AudioFileMarkers", lua_AudioFileMarkers},
    {"AudioFileMarkers", lua_AudioFileMarkers},
    {"AudioFileMarkersToNumBytes", lua_AudioFileMarkersToNumBytes},
    {"AudioFileMarkerList", lua_AudioFileMarkerList},
    {"AudioFileRegionFlags", lua_AudioFileRegionFlags},
    {"AudioFileRegion", lua_AudioFileRegion},
    {"AudioFileRegionFlag_LoopEnable", lua_AudioFileRegionFlag_LoopEnable},
    {"AudioFileRegionFlag_PlayForward", lua_AudioFileRegionFlag_PlayForward},
    {"AudioFileRegionFlag_PlayForward", lua_AudioFileRegionFlag_PlayForward},
    {"AudioFileRegionFlag_LoopEnable", lua_AudioFileRegionFlag_LoopEnable},
    {"AudioFileRegionFlag_PlayForward", lua_AudioFileRegionFlag_PlayForward},
    {"AudioFileRegionFlag_PlayBackward", lua_AudioFileRegionFlag_PlayBackward},
    {"AudioFileRegionFlag_LoopEnable", lua_AudioFileRegionFlag_LoopEnable},
    {"AudioFileRegionFlag_PlayForward", lua_AudioFileRegionFlag_PlayForward},
    {"AudioFileRegionFlag_PlayBackward", lua_AudioFileRegionFlag_PlayBackward},
    {"AudioFileRegion", lua_AudioFileRegion},
    {"AudioFileRegion", lua_AudioFileRegion},
    {"AudioFileRegionFlags", lua_AudioFileRegionFlags},
    {"AudioFileMarkers", lua_AudioFileMarkers},
    {"AudioFileRegion", lua_AudioFileRegion},
    {"AudioFileMarker", lua_AudioFileMarker},
    {"AudioFileRegion", lua_AudioFileRegion},
    {"AudioFileRegionList", lua_AudioFileRegionList},
    {"AudioFileRegions", lua_AudioFileRegions},
    {"AudioFilePropertyRegionList", lua_AudioFilePropertyRegionList},
    {"AudioFileRegions", lua_AudioFileRegions},
    {"AudioFileRegion", lua_AudioFileRegion},
    {"AudioFileRegionList", lua_AudioFileRegionList},
    {"AudioFileRegion", lua_AudioFileRegion},
    {"AudioFileRegionList", lua_AudioFileRegionList},
    {"AudioFileRegion", lua_AudioFileRegion},
    {"AudioFileRegions", lua_AudioFileRegions},
    {"AudioFileRegion", lua_AudioFileRegion},
    {"AudioFileRegion", lua_AudioFileRegion},
    {"AudioFilePropertyPacketToFrame", lua_AudioFilePropertyPacketToFrame},
    {"AudioFilePropertyPacketToFrame", lua_AudioFilePropertyPacketToFrame},
    {"AudioFileByteToPacket", lua_AudioFileByteToPacket},
    {"AudioFileByteToPacket", lua_AudioFileByteToPacket},
    {"AudioFilePacketTableInfo", lua_AudioFilePacketTableInfo},
    {"AudioFilePacketTableInfo", lua_AudioFilePacketTableInfo},
    {"AudioFilePacketTableInfo", lua_AudioFilePacketTableInfo},
    {"AudioFileCreateWithURL", lua_AudioFileCreateWithURL},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileFlags_EraseFile", lua_AudioFileFlags_EraseFile},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileCreateWithURL", lua_AudioFileCreateWithURL},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileOpenURL", lua_AudioFileOpenURL},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileOpenURL", lua_AudioFileOpenURL},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFile_ReadProc", lua_AudioFile_ReadProc},
    {"AudioFileOpenWithCallbacks", lua_AudioFileOpenWithCallbacks},
    {"AudioFileXXXWithCallbacks", lua_AudioFileXXXWithCallbacks},
    {"AudioFile_ReadProc", lua_AudioFile_ReadProc},
    {"AudioFile_WriteProc", lua_AudioFile_WriteProc},
    {"AudioFileOpenWithCallbacks", lua_AudioFileOpenWithCallbacks},
    {"AudioFileXXXWithCallbacks", lua_AudioFileXXXWithCallbacks},
    {"AudioFile_WriteProc", lua_AudioFile_WriteProc},
    {"AudioFile_GetSizeProc", lua_AudioFile_GetSizeProc},
    {"AudioFileOpenWithCallbacks", lua_AudioFileOpenWithCallbacks},
    {"AudioFileXXXWithCallbacks", lua_AudioFileXXXWithCallbacks},
    {"AudioFile_GetSizeProc", lua_AudioFile_GetSizeProc},
    {"AudioFile_SetSizeProc", lua_AudioFile_SetSizeProc},
    {"AudioFileOpenWithCallbacks", lua_AudioFileOpenWithCallbacks},
    {"AudioFileXXXWithCallbacks", lua_AudioFileXXXWithCallbacks},
    {"AudioFile_SetSizeProc", lua_AudioFile_SetSizeProc},
    {"AudioFileInitializeWithCallbacks", lua_AudioFileInitializeWithCallbacks},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileInitializeWithCallbacks", lua_AudioFileInitializeWithCallbacks},
    {"AudioFile_ReadProc", lua_AudioFile_ReadProc},
    {"AudioFile_WriteProc", lua_AudioFile_WriteProc},
    {"AudioFile_GetSizeProc", lua_AudioFile_GetSizeProc},
    {"AudioFile_SetSizeProc", lua_AudioFile_SetSizeProc},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileOpenWithCallbacks", lua_AudioFileOpenWithCallbacks},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileOpenWithCallbacks", lua_AudioFileOpenWithCallbacks},
    {"AudioFile_ReadProc", lua_AudioFile_ReadProc},
    {"AudioFile_WriteProc", lua_AudioFile_WriteProc},
    {"AudioFile_GetSizeProc", lua_AudioFile_GetSizeProc},
    {"AudioFile_SetSizeProc", lua_AudioFile_SetSizeProc},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileClose", lua_AudioFileClose},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileClose", lua_AudioFileClose},
    {"AudioFileOptimize", lua_AudioFileOptimize},
    {"AudioFilePropertyIsOptimized", lua_AudioFilePropertyIsOptimized},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileOptimize", lua_AudioFileOptimize},
    {"AudioFileReadBytes", lua_AudioFileReadBytes},
    {"AudioFileEndOfFileError", lua_AudioFileEndOfFileError},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileReadBytes", lua_AudioFileReadBytes},
    {"AudioFileWriteBytes", lua_AudioFileWriteBytes},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileWriteBytes", lua_AudioFileWriteBytes},
    {"AudioFileReadPacketData", lua_AudioFileReadPacketData},
    {"AudioFileEndOfFileError", lua_AudioFileEndOfFileError},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileReadPacketData", lua_AudioFileReadPacketData},
    {"AudioFileReadPackets", lua_AudioFileReadPackets},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileReadPackets", lua_AudioFileReadPackets},
    {"AudioFileWritePackets", lua_AudioFileWritePackets},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileWritePackets", lua_AudioFileWritePackets},
    {"AudioFileCountUserData", lua_AudioFileCountUserData},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileCountUserData", lua_AudioFileCountUserData},
    {"AudioFileGetUserDataSize", lua_AudioFileGetUserDataSize},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileGetUserDataSize", lua_AudioFileGetUserDataSize},
    {"AudioFileGetUserData", lua_AudioFileGetUserData},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileGetUserData", lua_AudioFileGetUserData},
    {"AudioFileSetUserData", lua_AudioFileSetUserData},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileSetUserData", lua_AudioFileSetUserData},
    {"AudioFileRemoveUserData", lua_AudioFileRemoveUserData},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileRemoveUserData", lua_AudioFileRemoveUserData},
    {"AudioFilePropertyFileFormat", lua_AudioFilePropertyFileFormat},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFilePropertyDataFormat", lua_AudioFilePropertyDataFormat},
    {"AudioFilePropertyFormatList", lua_AudioFilePropertyFormatList},
    {"AudioFilePropertyDataFormat", lua_AudioFilePropertyDataFormat},
    {"AudioFilePropertyIsOptimized", lua_AudioFilePropertyIsOptimized},
    {"AudioFilePropertyMagicCookieData", lua_AudioFilePropertyMagicCookieData},
    {"AudioFileWriteBytes", lua_AudioFileWriteBytes},
    {"AudioFilePropertyAudioDataByteCount", lua_AudioFilePropertyAudioDataByteCount},
    {"AudioFilePropertyAudioDataPacketCount", lua_AudioFilePropertyAudioDataPacketCount},
    {"AudioFilePropertyMaximumPacketSize", lua_AudioFilePropertyMaximumPacketSize},
    {"AudioFilePropertyDataOffset", lua_AudioFilePropertyDataOffset},
    {"AudioFilePropertyChannelLayout", lua_AudioFilePropertyChannelLayout},
    {"AudioFilePropertyDeferSizeUpdates", lua_AudioFilePropertyDeferSizeUpdates},
    {"AudioFilePropertyDataFormatName", lua_AudioFilePropertyDataFormatName},
    {"AudioFilePropertyMarkerList", lua_AudioFilePropertyMarkerList},
    {"AudioFileMarkerList", lua_AudioFileMarkerList},
    {"AudioFilePropertyRegionList", lua_AudioFilePropertyRegionList},
    {"AudioFileRegions", lua_AudioFileRegions},
    {"AudioFilePropertyPacketToFrame", lua_AudioFilePropertyPacketToFrame},
    {"AudioFilePropertyFrameToPacket", lua_AudioFilePropertyFrameToPacket},
    {"AudioFilePropertyPacketToByte", lua_AudioFilePropertyPacketToByte},
    {"AudioFilePropertyByteToPacket", lua_AudioFilePropertyByteToPacket},
    {"AudioFilePropertyChunkIDs", lua_AudioFilePropertyChunkIDs},
    {"AudioFilePropertyInfoDictionary", lua_AudioFilePropertyInfoDictionary},
    {"AudioFileComponents", lua_AudioFileComponents},
    {"AudioFilePropertyPacketTableInfo", lua_AudioFilePropertyPacketTableInfo},
    {"AudioFilePacketTableInfo", lua_AudioFilePacketTableInfo},
    {"AudioFilePropertyPacketSizeUpperBound", lua_AudioFilePropertyPacketSizeUpperBound},
    {"AudioFilePropertyMaximumPacketSize", lua_AudioFilePropertyMaximumPacketSize},
    {"AudioFilePropertyReserveDuration", lua_AudioFilePropertyReserveDuration},
    {"AudioFilePropertyEstimatedDuration", lua_AudioFilePropertyEstimatedDuration},
    {"AudioFilePropertyBitRate", lua_AudioFilePropertyBitRate},
    {"AudioFilePropertyID3Tag", lua_AudioFilePropertyID3Tag},
    {"AudioFileWritePackets", lua_AudioFileWritePackets},
    {"AudioFilePropertySourceBitDepth", lua_AudioFilePropertySourceBitDepth},
    {"AudioFilePropertyAlbumArtwork", lua_AudioFilePropertyAlbumArtwork},
    {"AudioFilePropertyFileFormat", lua_AudioFilePropertyFileFormat},
    {"AudioFilePropertyDataFormat", lua_AudioFilePropertyDataFormat},
    {"AudioFilePropertyIsOptimized", lua_AudioFilePropertyIsOptimized},
    {"AudioFilePropertyMagicCookieData", lua_AudioFilePropertyMagicCookieData},
    {"AudioFilePropertyAudioDataByteCount", lua_AudioFilePropertyAudioDataByteCount},
    {"AudioFilePropertyAudioDataPacketCount", lua_AudioFilePropertyAudioDataPacketCount},
    {"AudioFilePropertyMaximumPacketSize", lua_AudioFilePropertyMaximumPacketSize},
    {"AudioFilePropertyDataOffset", lua_AudioFilePropertyDataOffset},
    {"AudioFilePropertyChannelLayout", lua_AudioFilePropertyChannelLayout},
    {"AudioFilePropertyDeferSizeUpdates", lua_AudioFilePropertyDeferSizeUpdates},
    {"AudioFilePropertyDataFormatName", lua_AudioFilePropertyDataFormatName},
    {"AudioFilePropertyMarkerList", lua_AudioFilePropertyMarkerList},
    {"AudioFilePropertyRegionList", lua_AudioFilePropertyRegionList},
    {"AudioFilePropertyPacketToFrame", lua_AudioFilePropertyPacketToFrame},
    {"AudioFilePropertyFrameToPacket", lua_AudioFilePropertyFrameToPacket},
    {"AudioFilePropertyPacketToByte", lua_AudioFilePropertyPacketToByte},
    {"AudioFilePropertyByteToPacket", lua_AudioFilePropertyByteToPacket},
    {"AudioFilePropertyChunkIDs", lua_AudioFilePropertyChunkIDs},
    {"AudioFilePropertyInfoDictionary", lua_AudioFilePropertyInfoDictionary},
    {"AudioFilePropertyPacketTableInfo", lua_AudioFilePropertyPacketTableInfo},
    {"AudioFilePropertyFormatList", lua_AudioFilePropertyFormatList},
    {"AudioFilePropertyPacketSizeUpperBound", lua_AudioFilePropertyPacketSizeUpperBound},
    {"AudioFilePropertyReserveDuration", lua_AudioFilePropertyReserveDuration},
    {"AudioFilePropertyEstimatedDuration", lua_AudioFilePropertyEstimatedDuration},
    {"AudioFilePropertyBitRate", lua_AudioFilePropertyBitRate},
    {"AudioFilePropertyID3Tag", lua_AudioFilePropertyID3Tag},
    {"AudioFilePropertySourceBitDepth", lua_AudioFilePropertySourceBitDepth},
    {"AudioFilePropertyAlbumArtwork", lua_AudioFilePropertyAlbumArtwork},
    {"AudioFileGetPropertyInfo", lua_AudioFileGetPropertyInfo},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileProperty", lua_AudioFileProperty},
    {"AudioFileGetPropertyInfo", lua_AudioFileGetPropertyInfo},
    {"AudioFilePropertyID", lua_AudioFilePropertyID},
    {"AudioFileGetProperty", lua_AudioFileGetProperty},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileProperty", lua_AudioFileProperty},
    {"AudioFileGetProperty", lua_AudioFileGetProperty},
    {"AudioFilePropertyID", lua_AudioFilePropertyID},
    {"AudioFileSetProperty", lua_AudioFileSetProperty},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileProperty", lua_AudioFileProperty},
    {"AudioFileSetProperty", lua_AudioFileSetProperty},
    {"AudioFilePropertyID", lua_AudioFilePropertyID},
    {"AudioFileGetGlobalInfo", lua_AudioFileGetGlobalInfo},
    {"AudioFileGlobalInfo_ReadableTypes", lua_AudioFileGlobalInfo_ReadableTypes},
    {"AudioFileGlobalInfo_WritableTypes", lua_AudioFileGlobalInfo_WritableTypes},
    {"AudioFileGlobalInfo_FileTypeName", lua_AudioFileGlobalInfo_FileTypeName},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileGlobalInfo_AvailableFormatIDs", lua_AudioFileGlobalInfo_AvailableFormatIDs},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileGlobalInfo_AvailableStreamDescriptionsForFormat", lua_AudioFileGlobalInfo_AvailableStreamDescriptionsForFormat},
    {"AudioFileTypeAndFormatID", lua_AudioFileTypeAndFormatID},
    {"AudioFileGlobalInfo_AllExtensions", lua_AudioFileGlobalInfo_AllExtensions},
    {"AudioFileGlobalInfo_AllHFSTypeCodes", lua_AudioFileGlobalInfo_AllHFSTypeCodes},
    {"AudioFileGlobalInfo_AllUTIs", lua_AudioFileGlobalInfo_AllUTIs},
    {"AudioFileGlobalInfo_AllMIMETypes", lua_AudioFileGlobalInfo_AllMIMETypes},
    {"AudioFileGlobalInfo_ExtensionsForType", lua_AudioFileGlobalInfo_ExtensionsForType},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileGlobalInfo_HFSTypeCodesForType", lua_AudioFileGlobalInfo_HFSTypeCodesForType},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileGlobalInfo_UTIsForType", lua_AudioFileGlobalInfo_UTIsForType},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileGlobalInfo_MIMETypesForType", lua_AudioFileGlobalInfo_MIMETypesForType},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileGlobalInfo_TypesForExtension", lua_AudioFileGlobalInfo_TypesForExtension},
    {"AudioFileTypeIDs", lua_AudioFileTypeIDs},
    {"AudioFileGlobalInfo_TypesForHFSTypeCode", lua_AudioFileGlobalInfo_TypesForHFSTypeCode},
    {"AudioFileTypeIDs", lua_AudioFileTypeIDs},
    {"AudioFileGlobalInfo_TypesForUTI", lua_AudioFileGlobalInfo_TypesForUTI},
    {"AudioFileTypeIDs", lua_AudioFileTypeIDs},
    {"AudioFileGlobalInfo_TypesForMIMEType", lua_AudioFileGlobalInfo_TypesForMIMEType},
    {"AudioFileTypeIDs", lua_AudioFileTypeIDs},
    {"AudioFileGlobalInfo_ReadableTypes", lua_AudioFileGlobalInfo_ReadableTypes},
    {"AudioFileGlobalInfo_WritableTypes", lua_AudioFileGlobalInfo_WritableTypes},
    {"AudioFileGlobalInfo_FileTypeName", lua_AudioFileGlobalInfo_FileTypeName},
    {"AudioFileGlobalInfo_AvailableStreamDescriptionsForFormat", lua_AudioFileGlobalInfo_AvailableStreamDescriptionsForFormat},
    {"AudioFileGlobalInfo_AvailableFormatIDs", lua_AudioFileGlobalInfo_AvailableFormatIDs},
    {"AudioFileGlobalInfo_AllExtensions", lua_AudioFileGlobalInfo_AllExtensions},
    {"AudioFileGlobalInfo_AllHFSTypeCodes", lua_AudioFileGlobalInfo_AllHFSTypeCodes},
    {"AudioFileGlobalInfo_AllUTIs", lua_AudioFileGlobalInfo_AllUTIs},
    {"AudioFileGlobalInfo_AllMIMETypes", lua_AudioFileGlobalInfo_AllMIMETypes},
    {"AudioFileGlobalInfo_ExtensionsForType", lua_AudioFileGlobalInfo_ExtensionsForType},
    {"AudioFileGlobalInfo_HFSTypeCodesForType", lua_AudioFileGlobalInfo_HFSTypeCodesForType},
    {"AudioFileGlobalInfo_UTIsForType", lua_AudioFileGlobalInfo_UTIsForType},
    {"AudioFileGlobalInfo_MIMETypesForType", lua_AudioFileGlobalInfo_MIMETypesForType},
    {"AudioFileGlobalInfo_TypesForMIMEType", lua_AudioFileGlobalInfo_TypesForMIMEType},
    {"AudioFileGlobalInfo_TypesForUTI", lua_AudioFileGlobalInfo_TypesForUTI},
    {"AudioFileGlobalInfo_TypesForHFSTypeCode", lua_AudioFileGlobalInfo_TypesForHFSTypeCode},
    {"AudioFileGlobalInfo_TypesForExtension", lua_AudioFileGlobalInfo_TypesForExtension},
    {"AudioFileTypeAndFormatID", lua_AudioFileTypeAndFormatID},
    {"AudioFileGlobalInfo_AvailableStreamDescriptions", lua_AudioFileGlobalInfo_AvailableStreamDescriptions},
    {"AudioFileAIFFType", lua_AudioFileAIFFType},
    {"AudioFileTypeAndFormatID", lua_AudioFileTypeAndFormatID},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileTypeAndFormatID", lua_AudioFileTypeAndFormatID},
    {"AudioFileGetGlobalInfoSize", lua_AudioFileGetGlobalInfoSize},
    {"AudioFileGlobalInfo", lua_AudioFileGlobalInfo},
    {"AudioFileGetGlobalInfoSize", lua_AudioFileGetGlobalInfoSize},
    {"AudioFileGetGlobalInfo", lua_AudioFileGetGlobalInfo},
    {"AudioFileGlobalInfo", lua_AudioFileGlobalInfo},
    {"AudioFileGetGlobalInfo", lua_AudioFileGetGlobalInfo},
    {"AudioFileCreate", lua_AudioFileCreate},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileCreateWithURL", lua_AudioFileCreateWithURL},
    {"AudioFileCreate", lua_AudioFileCreate},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileInitialize", lua_AudioFileInitialize},
    {"AudioFileInitialize", lua_AudioFileInitialize},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileCreateWithURL", lua_AudioFileCreateWithURL},
    {"AudioFileInitialize", lua_AudioFileInitialize},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileOpen", lua_AudioFileOpen},
    {"AudioFileID", lua_AudioFileID},
    {"AudioFileOpenURL", lua_AudioFileOpenURL},
    {"AudioFileOpen", lua_AudioFileOpen},
    {"AudioFileTypeID", lua_AudioFileTypeID},
    {"AudioFileID", lua_AudioFileID},
    {NULL, NULL},
};

int LuaOpenAudioFile(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioFileAPIs);
    return 0;
}
