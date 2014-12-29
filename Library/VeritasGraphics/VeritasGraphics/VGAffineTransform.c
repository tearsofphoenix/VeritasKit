//
//  VGAffineTransform.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGAffineTransform.h"
#include <string.h>

const VGAffineTransform VGAffineTransformIdentity = {1, 0, 0, 1, 0, 0};

VGAffineTransform VGAffineTransformMakeTranslation(VGFloat tx,
                                                   VGFloat ty)
{
    return VGAffineTransformMake(1, 0, 0, 1, tx, ty);
}

bool VGAffineTransformEqualToTransform(VGAffineTransform t1,
                                            VGAffineTransform t2)
{
    return memcmp(&t1, &t2, sizeof(t1)) == 0;
}