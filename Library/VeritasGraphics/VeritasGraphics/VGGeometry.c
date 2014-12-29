//
//  VGGeometry.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGGeometry.h"
#include <string.h>

const VGRect VGRectZero = {{0, 0}, {0, 0}};

bool VGRectEqualToRect(VGRect r1, VGRect r2)
{
    return memcmp(&r1, &r2, sizeof(r1)) == 0;
}