//
//  LuaSecTrust.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSecTrust.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SecTrustResultType(lua_State *L)
{
    SecTrustResultType(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultType(lua_State *L)
{
    SecTrustResultType(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultUnspecified(lua_State *L)
{
    SecTrustResultUnspecified(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultRecoverableTrustFailure(lua_State *L)
{
    SecTrustResultRecoverableTrustFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultProceed(lua_State *L)
{
    SecTrustResultProceed(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustCopyExceptions(lua_State *L)
{
    SecTrustCopyExceptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetExceptions(lua_State *L)
{
    SecTrustSetExceptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultRecoverableTrustFailure(lua_State *L)
{
    SecTrustResultRecoverableTrustFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultInvalid(lua_State *L)
{
    SecTrustResultInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultProceed(lua_State *L)
{
    SecTrustResultProceed(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultConfirm(lua_State *L)
{
    SecTrustResultConfirm(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultDeny(lua_State *L)
{
    SecTrustResultDeny(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultUnspecified(lua_State *L)
{
    SecTrustResultUnspecified(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultRecoverableTrustFailure(lua_State *L)
{
    SecTrustResultRecoverableTrustFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultFatalTrustFailure(lua_State *L)
{
    SecTrustResultFatalTrustFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultOtherError(lua_State *L)
{
    SecTrustResultOtherError(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultType(lua_State *L)
{
    SecTrustResultType(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultInvalid(lua_State *L)
{
    SecTrustResultInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultProceed(lua_State *L)
{
    SecTrustResultProceed(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultConfirm(lua_State *L)
{
    SecTrustResultConfirm(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultDeny(lua_State *L)
{
    SecTrustResultDeny(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultUnspecified(lua_State *L)
{
    SecTrustResultUnspecified(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultRecoverableTrustFailure(lua_State *L)
{
    SecTrustResultRecoverableTrustFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultFatalTrustFailure(lua_State *L)
{
    SecTrustResultFatalTrustFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultOtherError(lua_State *L)
{
    SecTrustResultOtherError(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustRef(lua_State *L)
{
    SecTrustRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustRef(lua_State *L)
{
    SecTrustRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustGetTypeID(lua_State *L)
{
    SecTrustGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustGetTypeID(lua_State *L)
{
    SecTrustGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustCreateWithCertificates(lua_State *L)
{
    SecTrustCreateWithCertificates(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustCreateWithCertificates(lua_State *L)
{
    SecTrustCreateWithCertificates(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustRef(lua_State *L)
{
    SecTrustRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetAnchorCertificates(lua_State *L)
{
    SecTrustSetAnchorCertificates(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetAnchorCertificatesOnly(lua_State *L)
{
    SecTrustSetAnchorCertificatesOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetAnchorCertificates(lua_State *L)
{
    SecTrustSetAnchorCertificates(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetAnchorCertificatesOnly(lua_State *L)
{
    SecTrustSetAnchorCertificatesOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetAnchorCertificates(lua_State *L)
{
    SecTrustSetAnchorCertificates(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetAnchorCertificates(lua_State *L)
{
    SecTrustSetAnchorCertificates(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetAnchorCertificatesOnly(lua_State *L)
{
    SecTrustSetAnchorCertificatesOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetVerifyDate(lua_State *L)
{
    SecTrustSetVerifyDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetVerifyDate(lua_State *L)
{
    SecTrustSetVerifyDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustGetVerifyTime(lua_State *L)
{
    SecTrustGetVerifyTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustGetVerifyTime(lua_State *L)
{
    SecTrustGetVerifyTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustCopyPublicKey(lua_State *L)
{
    SecTrustCopyPublicKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustCopyPublicKey(lua_State *L)
{
    SecTrustCopyPublicKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustGetCertificateCount(lua_State *L)
{
    SecTrustGetCertificateCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustGetCertificateCount(lua_State *L)
{
    SecTrustGetCertificateCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustGetCertificateAtIndex(lua_State *L)
{
    SecTrustGetCertificateAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustGetCertificateAtIndex(lua_State *L)
{
    SecTrustGetCertificateAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustCopyExceptions(lua_State *L)
{
    SecTrustCopyExceptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetExceptions(lua_State *L)
{
    SecTrustSetExceptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustCopyExceptions(lua_State *L)
{
    SecTrustCopyExceptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetExceptions(lua_State *L)
{
    SecTrustSetExceptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustCopyExceptions(lua_State *L)
{
    SecTrustCopyExceptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustResultRecoverableTrustFailure(lua_State *L)
{
    SecTrustResultRecoverableTrustFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustEvaluate(lua_State *L)
{
    SecTrustEvaluate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecTrustSetExceptions(lua_State *L)
{
    SecTrustSetExceptions(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSecTrustAPIs[] = {
    {"SecTrustResultType", lua_SecTrustResultType},
    {"SecTrustResultType", lua_SecTrustResultType},
    {"SecTrustResultUnspecified", lua_SecTrustResultUnspecified},
    {"SecTrustResultRecoverableTrustFailure", lua_SecTrustResultRecoverableTrustFailure},
    {"SecTrustResultProceed", lua_SecTrustResultProceed},
    {"SecTrustCopyExceptions", lua_SecTrustCopyExceptions},
    {"SecTrustSetExceptions", lua_SecTrustSetExceptions},
    {"SecTrustResultRecoverableTrustFailure", lua_SecTrustResultRecoverableTrustFailure},
    {"SecTrustResultInvalid", lua_SecTrustResultInvalid},
    {"SecTrustResultProceed", lua_SecTrustResultProceed},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustResultConfirm", lua_SecTrustResultConfirm},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustResultDeny", lua_SecTrustResultDeny},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustResultUnspecified", lua_SecTrustResultUnspecified},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustResultRecoverableTrustFailure", lua_SecTrustResultRecoverableTrustFailure},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustResultFatalTrustFailure", lua_SecTrustResultFatalTrustFailure},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustResultOtherError", lua_SecTrustResultOtherError},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustResultType", lua_SecTrustResultType},
    {"SecTrustResultInvalid", lua_SecTrustResultInvalid},
    {"SecTrustResultProceed", lua_SecTrustResultProceed},
    {"SecTrustResultConfirm", lua_SecTrustResultConfirm},
    {"SecTrustResultDeny", lua_SecTrustResultDeny},
    {"SecTrustResultUnspecified", lua_SecTrustResultUnspecified},
    {"SecTrustResultRecoverableTrustFailure", lua_SecTrustResultRecoverableTrustFailure},
    {"SecTrustResultFatalTrustFailure", lua_SecTrustResultFatalTrustFailure},
    {"SecTrustResultOtherError", lua_SecTrustResultOtherError},
    {"SecTrustRef", lua_SecTrustRef},
    {"SecTrustRef", lua_SecTrustRef},
    {"SecTrustGetTypeID", lua_SecTrustGetTypeID},
    {"SecTrustGetTypeID", lua_SecTrustGetTypeID},
    {"SecTrustCreateWithCertificates", lua_SecTrustCreateWithCertificates},
    {"SecTrustCreateWithCertificates", lua_SecTrustCreateWithCertificates},
    {"SecTrustRef", lua_SecTrustRef},
    {"SecTrustSetAnchorCertificates", lua_SecTrustSetAnchorCertificates},
    {"SecTrustSetAnchorCertificatesOnly", lua_SecTrustSetAnchorCertificatesOnly},
    {"SecTrustSetAnchorCertificates", lua_SecTrustSetAnchorCertificates},
    {"SecTrustSetAnchorCertificatesOnly", lua_SecTrustSetAnchorCertificatesOnly},
    {"SecTrustSetAnchorCertificates", lua_SecTrustSetAnchorCertificates},
    {"SecTrustSetAnchorCertificates", lua_SecTrustSetAnchorCertificates},
    {"SecTrustSetAnchorCertificatesOnly", lua_SecTrustSetAnchorCertificatesOnly},
    {"SecTrustSetVerifyDate", lua_SecTrustSetVerifyDate},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustSetVerifyDate", lua_SecTrustSetVerifyDate},
    {"SecTrustGetVerifyTime", lua_SecTrustGetVerifyTime},
    {"SecTrustGetVerifyTime", lua_SecTrustGetVerifyTime},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustCopyPublicKey", lua_SecTrustCopyPublicKey},
    {"SecTrustCopyPublicKey", lua_SecTrustCopyPublicKey},
    {"SecTrustGetCertificateCount", lua_SecTrustGetCertificateCount},
    {"SecTrustGetCertificateCount", lua_SecTrustGetCertificateCount},
    {"SecTrustGetCertificateAtIndex", lua_SecTrustGetCertificateAtIndex},
    {"SecTrustGetCertificateAtIndex", lua_SecTrustGetCertificateAtIndex},
    {"SecTrustCopyExceptions", lua_SecTrustCopyExceptions},
    {"SecTrustSetExceptions", lua_SecTrustSetExceptions},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustCopyExceptions", lua_SecTrustCopyExceptions},
    {"SecTrustSetExceptions", lua_SecTrustSetExceptions},
    {"SecTrustCopyExceptions", lua_SecTrustCopyExceptions},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustResultRecoverableTrustFailure", lua_SecTrustResultRecoverableTrustFailure},
    {"SecTrustEvaluate", lua_SecTrustEvaluate},
    {"SecTrustSetExceptions", lua_SecTrustSetExceptions},
    {NULL, NULL},
};

int LuaOpenSecTrust(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSecTrustAPIs);
    return 0;
}
