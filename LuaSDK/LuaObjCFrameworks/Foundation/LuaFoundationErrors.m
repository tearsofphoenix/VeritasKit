//
//  LuaFoundationErrors.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaFoundationErrors.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaObjCAuxiliary.h"
#import "luasdk_utilities.h"

static const LuaSDKConst __luaFoundationErrors[] = 
{
    {"NSFileNoSuchFileError", NSFileNoSuchFileError},
    {"NSFileLockingError", NSFileLockingError},
    {"NSFileReadUnknownError", NSFileReadUnknownError},
    {"NSFileReadNoPermissionError", NSFileReadNoPermissionError},
    {"NSFileReadInvalidFileNameError", NSFileReadInvalidFileNameError},
    {"NSFileReadCorruptFileError", NSFileReadCorruptFileError},
    {"NSFileReadNoSuchFileError", NSFileReadNoSuchFileError},
    {"NSFileReadInapplicableStringEncodingError", NSFileReadInapplicableStringEncodingError},
    {"NSFileReadUnsupportedSchemeError", NSFileReadUnsupportedSchemeError},
    {"NSFileReadTooLargeError", NSFileReadTooLargeError},
    {"NSFileReadUnknownStringEncodingError", NSFileReadUnknownStringEncodingError},
    {"NSFileWriteUnknownError", NSFileWriteUnknownError},
    {"NSFileWriteNoPermissionError", NSFileWriteNoPermissionError},
    {"NSFileWriteInvalidFileNameError", NSFileWriteInvalidFileNameError},
    {"NSFileWriteFileExistsError", NSFileWriteFileExistsError},
    {"NSFileWriteInapplicableStringEncodingError", NSFileWriteInapplicableStringEncodingError},
    {"NSFileWriteUnsupportedSchemeError", NSFileWriteUnsupportedSchemeError},
    {"NSFileWriteOutOfSpaceError", NSFileWriteOutOfSpaceError},
    {"NSFileWriteVolumeReadOnlyError", NSFileWriteVolumeReadOnlyError},
    {"NSKeyValueValidationError", NSKeyValueValidationError},
    {"NSFormattingError", NSFormattingError},
    {"NSUserCancelledError", NSUserCancelledError},
    {"NSExecutableNotLoadableError", NSExecutableNotLoadableError},
    {"NSExecutableArchitectureMismatchError", NSExecutableArchitectureMismatchError},
    {"NSExecutableRuntimeMismatchError", NSExecutableRuntimeMismatchError},
    {"NSExecutableLoadError", NSExecutableLoadError},
    {"NSExecutableLinkError", NSExecutableLinkError},
    {"NSFileErrorMinimum", NSFileErrorMinimum},
    {"NSFileErrorMaximum", NSFileErrorMaximum},
    {"NSValidationErrorMinimum", NSValidationErrorMinimum},
    {"NSValidationErrorMaximum", NSValidationErrorMaximum},
    {"NSExecutableErrorMinimum", NSExecutableErrorMinimum},
    {"NSExecutableErrorMaximum", NSExecutableErrorMaximum},
    {"NSFormattingErrorMinimum", NSFormattingErrorMinimum},
    {"NSFormattingErrorMaximum", NSFormattingErrorMaximum},
    {"NSPropertyListReadCorruptError", NSPropertyListReadCorruptError},
    {"NSPropertyListReadUnknownVersionError", NSPropertyListReadUnknownVersionError},
    {"NSPropertyListReadStreamError", NSPropertyListReadStreamError},
    {"NSPropertyListWriteStreamError", NSPropertyListWriteStreamError},
    {"NSPropertyListErrorMinimum", NSPropertyListErrorMinimum},
    {"NSPropertyListErrorMaximum", NSPropertyListErrorMaximum},
    {NULL, 0},
};


int LuaOpenFoundationErrors(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaFoundationErrors);
    return 0;
}
