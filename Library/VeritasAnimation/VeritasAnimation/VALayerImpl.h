//
//  VALayerImpl.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VALayerImpl__
#define __VeritasGraphics__VALayerImpl__

#include <VeritasGraphics/VGGeometry.h>

struct VALayerImpl
{
    VGRect bounds;
    VGFloat position;
};

typedef struct VALayerImpl *VALayerImplRef;
 
#endif /* defined(__VeritasGraphics__VALayerImpl__) */
