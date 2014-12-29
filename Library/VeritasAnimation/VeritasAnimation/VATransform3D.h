//
//  VATransform3D.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef VeritasGraphics_VATransform3D_h
#define VeritasGraphics_VATransform3D_h

#include <VeritasAnimation/VABase.h>
#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGAffineTransform.h>

/* Homogeneous three-dimensional transforms. */

struct VATransform3D
{
    VGFloat m11, m12, m13, m14;
    VGFloat m21, m22, m23, m24;
    VGFloat m31, m32, m33, m34;
    VGFloat m41, m42, m43, m44;
};

typedef struct VATransform3D VATransform3D;

VA_EXTERN_C_BEGIN

/* The identity transform: [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]. */

VA_EXTERN const VATransform3D VATransform3DIdentity;

/* Returns true if 't' is the identity transform. */

VA_EXTERN bool VATransform3DIsIdentity (VATransform3D t);

/* Returns true if 'a' is exactly equal to 'b'. */

VA_EXTERN bool VATransform3DEqualToTransform (VATransform3D a,
                                              VATransform3D b);

/* Returns a transform that translates by '(tx, ty, tz)':
 * t' =  [1 0 0 0; 0 1 0 0; 0 0 1 0; tx ty tz 1]. */

VA_EXTERN VATransform3D VATransform3DMakeTranslation (VGFloat tx,
                                                      VGFloat ty, VGFloat tz);

/* Returns a transform that scales by `(sx, sy, sz)':
 * t' = [sx 0 0 0; 0 sy 0 0; 0 0 sz 0; 0 0 0 1]. */

VA_EXTERN VATransform3D VATransform3DMakeScale (VGFloat sx, VGFloat sy,
                                                VGFloat sz);

/* Returns a transform that rotates by 'angle' radians about the vector
 * '(x, y, z)'. If the vector has length zero the identity transform is
 * returned. */

VA_EXTERN VATransform3D VATransform3DMakeRotation (VGFloat angle, VGFloat x,
                                                   VGFloat y, VGFloat z);

/* Translate 't' by '(tx, ty, tz)' and return the result:
 * t' = translate(tx, ty, tz) * t. */

VA_EXTERN VATransform3D VATransform3DTranslate (VATransform3D t, VGFloat tx,
                                                VGFloat ty, VGFloat tz);

/* Scale 't' by '(sx, sy, sz)' and return the result:
 * t' = scale(sx, sy, sz) * t. */

VA_EXTERN VATransform3D VATransform3DScale (VATransform3D t, VGFloat sx,
                                            VGFloat sy, VGFloat sz);

/* Rotate 't' by 'angle' radians about the vector '(x, y, z)' and return
 * the result. If the vector has zero length the behavior is undefined:
 * t' = rotation(angle, x, y, z) * t. */

VA_EXTERN VATransform3D VATransform3DRotate (VATransform3D t, VGFloat angle,
                                             VGFloat x, VGFloat y, VGFloat z);

/* Concatenate 'b' to 'a' and return the result: t' = a * b. */

VA_EXTERN VATransform3D VATransform3DConcat (VATransform3D a, VATransform3D b);

/* Invert 't' and return the result. Returns the original matrix if 't'
 * has no inverse. */

VA_EXTERN VATransform3D VATransform3DInvert (VATransform3D t);

/* Return a transform with the same effect as affine transform 'm'. */

VA_EXTERN VATransform3D VATransform3DMakeAffineTransform (VGAffineTransform m);

/* Returns true if 't' can be represented exactly by an affine transform. */

VA_EXTERN bool VATransform3DIsAffine (VATransform3D t);

/* Returns the affine transform represented by 't'. If 't' can not be
 * represented exactly by an affine transform the returned value is
 * undefined. */

VA_EXTERN VGAffineTransform VATransform3DGetAffineTransform (VATransform3D t);

VA_EXTERN_C_END

#endif
