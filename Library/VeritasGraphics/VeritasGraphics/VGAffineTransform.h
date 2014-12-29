//
//  VGAffineTransform.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef VeritasGraphics_VGAffineTransform_h
#define VeritasGraphics_VGAffineTransform_h


typedef struct VGAffineTransform VGAffineTransform;

#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGGeometry.h>

struct VGAffineTransform {
    VGFloat a, b, c, d;
    VGFloat tx, ty;
};

/* The identity transform: [ 1 0 0 1 0 0 ]. */

VG_EXTERN const VGAffineTransform VGAffineTransformIdentity;

/* Return the transform [ a b c d tx ty ]. */

VG_EXTERN VGAffineTransform VGAffineTransformMake(VGFloat a, VGFloat b,
                                                  VGFloat c, VGFloat d, VGFloat tx, VGFloat ty);

/* Return a transform which translates by `(tx, ty)':
 t' = [ 1 0 0 1 tx ty ] */

VG_EXTERN VGAffineTransform VGAffineTransformMakeTranslation(VGFloat tx,
                                                             VGFloat ty) ;

/* Return a transform which scales by `(sx, sy)':
 t' = [ sx 0 0 sy 0 0 ] */

VG_EXTERN VGAffineTransform VGAffineTransformMakeScale(VGFloat sx, VGFloat sy);

/* Return a transform which rotates by `angle' radians:
 t' = [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] */

VG_EXTERN VGAffineTransform VGAffineTransformMakeRotation(VGFloat angle);

/* Return true if `t' is the identity transform, false otherwise. */

VG_EXTERN bool VGAffineTransformIsIdentity(VGAffineTransform t)
;

/* Translate `t' by `(tx, ty)' and return the result:
 t' = [ 1 0 0 1 tx ty ] * t */

VG_EXTERN VGAffineTransform VGAffineTransformTranslate(VGAffineTransform t,
                                                       VGFloat tx, VGFloat ty) ;

/* Scale `t' by `(sx, sy)' and return the result:
 t' = [ sx 0 0 sy 0 0 ] * t */

VG_EXTERN VGAffineTransform VGAffineTransformScale(VGAffineTransform t,
                                                   VGFloat sx, VGFloat sy) ;

/* Rotate `t' by `angle' radians and return the result:
 t' =  [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] * t */

VG_EXTERN VGAffineTransform VGAffineTransformRotate(VGAffineTransform t,
                                                    VGFloat angle) ;

/* Invert `t' and return the result. If `t' has zero determinant, then `t'
 is returned unchanged. */

VG_EXTERN VGAffineTransform VGAffineTransformInvert(VGAffineTransform t);

/* Concatenate `t2' to `t1' and return the result:
 t' = t1 * t2 */

VG_EXTERN VGAffineTransform VGAffineTransformConcat(VGAffineTransform t1,
                                                    VGAffineTransform t2) ;

/* Return true if `t1' and `t2' are equal, false otherwise. */

VG_EXTERN bool VGAffineTransformEqualToTransform(VGAffineTransform t1,
                                                 VGAffineTransform t2) ;

/* Transform `point' by `t' and return the result:
 p' = p * t
 where p = [ x y 1 ]. */

VG_EXTERN VGPoint VGPointApplyAffineTransform(VGPoint point,
                                              VGAffineTransform t) ;

/* Transform `size' by `t' and return the result:
 s' = s * t
 where s = [ width height 0 ]. */

VG_EXTERN VGSize VGSizeApplyAffineTransform(VGSize size, VGAffineTransform t);

/* Transform `rect' by `t' and return the result. Since affine transforms do
 not preserve rectangles in general, this function returns the smallest
 rectangle which contains the transformed corner points of `rect'. If `t'
 consists solely of scales, flips and translations, then the returned
 rectangle coincides with the rectangle constructed from the four
 transformed corners. */

VG_EXTERN VGRect VGRectApplyAffineTransform(VGRect rect, VGAffineTransform t)
;

/*** Definitions of inline functions. ***/

VG_INLINE VGAffineTransform
__VGAffineTransformMake(VGFloat a, VGFloat b, VGFloat c, VGFloat d,
                        VGFloat tx, VGFloat ty)
{
    VGAffineTransform t;
    t.a = a; t.b = b; t.c = c; t.d = d; t.tx = tx; t.ty = ty;
    return t;
}
#define VGAffineTransformMake __VGAffineTransformMake

VG_INLINE VGPoint
__VGPointApplyAffineTransform(VGPoint point, VGAffineTransform t)
{
    VGPoint p;
    p.x = (VGFloat)((double)t.a * point.x + (double)t.c * point.y + t.tx);
    p.y = (VGFloat)((double)t.b * point.x + (double)t.d * point.y + t.ty);
    return p;
}
#define VGPointApplyAffineTransform __VGPointApplyAffineTransform

VG_INLINE VGSize
__VGSizeApplyAffineTransform(VGSize size, VGAffineTransform t)
{
    VGSize s;
    s.width = (VGFloat)((double)t.a * size.width + (double)t.c * size.height);
    s.height = (VGFloat)((double)t.b * size.width + (double)t.d * size.height);
    return s;
}
#define VGSizeApplyAffineTransform __VGSizeApplyAffineTransform

#endif
