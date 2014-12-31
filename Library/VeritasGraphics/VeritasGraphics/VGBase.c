//
//  VGBase.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/31.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGBasePriv.h"
#include <stdio.h>
#include <stdarg.h>

CFTypeID VGTypeRegisterWithCallbacks(CFTypeID* typeID, const CFRuntimeClass * const rtclass)
{
    if (_kCFRuntimeNotATypeID == *typeID) {
        *typeID = _CFRuntimeRegisterClass(rtclass);
    }
    
    return *typeID;
}

void VGPostError(const char *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    
    vprintf(fmt, ap);
    
    va_end(ap);
}