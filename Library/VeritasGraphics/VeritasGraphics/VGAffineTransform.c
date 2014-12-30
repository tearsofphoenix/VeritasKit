//
//  VGAffineTransform.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGAffineTransform.h"
#include <string.h>
#include <math.h>

const VGAffineTransform VGAffineTransformIdentity = {1, 0, 0, 1, 0, 0};

bool VGAffineTransformEqualToTransform(VGAffineTransform t1,
                                            VGAffineTransform t2)
{
    return memcmp(&t1, &t2, sizeof(t1)) == 0;
}

VGAffineTransform VGAffineTransformMakeTranslation(VGFloat tx,
                                                   VGFloat ty)
{
    return VGAffineTransformMake(1, 0, 0, 1, tx, ty);
}

VGAffineTransform VGAffineTransformMakeScale(VGFloat sx, VGFloat sy)
{
    return VGAffineTransformMake(sx, 0, 0, sy, 0, 0);
}

/* Return a transform which rotates by `angle' radians:
 t' = [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] */

VGAffineTransform VGAffineTransformMakeRotation(VGFloat angle)
{
    VGFloat sinus = (VGFloat) sin(angle);
    VGFloat cosinus = (VGFloat) cos(angle);
    
    return VGAffineTransformMake(cosinus, sinus, -sinus, cosinus, 0, 0);
}

bool VGAffineTransformIsIdentity(VGAffineTransform t)
{
    return VGAffineTransformEqualToTransform(t, VGAffineTransformIdentity);
}

/* Translate `t' by `(tx, ty)' and return the result:
 t' = [ 1 0 0 1 tx ty ] * t */

VGAffineTransform VGAffineTransformTranslate(VGAffineTransform t,
                                                       VGFloat tx, VGFloat ty)
{
    return VGAffineTransformConcat(t, VGAffineTransformMakeTranslation(tx, ty));
}

/* Scale `t' by `(sx, sy)' and return the result:
 t' = [ sx 0 0 sy 0 0 ] * t */

VGAffineTransform VGAffineTransformScale(VGAffineTransform t,
                                                   VGFloat sx, VGFloat sy)
{
    return VGAffineTransformConcat(t, VGAffineTransformMakeScale(sx, sy));
}

/* Rotate `t' by `angle' radians and return the result:
 t' =  [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] * t */

VGAffineTransform VGAffineTransformRotate(VGAffineTransform t,
                                                    VGFloat angle)
{
    return VGAffineTransformConcat(t, VGAffineTransformMakeRotation(angle));
}

VGAffineTransform VGAffineTransformInvert(VGAffineTransform t)
{
    VGAffineTransform tRet;
    VGFloat determinant;
    
    determinant = (t.a * t.d - t.c * t.b);
    if(determinant == 0) return t;
    
    tRet.a = t.d  / determinant;
    tRet.b = -t.b  / determinant;
    tRet.c = -t.c  / determinant;
    tRet.d = t.a  / determinant;
    tRet.tx =(-t.d * t.tx + t.c * t.ty) / determinant;
    tRet.ty =(t.b * t.tx - t.a * t.ty) / determinant;
    
    return tRet;
}

VGAffineTransform VGAffineTransformConcat(VGAffineTransform t1,
                                                    VGAffineTransform t2)
{
    VGAffineTransform tRet;
    
    tRet.a=t2.a*t1.a+t2.b*t1.c;
    tRet.b=t2.a*t1.b+t2.b*t1.d;
    tRet.c=t2.c*t1.a+t2.d*t1.c;
    tRet.d=t2.c*t1.b+t2.d*t1.d;
    tRet.tx=t2.tx*t1.a+t2.ty*t1.c+t1.tx;
    tRet.ty=t2.tx*t1.b+t2.ty*t1.d+t1.ty;
    
    return tRet;
}

VGRect VGRectApplyAffineTransform(VGRect rect, VGAffineTransform t)
{
    VGRect result;
    result.origin = VGPointApplyAffineTransform(rect.origin, t);
    result.size = VGSizeApplyAffineTransform(rect.size, t);
    return result;
}
