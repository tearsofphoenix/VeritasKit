//
//  LuaNSURLError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSURLError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSURLErrorConstants[] = 
{
    {"NSURLErrorUnknown", NSURLErrorUnknown},
    {"NSURLErrorCancelled", NSURLErrorCancelled},
    {"NSURLErrorBadURL", NSURLErrorBadURL},
    {"NSURLErrorTimedOut", NSURLErrorTimedOut},
    {"NSURLErrorUnsupportedURL", NSURLErrorUnsupportedURL},
    {"NSURLErrorCannotFindHost", NSURLErrorCannotFindHost},
    {"NSURLErrorCannotConnectToHost", NSURLErrorCannotConnectToHost},
    {"NSURLErrorNetworkConnectionLost", NSURLErrorNetworkConnectionLost},
    {"NSURLErrorDNSLookupFailed", NSURLErrorDNSLookupFailed},
    {"NSURLErrorHTTPTooManyRedirects", NSURLErrorHTTPTooManyRedirects},
    {"NSURLErrorResourceUnavailable", NSURLErrorResourceUnavailable},
    {"NSURLErrorNotConnectedToInternet", NSURLErrorNotConnectedToInternet},
    {"NSURLErrorRedirectToNonExistentLocation", NSURLErrorRedirectToNonExistentLocation},
    {"NSURLErrorBadServerResponse", NSURLErrorBadServerResponse},
    {"NSURLErrorUserCancelledAuthentication", NSURLErrorUserCancelledAuthentication},
    {"NSURLErrorUserAuthenticationRequired", NSURLErrorUserAuthenticationRequired},
    {"NSURLErrorZeroByteResource", NSURLErrorZeroByteResource},
    {"NSURLErrorCannotDecodeRawData", NSURLErrorCannotDecodeRawData},
    {"NSURLErrorCannotDecodeContentData", NSURLErrorCannotDecodeContentData},
    {"NSURLErrorCannotParseResponse", NSURLErrorCannotParseResponse},
    {"NSURLErrorFileDoesNotExist", NSURLErrorFileDoesNotExist},
    {"NSURLErrorFileIsDirectory", NSURLErrorFileIsDirectory},
    {"NSURLErrorNoPermissionsToReadFile", NSURLErrorNoPermissionsToReadFile},
    {"NSURLErrorDataLengthExceedsMaximum", NSURLErrorDataLengthExceedsMaximum},
    {"NSURLErrorSecureConnectionFailed", NSURLErrorSecureConnectionFailed},
    {"NSURLErrorServerCertificateHasBadDate", NSURLErrorServerCertificateHasBadDate},
    {"NSURLErrorServerCertificateUntrusted", NSURLErrorServerCertificateUntrusted},
    {"NSURLErrorServerCertificateHasUnknownRoot", NSURLErrorServerCertificateHasUnknownRoot},
    {"NSURLErrorServerCertificateNotYetValid", NSURLErrorServerCertificateNotYetValid},
    {"NSURLErrorClientCertificateRejected", NSURLErrorClientCertificateRejected},
    {"NSURLErrorClientCertificateRequired", NSURLErrorClientCertificateRequired},
    {"NSURLErrorCannotLoadFromNetwork", NSURLErrorCannotLoadFromNetwork},
    {"NSURLErrorCannotCreateFile", NSURLErrorCannotCreateFile},
    {"NSURLErrorCannotOpenFile", NSURLErrorCannotOpenFile},
    {"NSURLErrorCannotCloseFile", NSURLErrorCannotCloseFile},
    {"NSURLErrorCannotWriteToFile", NSURLErrorCannotWriteToFile},
    {"NSURLErrorCannotRemoveFile", NSURLErrorCannotRemoveFile},
    {"NSURLErrorCannotMoveFile", NSURLErrorCannotMoveFile},
    {"NSURLErrorDownloadDecodingFailedMidStream", NSURLErrorDownloadDecodingFailedMidStream},
    {"NSURLErrorDownloadDecodingFailedToComplete", NSURLErrorDownloadDecodingFailedToComplete},
    {"NSURLErrorInternationalRoamingOff", NSURLErrorInternationalRoamingOff},
    {"NSURLErrorCallIsActive", NSURLErrorCallIsActive},
    {"NSURLErrorDataNotAllowed", NSURLErrorDataNotAllowed},
    {"NSURLErrorRequestBodyStreamExhausted", NSURLErrorRequestBodyStreamExhausted},
    {NULL, 0},
};

int LuaOpenNSURLError(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSURLErrorConstants);
    return 0;
}
