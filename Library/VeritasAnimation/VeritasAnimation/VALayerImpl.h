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
#include <VeritasGraphics/VGAffineTransform.h>
#include <VeritasAnimation/VATransform3D.h>
#include <SDL.h>

struct VALayerImpl
{
    VGRect bounds;
    VGFloat position;
    VATransform3D transform;
    VGAffineTransform affineTransform;
    VGRect frame;
    bool hidden;
    
    SDL_Surface *impl;
};

typedef struct VALayerImpl *VALayerImplRef;

void VALayerImplInit(VALayerImplRef layer);

#endif /* defined(__VeritasGraphics__VALayerImpl__) */
