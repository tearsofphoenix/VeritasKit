//
//  LuaAudioQueue.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioQueue.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AudioQueue_h__(lua_State *L)
{
    AudioQueue_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueue_h__(lua_State *L)
{
    AudioQueue_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidBuffer(lua_State *L)
{
    AudioQueueErr_InvalidBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_BufferEmpty(lua_State *L)
{
    AudioQueueErr_BufferEmpty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_DisposalPending(lua_State *L)
{
    AudioQueueErr_DisposalPending(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidProperty(lua_State *L)
{
    AudioQueueErr_InvalidProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidPropertySize(lua_State *L)
{
    AudioQueueErr_InvalidPropertySize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidParameter(lua_State *L)
{
    AudioQueueErr_InvalidParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_CannotStart(lua_State *L)
{
    AudioQueueErr_CannotStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidDevice(lua_State *L)
{
    AudioQueueErr_InvalidDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_BufferInQueue(lua_State *L)
{
    AudioQueueErr_BufferInQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidRunState(lua_State *L)
{
    AudioQueueErr_InvalidRunState(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidQueueType(lua_State *L)
{
    AudioQueueErr_InvalidQueueType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_Permissions(lua_State *L)
{
    AudioQueueErr_Permissions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidPropertyValue(lua_State *L)
{
    AudioQueueErr_InvalidPropertyValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_PrimeTimedOut(lua_State *L)
{
    AudioQueueErr_PrimeTimedOut(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_CodecNotFound(lua_State *L)
{
    AudioQueueErr_CodecNotFound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidCodecAccess(lua_State *L)
{
    AudioQueueErr_InvalidCodecAccess(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_QueueInvalidated(lua_State *L)
{
    AudioQueueErr_QueueInvalidated(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_TooManyTaps(lua_State *L)
{
    AudioQueueErr_TooManyTaps(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidTapContext(lua_State *L)
{
    AudioQueueErr_InvalidTapContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_RecordUnderrun(lua_State *L)
{
    AudioQueueErr_RecordUnderrun(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_EnqueueDuringReset(lua_State *L)
{
    AudioQueueErr_EnqueueDuringReset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidOfflineMode(lua_State *L)
{
    AudioQueueErr_InvalidOfflineMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueSetOfflineRenderFormat(lua_State *L)
{
    AudioQueueSetOfflineRenderFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidBuffer(lua_State *L)
{
    AudioQueueErr_InvalidBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_BufferEmpty(lua_State *L)
{
    AudioQueueErr_BufferEmpty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_DisposalPending(lua_State *L)
{
    AudioQueueErr_DisposalPending(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidProperty(lua_State *L)
{
    AudioQueueErr_InvalidProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidPropertySize(lua_State *L)
{
    AudioQueueErr_InvalidPropertySize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidParameter(lua_State *L)
{
    AudioQueueErr_InvalidParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_CannotStart(lua_State *L)
{
    AudioQueueErr_CannotStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidDevice(lua_State *L)
{
    AudioQueueErr_InvalidDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_BufferInQueue(lua_State *L)
{
    AudioQueueErr_BufferInQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidRunState(lua_State *L)
{
    AudioQueueErr_InvalidRunState(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidQueueType(lua_State *L)
{
    AudioQueueErr_InvalidQueueType(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_Permissions(lua_State *L)
{
    AudioQueueErr_Permissions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidPropertyValue(lua_State *L)
{
    AudioQueueErr_InvalidPropertyValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_PrimeTimedOut(lua_State *L)
{
    AudioQueueErr_PrimeTimedOut(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_CodecNotFound(lua_State *L)
{
    AudioQueueErr_CodecNotFound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidCodecAccess(lua_State *L)
{
    AudioQueueErr_InvalidCodecAccess(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_QueueInvalidated(lua_State *L)
{
    AudioQueueErr_QueueInvalidated(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_RecordUnderrun(lua_State *L)
{
    AudioQueueErr_RecordUnderrun(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_EnqueueDuringReset(lua_State *L)
{
    AudioQueueErr_EnqueueDuringReset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueErr_InvalidOfflineMode(lua_State *L)
{
    AudioQueueErr_InvalidOfflineMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_IsRunning(lua_State *L)
{
    AudioQueueProperty_IsRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceProperty_SampleRate(lua_State *L)
{
    AudioQueueDeviceProperty_SampleRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceProperty_NumberChannels(lua_State *L)
{
    AudioQueueDeviceProperty_NumberChannels(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_CurrentDevice(lua_State *L)
{
    AudioQueueProperty_CurrentDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_MagicCookie(lua_State *L)
{
    AudioQueueProperty_MagicCookie(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_MaximumOutputPacketSize(lua_State *L)
{
    AudioQueueProperty_MaximumOutputPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_StreamDescription(lua_State *L)
{
    AudioQueueProperty_StreamDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_ChannelLayout(lua_State *L)
{
    AudioQueueProperty_ChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_EnableLevelMetering(lua_State *L)
{
    AudioQueueProperty_EnableLevelMetering(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_CurrentLevelMeter(lua_State *L)
{
    AudioQueueProperty_CurrentLevelMeter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueLevelMeter(lua_State *L)
{
    AudioQueueLevelMeter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueLevelMeters(lua_State *L)
{
    AudioQueueLevelMeters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_CurrentLevelMeterDB(lua_State *L)
{
    AudioQueueProperty_CurrentLevelMeterDB(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueLevelMeter(lua_State *L)
{
    AudioQueueLevelMeter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueLevelMeters(lua_State *L)
{
    AudioQueueLevelMeters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_DecodeBufferSizeFrames(lua_State *L)
{
    AudioQueueProperty_DecodeBufferSizeFrames(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_ConverterError(lua_State *L)
{
    AudioQueueProperty_ConverterError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_EnableTimePitch(lua_State *L)
{
    AudioQueueProperty_EnableTimePitch(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_TimePitchAlgorithm(lua_State *L)
{
    AudioQueueProperty_TimePitchAlgorithm(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueTimePitchAlgorithm_Spectral(lua_State *L)
{
    AudioQueueTimePitchAlgorithm_Spectral(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueTimePitchAlgorithm_TimeDomain(lua_State *L)
{
    AudioQueueTimePitchAlgorithm_TimeDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_TimePitchBypass(lua_State *L)
{
    AudioQueueProperty_TimePitchBypass(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyID(lua_State *L)
{
    AudioQueuePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_IsRunning(lua_State *L)
{
    AudioQueueProperty_IsRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceProperty_SampleRate(lua_State *L)
{
    AudioQueueDeviceProperty_SampleRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceProperty_NumberChannels(lua_State *L)
{
    AudioQueueDeviceProperty_NumberChannels(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_CurrentDevice(lua_State *L)
{
    AudioQueueProperty_CurrentDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_MagicCookie(lua_State *L)
{
    AudioQueueProperty_MagicCookie(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_MaximumOutputPacketSize(lua_State *L)
{
    AudioQueueProperty_MaximumOutputPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_StreamDescription(lua_State *L)
{
    AudioQueueProperty_StreamDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_ChannelLayout(lua_State *L)
{
    AudioQueueProperty_ChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_EnableLevelMetering(lua_State *L)
{
    AudioQueueProperty_EnableLevelMetering(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_CurrentLevelMeter(lua_State *L)
{
    AudioQueueProperty_CurrentLevelMeter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_CurrentLevelMeterDB(lua_State *L)
{
    AudioQueueProperty_CurrentLevelMeterDB(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_DecodeBufferSizeFrames(lua_State *L)
{
    AudioQueueProperty_DecodeBufferSizeFrames(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_ConverterError(lua_State *L)
{
    AudioQueueProperty_ConverterError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_EnableTimePitch(lua_State *L)
{
    AudioQueueProperty_EnableTimePitch(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_TimePitchAlgorithm(lua_State *L)
{
    AudioQueueProperty_TimePitchAlgorithm(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_TimePitchBypass(lua_State *L)
{
    AudioQueueProperty_TimePitchBypass(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_TimePitchAlgorithm(lua_State *L)
{
    AudioQueueProperty_TimePitchAlgorithm(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueTimePitchAlgorithm_Spectral(lua_State *L)
{
    AudioQueueTimePitchAlgorithm_Spectral(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueTimePitchAlgorithm_TimeDomain(lua_State *L)
{
    AudioQueueTimePitchAlgorithm_TimeDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_HardwareCodecPolicy(lua_State *L)
{
    AudioQueueProperty_HardwareCodecPolicy(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy(lua_State *L)
{
    AudioQueueHardwareCodecPolicy(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_HardwareCodecPolicy(lua_State *L)
{
    AudioQueueProperty_HardwareCodecPolicy(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy(lua_State *L)
{
    AudioQueueHardwareCodecPolicy(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_HardwareCodecPolicy(lua_State *L)
{
    AudioQueueProperty_HardwareCodecPolicy(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy_Default(lua_State *L)
{
    AudioQueueHardwareCodecPolicy_Default(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy_UseSoftwareOnly(lua_State *L)
{
    AudioQueueHardwareCodecPolicy_UseSoftwareOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy_UseHardwareOnly(lua_State *L)
{
    AudioQueueHardwareCodecPolicy_UseHardwareOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy_PreferSoftware(lua_State *L)
{
    AudioQueueHardwareCodecPolicy_PreferSoftware(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy_PreferHardware(lua_State *L)
{
    AudioQueueHardwareCodecPolicy_PreferHardware(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy_Default(lua_State *L)
{
    AudioQueueHardwareCodecPolicy_Default(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy_UseSoftwareOnly(lua_State *L)
{
    AudioQueueHardwareCodecPolicy_UseSoftwareOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy_UseHardwareOnly(lua_State *L)
{
    AudioQueueHardwareCodecPolicy_UseHardwareOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy_PreferSoftware(lua_State *L)
{
    AudioQueueHardwareCodecPolicy_PreferSoftware(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueHardwareCodecPolicy_PreferHardware(lua_State *L)
{
    AudioQueueHardwareCodecPolicy_PreferHardware(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterID(lua_State *L)
{
    AudioQueueParameterID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueSetParameter(lua_State *L)
{
    AudioQueueSetParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetParameter(lua_State *L)
{
    AudioQueueGetParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_Volume(lua_State *L)
{
    AudioQueueParam_Volume(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_PlayRate(lua_State *L)
{
    AudioQueueParam_PlayRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_Pitch(lua_State *L)
{
    AudioQueueParam_Pitch(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_VolumeRampTime(lua_State *L)
{
    AudioQueueParam_VolumeRampTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_VolumeRampTime(lua_State *L)
{
    AudioQueueParam_VolumeRampTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_Pan(lua_State *L)
{
    AudioQueueParam_Pan(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterID(lua_State *L)
{
    AudioQueueParameterID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_Volume(lua_State *L)
{
    AudioQueueParam_Volume(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_PlayRate(lua_State *L)
{
    AudioQueueParam_PlayRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_Pitch(lua_State *L)
{
    AudioQueueParam_Pitch(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_VolumeRampTime(lua_State *L)
{
    AudioQueueParam_VolumeRampTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_Pan(lua_State *L)
{
    AudioQueueParam_Pan(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyID(lua_State *L)
{
    AudioQueuePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyID(lua_State *L)
{
    AudioQueuePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterID(lua_State *L)
{
    AudioQueueParameterID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterID(lua_State *L)
{
    AudioQueueParameterID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterID(lua_State *L)
{
    AudioQueueParameterID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterValue(lua_State *L)
{
    AudioQueueParameterValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueTimelineRef(lua_State *L)
{
    AudioQueueTimelineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetCurrentTime(lua_State *L)
{
    AudioQueueGetCurrentTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueTimeline(lua_State *L)
{
    AudioQueueTimeline(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBuffer(lua_State *L)
{
    AudioQueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAllocateBuffer(lua_State *L)
{
    AudioQueueAllocateBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueFreeBuffer(lua_State *L)
{
    AudioQueueFreeBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAllocateBufferWithPacketDescriptions(lua_State *L)
{
    AudioQueueAllocateBufferWithPacketDescriptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBuffer(lua_State *L)
{
    AudioQueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBuffer(lua_State *L)
{
    AudioQueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBuffer(lua_State *L)
{
    AudioQueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBuffer(lua_State *L)
{
    AudioQueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBuffer(lua_State *L)
{
    AudioQueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterEvent(lua_State *L)
{
    AudioQueueParameterEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBufferWithParameters(lua_State *L)
{
    AudioQueueEnqueueBufferWithParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueSetParameter(lua_State *L)
{
    AudioQueueSetParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetParameter(lua_State *L)
{
    AudioQueueGetParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_Volume(lua_State *L)
{
    AudioQueueParam_Volume(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterEvent(lua_State *L)
{
    AudioQueueParameterEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterID(lua_State *L)
{
    AudioQueueParameterID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterValue(lua_State *L)
{
    AudioQueueParameterValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterEvent(lua_State *L)
{
    AudioQueueParameterEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueLevelMeterState(lua_State *L)
{
    AudioQueueLevelMeterState(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueLevelMeterState(lua_State *L)
{
    AudioQueueLevelMeterState(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueLevelMeterState(lua_State *L)
{
    AudioQueueLevelMeterState(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueOutputCallbackBlock(lua_State *L)
{
    AudioQueueOutputCallbackBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueOutputCallbackBlock(lua_State *L)
{
    AudioQueueOutputCallbackBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueInputCallbackBlock(lua_State *L)
{
    AudioQueueInputCallbackBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewInput(lua_State *L)
{
    AudioQueueNewInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueInputCallbackBlock(lua_State *L)
{
    AudioQueueInputCallbackBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueOutputCallback(lua_State *L)
{
    AudioQueueOutputCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewOutput(lua_State *L)
{
    AudioQueueNewOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueOutputCallback(lua_State *L)
{
    AudioQueueOutputCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueInputCallback(lua_State *L)
{
    AudioQueueInputCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewInput(lua_State *L)
{
    AudioQueueNewInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewInput(lua_State *L)
{
    AudioQueueNewInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueInputCallback(lua_State *L)
{
    AudioQueueInputCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyListenerProc(lua_State *L)
{
    AudioQueuePropertyListenerProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAddPropertyListener(lua_State *L)
{
    AudioQueueAddPropertyListener(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAddPropertyListener(lua_State *L)
{
    AudioQueueAddPropertyListener(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyListenerProc(lua_State *L)
{
    AudioQueuePropertyListenerProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyID(lua_State *L)
{
    AudioQueuePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewOutput(lua_State *L)
{
    AudioQueueNewOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBuffer(lua_State *L)
{
    AudioQueueEnqueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBufferWithParameters(lua_State *L)
{
    AudioQueueEnqueueBufferWithParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewOutput(lua_State *L)
{
    AudioQueueNewOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueOutputCallback(lua_State *L)
{
    AudioQueueOutputCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewInput(lua_State *L)
{
    AudioQueueNewInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBuffer(lua_State *L)
{
    AudioQueueEnqueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewInput(lua_State *L)
{
    AudioQueueNewInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueInputCallback(lua_State *L)
{
    AudioQueueInputCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewOutputWithDispatchQueue(lua_State *L)
{
    AudioQueueNewOutputWithDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBuffer(lua_State *L)
{
    AudioQueueEnqueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBufferWithParameters(lua_State *L)
{
    AudioQueueEnqueueBufferWithParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewOutputWithDispatchQueue(lua_State *L)
{
    AudioQueueNewOutputWithDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueOutputCallbackBlock(lua_State *L)
{
    AudioQueueOutputCallbackBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewInputWithDispatchQueue(lua_State *L)
{
    AudioQueueNewInputWithDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBuffer(lua_State *L)
{
    AudioQueueEnqueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueNewInputWithDispatchQueue(lua_State *L)
{
    AudioQueueNewInputWithDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueInputCallbackBlock(lua_State *L)
{
    AudioQueueInputCallbackBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDispose(lua_State *L)
{
    AudioQueueDispose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDispose(lua_State *L)
{
    AudioQueueDispose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDispose(lua_State *L)
{
    AudioQueueDispose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAllocateBuffer(lua_State *L)
{
    AudioQueueAllocateBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBuffer(lua_State *L)
{
    AudioQueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBuffer(lua_State *L)
{
    AudioQueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAllocateBuffer(lua_State *L)
{
    AudioQueueAllocateBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAllocateBuffer(lua_State *L)
{
    AudioQueueAllocateBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBuffer(lua_State *L)
{
    AudioQueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBuffer(lua_State *L)
{
    AudioQueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAllocateBufferWithPacketDescriptions(lua_State *L)
{
    AudioQueueAllocateBufferWithPacketDescriptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueFreeBuffer(lua_State *L)
{
    AudioQueueFreeBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAllocateBuffer(lua_State *L)
{
    AudioQueueAllocateBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueFreeBuffer(lua_State *L)
{
    AudioQueueFreeBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBuffer(lua_State *L)
{
    AudioQueueEnqueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAllocateBufferWithPacketDescriptions(lua_State *L)
{
    AudioQueueAllocateBufferWithPacketDescriptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBuffer(lua_State *L)
{
    AudioQueueEnqueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBufferWithParameters(lua_State *L)
{
    AudioQueueEnqueueBufferWithParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBuffer(lua_State *L)
{
    AudioQueueEnqueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAllocateBufferWithPacketDescriptions(lua_State *L)
{
    AudioQueueAllocateBufferWithPacketDescriptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_Volume(lua_State *L)
{
    AudioQueueParam_Volume(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueStop(lua_State *L)
{
    AudioQueueStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBufferWithParameters(lua_State *L)
{
    AudioQueueEnqueueBufferWithParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBufferWithParameters(lua_State *L)
{
    AudioQueueEnqueueBufferWithParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRef(lua_State *L)
{
    AudioQueueRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterEvent(lua_State *L)
{
    AudioQueueParameterEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueStart(lua_State *L)
{
    AudioQueueStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueStart(lua_State *L)
{
    AudioQueueStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePrime(lua_State *L)
{
    AudioQueuePrime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueEnqueueBuffer(lua_State *L)
{
    AudioQueueEnqueueBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePrime(lua_State *L)
{
    AudioQueuePrime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueStart(lua_State *L)
{
    AudioQueueStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePrime(lua_State *L)
{
    AudioQueuePrime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueStop(lua_State *L)
{
    AudioQueueStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueStop(lua_State *L)
{
    AudioQueueStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueStop(lua_State *L)
{
    AudioQueueStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePause(lua_State *L)
{
    AudioQueuePause(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueStart(lua_State *L)
{
    AudioQueueStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePause(lua_State *L)
{
    AudioQueuePause(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueFlush(lua_State *L)
{
    AudioQueueFlush(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueFlush(lua_State *L)
{
    AudioQueueFlush(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueFlush(lua_State *L)
{
    AudioQueueFlush(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueStop(lua_State *L)
{
    AudioQueueStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueFlush(lua_State *L)
{
    AudioQueueFlush(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueReset(lua_State *L)
{
    AudioQueueReset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueReset(lua_State *L)
{
    AudioQueueReset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueReset(lua_State *L)
{
    AudioQueueReset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetParameter(lua_State *L)
{
    AudioQueueGetParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParam_Volume(lua_State *L)
{
    AudioQueueParam_Volume(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetParameter(lua_State *L)
{
    AudioQueueGetParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterID(lua_State *L)
{
    AudioQueueParameterID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterValue(lua_State *L)
{
    AudioQueueParameterValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueSetParameter(lua_State *L)
{
    AudioQueueSetParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueSetParameter(lua_State *L)
{
    AudioQueueSetParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterID(lua_State *L)
{
    AudioQueueParameterID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueParameterValue(lua_State *L)
{
    AudioQueueParameterValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetProperty(lua_State *L)
{
    AudioQueueGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetProperty(lua_State *L)
{
    AudioQueueGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyID(lua_State *L)
{
    AudioQueuePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueSetProperty(lua_State *L)
{
    AudioQueueSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueSetProperty(lua_State *L)
{
    AudioQueueSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyID(lua_State *L)
{
    AudioQueuePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetPropertySize(lua_State *L)
{
    AudioQueueGetPropertySize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetPropertySize(lua_State *L)
{
    AudioQueueGetPropertySize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyID(lua_State *L)
{
    AudioQueuePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAddPropertyListener(lua_State *L)
{
    AudioQueueAddPropertyListener(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_IsRunning(lua_State *L)
{
    AudioQueueProperty_IsRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueProperty_IsRunning(lua_State *L)
{
    AudioQueueProperty_IsRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAddPropertyListener(lua_State *L)
{
    AudioQueueAddPropertyListener(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyID(lua_State *L)
{
    AudioQueuePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyListenerProc(lua_State *L)
{
    AudioQueuePropertyListenerProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRemovePropertyListener(lua_State *L)
{
    AudioQueueRemovePropertyListener(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueAddPropertyListener(lua_State *L)
{
    AudioQueueAddPropertyListener(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueRemovePropertyListener(lua_State *L)
{
    AudioQueueRemovePropertyListener(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyID(lua_State *L)
{
    AudioQueuePropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueuePropertyListenerProc(lua_State *L)
{
    AudioQueuePropertyListenerProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueCreateTimeline(lua_State *L)
{
    AudioQueueCreateTimeline(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetCurrentTime(lua_State *L)
{
    AudioQueueGetCurrentTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueCreateTimeline(lua_State *L)
{
    AudioQueueCreateTimeline(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueTimelineRef(lua_State *L)
{
    AudioQueueTimelineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDisposeTimeline(lua_State *L)
{
    AudioQueueDisposeTimeline(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDisposeTimeline(lua_State *L)
{
    AudioQueueDisposeTimeline(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueTimelineRef(lua_State *L)
{
    AudioQueueTimelineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetCurrentTime(lua_State *L)
{
    AudioQueueGetCurrentTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueGetCurrentTime(lua_State *L)
{
    AudioQueueGetCurrentTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueTimelineRef(lua_State *L)
{
    AudioQueueTimelineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceGetCurrentTime(lua_State *L)
{
    AudioQueueDeviceGetCurrentTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceGetCurrentTime(lua_State *L)
{
    AudioQueueDeviceGetCurrentTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceTranslateTime(lua_State *L)
{
    AudioQueueDeviceTranslateTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceTranslateTime(lua_State *L)
{
    AudioQueueDeviceTranslateTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceTranslateTime(lua_State *L)
{
    AudioQueueDeviceTranslateTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceGetNearestStartTime(lua_State *L)
{
    AudioQueueDeviceGetNearestStartTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueDeviceGetNearestStartTime(lua_State *L)
{
    AudioQueueDeviceGetNearestStartTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueSetOfflineRenderFormat(lua_State *L)
{
    AudioQueueSetOfflineRenderFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueSetOfflineRenderFormat(lua_State *L)
{
    AudioQueueSetOfflineRenderFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueSetOfflineRenderFormat(lua_State *L)
{
    AudioQueueSetOfflineRenderFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueOfflineRender(lua_State *L)
{
    AudioQueueOfflineRender(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueOfflineRender(lua_State *L)
{
    AudioQueueOfflineRender(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueueBufferRef(lua_State *L)
{
    AudioQueueBufferRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioQueue_h__(lua_State *L)
{
    AudioQueue_h__(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAudioQueueAPIs[] = {
    {"AudioQueue_h__", lua_AudioQueue_h__},
    {"AudioQueue_h__", lua_AudioQueue_h__},
    {"AudioQueueErr_InvalidBuffer", lua_AudioQueueErr_InvalidBuffer},
    {"AudioQueueErr_BufferEmpty", lua_AudioQueueErr_BufferEmpty},
    {"AudioQueueErr_DisposalPending", lua_AudioQueueErr_DisposalPending},
    {"AudioQueueErr_InvalidProperty", lua_AudioQueueErr_InvalidProperty},
    {"AudioQueueErr_InvalidPropertySize", lua_AudioQueueErr_InvalidPropertySize},
    {"AudioQueueErr_InvalidParameter", lua_AudioQueueErr_InvalidParameter},
    {"AudioQueueErr_CannotStart", lua_AudioQueueErr_CannotStart},
    {"AudioQueueErr_InvalidDevice", lua_AudioQueueErr_InvalidDevice},
    {"AudioQueueErr_BufferInQueue", lua_AudioQueueErr_BufferInQueue},
    {"AudioQueueErr_InvalidRunState", lua_AudioQueueErr_InvalidRunState},
    {"AudioQueueErr_InvalidQueueType", lua_AudioQueueErr_InvalidQueueType},
    {"AudioQueueErr_Permissions", lua_AudioQueueErr_Permissions},
    {"AudioQueueErr_InvalidPropertyValue", lua_AudioQueueErr_InvalidPropertyValue},
    {"AudioQueueErr_PrimeTimedOut", lua_AudioQueueErr_PrimeTimedOut},
    {"AudioQueueErr_CodecNotFound", lua_AudioQueueErr_CodecNotFound},
    {"AudioQueueErr_InvalidCodecAccess", lua_AudioQueueErr_InvalidCodecAccess},
    {"AudioQueueErr_QueueInvalidated", lua_AudioQueueErr_QueueInvalidated},
    {"AudioQueueErr_TooManyTaps", lua_AudioQueueErr_TooManyTaps},
    {"AudioQueueErr_InvalidTapContext", lua_AudioQueueErr_InvalidTapContext},
    {"AudioQueueErr_RecordUnderrun", lua_AudioQueueErr_RecordUnderrun},
    {"AudioQueueErr_EnqueueDuringReset", lua_AudioQueueErr_EnqueueDuringReset},
    {"AudioQueueErr_InvalidOfflineMode", lua_AudioQueueErr_InvalidOfflineMode},
    {"AudioQueueSetOfflineRenderFormat", lua_AudioQueueSetOfflineRenderFormat},
    {"AudioQueueErr_InvalidBuffer", lua_AudioQueueErr_InvalidBuffer},
    {"AudioQueueErr_BufferEmpty", lua_AudioQueueErr_BufferEmpty},
    {"AudioQueueErr_DisposalPending", lua_AudioQueueErr_DisposalPending},
    {"AudioQueueErr_InvalidProperty", lua_AudioQueueErr_InvalidProperty},
    {"AudioQueueErr_InvalidPropertySize", lua_AudioQueueErr_InvalidPropertySize},
    {"AudioQueueErr_InvalidParameter", lua_AudioQueueErr_InvalidParameter},
    {"AudioQueueErr_CannotStart", lua_AudioQueueErr_CannotStart},
    {"AudioQueueErr_InvalidDevice", lua_AudioQueueErr_InvalidDevice},
    {"AudioQueueErr_BufferInQueue", lua_AudioQueueErr_BufferInQueue},
    {"AudioQueueErr_InvalidRunState", lua_AudioQueueErr_InvalidRunState},
    {"AudioQueueErr_InvalidQueueType", lua_AudioQueueErr_InvalidQueueType},
    {"AudioQueueErr_Permissions", lua_AudioQueueErr_Permissions},
    {"AudioQueueErr_InvalidPropertyValue", lua_AudioQueueErr_InvalidPropertyValue},
    {"AudioQueueErr_PrimeTimedOut", lua_AudioQueueErr_PrimeTimedOut},
    {"AudioQueueErr_CodecNotFound", lua_AudioQueueErr_CodecNotFound},
    {"AudioQueueErr_InvalidCodecAccess", lua_AudioQueueErr_InvalidCodecAccess},
    {"AudioQueueErr_QueueInvalidated", lua_AudioQueueErr_QueueInvalidated},
    {"AudioQueueErr_RecordUnderrun", lua_AudioQueueErr_RecordUnderrun},
    {"AudioQueueErr_EnqueueDuringReset", lua_AudioQueueErr_EnqueueDuringReset},
    {"AudioQueueErr_InvalidOfflineMode", lua_AudioQueueErr_InvalidOfflineMode},
    {"AudioQueueProperty_IsRunning", lua_AudioQueueProperty_IsRunning},
    {"AudioQueueDeviceProperty_SampleRate", lua_AudioQueueDeviceProperty_SampleRate},
    {"AudioQueueDeviceProperty_NumberChannels", lua_AudioQueueDeviceProperty_NumberChannels},
    {"AudioQueueProperty_CurrentDevice", lua_AudioQueueProperty_CurrentDevice},
    {"AudioQueueProperty_MagicCookie", lua_AudioQueueProperty_MagicCookie},
    {"AudioQueueProperty_MaximumOutputPacketSize", lua_AudioQueueProperty_MaximumOutputPacketSize},
    {"AudioQueueProperty_StreamDescription", lua_AudioQueueProperty_StreamDescription},
    {"AudioQueueProperty_ChannelLayout", lua_AudioQueueProperty_ChannelLayout},
    {"AudioQueueProperty_EnableLevelMetering", lua_AudioQueueProperty_EnableLevelMetering},
    {"AudioQueueProperty_CurrentLevelMeter", lua_AudioQueueProperty_CurrentLevelMeter},
    {"AudioQueueLevelMeter", lua_AudioQueueLevelMeter},
    {"AudioQueueLevelMeters", lua_AudioQueueLevelMeters},
    {"AudioQueueProperty_CurrentLevelMeterDB", lua_AudioQueueProperty_CurrentLevelMeterDB},
    {"AudioQueueLevelMeter", lua_AudioQueueLevelMeter},
    {"AudioQueueLevelMeters", lua_AudioQueueLevelMeters},
    {"AudioQueueProperty_DecodeBufferSizeFrames", lua_AudioQueueProperty_DecodeBufferSizeFrames},
    {"AudioQueueProperty_ConverterError", lua_AudioQueueProperty_ConverterError},
    {"AudioQueueProperty_EnableTimePitch", lua_AudioQueueProperty_EnableTimePitch},
    {"AudioQueueProperty_TimePitchAlgorithm", lua_AudioQueueProperty_TimePitchAlgorithm},
    {"AudioQueueTimePitchAlgorithm_Spectral", lua_AudioQueueTimePitchAlgorithm_Spectral},
    {"AudioQueueTimePitchAlgorithm_TimeDomain", lua_AudioQueueTimePitchAlgorithm_TimeDomain},
    {"AudioQueueProperty_TimePitchBypass", lua_AudioQueueProperty_TimePitchBypass},
    {"AudioQueuePropertyID", lua_AudioQueuePropertyID},
    {"AudioQueueProperty_IsRunning", lua_AudioQueueProperty_IsRunning},
    {"AudioQueueDeviceProperty_SampleRate", lua_AudioQueueDeviceProperty_SampleRate},
    {"AudioQueueDeviceProperty_NumberChannels", lua_AudioQueueDeviceProperty_NumberChannels},
    {"AudioQueueProperty_CurrentDevice", lua_AudioQueueProperty_CurrentDevice},
    {"AudioQueueProperty_MagicCookie", lua_AudioQueueProperty_MagicCookie},
    {"AudioQueueProperty_MaximumOutputPacketSize", lua_AudioQueueProperty_MaximumOutputPacketSize},
    {"AudioQueueProperty_StreamDescription", lua_AudioQueueProperty_StreamDescription},
    {"AudioQueueProperty_ChannelLayout", lua_AudioQueueProperty_ChannelLayout},
    {"AudioQueueProperty_EnableLevelMetering", lua_AudioQueueProperty_EnableLevelMetering},
    {"AudioQueueProperty_CurrentLevelMeter", lua_AudioQueueProperty_CurrentLevelMeter},
    {"AudioQueueProperty_CurrentLevelMeterDB", lua_AudioQueueProperty_CurrentLevelMeterDB},
    {"AudioQueueProperty_DecodeBufferSizeFrames", lua_AudioQueueProperty_DecodeBufferSizeFrames},
    {"AudioQueueProperty_ConverterError", lua_AudioQueueProperty_ConverterError},
    {"AudioQueueProperty_EnableTimePitch", lua_AudioQueueProperty_EnableTimePitch},
    {"AudioQueueProperty_TimePitchAlgorithm", lua_AudioQueueProperty_TimePitchAlgorithm},
    {"AudioQueueProperty_TimePitchBypass", lua_AudioQueueProperty_TimePitchBypass},
    {"AudioQueueProperty_TimePitchAlgorithm", lua_AudioQueueProperty_TimePitchAlgorithm},
    {"AudioQueueTimePitchAlgorithm_Spectral", lua_AudioQueueTimePitchAlgorithm_Spectral},
    {"AudioQueueTimePitchAlgorithm_TimeDomain", lua_AudioQueueTimePitchAlgorithm_TimeDomain},
    {"AudioQueueProperty_HardwareCodecPolicy", lua_AudioQueueProperty_HardwareCodecPolicy},
    {"AudioQueueHardwareCodecPolicy", lua_AudioQueueHardwareCodecPolicy},
    {"AudioQueueProperty_HardwareCodecPolicy", lua_AudioQueueProperty_HardwareCodecPolicy},
    {"AudioQueueHardwareCodecPolicy", lua_AudioQueueHardwareCodecPolicy},
    {"AudioQueueProperty_HardwareCodecPolicy", lua_AudioQueueProperty_HardwareCodecPolicy},
    {"AudioQueueHardwareCodecPolicy_Default", lua_AudioQueueHardwareCodecPolicy_Default},
    {"AudioQueueHardwareCodecPolicy_UseSoftwareOnly", lua_AudioQueueHardwareCodecPolicy_UseSoftwareOnly},
    {"AudioQueueHardwareCodecPolicy_UseHardwareOnly", lua_AudioQueueHardwareCodecPolicy_UseHardwareOnly},
    {"AudioQueueHardwareCodecPolicy_PreferSoftware", lua_AudioQueueHardwareCodecPolicy_PreferSoftware},
    {"AudioQueueHardwareCodecPolicy_PreferHardware", lua_AudioQueueHardwareCodecPolicy_PreferHardware},
    {"AudioQueueHardwareCodecPolicy_Default", lua_AudioQueueHardwareCodecPolicy_Default},
    {"AudioQueueHardwareCodecPolicy_UseSoftwareOnly", lua_AudioQueueHardwareCodecPolicy_UseSoftwareOnly},
    {"AudioQueueHardwareCodecPolicy_UseHardwareOnly", lua_AudioQueueHardwareCodecPolicy_UseHardwareOnly},
    {"AudioQueueHardwareCodecPolicy_PreferSoftware", lua_AudioQueueHardwareCodecPolicy_PreferSoftware},
    {"AudioQueueHardwareCodecPolicy_PreferHardware", lua_AudioQueueHardwareCodecPolicy_PreferHardware},
    {"AudioQueueParameterID", lua_AudioQueueParameterID},
    {"AudioQueueSetParameter", lua_AudioQueueSetParameter},
    {"AudioQueueGetParameter", lua_AudioQueueGetParameter},
    {"AudioQueueParam_Volume", lua_AudioQueueParam_Volume},
    {"AudioQueueParam_PlayRate", lua_AudioQueueParam_PlayRate},
    {"AudioQueueParam_Pitch", lua_AudioQueueParam_Pitch},
    {"AudioQueueParam_VolumeRampTime", lua_AudioQueueParam_VolumeRampTime},
    {"AudioQueueParam_VolumeRampTime", lua_AudioQueueParam_VolumeRampTime},
    {"AudioQueueParam_Pan", lua_AudioQueueParam_Pan},
    {"AudioQueueParameterID", lua_AudioQueueParameterID},
    {"AudioQueueParam_Volume", lua_AudioQueueParam_Volume},
    {"AudioQueueParam_PlayRate", lua_AudioQueueParam_PlayRate},
    {"AudioQueueParam_Pitch", lua_AudioQueueParam_Pitch},
    {"AudioQueueParam_VolumeRampTime", lua_AudioQueueParam_VolumeRampTime},
    {"AudioQueueParam_Pan", lua_AudioQueueParam_Pan},
    {"AudioQueuePropertyID", lua_AudioQueuePropertyID},
    {"AudioQueuePropertyID", lua_AudioQueuePropertyID},
    {"AudioQueueParameterID", lua_AudioQueueParameterID},
    {"AudioQueueParameterID", lua_AudioQueueParameterID},
    {"AudioQueueParameterID", lua_AudioQueueParameterID},
    {"AudioQueueParameterValue", lua_AudioQueueParameterValue},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueueTimelineRef", lua_AudioQueueTimelineRef},
    {"AudioQueueGetCurrentTime", lua_AudioQueueGetCurrentTime},
    {"AudioQueueTimeline", lua_AudioQueueTimeline},
    {"AudioQueueBuffer", lua_AudioQueueBuffer},
    {"AudioQueueAllocateBuffer", lua_AudioQueueAllocateBuffer},
    {"AudioQueueFreeBuffer", lua_AudioQueueFreeBuffer},
    {"AudioQueueAllocateBufferWithPacketDescriptions", lua_AudioQueueAllocateBufferWithPacketDescriptions},
    {"AudioQueueBuffer", lua_AudioQueueBuffer},
    {"AudioQueueBuffer", lua_AudioQueueBuffer},
    {"AudioQueueBuffer", lua_AudioQueueBuffer},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueueBuffer", lua_AudioQueueBuffer},
    {"AudioQueueBuffer", lua_AudioQueueBuffer},
    {"AudioQueueParameterEvent", lua_AudioQueueParameterEvent},
    {"AudioQueueEnqueueBufferWithParameters", lua_AudioQueueEnqueueBufferWithParameters},
    {"AudioQueueSetParameter", lua_AudioQueueSetParameter},
    {"AudioQueueGetParameter", lua_AudioQueueGetParameter},
    {"AudioQueueParam_Volume", lua_AudioQueueParam_Volume},
    {"AudioQueueParameterEvent", lua_AudioQueueParameterEvent},
    {"AudioQueueParameterID", lua_AudioQueueParameterID},
    {"AudioQueueParameterValue", lua_AudioQueueParameterValue},
    {"AudioQueueParameterEvent", lua_AudioQueueParameterEvent},
    {"AudioQueueLevelMeterState", lua_AudioQueueLevelMeterState},
    {"AudioQueueLevelMeterState", lua_AudioQueueLevelMeterState},
    {"AudioQueueLevelMeterState", lua_AudioQueueLevelMeterState},
    {"AudioQueueOutputCallbackBlock", lua_AudioQueueOutputCallbackBlock},
    {"AudioQueueOutputCallbackBlock", lua_AudioQueueOutputCallbackBlock},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueueInputCallbackBlock", lua_AudioQueueInputCallbackBlock},
    {"AudioQueueNewInput", lua_AudioQueueNewInput},
    {"AudioQueueInputCallbackBlock", lua_AudioQueueInputCallbackBlock},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueueOutputCallback", lua_AudioQueueOutputCallback},
    {"AudioQueueNewOutput", lua_AudioQueueNewOutput},
    {"AudioQueueOutputCallback", lua_AudioQueueOutputCallback},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueueInputCallback", lua_AudioQueueInputCallback},
    {"AudioQueueNewInput", lua_AudioQueueNewInput},
    {"AudioQueueNewInput", lua_AudioQueueNewInput},
    {"AudioQueueInputCallback", lua_AudioQueueInputCallback},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueuePropertyListenerProc", lua_AudioQueuePropertyListenerProc},
    {"AudioQueueAddPropertyListener", lua_AudioQueueAddPropertyListener},
    {"AudioQueueAddPropertyListener", lua_AudioQueueAddPropertyListener},
    {"AudioQueuePropertyListenerProc", lua_AudioQueuePropertyListenerProc},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueuePropertyID", lua_AudioQueuePropertyID},
    {"AudioQueueNewOutput", lua_AudioQueueNewOutput},
    {"AudioQueueEnqueueBuffer", lua_AudioQueueEnqueueBuffer},
    {"AudioQueueEnqueueBufferWithParameters", lua_AudioQueueEnqueueBufferWithParameters},
    {"AudioQueueNewOutput", lua_AudioQueueNewOutput},
    {"AudioQueueOutputCallback", lua_AudioQueueOutputCallback},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueueNewInput", lua_AudioQueueNewInput},
    {"AudioQueueEnqueueBuffer", lua_AudioQueueEnqueueBuffer},
    {"AudioQueueNewInput", lua_AudioQueueNewInput},
    {"AudioQueueInputCallback", lua_AudioQueueInputCallback},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueueNewOutputWithDispatchQueue", lua_AudioQueueNewOutputWithDispatchQueue},
    {"AudioQueueEnqueueBuffer", lua_AudioQueueEnqueueBuffer},
    {"AudioQueueEnqueueBufferWithParameters", lua_AudioQueueEnqueueBufferWithParameters},
    {"AudioQueueNewOutputWithDispatchQueue", lua_AudioQueueNewOutputWithDispatchQueue},
    {"AudioQueueOutputCallbackBlock", lua_AudioQueueOutputCallbackBlock},
    {"AudioQueueNewInputWithDispatchQueue", lua_AudioQueueNewInputWithDispatchQueue},
    {"AudioQueueEnqueueBuffer", lua_AudioQueueEnqueueBuffer},
    {"AudioQueueNewInputWithDispatchQueue", lua_AudioQueueNewInputWithDispatchQueue},
    {"AudioQueueInputCallbackBlock", lua_AudioQueueInputCallbackBlock},
    {"AudioQueueDispose", lua_AudioQueueDispose},
    {"AudioQueueDispose", lua_AudioQueueDispose},
    {"AudioQueueDispose", lua_AudioQueueDispose},
    {"AudioQueueAllocateBuffer", lua_AudioQueueAllocateBuffer},
    {"AudioQueueBuffer", lua_AudioQueueBuffer},
    {"AudioQueueBuffer", lua_AudioQueueBuffer},
    {"AudioQueueAllocateBuffer", lua_AudioQueueAllocateBuffer},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueueAllocateBuffer", lua_AudioQueueAllocateBuffer},
    {"AudioQueueBuffer", lua_AudioQueueBuffer},
    {"AudioQueueBuffer", lua_AudioQueueBuffer},
    {"AudioQueueAllocateBufferWithPacketDescriptions", lua_AudioQueueAllocateBufferWithPacketDescriptions},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueueFreeBuffer", lua_AudioQueueFreeBuffer},
    {"AudioQueueAllocateBuffer", lua_AudioQueueAllocateBuffer},
    {"AudioQueueFreeBuffer", lua_AudioQueueFreeBuffer},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueueEnqueueBuffer", lua_AudioQueueEnqueueBuffer},
    {"AudioQueueAllocateBufferWithPacketDescriptions", lua_AudioQueueAllocateBufferWithPacketDescriptions},
    {"AudioQueueEnqueueBuffer", lua_AudioQueueEnqueueBuffer},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueueEnqueueBufferWithParameters", lua_AudioQueueEnqueueBufferWithParameters},
    {"AudioQueueEnqueueBuffer", lua_AudioQueueEnqueueBuffer},
    {"AudioQueueAllocateBufferWithPacketDescriptions", lua_AudioQueueAllocateBufferWithPacketDescriptions},
    {"AudioQueueParam_Volume", lua_AudioQueueParam_Volume},
    {"AudioQueueStop", lua_AudioQueueStop},
    {"AudioQueueEnqueueBufferWithParameters", lua_AudioQueueEnqueueBufferWithParameters},
    {"AudioQueueEnqueueBufferWithParameters", lua_AudioQueueEnqueueBufferWithParameters},
    {"AudioQueueRef", lua_AudioQueueRef},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueueParameterEvent", lua_AudioQueueParameterEvent},
    {"AudioQueueStart", lua_AudioQueueStart},
    {"AudioQueueStart", lua_AudioQueueStart},
    {"AudioQueuePrime", lua_AudioQueuePrime},
    {"AudioQueueEnqueueBuffer", lua_AudioQueueEnqueueBuffer},
    {"AudioQueuePrime", lua_AudioQueuePrime},
    {"AudioQueueStart", lua_AudioQueueStart},
    {"AudioQueuePrime", lua_AudioQueuePrime},
    {"AudioQueueStop", lua_AudioQueueStop},
    {"AudioQueueStop", lua_AudioQueueStop},
    {"AudioQueueStop", lua_AudioQueueStop},
    {"AudioQueuePause", lua_AudioQueuePause},
    {"AudioQueueStart", lua_AudioQueueStart},
    {"AudioQueuePause", lua_AudioQueuePause},
    {"AudioQueueFlush", lua_AudioQueueFlush},
    {"AudioQueueFlush", lua_AudioQueueFlush},
    {"AudioQueueFlush", lua_AudioQueueFlush},
    {"AudioQueueStop", lua_AudioQueueStop},
    {"AudioQueueFlush", lua_AudioQueueFlush},
    {"AudioQueueReset", lua_AudioQueueReset},
    {"AudioQueueReset", lua_AudioQueueReset},
    {"AudioQueueReset", lua_AudioQueueReset},
    {"AudioQueueGetParameter", lua_AudioQueueGetParameter},
    {"AudioQueueParam_Volume", lua_AudioQueueParam_Volume},
    {"AudioQueueGetParameter", lua_AudioQueueGetParameter},
    {"AudioQueueParameterID", lua_AudioQueueParameterID},
    {"AudioQueueParameterValue", lua_AudioQueueParameterValue},
    {"AudioQueueSetParameter", lua_AudioQueueSetParameter},
    {"AudioQueueSetParameter", lua_AudioQueueSetParameter},
    {"AudioQueueParameterID", lua_AudioQueueParameterID},
    {"AudioQueueParameterValue", lua_AudioQueueParameterValue},
    {"AudioQueueGetProperty", lua_AudioQueueGetProperty},
    {"AudioQueueGetProperty", lua_AudioQueueGetProperty},
    {"AudioQueuePropertyID", lua_AudioQueuePropertyID},
    {"AudioQueueSetProperty", lua_AudioQueueSetProperty},
    {"AudioQueueSetProperty", lua_AudioQueueSetProperty},
    {"AudioQueuePropertyID", lua_AudioQueuePropertyID},
    {"AudioQueueGetPropertySize", lua_AudioQueueGetPropertySize},
    {"AudioQueueGetPropertySize", lua_AudioQueueGetPropertySize},
    {"AudioQueuePropertyID", lua_AudioQueuePropertyID},
    {"AudioQueueAddPropertyListener", lua_AudioQueueAddPropertyListener},
    {"AudioQueueProperty_IsRunning", lua_AudioQueueProperty_IsRunning},
    {"AudioQueueProperty_IsRunning", lua_AudioQueueProperty_IsRunning},
    {"AudioQueueAddPropertyListener", lua_AudioQueueAddPropertyListener},
    {"AudioQueuePropertyID", lua_AudioQueuePropertyID},
    {"AudioQueuePropertyListenerProc", lua_AudioQueuePropertyListenerProc},
    {"AudioQueueRemovePropertyListener", lua_AudioQueueRemovePropertyListener},
    {"AudioQueueAddPropertyListener", lua_AudioQueueAddPropertyListener},
    {"AudioQueueRemovePropertyListener", lua_AudioQueueRemovePropertyListener},
    {"AudioQueuePropertyID", lua_AudioQueuePropertyID},
    {"AudioQueuePropertyListenerProc", lua_AudioQueuePropertyListenerProc},
    {"AudioQueueCreateTimeline", lua_AudioQueueCreateTimeline},
    {"AudioQueueGetCurrentTime", lua_AudioQueueGetCurrentTime},
    {"AudioQueueCreateTimeline", lua_AudioQueueCreateTimeline},
    {"AudioQueueTimelineRef", lua_AudioQueueTimelineRef},
    {"AudioQueueDisposeTimeline", lua_AudioQueueDisposeTimeline},
    {"AudioQueueDisposeTimeline", lua_AudioQueueDisposeTimeline},
    {"AudioQueueTimelineRef", lua_AudioQueueTimelineRef},
    {"AudioQueueGetCurrentTime", lua_AudioQueueGetCurrentTime},
    {"AudioQueueGetCurrentTime", lua_AudioQueueGetCurrentTime},
    {"AudioQueueTimelineRef", lua_AudioQueueTimelineRef},
    {"AudioQueueDeviceGetCurrentTime", lua_AudioQueueDeviceGetCurrentTime},
    {"AudioQueueDeviceGetCurrentTime", lua_AudioQueueDeviceGetCurrentTime},
    {"AudioQueueDeviceTranslateTime", lua_AudioQueueDeviceTranslateTime},
    {"AudioQueueDeviceTranslateTime", lua_AudioQueueDeviceTranslateTime},
    {"AudioQueueDeviceTranslateTime", lua_AudioQueueDeviceTranslateTime},
    {"AudioQueueDeviceGetNearestStartTime", lua_AudioQueueDeviceGetNearestStartTime},
    {"AudioQueueDeviceGetNearestStartTime", lua_AudioQueueDeviceGetNearestStartTime},
    {"AudioQueueSetOfflineRenderFormat", lua_AudioQueueSetOfflineRenderFormat},
    {"AudioQueueSetOfflineRenderFormat", lua_AudioQueueSetOfflineRenderFormat},
    {"AudioQueueSetOfflineRenderFormat", lua_AudioQueueSetOfflineRenderFormat},
    {"AudioQueueOfflineRender", lua_AudioQueueOfflineRender},
    {"AudioQueueOfflineRender", lua_AudioQueueOfflineRender},
    {"AudioQueueBufferRef", lua_AudioQueueBufferRef},
    {"AudioQueue_h__", lua_AudioQueue_h__},
    {NULL, NULL},
};

int LuaOpenAudioQueue(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioQueueAPIs);
    return 0;
}
