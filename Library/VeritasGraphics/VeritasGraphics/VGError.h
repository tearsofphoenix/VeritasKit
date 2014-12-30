//
//  VGError.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/30.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef VeritasGraphics_VGError_h
#define VeritasGraphics_VGError_h

#include <stdint.h>

/* Types used for errors and error handlers. */

enum _VGError
{
    kVGErrorSuccess = 0,
    kVGErrorFailure = 1000,
    kVGErrorIllegalArgument = 1001,
    kVGErrorInvalidConnection = 1002,
    kVGErrorInvalidContext = 1003,
    kVGErrorCannotComplete = 1004,
    kVGErrorNotImplemented = 1006,
    kVGErrorRangeCheck = 1007,
    kVGErrorTypeCheck = 1008,
    kVGErrorInvalidOperation = 1010,
    kVGErrorNoneAvailable = 1011,
};
typedef int32_t VGError;

#endif
