//
//  VATransform3D.c
//  VeritasAnimation
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 NewGrace. All rights reserved.
//

#include "VATransform3D.h"
#include <string.h>

const VATransform3D VATransform3DIdentity = {1, 0, 0, 0,
                                             0, 1, 0, 0,
                                             0, 0, 1, 0,
                                             0, 0, 0, 1};

bool VATransform3DEqualToTransform (VATransform3D a,
                                    VATransform3D b)
{
    return memcmp(&a, &b, sizeof(a)) == 0;
}