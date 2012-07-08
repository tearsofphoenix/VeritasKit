//
//  LuaAudioFileStream.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioFileStream.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AudioFileStream_h__(lua_State *L)
{
    AudioFileStream_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStream_h__(lua_State *L)
{
    AudioFileStream_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamParseBytes(lua_State *L)
{
    AudioFileStreamParseBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStream_PropertyListenerProc(lua_State *L)
{
    AudioFileStream_PropertyListenerProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyID(lua_State *L)
{
    AudioFileStreamPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamID(lua_State *L)
{
    AudioFileStreamID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStream_PropertyListenerProc(lua_State *L)
{
    AudioFileStream_PropertyListenerProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamID(lua_State *L)
{
    AudioFileStreamID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyID(lua_State *L)
{
    AudioFileStreamPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStream_PacketsProc(lua_State *L)
{
    AudioFileStream_PacketsProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyFlag_PropertyIsCached(lua_State *L)
{
    AudioFileStreamPropertyFlag_PropertyIsCached(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStream_PropertyListenerProc(lua_State *L)
{
    AudioFileStream_PropertyListenerProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyFlag_CacheProperty(lua_State *L)
{
    AudioFileStreamPropertyFlag_CacheProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyFlag_CacheProperty(lua_State *L)
{
    AudioFileStreamPropertyFlag_CacheProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamParseFlag_Discontinuity(lua_State *L)
{
    AudioFileStreamParseFlag_Discontinuity(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamParseBytes(lua_State *L)
{
    AudioFileStreamParseBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamSeekFlag_OffsetIsEstimated(lua_State *L)
{
    AudioFileStreamSeekFlag_OffsetIsEstimated(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamSeek(lua_State *L)
{
    AudioFileStreamSeek(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyFlag_PropertyIsCached(lua_State *L)
{
    AudioFileStreamPropertyFlag_PropertyIsCached(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyFlag_CacheProperty(lua_State *L)
{
    AudioFileStreamPropertyFlag_CacheProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamParseFlag_Discontinuity(lua_State *L)
{
    AudioFileStreamParseFlag_Discontinuity(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamSeekFlag_OffsetIsEstimated(lua_State *L)
{
    AudioFileStreamSeekFlag_OffsetIsEstimated(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_UnsupportedFileType(lua_State *L)
{
    AudioFileStreamError_UnsupportedFileType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_UnsupportedDataFormat(lua_State *L)
{
    AudioFileStreamError_UnsupportedDataFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_UnsupportedProperty(lua_State *L)
{
    AudioFileStreamError_UnsupportedProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_BadPropertySize(lua_State *L)
{
    AudioFileStreamError_BadPropertySize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_NotOptimized(lua_State *L)
{
    AudioFileStreamError_NotOptimized(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_InvalidPacketOffset(lua_State *L)
{
    AudioFileStreamError_InvalidPacketOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_InvalidFile(lua_State *L)
{
    AudioFileStreamError_InvalidFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_ValueUnknown(lua_State *L)
{
    AudioFileStreamError_ValueUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_DataUnavailable(lua_State *L)
{
    AudioFileStreamError_DataUnavailable(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_IllegalOperation(lua_State *L)
{
    AudioFileStreamError_IllegalOperation(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_UnspecifiedError(lua_State *L)
{
    AudioFileStreamError_UnspecifiedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_UnsupportedFileType(lua_State *L)
{
    AudioFileStreamError_UnsupportedFileType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_UnsupportedDataFormat(lua_State *L)
{
    AudioFileStreamError_UnsupportedDataFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_UnsupportedProperty(lua_State *L)
{
    AudioFileStreamError_UnsupportedProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_BadPropertySize(lua_State *L)
{
    AudioFileStreamError_BadPropertySize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_NotOptimized(lua_State *L)
{
    AudioFileStreamError_NotOptimized(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_InvalidPacketOffset(lua_State *L)
{
    AudioFileStreamError_InvalidPacketOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_InvalidFile(lua_State *L)
{
    AudioFileStreamError_InvalidFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_ValueUnknown(lua_State *L)
{
    AudioFileStreamError_ValueUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_DataUnavailable(lua_State *L)
{
    AudioFileStreamError_DataUnavailable(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_IllegalOperation(lua_State *L)
{
    AudioFileStreamError_IllegalOperation(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_UnspecifiedError(lua_State *L)
{
    AudioFileStreamError_UnspecifiedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_DiscontinuityCantRecover(lua_State *L)
{
    AudioFileStreamError_DiscontinuityCantRecover(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_ReadyToProducePackets(lua_State *L)
{
    AudioFileStreamProperty_ReadyToProducePackets(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_FileFormat(lua_State *L)
{
    AudioFileStreamProperty_FileFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_DataFormat(lua_State *L)
{
    AudioFileStreamProperty_DataFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_FormatList(lua_State *L)
{
    AudioFileStreamProperty_FormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_DataFormat(lua_State *L)
{
    AudioFileStreamProperty_DataFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_MagicCookieData(lua_State *L)
{
    AudioFileStreamProperty_MagicCookieData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_AudioDataByteCount(lua_State *L)
{
    AudioFileStreamProperty_AudioDataByteCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_AudioDataPacketCount(lua_State *L)
{
    AudioFileStreamProperty_AudioDataPacketCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_MaximumPacketSize(lua_State *L)
{
    AudioFileStreamProperty_MaximumPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_DataOffset(lua_State *L)
{
    AudioFileStreamProperty_DataOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_ChannelLayout(lua_State *L)
{
    AudioFileStreamProperty_ChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_PacketToFrame(lua_State *L)
{
    AudioFileStreamProperty_PacketToFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_FrameToPacket(lua_State *L)
{
    AudioFileStreamProperty_FrameToPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_PacketToByte(lua_State *L)
{
    AudioFileStreamProperty_PacketToByte(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_ByteToPacket(lua_State *L)
{
    AudioFileStreamProperty_ByteToPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_PacketTableInfo(lua_State *L)
{
    AudioFileStreamProperty_PacketTableInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_PacketSizeUpperBound(lua_State *L)
{
    AudioFileStreamProperty_PacketSizeUpperBound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_AverageBytesPerPacket(lua_State *L)
{
    AudioFileStreamProperty_AverageBytesPerPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_BitRate(lua_State *L)
{
    AudioFileStreamProperty_BitRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_ReadyToProducePackets(lua_State *L)
{
    AudioFileStreamProperty_ReadyToProducePackets(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_FileFormat(lua_State *L)
{
    AudioFileStreamProperty_FileFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_DataFormat(lua_State *L)
{
    AudioFileStreamProperty_DataFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_FormatList(lua_State *L)
{
    AudioFileStreamProperty_FormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_MagicCookieData(lua_State *L)
{
    AudioFileStreamProperty_MagicCookieData(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_AudioDataByteCount(lua_State *L)
{
    AudioFileStreamProperty_AudioDataByteCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_AudioDataPacketCount(lua_State *L)
{
    AudioFileStreamProperty_AudioDataPacketCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_MaximumPacketSize(lua_State *L)
{
    AudioFileStreamProperty_MaximumPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_DataOffset(lua_State *L)
{
    AudioFileStreamProperty_DataOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_ChannelLayout(lua_State *L)
{
    AudioFileStreamProperty_ChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_PacketToFrame(lua_State *L)
{
    AudioFileStreamProperty_PacketToFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_FrameToPacket(lua_State *L)
{
    AudioFileStreamProperty_FrameToPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_PacketToByte(lua_State *L)
{
    AudioFileStreamProperty_PacketToByte(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_ByteToPacket(lua_State *L)
{
    AudioFileStreamProperty_ByteToPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_PacketTableInfo(lua_State *L)
{
    AudioFileStreamProperty_PacketTableInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_PacketSizeUpperBound(lua_State *L)
{
    AudioFileStreamProperty_PacketSizeUpperBound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_AverageBytesPerPacket(lua_State *L)
{
    AudioFileStreamProperty_AverageBytesPerPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_BitRate(lua_State *L)
{
    AudioFileStreamProperty_BitRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamOpen(lua_State *L)
{
    AudioFileStreamOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamError_DataUnavailable(lua_State *L)
{
    AudioFileStreamError_DataUnavailable(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyFlag_PropertyIsCached(lua_State *L)
{
    AudioFileStreamPropertyFlag_PropertyIsCached(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamOpen(lua_State *L)
{
    AudioFileStreamOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStream_PropertyListenerProc(lua_State *L)
{
    AudioFileStream_PropertyListenerProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStream_PacketsProc(lua_State *L)
{
    AudioFileStream_PacketsProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamID(lua_State *L)
{
    AudioFileStreamID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamParseBytes(lua_State *L)
{
    AudioFileStreamParseBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamParseFlag_Discontinuity(lua_State *L)
{
    AudioFileStreamParseFlag_Discontinuity(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamParseBytes(lua_State *L)
{
    AudioFileStreamParseBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamID(lua_State *L)
{
    AudioFileStreamID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamSeek(lua_State *L)
{
    AudioFileStreamSeek(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamSeekFlag_OffsetIsEstimated(lua_State *L)
{
    AudioFileStreamSeekFlag_OffsetIsEstimated(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamProperty_DataOffset(lua_State *L)
{
    AudioFileStreamProperty_DataOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamSeekFlag_OffsetIsEstimated(lua_State *L)
{
    AudioFileStreamSeekFlag_OffsetIsEstimated(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamSeek(lua_State *L)
{
    AudioFileStreamSeek(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamID(lua_State *L)
{
    AudioFileStreamID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamGetPropertyInfo(lua_State *L)
{
    AudioFileStreamGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamGetPropertyInfo(lua_State *L)
{
    AudioFileStreamGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamID(lua_State *L)
{
    AudioFileStreamID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyID(lua_State *L)
{
    AudioFileStreamPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamGetProperty(lua_State *L)
{
    AudioFileStreamGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamGetProperty(lua_State *L)
{
    AudioFileStreamGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamID(lua_State *L)
{
    AudioFileStreamID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyID(lua_State *L)
{
    AudioFileStreamPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamSetProperty(lua_State *L)
{
    AudioFileStreamSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamSetProperty(lua_State *L)
{
    AudioFileStreamSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamID(lua_State *L)
{
    AudioFileStreamID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamPropertyID(lua_State *L)
{
    AudioFileStreamPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamClose(lua_State *L)
{
    AudioFileStreamClose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFileStreamClose(lua_State *L)
{
    AudioFileStreamClose(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAudioFileStreamAPIs[] = {
    {"AudioFileStream_h__", lua_AudioFileStream_h__},
    {"AudioFileStream_h__", lua_AudioFileStream_h__},
    {"AudioFileStreamParseBytes", lua_AudioFileStreamParseBytes},
    {"AudioFileStream_PropertyListenerProc", lua_AudioFileStream_PropertyListenerProc},
    {"AudioFileStreamPropertyID", lua_AudioFileStreamPropertyID},
    {"AudioFileStreamID", lua_AudioFileStreamID},
    {"AudioFileStream_PropertyListenerProc", lua_AudioFileStream_PropertyListenerProc},
    {"AudioFileStreamID", lua_AudioFileStreamID},
    {"AudioFileStreamPropertyID", lua_AudioFileStreamPropertyID},
    {"AudioFileStream_PacketsProc", lua_AudioFileStream_PacketsProc},
    {"AudioFileStreamPropertyFlag_PropertyIsCached", lua_AudioFileStreamPropertyFlag_PropertyIsCached},
    {"AudioFileStream_PropertyListenerProc", lua_AudioFileStream_PropertyListenerProc},
    {"AudioFileStreamPropertyFlag_CacheProperty", lua_AudioFileStreamPropertyFlag_CacheProperty},
    {"AudioFileStreamPropertyFlag_CacheProperty", lua_AudioFileStreamPropertyFlag_CacheProperty},
    {"AudioFileStreamParseFlag_Discontinuity", lua_AudioFileStreamParseFlag_Discontinuity},
    {"AudioFileStreamParseBytes", lua_AudioFileStreamParseBytes},
    {"AudioFileStreamSeekFlag_OffsetIsEstimated", lua_AudioFileStreamSeekFlag_OffsetIsEstimated},
    {"AudioFileStreamSeek", lua_AudioFileStreamSeek},
    {"AudioFileStreamPropertyFlag_PropertyIsCached", lua_AudioFileStreamPropertyFlag_PropertyIsCached},
    {"AudioFileStreamPropertyFlag_CacheProperty", lua_AudioFileStreamPropertyFlag_CacheProperty},
    {"AudioFileStreamParseFlag_Discontinuity", lua_AudioFileStreamParseFlag_Discontinuity},
    {"AudioFileStreamSeekFlag_OffsetIsEstimated", lua_AudioFileStreamSeekFlag_OffsetIsEstimated},
    {"AudioFileStreamError_UnsupportedFileType", lua_AudioFileStreamError_UnsupportedFileType},
    {"AudioFileStreamError_UnsupportedDataFormat", lua_AudioFileStreamError_UnsupportedDataFormat},
    {"AudioFileStreamError_UnsupportedProperty", lua_AudioFileStreamError_UnsupportedProperty},
    {"AudioFileStreamError_BadPropertySize", lua_AudioFileStreamError_BadPropertySize},
    {"AudioFileStreamError_NotOptimized", lua_AudioFileStreamError_NotOptimized},
    {"AudioFileStreamError_InvalidPacketOffset", lua_AudioFileStreamError_InvalidPacketOffset},
    {"AudioFileStreamError_InvalidFile", lua_AudioFileStreamError_InvalidFile},
    {"AudioFileStreamError_ValueUnknown", lua_AudioFileStreamError_ValueUnknown},
    {"AudioFileStreamError_DataUnavailable", lua_AudioFileStreamError_DataUnavailable},
    {"AudioFileStreamError_IllegalOperation", lua_AudioFileStreamError_IllegalOperation},
    {"AudioFileStreamError_UnspecifiedError", lua_AudioFileStreamError_UnspecifiedError},
    {"AudioFileStreamError_UnsupportedFileType", lua_AudioFileStreamError_UnsupportedFileType},
    {"AudioFileStreamError_UnsupportedDataFormat", lua_AudioFileStreamError_UnsupportedDataFormat},
    {"AudioFileStreamError_UnsupportedProperty", lua_AudioFileStreamError_UnsupportedProperty},
    {"AudioFileStreamError_BadPropertySize", lua_AudioFileStreamError_BadPropertySize},
    {"AudioFileStreamError_NotOptimized", lua_AudioFileStreamError_NotOptimized},
    {"AudioFileStreamError_InvalidPacketOffset", lua_AudioFileStreamError_InvalidPacketOffset},
    {"AudioFileStreamError_InvalidFile", lua_AudioFileStreamError_InvalidFile},
    {"AudioFileStreamError_ValueUnknown", lua_AudioFileStreamError_ValueUnknown},
    {"AudioFileStreamError_DataUnavailable", lua_AudioFileStreamError_DataUnavailable},
    {"AudioFileStreamError_IllegalOperation", lua_AudioFileStreamError_IllegalOperation},
    {"AudioFileStreamError_UnspecifiedError", lua_AudioFileStreamError_UnspecifiedError},
    {"AudioFileStreamError_DiscontinuityCantRecover", lua_AudioFileStreamError_DiscontinuityCantRecover},
    {"AudioFileStreamProperty_ReadyToProducePackets", lua_AudioFileStreamProperty_ReadyToProducePackets},
    {"AudioFileStreamProperty_FileFormat", lua_AudioFileStreamProperty_FileFormat},
    {"AudioFileStreamProperty_DataFormat", lua_AudioFileStreamProperty_DataFormat},
    {"AudioFileStreamProperty_FormatList", lua_AudioFileStreamProperty_FormatList},
    {"AudioFileStreamProperty_DataFormat", lua_AudioFileStreamProperty_DataFormat},
    {"AudioFileStreamProperty_MagicCookieData", lua_AudioFileStreamProperty_MagicCookieData},
    {"AudioFileStreamProperty_AudioDataByteCount", lua_AudioFileStreamProperty_AudioDataByteCount},
    {"AudioFileStreamProperty_AudioDataPacketCount", lua_AudioFileStreamProperty_AudioDataPacketCount},
    {"AudioFileStreamProperty_MaximumPacketSize", lua_AudioFileStreamProperty_MaximumPacketSize},
    {"AudioFileStreamProperty_DataOffset", lua_AudioFileStreamProperty_DataOffset},
    {"AudioFileStreamProperty_ChannelLayout", lua_AudioFileStreamProperty_ChannelLayout},
    {"AudioFileStreamProperty_PacketToFrame", lua_AudioFileStreamProperty_PacketToFrame},
    {"AudioFileStreamProperty_FrameToPacket", lua_AudioFileStreamProperty_FrameToPacket},
    {"AudioFileStreamProperty_PacketToByte", lua_AudioFileStreamProperty_PacketToByte},
    {"AudioFileStreamProperty_ByteToPacket", lua_AudioFileStreamProperty_ByteToPacket},
    {"AudioFileStreamProperty_PacketTableInfo", lua_AudioFileStreamProperty_PacketTableInfo},
    {"AudioFileStreamProperty_PacketSizeUpperBound", lua_AudioFileStreamProperty_PacketSizeUpperBound},
    {"AudioFileStreamProperty_AverageBytesPerPacket", lua_AudioFileStreamProperty_AverageBytesPerPacket},
    {"AudioFileStreamProperty_BitRate", lua_AudioFileStreamProperty_BitRate},
    {"AudioFileStreamProperty_ReadyToProducePackets", lua_AudioFileStreamProperty_ReadyToProducePackets},
    {"AudioFileStreamProperty_FileFormat", lua_AudioFileStreamProperty_FileFormat},
    {"AudioFileStreamProperty_DataFormat", lua_AudioFileStreamProperty_DataFormat},
    {"AudioFileStreamProperty_FormatList", lua_AudioFileStreamProperty_FormatList},
    {"AudioFileStreamProperty_MagicCookieData", lua_AudioFileStreamProperty_MagicCookieData},
    {"AudioFileStreamProperty_AudioDataByteCount", lua_AudioFileStreamProperty_AudioDataByteCount},
    {"AudioFileStreamProperty_AudioDataPacketCount", lua_AudioFileStreamProperty_AudioDataPacketCount},
    {"AudioFileStreamProperty_MaximumPacketSize", lua_AudioFileStreamProperty_MaximumPacketSize},
    {"AudioFileStreamProperty_DataOffset", lua_AudioFileStreamProperty_DataOffset},
    {"AudioFileStreamProperty_ChannelLayout", lua_AudioFileStreamProperty_ChannelLayout},
    {"AudioFileStreamProperty_PacketToFrame", lua_AudioFileStreamProperty_PacketToFrame},
    {"AudioFileStreamProperty_FrameToPacket", lua_AudioFileStreamProperty_FrameToPacket},
    {"AudioFileStreamProperty_PacketToByte", lua_AudioFileStreamProperty_PacketToByte},
    {"AudioFileStreamProperty_ByteToPacket", lua_AudioFileStreamProperty_ByteToPacket},
    {"AudioFileStreamProperty_PacketTableInfo", lua_AudioFileStreamProperty_PacketTableInfo},
    {"AudioFileStreamProperty_PacketSizeUpperBound", lua_AudioFileStreamProperty_PacketSizeUpperBound},
    {"AudioFileStreamProperty_AverageBytesPerPacket", lua_AudioFileStreamProperty_AverageBytesPerPacket},
    {"AudioFileStreamProperty_BitRate", lua_AudioFileStreamProperty_BitRate},
    {"AudioFileStreamOpen", lua_AudioFileStreamOpen},
    {"AudioFileStreamError_DataUnavailable", lua_AudioFileStreamError_DataUnavailable},
    {"AudioFileStreamPropertyFlag_PropertyIsCached", lua_AudioFileStreamPropertyFlag_PropertyIsCached},
    {"AudioFileStreamOpen", lua_AudioFileStreamOpen},
    {"AudioFileStream_PropertyListenerProc", lua_AudioFileStream_PropertyListenerProc},
    {"AudioFileStream_PacketsProc", lua_AudioFileStream_PacketsProc},
    {"AudioFileStreamID", lua_AudioFileStreamID},
    {"AudioFileStreamParseBytes", lua_AudioFileStreamParseBytes},
    {"AudioFileStreamParseFlag_Discontinuity", lua_AudioFileStreamParseFlag_Discontinuity},
    {"AudioFileStreamParseBytes", lua_AudioFileStreamParseBytes},
    {"AudioFileStreamID", lua_AudioFileStreamID},
    {"AudioFileStreamSeek", lua_AudioFileStreamSeek},
    {"AudioFileStreamSeekFlag_OffsetIsEstimated", lua_AudioFileStreamSeekFlag_OffsetIsEstimated},
    {"AudioFileStreamProperty_DataOffset", lua_AudioFileStreamProperty_DataOffset},
    {"AudioFileStreamSeekFlag_OffsetIsEstimated", lua_AudioFileStreamSeekFlag_OffsetIsEstimated},
    {"AudioFileStreamSeek", lua_AudioFileStreamSeek},
    {"AudioFileStreamID", lua_AudioFileStreamID},
    {"AudioFileStreamGetPropertyInfo", lua_AudioFileStreamGetPropertyInfo},
    {"AudioFileStreamGetPropertyInfo", lua_AudioFileStreamGetPropertyInfo},
    {"AudioFileStreamID", lua_AudioFileStreamID},
    {"AudioFileStreamPropertyID", lua_AudioFileStreamPropertyID},
    {"AudioFileStreamGetProperty", lua_AudioFileStreamGetProperty},
    {"AudioFileStreamGetProperty", lua_AudioFileStreamGetProperty},
    {"AudioFileStreamID", lua_AudioFileStreamID},
    {"AudioFileStreamPropertyID", lua_AudioFileStreamPropertyID},
    {"AudioFileStreamSetProperty", lua_AudioFileStreamSetProperty},
    {"AudioFileStreamSetProperty", lua_AudioFileStreamSetProperty},
    {"AudioFileStreamID", lua_AudioFileStreamID},
    {"AudioFileStreamPropertyID", lua_AudioFileStreamPropertyID},
    {"AudioFileStreamClose", lua_AudioFileStreamClose},
    {"AudioFileStreamClose", lua_AudioFileStreamClose},
    {NULL, NULL},
};

int LuaOpenAudioFileStream(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioFileStreamAPIs);
    return 0;
}
