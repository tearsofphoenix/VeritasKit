//
//  LuaAudioFormat.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioFormat.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AudioFormat_h__(lua_State *L)
{
    AudioFormat_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormat_h__(lua_State *L)
{
    AudioFormat_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatPropertyID(lua_State *L)
{
    AudioFormatPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatPropertyID(lua_State *L)
{
    AudioFormatPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_PanningMatrix(lua_State *L)
{
    AudioFormatProperty_PanningMatrix(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_BalanceFade(lua_State *L)
{
    AudioFormatProperty_BalanceFade(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatInfo(lua_State *L)
{
    AudioFormatInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatList(lua_State *L)
{
    AudioFormatProperty_FormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatInfo(lua_State *L)
{
    AudioFormatInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatInfo(lua_State *L)
{
    AudioFormatInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatInfo(lua_State *L)
{
    AudioFormatInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatList(lua_State *L)
{
    AudioFormatProperty_FormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatInfo(lua_State *L)
{
    AudioFormatInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatInfo(lua_State *L)
{
    AudioFormatInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatListItem(lua_State *L)
{
    AudioFormatListItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatList(lua_State *L)
{
    AudioFormatProperty_FormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatListItem(lua_State *L)
{
    AudioFormatListItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatListItem(lua_State *L)
{
    AudioFormatListItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty(lua_State *L)
{
    AudioFormatProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatGetPropertyInfo(lua_State *L)
{
    AudioFormatGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatInfo(lua_State *L)
{
    AudioFormatProperty_FormatInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatIsVBR(lua_State *L)
{
    AudioFormatProperty_FormatIsVBR(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatIsExternallyFramed(lua_State *L)
{
    AudioFormatProperty_FormatIsExternallyFramed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatIsEncrypted(lua_State *L)
{
    AudioFormatProperty_FormatIsEncrypted(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_EncodeFormatIDs(lua_State *L)
{
    AudioFormatProperty_EncodeFormatIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_DecodeFormatIDs(lua_State *L)
{
    AudioFormatProperty_DecodeFormatIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_Encoders(lua_State *L)
{
    AudioFormatProperty_Encoders(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_Decoders(lua_State *L)
{
    AudioFormatProperty_Decoders(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_AvailableEncodeBitRates(lua_State *L)
{
    AudioFormatProperty_AvailableEncodeBitRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_AvailableEncodeSampleRates(lua_State *L)
{
    AudioFormatProperty_AvailableEncodeSampleRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_AvailableEncodeChannelLayoutTags(lua_State *L)
{
    AudioFormatProperty_AvailableEncodeChannelLayoutTags(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_AvailableEncodeNumberChannels(lua_State *L)
{
    AudioFormatProperty_AvailableEncodeNumberChannels(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatName(lua_State *L)
{
    AudioFormatProperty_FormatName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ASBDFromESDS(lua_State *L)
{
    AudioFormatProperty_ASBDFromESDS(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutFromESDS(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutFromESDS(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ASBDFromMPEGPacket(lua_State *L)
{
    AudioFormatProperty_ASBDFromMPEGPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatList(lua_State *L)
{
    AudioFormatProperty_FormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatListItem(lua_State *L)
{
    AudioFormatListItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatInfo(lua_State *L)
{
    AudioFormatInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatList(lua_State *L)
{
    AudioFormatProperty_FormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatListItem(lua_State *L)
{
    AudioFormatListItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatList(lua_State *L)
{
    AudioFormatProperty_FormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_OutputFormatList(lua_State *L)
{
    AudioFormatProperty_OutputFormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatListItem(lua_State *L)
{
    AudioFormatListItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatInfo(lua_State *L)
{
    AudioFormatInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FirstPlayableFormatFromList(lua_State *L)
{
    AudioFormatProperty_FirstPlayableFormatFromList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatListItem(lua_State *L)
{
    AudioFormatListItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ValidateChannelLayout(lua_State *L)
{
    AudioFormatProperty_ValidateChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatUnknownFormatError(lua_State *L)
{
    AudioFormatUnknownFormatError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutForTag(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutForTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_TagForChannelLayout(lua_State *L)
{
    AudioFormatProperty_TagForChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutForBitmap(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutForBitmap(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_BitmapForLayoutTag(lua_State *L)
{
    AudioFormatProperty_BitmapForLayoutTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_TagForChannelLayout(lua_State *L)
{
    AudioFormatProperty_TagForChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutName(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutSimpleName(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutSimpleName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutName(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelName(lua_State *L)
{
    AudioFormatProperty_ChannelName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelShortName(lua_State *L)
{
    AudioFormatProperty_ChannelShortName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_MatrixMixMap(lua_State *L)
{
    AudioFormatProperty_MatrixMixMap(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelMap(lua_State *L)
{
    AudioFormatProperty_ChannelMap(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_NumberOfChannelsForLayout(lua_State *L)
{
    AudioFormatProperty_NumberOfChannelsForLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_TagsForNumberOfChannels(lua_State *L)
{
    AudioFormatProperty_TagsForNumberOfChannels(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_PanningMatrix(lua_State *L)
{
    AudioFormatProperty_PanningMatrix(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_MatrixMixMap(lua_State *L)
{
    AudioFormatProperty_MatrixMixMap(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_BalanceFade(lua_State *L)
{
    AudioFormatProperty_BalanceFade(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ID3TagSize(lua_State *L)
{
    AudioFormatProperty_ID3TagSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ID3TagToDictionary(lua_State *L)
{
    AudioFormatProperty_ID3TagToDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatInfo(lua_State *L)
{
    AudioFormatProperty_FormatInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatName(lua_State *L)
{
    AudioFormatProperty_FormatName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_EncodeFormatIDs(lua_State *L)
{
    AudioFormatProperty_EncodeFormatIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_DecodeFormatIDs(lua_State *L)
{
    AudioFormatProperty_DecodeFormatIDs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatList(lua_State *L)
{
    AudioFormatProperty_FormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ASBDFromESDS(lua_State *L)
{
    AudioFormatProperty_ASBDFromESDS(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutFromESDS(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutFromESDS(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_OutputFormatList(lua_State *L)
{
    AudioFormatProperty_OutputFormatList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FirstPlayableFormatFromList(lua_State *L)
{
    AudioFormatProperty_FirstPlayableFormatFromList(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatIsVBR(lua_State *L)
{
    AudioFormatProperty_FormatIsVBR(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatIsExternallyFramed(lua_State *L)
{
    AudioFormatProperty_FormatIsExternallyFramed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_FormatIsEncrypted(lua_State *L)
{
    AudioFormatProperty_FormatIsEncrypted(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_Encoders(lua_State *L)
{
    AudioFormatProperty_Encoders(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_Decoders(lua_State *L)
{
    AudioFormatProperty_Decoders(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_AvailableEncodeBitRates(lua_State *L)
{
    AudioFormatProperty_AvailableEncodeBitRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_AvailableEncodeSampleRates(lua_State *L)
{
    AudioFormatProperty_AvailableEncodeSampleRates(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_AvailableEncodeChannelLayoutTags(lua_State *L)
{
    AudioFormatProperty_AvailableEncodeChannelLayoutTags(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_AvailableEncodeNumberChannels(lua_State *L)
{
    AudioFormatProperty_AvailableEncodeNumberChannels(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ASBDFromMPEGPacket(lua_State *L)
{
    AudioFormatProperty_ASBDFromMPEGPacket(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_BitmapForLayoutTag(lua_State *L)
{
    AudioFormatProperty_BitmapForLayoutTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_MatrixMixMap(lua_State *L)
{
    AudioFormatProperty_MatrixMixMap(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelMap(lua_State *L)
{
    AudioFormatProperty_ChannelMap(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_NumberOfChannelsForLayout(lua_State *L)
{
    AudioFormatProperty_NumberOfChannelsForLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ValidateChannelLayout(lua_State *L)
{
    AudioFormatProperty_ValidateChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutForTag(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutForTag(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_TagForChannelLayout(lua_State *L)
{
    AudioFormatProperty_TagForChannelLayout(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutName(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutSimpleName(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutSimpleName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelLayoutForBitmap(lua_State *L)
{
    AudioFormatProperty_ChannelLayoutForBitmap(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelName(lua_State *L)
{
    AudioFormatProperty_ChannelName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ChannelShortName(lua_State *L)
{
    AudioFormatProperty_ChannelShortName(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_TagsForNumberOfChannels(lua_State *L)
{
    AudioFormatProperty_TagsForNumberOfChannels(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_PanningMatrix(lua_State *L)
{
    AudioFormatProperty_PanningMatrix(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_BalanceFade(lua_State *L)
{
    AudioFormatProperty_BalanceFade(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ID3TagSize(lua_State *L)
{
    AudioFormatProperty_ID3TagSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_ID3TagToDictionary(lua_State *L)
{
    AudioFormatProperty_ID3TagToDictionary(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_HardwareCodecCapabilities(lua_State *L)
{
    AudioFormatProperty_HardwareCodecCapabilities(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatAAC(lua_State *L)
{
    AudioFormatAAC(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatAAC(lua_State *L)
{
    AudioFormatAAC(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatGetProperty(lua_State *L)
{
    AudioFormatGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_Decoders(lua_State *L)
{
    AudioFormatProperty_Decoders(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_HardwareCodecCapabilities(lua_State *L)
{
    AudioFormatProperty_HardwareCodecCapabilities(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatProperty_CodecAvailability(lua_State *L)
{
    AudioFormatProperty_CodecAvailability(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatGetPropertyInfo(lua_State *L)
{
    AudioFormatGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatPropertyID(lua_State *L)
{
    AudioFormatPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatGetPropertyInfo(lua_State *L)
{
    AudioFormatGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatGetProperty(lua_State *L)
{
    AudioFormatGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatPropertyID(lua_State *L)
{
    AudioFormatPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatGetProperty(lua_State *L)
{
    AudioFormatGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatUnspecifiedError(lua_State *L)
{
    AudioFormatUnspecifiedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatUnsupportedPropertyError(lua_State *L)
{
    AudioFormatUnsupportedPropertyError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatBadPropertySizeError(lua_State *L)
{
    AudioFormatBadPropertySizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatBadSpecifierSizeError(lua_State *L)
{
    AudioFormatBadSpecifierSizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatUnsupportedDataFormatError(lua_State *L)
{
    AudioFormatUnsupportedDataFormatError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioFormatUnknownFormatError(lua_State *L)
{
    AudioFormatUnknownFormatError(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAudioFormatAPIs[] = {
    {"AudioFormat_h__", lua_AudioFormat_h__},
    {"AudioFormat_h__", lua_AudioFormat_h__},
    {"AudioFormatPropertyID", lua_AudioFormatPropertyID},
    {"AudioFormatPropertyID", lua_AudioFormatPropertyID},
    {"AudioFormatProperty_PanningMatrix", lua_AudioFormatProperty_PanningMatrix},
    {"AudioFormatProperty_BalanceFade", lua_AudioFormatProperty_BalanceFade},
    {"AudioFormatInfo", lua_AudioFormatInfo},
    {"AudioFormatProperty_FormatList", lua_AudioFormatProperty_FormatList},
    {"AudioFormatInfo", lua_AudioFormatInfo},
    {"AudioFormatInfo", lua_AudioFormatInfo},
    {"AudioFormatInfo", lua_AudioFormatInfo},
    {"AudioFormatProperty_FormatList", lua_AudioFormatProperty_FormatList},
    {"AudioFormatInfo", lua_AudioFormatInfo},
    {"AudioFormatInfo", lua_AudioFormatInfo},
    {"AudioFormatListItem", lua_AudioFormatListItem},
    {"AudioFormatProperty_FormatList", lua_AudioFormatProperty_FormatList},
    {"AudioFormatListItem", lua_AudioFormatListItem},
    {"AudioFormatListItem", lua_AudioFormatListItem},
    {"AudioFormatProperty", lua_AudioFormatProperty},
    {"AudioFormatGetPropertyInfo", lua_AudioFormatGetPropertyInfo},
    {"AudioFormatProperty_FormatInfo", lua_AudioFormatProperty_FormatInfo},
    {"AudioFormatProperty_FormatIsVBR", lua_AudioFormatProperty_FormatIsVBR},
    {"AudioFormatProperty_FormatIsExternallyFramed", lua_AudioFormatProperty_FormatIsExternallyFramed},
    {"AudioFormatProperty_FormatIsEncrypted", lua_AudioFormatProperty_FormatIsEncrypted},
    {"AudioFormatProperty_EncodeFormatIDs", lua_AudioFormatProperty_EncodeFormatIDs},
    {"AudioFormatProperty_DecodeFormatIDs", lua_AudioFormatProperty_DecodeFormatIDs},
    {"AudioFormatProperty_Encoders", lua_AudioFormatProperty_Encoders},
    {"AudioFormatProperty_Decoders", lua_AudioFormatProperty_Decoders},
    {"AudioFormatProperty_AvailableEncodeBitRates", lua_AudioFormatProperty_AvailableEncodeBitRates},
    {"AudioFormatProperty_AvailableEncodeSampleRates", lua_AudioFormatProperty_AvailableEncodeSampleRates},
    {"AudioFormatProperty_AvailableEncodeChannelLayoutTags", lua_AudioFormatProperty_AvailableEncodeChannelLayoutTags},
    {"AudioFormatProperty_AvailableEncodeNumberChannels", lua_AudioFormatProperty_AvailableEncodeNumberChannels},
    {"AudioFormatProperty_FormatName", lua_AudioFormatProperty_FormatName},
    {"AudioFormatProperty_ASBDFromESDS", lua_AudioFormatProperty_ASBDFromESDS},
    {"AudioFormatProperty_ChannelLayoutFromESDS", lua_AudioFormatProperty_ChannelLayoutFromESDS},
    {"AudioFormatProperty_ASBDFromMPEGPacket", lua_AudioFormatProperty_ASBDFromMPEGPacket},
    {"AudioFormatProperty_FormatList", lua_AudioFormatProperty_FormatList},
    {"AudioFormatListItem", lua_AudioFormatListItem},
    {"AudioFormatInfo", lua_AudioFormatInfo},
    {"AudioFormatProperty_FormatList", lua_AudioFormatProperty_FormatList},
    {"AudioFormatListItem", lua_AudioFormatListItem},
    {"AudioFormatProperty_FormatList", lua_AudioFormatProperty_FormatList},
    {"AudioFormatProperty_OutputFormatList", lua_AudioFormatProperty_OutputFormatList},
    {"AudioFormatListItem", lua_AudioFormatListItem},
    {"AudioFormatInfo", lua_AudioFormatInfo},
    {"AudioFormatProperty_FirstPlayableFormatFromList", lua_AudioFormatProperty_FirstPlayableFormatFromList},
    {"AudioFormatListItem", lua_AudioFormatListItem},
    {"AudioFormatProperty_ValidateChannelLayout", lua_AudioFormatProperty_ValidateChannelLayout},
    {"AudioFormatUnknownFormatError", lua_AudioFormatUnknownFormatError},
    {"AudioFormatProperty_ChannelLayoutForTag", lua_AudioFormatProperty_ChannelLayoutForTag},
    {"AudioFormatProperty_TagForChannelLayout", lua_AudioFormatProperty_TagForChannelLayout},
    {"AudioFormatProperty_ChannelLayoutForBitmap", lua_AudioFormatProperty_ChannelLayoutForBitmap},
    {"AudioFormatProperty_BitmapForLayoutTag", lua_AudioFormatProperty_BitmapForLayoutTag},
    {"AudioFormatProperty_TagForChannelLayout", lua_AudioFormatProperty_TagForChannelLayout},
    {"AudioFormatProperty_ChannelLayoutName", lua_AudioFormatProperty_ChannelLayoutName},
    {"AudioFormatProperty_ChannelLayoutSimpleName", lua_AudioFormatProperty_ChannelLayoutSimpleName},
    {"AudioFormatProperty_ChannelLayoutName", lua_AudioFormatProperty_ChannelLayoutName},
    {"AudioFormatProperty_ChannelName", lua_AudioFormatProperty_ChannelName},
    {"AudioFormatProperty_ChannelShortName", lua_AudioFormatProperty_ChannelShortName},
    {"AudioFormatProperty_MatrixMixMap", lua_AudioFormatProperty_MatrixMixMap},
    {"AudioFormatProperty_ChannelMap", lua_AudioFormatProperty_ChannelMap},
    {"AudioFormatProperty_NumberOfChannelsForLayout", lua_AudioFormatProperty_NumberOfChannelsForLayout},
    {"AudioFormatProperty_TagsForNumberOfChannels", lua_AudioFormatProperty_TagsForNumberOfChannels},
    {"AudioFormatProperty_PanningMatrix", lua_AudioFormatProperty_PanningMatrix},
    {"AudioFormatProperty_MatrixMixMap", lua_AudioFormatProperty_MatrixMixMap},
    {"AudioFormatProperty_BalanceFade", lua_AudioFormatProperty_BalanceFade},
    {"AudioFormatProperty_ID3TagSize", lua_AudioFormatProperty_ID3TagSize},
    {"AudioFormatProperty_ID3TagToDictionary", lua_AudioFormatProperty_ID3TagToDictionary},
    {"AudioFormatProperty_FormatInfo", lua_AudioFormatProperty_FormatInfo},
    {"AudioFormatProperty_FormatName", lua_AudioFormatProperty_FormatName},
    {"AudioFormatProperty_EncodeFormatIDs", lua_AudioFormatProperty_EncodeFormatIDs},
    {"AudioFormatProperty_DecodeFormatIDs", lua_AudioFormatProperty_DecodeFormatIDs},
    {"AudioFormatProperty_FormatList", lua_AudioFormatProperty_FormatList},
    {"AudioFormatProperty_ASBDFromESDS", lua_AudioFormatProperty_ASBDFromESDS},
    {"AudioFormatProperty_ChannelLayoutFromESDS", lua_AudioFormatProperty_ChannelLayoutFromESDS},
    {"AudioFormatProperty_OutputFormatList", lua_AudioFormatProperty_OutputFormatList},
    {"AudioFormatProperty_FirstPlayableFormatFromList", lua_AudioFormatProperty_FirstPlayableFormatFromList},
    {"AudioFormatProperty_FormatIsVBR", lua_AudioFormatProperty_FormatIsVBR},
    {"AudioFormatProperty_FormatIsExternallyFramed", lua_AudioFormatProperty_FormatIsExternallyFramed},
    {"AudioFormatProperty_FormatIsEncrypted", lua_AudioFormatProperty_FormatIsEncrypted},
    {"AudioFormatProperty_Encoders", lua_AudioFormatProperty_Encoders},
    {"AudioFormatProperty_Decoders", lua_AudioFormatProperty_Decoders},
    {"AudioFormatProperty_AvailableEncodeBitRates", lua_AudioFormatProperty_AvailableEncodeBitRates},
    {"AudioFormatProperty_AvailableEncodeSampleRates", lua_AudioFormatProperty_AvailableEncodeSampleRates},
    {"AudioFormatProperty_AvailableEncodeChannelLayoutTags", lua_AudioFormatProperty_AvailableEncodeChannelLayoutTags},
    {"AudioFormatProperty_AvailableEncodeNumberChannels", lua_AudioFormatProperty_AvailableEncodeNumberChannels},
    {"AudioFormatProperty_ASBDFromMPEGPacket", lua_AudioFormatProperty_ASBDFromMPEGPacket},
    {"AudioFormatProperty_BitmapForLayoutTag", lua_AudioFormatProperty_BitmapForLayoutTag},
    {"AudioFormatProperty_MatrixMixMap", lua_AudioFormatProperty_MatrixMixMap},
    {"AudioFormatProperty_ChannelMap", lua_AudioFormatProperty_ChannelMap},
    {"AudioFormatProperty_NumberOfChannelsForLayout", lua_AudioFormatProperty_NumberOfChannelsForLayout},
    {"AudioFormatProperty_ValidateChannelLayout", lua_AudioFormatProperty_ValidateChannelLayout},
    {"AudioFormatProperty_ChannelLayoutForTag", lua_AudioFormatProperty_ChannelLayoutForTag},
    {"AudioFormatProperty_TagForChannelLayout", lua_AudioFormatProperty_TagForChannelLayout},
    {"AudioFormatProperty_ChannelLayoutName", lua_AudioFormatProperty_ChannelLayoutName},
    {"AudioFormatProperty_ChannelLayoutSimpleName", lua_AudioFormatProperty_ChannelLayoutSimpleName},
    {"AudioFormatProperty_ChannelLayoutForBitmap", lua_AudioFormatProperty_ChannelLayoutForBitmap},
    {"AudioFormatProperty_ChannelName", lua_AudioFormatProperty_ChannelName},
    {"AudioFormatProperty_ChannelShortName", lua_AudioFormatProperty_ChannelShortName},
    {"AudioFormatProperty_TagsForNumberOfChannels", lua_AudioFormatProperty_TagsForNumberOfChannels},
    {"AudioFormatProperty_PanningMatrix", lua_AudioFormatProperty_PanningMatrix},
    {"AudioFormatProperty_BalanceFade", lua_AudioFormatProperty_BalanceFade},
    {"AudioFormatProperty_ID3TagSize", lua_AudioFormatProperty_ID3TagSize},
    {"AudioFormatProperty_ID3TagToDictionary", lua_AudioFormatProperty_ID3TagToDictionary},
    {"AudioFormatProperty_HardwareCodecCapabilities", lua_AudioFormatProperty_HardwareCodecCapabilities},
    {"AudioFormatAAC", lua_AudioFormatAAC},
    {"AudioFormatAAC", lua_AudioFormatAAC},
    {"AudioFormatGetProperty", lua_AudioFormatGetProperty},
    {"AudioFormatProperty_Decoders", lua_AudioFormatProperty_Decoders},
    {"AudioFormatProperty_HardwareCodecCapabilities", lua_AudioFormatProperty_HardwareCodecCapabilities},
    {"AudioFormatProperty_CodecAvailability", lua_AudioFormatProperty_CodecAvailability},
    {"AudioFormatGetPropertyInfo", lua_AudioFormatGetPropertyInfo},
    {"AudioFormatPropertyID", lua_AudioFormatPropertyID},
    {"AudioFormatGetPropertyInfo", lua_AudioFormatGetPropertyInfo},
    {"AudioFormatGetProperty", lua_AudioFormatGetProperty},
    {"AudioFormatPropertyID", lua_AudioFormatPropertyID},
    {"AudioFormatGetProperty", lua_AudioFormatGetProperty},
    {"AudioFormatUnspecifiedError", lua_AudioFormatUnspecifiedError},
    {"AudioFormatUnsupportedPropertyError", lua_AudioFormatUnsupportedPropertyError},
    {"AudioFormatBadPropertySizeError", lua_AudioFormatBadPropertySizeError},
    {"AudioFormatBadSpecifierSizeError", lua_AudioFormatBadSpecifierSizeError},
    {"AudioFormatUnsupportedDataFormatError", lua_AudioFormatUnsupportedDataFormatError},
    {"AudioFormatUnknownFormatError", lua_AudioFormatUnknownFormatError},
    {NULL, NULL},
};

int LuaOpenAudioFormat(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioFormatAPIs);
    return 0;
}
