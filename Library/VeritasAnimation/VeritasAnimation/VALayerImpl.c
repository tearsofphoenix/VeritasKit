//
//  VALayerImpl.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VALayerImpl.h"
#include <SDL_surface.h>
#include <SDL_video.h>

static SDL_Surface* prepare_SDL_surface(int w, int h)
{
    return SDL_CreateRGBSurface(0, w, h, 32,0,0,0,0);
}

void VALayerImplInit(VALayerImplRef layer)
{
    layer->bounds = VGRectZero;
    layer->position = 0;
    layer->transform = VATransform3DIdentity;
    layer->affineTransform = VGAffineTransformIdentity;
    layer->frame = VGRectZero;
    layer->hidden = false;
}