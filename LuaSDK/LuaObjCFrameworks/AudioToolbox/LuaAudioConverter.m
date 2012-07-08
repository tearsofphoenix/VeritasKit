//
//  LuaAudioConverter.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioConverter.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AudioConverter_h__(lua_State *L)
{
    AudioConverter_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverter_h__(lua_State *L)
{
    AudioConverter_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverters(lua_State *L)
{
    AudioConverters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterRef(lua_State *L)
{
    AudioConverterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterRef(lua_State *L)
{
    AudioConverterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyID(lua_State *L)
{
    AudioConverterPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyID(lua_State *L)
{
    AudioConverterPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterGetProperty(lua_State *L)
{
    AudioConverterGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSetProperty(lua_State *L)
{
    AudioConverterSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyMinimumInputBufferSize(lua_State *L)
{
    AudioConverterPropertyMinimumInputBufferSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterInputProc(lua_State *L)
{
    AudioConverterInputProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterConvertBuffer(lua_State *L)
{
    AudioConverterConvertBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyMinimumOutputBufferSize(lua_State *L)
{
    AudioConverterPropertyMinimumOutputBufferSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterConvertBuffer(lua_State *L)
{
    AudioConverterConvertBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyMaximumInputBufferSize(lua_State *L)
{
    AudioConverterPropertyMaximumInputBufferSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyMaximumInputPacketSize(lua_State *L)
{
    AudioConverterPropertyMaximumInputPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyMaximumOutputPacketSize(lua_State *L)
{
    AudioConverterPropertyMaximumOutputPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyCalculateInputBufferSize(lua_State *L)
{
    AudioConverterPropertyCalculateInputBufferSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyCalculateOutputBufferSize(lua_State *L)
{
    AudioConverterPropertyCalculateOutputBufferSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyInputCodecParameters(lua_State *L)
{
    AudioConverterPropertyInputCodecParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyOutputCodecParameters(lua_State *L)
{
    AudioConverterPropertyOutputCodecParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterAlgorithm(lua_State *L)
{
    AudioConverterSampleRateConverterAlgorithm(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterComplexity(lua_State *L)
{
    AudioConverterSampleRateConverterComplexity(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterComplexity(lua_State *L)
{
    AudioConverterSampleRateConverterComplexity(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterQuality(lua_State *L)
{
    AudioConverterSampleRateConverterQuality(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterInitialPhase(lua_State *L)
{
    AudioConverterSampleRateConverterInitialPhase(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterCodecQuality(lua_State *L)
{
    AudioConverterCodecQuality(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeMethod(lua_State *L)
{
    AudioConverterPrimeMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeInfo(lua_State *L)
{
    AudioConverterPrimeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeInfo(lua_State *L)
{
    AudioConverterPrimeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeInfo(lua_State *L)
{
    AudioConverterPrimeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeInfo(lua_State *L)
{
    AudioConverterPrimeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterChannelMap(lua_State *L)
{
    AudioConverterChannelMap(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSetProperty(lua_State *L)
{
    AudioConverterSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterDecompressionMagicCookie(lua_State *L)
{
    AudioConverterDecompressionMagicCookie(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterCompressionMagicCookie(lua_State *L)
{
    AudioConverterCompressionMagicCookie(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterEncodeBitRate(lua_State *L)
{
    AudioConverterEncodeBitRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterEncodeAdjustableSampleRate(lua_State *L)
{
    AudioConverterEncodeAdjustableSampleRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterInputChannelLayout(lua_State *L)
{
    AudioConverterInputChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterOutputChannelLayout(lua_State *L)
{
    AudioConverterOutputChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterApplicableEncodeBitRates(lua_State *L)
{
    AudioConverterApplicableEncodeBitRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterAvailableEncodeBitRates(lua_State *L)
{
    AudioConverterAvailableEncodeBitRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterApplicableEncodeSampleRates(lua_State *L)
{
    AudioConverterApplicableEncodeSampleRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterAvailableEncodeSampleRates(lua_State *L)
{
    AudioConverterAvailableEncodeSampleRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterAvailableEncodeChannelLayoutTags(lua_State *L)
{
    AudioConverterAvailableEncodeChannelLayoutTags(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterCurrentOutputStreamDescription(lua_State *L)
{
    AudioConverterCurrentOutputStreamDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterCurrentInputStreamDescription(lua_State *L)
{
    AudioConverterCurrentInputStreamDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertySettings(lua_State *L)
{
    AudioConverterPropertySettings(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyBitDepthHint(lua_State *L)
{
    AudioConverterPropertyBitDepthHint(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyFormatList(lua_State *L)
{
    AudioConverterPropertyFormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyID(lua_State *L)
{
    AudioConverterPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyMinimumInputBufferSize(lua_State *L)
{
    AudioConverterPropertyMinimumInputBufferSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyMinimumOutputBufferSize(lua_State *L)
{
    AudioConverterPropertyMinimumOutputBufferSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyMaximumInputBufferSize(lua_State *L)
{
    AudioConverterPropertyMaximumInputBufferSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyMaximumInputPacketSize(lua_State *L)
{
    AudioConverterPropertyMaximumInputPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyMaximumOutputPacketSize(lua_State *L)
{
    AudioConverterPropertyMaximumOutputPacketSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyCalculateInputBufferSize(lua_State *L)
{
    AudioConverterPropertyCalculateInputBufferSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyCalculateOutputBufferSize(lua_State *L)
{
    AudioConverterPropertyCalculateOutputBufferSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyInputCodecParameters(lua_State *L)
{
    AudioConverterPropertyInputCodecParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyOutputCodecParameters(lua_State *L)
{
    AudioConverterPropertyOutputCodecParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterAlgorithm(lua_State *L)
{
    AudioConverterSampleRateConverterAlgorithm(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterComplexity(lua_State *L)
{
    AudioConverterSampleRateConverterComplexity(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterQuality(lua_State *L)
{
    AudioConverterSampleRateConverterQuality(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterInitialPhase(lua_State *L)
{
    AudioConverterSampleRateConverterInitialPhase(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterCodecQuality(lua_State *L)
{
    AudioConverterCodecQuality(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeMethod(lua_State *L)
{
    AudioConverterPrimeMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeInfo(lua_State *L)
{
    AudioConverterPrimeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterChannelMap(lua_State *L)
{
    AudioConverterChannelMap(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterDecompressionMagicCookie(lua_State *L)
{
    AudioConverterDecompressionMagicCookie(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterCompressionMagicCookie(lua_State *L)
{
    AudioConverterCompressionMagicCookie(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterEncodeBitRate(lua_State *L)
{
    AudioConverterEncodeBitRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterEncodeAdjustableSampleRate(lua_State *L)
{
    AudioConverterEncodeAdjustableSampleRate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterInputChannelLayout(lua_State *L)
{
    AudioConverterInputChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterOutputChannelLayout(lua_State *L)
{
    AudioConverterOutputChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterApplicableEncodeBitRates(lua_State *L)
{
    AudioConverterApplicableEncodeBitRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterAvailableEncodeBitRates(lua_State *L)
{
    AudioConverterAvailableEncodeBitRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterApplicableEncodeSampleRates(lua_State *L)
{
    AudioConverterApplicableEncodeSampleRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterAvailableEncodeSampleRates(lua_State *L)
{
    AudioConverterAvailableEncodeSampleRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterAvailableEncodeChannelLayoutTags(lua_State *L)
{
    AudioConverterAvailableEncodeChannelLayoutTags(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterCurrentOutputStreamDescription(lua_State *L)
{
    AudioConverterCurrentOutputStreamDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterCurrentInputStreamDescription(lua_State *L)
{
    AudioConverterCurrentInputStreamDescription(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertySettings(lua_State *L)
{
    AudioConverterPropertySettings(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyBitDepthHint(lua_State *L)
{
    AudioConverterPropertyBitDepthHint(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyFormatList(lua_State *L)
{
    AudioConverterPropertyFormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyID(lua_State *L)
{
    AudioConverterPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterGetProperty(lua_State *L)
{
    AudioConverterGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSetProperty(lua_State *L)
{
    AudioConverterSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyCanResumeFromInterruption(lua_State *L)
{
    AudioConverterPropertyCanResumeFromInterruption(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterGetProperty(lua_State *L)
{
    AudioConverterGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyCanResumeFromInterruption(lua_State *L)
{
    AudioConverterPropertyCanResumeFromInterruption(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterQuality(lua_State *L)
{
    AudioConverterSampleRateConverterQuality(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterQuality_Max(lua_State *L)
{
    AudioConverterQuality_Max(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterQuality_High(lua_State *L)
{
    AudioConverterQuality_High(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterQuality_Medium(lua_State *L)
{
    AudioConverterQuality_Medium(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterQuality_Low(lua_State *L)
{
    AudioConverterQuality_Low(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterQuality_Min(lua_State *L)
{
    AudioConverterQuality_Min(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterQuality_Max(lua_State *L)
{
    AudioConverterQuality_Max(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterQuality_High(lua_State *L)
{
    AudioConverterQuality_High(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterQuality_Medium(lua_State *L)
{
    AudioConverterQuality_Medium(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterQuality_Low(lua_State *L)
{
    AudioConverterQuality_Low(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterQuality_Min(lua_State *L)
{
    AudioConverterQuality_Min(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterComplexity_Linear(lua_State *L)
{
    AudioConverterSampleRateConverterComplexity_Linear(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterComplexity_Normal(lua_State *L)
{
    AudioConverterSampleRateConverterComplexity_Normal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterComplexity_Mastering(lua_State *L)
{
    AudioConverterSampleRateConverterComplexity_Mastering(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterComplexity_Linear(lua_State *L)
{
    AudioConverterSampleRateConverterComplexity_Linear(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterComplexity_Normal(lua_State *L)
{
    AudioConverterSampleRateConverterComplexity_Normal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSampleRateConverterComplexity_Mastering(lua_State *L)
{
    AudioConverterSampleRateConverterComplexity_Mastering(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeMethod(lua_State *L)
{
    AudioConverterPrimeMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeInfo(lua_State *L)
{
    AudioConverterPrimeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterReset(lua_State *L)
{
    AudioConverterReset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeInfo(lua_State *L)
{
    AudioConverterPrimeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPrimeInfo(lua_State *L)
{
    AudioConverterPrimeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_FormatNotSupported(lua_State *L)
{
    AudioConverterErr_FormatNotSupported(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_OperationNotSupported(lua_State *L)
{
    AudioConverterErr_OperationNotSupported(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_PropertyNotSupported(lua_State *L)
{
    AudioConverterErr_PropertyNotSupported(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_InvalidInputSize(lua_State *L)
{
    AudioConverterErr_InvalidInputSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_InvalidOutputSize(lua_State *L)
{
    AudioConverterErr_InvalidOutputSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_UnspecifiedError(lua_State *L)
{
    AudioConverterErr_UnspecifiedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_BadPropertySizeError(lua_State *L)
{
    AudioConverterErr_BadPropertySizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_RequiresPacketDescriptionsError(lua_State *L)
{
    AudioConverterErr_RequiresPacketDescriptionsError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_InputSampleRateOutOfRange(lua_State *L)
{
    AudioConverterErr_InputSampleRateOutOfRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_OutputSampleRateOutOfRange(lua_State *L)
{
    AudioConverterErr_OutputSampleRateOutOfRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_HardwareInUse(lua_State *L)
{
    AudioConverterErr_HardwareInUse(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyCanResumeFromInterruption(lua_State *L)
{
    AudioConverterPropertyCanResumeFromInterruption(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_NoHardwarePermission(lua_State *L)
{
    AudioConverterErr_NoHardwarePermission(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterNew(lua_State *L)
{
    AudioConverterNew(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_HardwareInUse(lua_State *L)
{
    AudioConverterErr_HardwareInUse(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterErr_NoHardwarePermission(lua_State *L)
{
    AudioConverterErr_NoHardwarePermission(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterNew(lua_State *L)
{
    AudioConverterNew(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterChannelMap(lua_State *L)
{
    AudioConverterChannelMap(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterNew(lua_State *L)
{
    AudioConverterNew(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterRef(lua_State *L)
{
    AudioConverterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterNewSpecific(lua_State *L)
{
    AudioConverterNewSpecific(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterNew(lua_State *L)
{
    AudioConverterNew(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterNewSpecific(lua_State *L)
{
    AudioConverterNewSpecific(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterRef(lua_State *L)
{
    AudioConverterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterDispose(lua_State *L)
{
    AudioConverterDispose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterDispose(lua_State *L)
{
    AudioConverterDispose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterReset(lua_State *L)
{
    AudioConverterReset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterReset(lua_State *L)
{
    AudioConverterReset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterGetPropertyInfo(lua_State *L)
{
    AudioConverterGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterGetPropertyInfo(lua_State *L)
{
    AudioConverterGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyID(lua_State *L)
{
    AudioConverterPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterGetProperty(lua_State *L)
{
    AudioConverterGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterGetProperty(lua_State *L)
{
    AudioConverterGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyID(lua_State *L)
{
    AudioConverterPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSetProperty(lua_State *L)
{
    AudioConverterSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterSetProperty(lua_State *L)
{
    AudioConverterSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterPropertyID(lua_State *L)
{
    AudioConverterPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterInputDataProc(lua_State *L)
{
    AudioConverterInputDataProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillBuffer(lua_State *L)
{
    AudioConverterFillBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillBuffer(lua_State *L)
{
    AudioConverterFillBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillBuffer(lua_State *L)
{
    AudioConverterFillBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillBuffer(lua_State *L)
{
    AudioConverterFillBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterInputDataProc(lua_State *L)
{
    AudioConverterInputDataProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillBuffer(lua_State *L)
{
    AudioConverterFillBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillBuffer(lua_State *L)
{
    AudioConverterFillBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterInputDataProc(lua_State *L)
{
    AudioConverterInputDataProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterConvertBuffer(lua_State *L)
{
    AudioConverterConvertBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterConvertBuffer(lua_State *L)
{
    AudioConverterConvertBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterComplexInputDataProc(lua_State *L)
{
    AudioConverterComplexInputDataProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterComplexInputDataProc(lua_State *L)
{
    AudioConverterComplexInputDataProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterComplexInputDataProc(lua_State *L)
{
    AudioConverterComplexInputDataProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterConvertComplexBuffer(lua_State *L)
{
    AudioConverterConvertComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterFillComplexBuffer(lua_State *L)
{
    AudioConverterFillComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioConverterConvertComplexBuffer(lua_State *L)
{
    AudioConverterConvertComplexBuffer(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAudioConverterAPIs[] = {
    {"AudioConverter_h__", lua_AudioConverter_h__},
    {"AudioConverter_h__", lua_AudioConverter_h__},
    {"AudioConverters", lua_AudioConverters},
    {"AudioConverterRef", lua_AudioConverterRef},
    {"AudioConverterRef", lua_AudioConverterRef},
    {"AudioConverterPropertyID", lua_AudioConverterPropertyID},
    {"AudioConverterPropertyID", lua_AudioConverterPropertyID},
    {"AudioConverterGetProperty", lua_AudioConverterGetProperty},
    {"AudioConverterSetProperty", lua_AudioConverterSetProperty},
    {"AudioConverterPropertyMinimumInputBufferSize", lua_AudioConverterPropertyMinimumInputBufferSize},
    {"AudioConverterInputProc", lua_AudioConverterInputProc},
    {"AudioConverterConvertBuffer", lua_AudioConverterConvertBuffer},
    {"AudioConverterPropertyMinimumOutputBufferSize", lua_AudioConverterPropertyMinimumOutputBufferSize},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterConvertBuffer", lua_AudioConverterConvertBuffer},
    {"AudioConverterPropertyMaximumInputBufferSize", lua_AudioConverterPropertyMaximumInputBufferSize},
    {"AudioConverterPropertyMaximumInputPacketSize", lua_AudioConverterPropertyMaximumInputPacketSize},
    {"AudioConverterPropertyMaximumOutputPacketSize", lua_AudioConverterPropertyMaximumOutputPacketSize},
    {"AudioConverterPropertyCalculateInputBufferSize", lua_AudioConverterPropertyCalculateInputBufferSize},
    {"AudioConverterPropertyCalculateOutputBufferSize", lua_AudioConverterPropertyCalculateOutputBufferSize},
    {"AudioConverterPropertyInputCodecParameters", lua_AudioConverterPropertyInputCodecParameters},
    {"AudioConverterPropertyOutputCodecParameters", lua_AudioConverterPropertyOutputCodecParameters},
    {"AudioConverterSampleRateConverterAlgorithm", lua_AudioConverterSampleRateConverterAlgorithm},
    {"AudioConverterSampleRateConverterComplexity", lua_AudioConverterSampleRateConverterComplexity},
    {"AudioConverterSampleRateConverterComplexity", lua_AudioConverterSampleRateConverterComplexity},
    {"AudioConverterSampleRateConverterQuality", lua_AudioConverterSampleRateConverterQuality},
    {"AudioConverterSampleRateConverterInitialPhase", lua_AudioConverterSampleRateConverterInitialPhase},
    {"AudioConverterCodecQuality", lua_AudioConverterCodecQuality},
    {"AudioConverterPrimeMethod", lua_AudioConverterPrimeMethod},
    {"AudioConverterPrimeInfo", lua_AudioConverterPrimeInfo},
    {"AudioConverterPrimeInfo", lua_AudioConverterPrimeInfo},
    {"AudioConverterPrimeInfo", lua_AudioConverterPrimeInfo},
    {"AudioConverterPrimeInfo", lua_AudioConverterPrimeInfo},
    {"AudioConverterChannelMap", lua_AudioConverterChannelMap},
    {"AudioConverterSetProperty", lua_AudioConverterSetProperty},
    {"AudioConverterDecompressionMagicCookie", lua_AudioConverterDecompressionMagicCookie},
    {"AudioConverterCompressionMagicCookie", lua_AudioConverterCompressionMagicCookie},
    {"AudioConverterEncodeBitRate", lua_AudioConverterEncodeBitRate},
    {"AudioConverterEncodeAdjustableSampleRate", lua_AudioConverterEncodeAdjustableSampleRate},
    {"AudioConverterInputChannelLayout", lua_AudioConverterInputChannelLayout},
    {"AudioConverterOutputChannelLayout", lua_AudioConverterOutputChannelLayout},
    {"AudioConverterApplicableEncodeBitRates", lua_AudioConverterApplicableEncodeBitRates},
    {"AudioConverterAvailableEncodeBitRates", lua_AudioConverterAvailableEncodeBitRates},
    {"AudioConverterApplicableEncodeSampleRates", lua_AudioConverterApplicableEncodeSampleRates},
    {"AudioConverterAvailableEncodeSampleRates", lua_AudioConverterAvailableEncodeSampleRates},
    {"AudioConverterAvailableEncodeChannelLayoutTags", lua_AudioConverterAvailableEncodeChannelLayoutTags},
    {"AudioConverterCurrentOutputStreamDescription", lua_AudioConverterCurrentOutputStreamDescription},
    {"AudioConverterCurrentInputStreamDescription", lua_AudioConverterCurrentInputStreamDescription},
    {"AudioConverterPropertySettings", lua_AudioConverterPropertySettings},
    {"AudioConverterPropertyBitDepthHint", lua_AudioConverterPropertyBitDepthHint},
    {"AudioConverterPropertyFormatList", lua_AudioConverterPropertyFormatList},
    {"AudioConverterPropertyID", lua_AudioConverterPropertyID},
    {"AudioConverterPropertyMinimumInputBufferSize", lua_AudioConverterPropertyMinimumInputBufferSize},
    {"AudioConverterPropertyMinimumOutputBufferSize", lua_AudioConverterPropertyMinimumOutputBufferSize},
    {"AudioConverterPropertyMaximumInputBufferSize", lua_AudioConverterPropertyMaximumInputBufferSize},
    {"AudioConverterPropertyMaximumInputPacketSize", lua_AudioConverterPropertyMaximumInputPacketSize},
    {"AudioConverterPropertyMaximumOutputPacketSize", lua_AudioConverterPropertyMaximumOutputPacketSize},
    {"AudioConverterPropertyCalculateInputBufferSize", lua_AudioConverterPropertyCalculateInputBufferSize},
    {"AudioConverterPropertyCalculateOutputBufferSize", lua_AudioConverterPropertyCalculateOutputBufferSize},
    {"AudioConverterPropertyInputCodecParameters", lua_AudioConverterPropertyInputCodecParameters},
    {"AudioConverterPropertyOutputCodecParameters", lua_AudioConverterPropertyOutputCodecParameters},
    {"AudioConverterSampleRateConverterAlgorithm", lua_AudioConverterSampleRateConverterAlgorithm},
    {"AudioConverterSampleRateConverterComplexity", lua_AudioConverterSampleRateConverterComplexity},
    {"AudioConverterSampleRateConverterQuality", lua_AudioConverterSampleRateConverterQuality},
    {"AudioConverterSampleRateConverterInitialPhase", lua_AudioConverterSampleRateConverterInitialPhase},
    {"AudioConverterCodecQuality", lua_AudioConverterCodecQuality},
    {"AudioConverterPrimeMethod", lua_AudioConverterPrimeMethod},
    {"AudioConverterPrimeInfo", lua_AudioConverterPrimeInfo},
    {"AudioConverterChannelMap", lua_AudioConverterChannelMap},
    {"AudioConverterDecompressionMagicCookie", lua_AudioConverterDecompressionMagicCookie},
    {"AudioConverterCompressionMagicCookie", lua_AudioConverterCompressionMagicCookie},
    {"AudioConverterEncodeBitRate", lua_AudioConverterEncodeBitRate},
    {"AudioConverterEncodeAdjustableSampleRate", lua_AudioConverterEncodeAdjustableSampleRate},
    {"AudioConverterInputChannelLayout", lua_AudioConverterInputChannelLayout},
    {"AudioConverterOutputChannelLayout", lua_AudioConverterOutputChannelLayout},
    {"AudioConverterApplicableEncodeBitRates", lua_AudioConverterApplicableEncodeBitRates},
    {"AudioConverterAvailableEncodeBitRates", lua_AudioConverterAvailableEncodeBitRates},
    {"AudioConverterApplicableEncodeSampleRates", lua_AudioConverterApplicableEncodeSampleRates},
    {"AudioConverterAvailableEncodeSampleRates", lua_AudioConverterAvailableEncodeSampleRates},
    {"AudioConverterAvailableEncodeChannelLayoutTags", lua_AudioConverterAvailableEncodeChannelLayoutTags},
    {"AudioConverterCurrentOutputStreamDescription", lua_AudioConverterCurrentOutputStreamDescription},
    {"AudioConverterCurrentInputStreamDescription", lua_AudioConverterCurrentInputStreamDescription},
    {"AudioConverterPropertySettings", lua_AudioConverterPropertySettings},
    {"AudioConverterPropertyBitDepthHint", lua_AudioConverterPropertyBitDepthHint},
    {"AudioConverterPropertyFormatList", lua_AudioConverterPropertyFormatList},
    {"AudioConverterPropertyID", lua_AudioConverterPropertyID},
    {"AudioConverterGetProperty", lua_AudioConverterGetProperty},
    {"AudioConverterSetProperty", lua_AudioConverterSetProperty},
    {"AudioConverterPropertyCanResumeFromInterruption", lua_AudioConverterPropertyCanResumeFromInterruption},
    {"AudioConverterGetProperty", lua_AudioConverterGetProperty},
    {"AudioConverterPropertyCanResumeFromInterruption", lua_AudioConverterPropertyCanResumeFromInterruption},
    {"AudioConverterSampleRateConverterQuality", lua_AudioConverterSampleRateConverterQuality},
    {"AudioConverterQuality_Max", lua_AudioConverterQuality_Max},
    {"AudioConverterQuality_High", lua_AudioConverterQuality_High},
    {"AudioConverterQuality_Medium", lua_AudioConverterQuality_Medium},
    {"AudioConverterQuality_Low", lua_AudioConverterQuality_Low},
    {"AudioConverterQuality_Min", lua_AudioConverterQuality_Min},
    {"AudioConverterQuality_Max", lua_AudioConverterQuality_Max},
    {"AudioConverterQuality_High", lua_AudioConverterQuality_High},
    {"AudioConverterQuality_Medium", lua_AudioConverterQuality_Medium},
    {"AudioConverterQuality_Low", lua_AudioConverterQuality_Low},
    {"AudioConverterQuality_Min", lua_AudioConverterQuality_Min},
    {"AudioConverterSampleRateConverterComplexity_Linear", lua_AudioConverterSampleRateConverterComplexity_Linear},
    {"AudioConverterSampleRateConverterComplexity_Normal", lua_AudioConverterSampleRateConverterComplexity_Normal},
    {"AudioConverterSampleRateConverterComplexity_Mastering", lua_AudioConverterSampleRateConverterComplexity_Mastering},
    {"AudioConverterSampleRateConverterComplexity_Linear", lua_AudioConverterSampleRateConverterComplexity_Linear},
    {"AudioConverterSampleRateConverterComplexity_Normal", lua_AudioConverterSampleRateConverterComplexity_Normal},
    {"AudioConverterSampleRateConverterComplexity_Mastering", lua_AudioConverterSampleRateConverterComplexity_Mastering},
    {"AudioConverterPrimeMethod", lua_AudioConverterPrimeMethod},
    {"AudioConverterPrimeInfo", lua_AudioConverterPrimeInfo},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterReset", lua_AudioConverterReset},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterPrimeInfo", lua_AudioConverterPrimeInfo},
    {"AudioConverterPrimeInfo", lua_AudioConverterPrimeInfo},
    {"AudioConverterErr_FormatNotSupported", lua_AudioConverterErr_FormatNotSupported},
    {"AudioConverterErr_OperationNotSupported", lua_AudioConverterErr_OperationNotSupported},
    {"AudioConverterErr_PropertyNotSupported", lua_AudioConverterErr_PropertyNotSupported},
    {"AudioConverterErr_InvalidInputSize", lua_AudioConverterErr_InvalidInputSize},
    {"AudioConverterErr_InvalidOutputSize", lua_AudioConverterErr_InvalidOutputSize},
    {"AudioConverterErr_UnspecifiedError", lua_AudioConverterErr_UnspecifiedError},
    {"AudioConverterErr_BadPropertySizeError", lua_AudioConverterErr_BadPropertySizeError},
    {"AudioConverterErr_RequiresPacketDescriptionsError", lua_AudioConverterErr_RequiresPacketDescriptionsError},
    {"AudioConverterErr_InputSampleRateOutOfRange", lua_AudioConverterErr_InputSampleRateOutOfRange},
    {"AudioConverterErr_OutputSampleRateOutOfRange", lua_AudioConverterErr_OutputSampleRateOutOfRange},
    {"AudioConverterErr_HardwareInUse", lua_AudioConverterErr_HardwareInUse},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterPropertyCanResumeFromInterruption", lua_AudioConverterPropertyCanResumeFromInterruption},
    {"AudioConverterErr_NoHardwarePermission", lua_AudioConverterErr_NoHardwarePermission},
    {"AudioConverterNew", lua_AudioConverterNew},
    {"AudioConverterErr_HardwareInUse", lua_AudioConverterErr_HardwareInUse},
    {"AudioConverterErr_NoHardwarePermission", lua_AudioConverterErr_NoHardwarePermission},
    {"AudioConverterNew", lua_AudioConverterNew},
    {"AudioConverterChannelMap", lua_AudioConverterChannelMap},
    {"AudioConverterNew", lua_AudioConverterNew},
    {"AudioConverterRef", lua_AudioConverterRef},
    {"AudioConverterNewSpecific", lua_AudioConverterNewSpecific},
    {"AudioConverterNew", lua_AudioConverterNew},
    {"AudioConverterNewSpecific", lua_AudioConverterNewSpecific},
    {"AudioConverterRef", lua_AudioConverterRef},
    {"AudioConverterDispose", lua_AudioConverterDispose},
    {"AudioConverterDispose", lua_AudioConverterDispose},
    {"AudioConverterReset", lua_AudioConverterReset},
    {"AudioConverterReset", lua_AudioConverterReset},
    {"AudioConverterGetPropertyInfo", lua_AudioConverterGetPropertyInfo},
    {"AudioConverterGetPropertyInfo", lua_AudioConverterGetPropertyInfo},
    {"AudioConverterPropertyID", lua_AudioConverterPropertyID},
    {"AudioConverterGetProperty", lua_AudioConverterGetProperty},
    {"AudioConverterGetProperty", lua_AudioConverterGetProperty},
    {"AudioConverterPropertyID", lua_AudioConverterPropertyID},
    {"AudioConverterSetProperty", lua_AudioConverterSetProperty},
    {"AudioConverterSetProperty", lua_AudioConverterSetProperty},
    {"AudioConverterPropertyID", lua_AudioConverterPropertyID},
    {"AudioConverterInputDataProc", lua_AudioConverterInputDataProc},
    {"AudioConverterFillBuffer", lua_AudioConverterFillBuffer},
    {"AudioConverterFillBuffer", lua_AudioConverterFillBuffer},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterFillBuffer", lua_AudioConverterFillBuffer},
    {"AudioConverterFillBuffer", lua_AudioConverterFillBuffer},
    {"AudioConverterInputDataProc", lua_AudioConverterInputDataProc},
    {"AudioConverterFillBuffer", lua_AudioConverterFillBuffer},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterFillBuffer", lua_AudioConverterFillBuffer},
    {"AudioConverterInputDataProc", lua_AudioConverterInputDataProc},
    {"AudioConverterConvertBuffer", lua_AudioConverterConvertBuffer},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterConvertBuffer", lua_AudioConverterConvertBuffer},
    {"AudioConverterComplexInputDataProc", lua_AudioConverterComplexInputDataProc},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterComplexInputDataProc", lua_AudioConverterComplexInputDataProc},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterComplexInputDataProc", lua_AudioConverterComplexInputDataProc},
    {"AudioConverterConvertComplexBuffer", lua_AudioConverterConvertComplexBuffer},
    {"AudioConverterFillComplexBuffer", lua_AudioConverterFillComplexBuffer},
    {"AudioConverterConvertComplexBuffer", lua_AudioConverterConvertComplexBuffer},
    {NULL, NULL},
};

int LuaOpenAudioConverter(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioConverterAPIs);
    return 0;
}
