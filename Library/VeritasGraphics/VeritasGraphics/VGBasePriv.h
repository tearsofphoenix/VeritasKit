//
//  VGBasePriv.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/31.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef VeritasGraphics_VGBasePriv_h
#define VeritasGraphics_VGBasePriv_h

#include "VGBase.h"
#include <VeritasFoundation/CFRuntime.h>
#include <VeritasFoundation/VFBase.h>
#include <pthread.h>
#include <pthread_impl.h>

VG_EXTERN CFTypeID VGTypeRegisterWithCallbacks(CFTypeID* typeID, const CFRuntimeClass * const rtclass);

VG_EXTERN void VGPostError(const char *fmt, ...) __printflike(1, 2);


#endif
