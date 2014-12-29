//
//  VGAffineTransform.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGAffineTransform.h"

VGAffineTransform VGAffineTransformMakeTranslation(VGFloat tx,
                                                   VGFloat ty)
{
    return VGAffineTransformMake(1, 0, 0, 1, tx, ty);
}
