//
//  VATransform3D.c
//  VeritasAnimation
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 NewGrace. All rights reserved.
//

#include "VATransform3D.h"
#include <string.h>
#include <math.h>

const VATransform3D VATransform3DIdentity = {1, 0, 0, 0,
                                             0, 1, 0, 0,
                                             0, 0, 1, 0,
                                             0, 0, 0, 1};


bool VATransform3DIsIdentity (VATransform3D t)
{
    return VATransform3DEqualToTransform(t, VATransform3DIdentity);
}

bool VATransform3DEqualToTransform (VATransform3D a,
                                    VATransform3D b)
{
    return memcmp(&a, &b, sizeof(a)) == 0;
}

VATransform3D VATransform3DMakeTranslation (VGFloat tx,
                                                      VGFloat ty, VGFloat tz)
{
    return (VATransform3D){
        1,  0,  0,  0,
        0,  1,  0,  0,
        0,  0,  1,  0,
        tx, ty, tz, 1};
}

VATransform3D VATransform3DMakeScale (VGFloat sx, VGFloat sy,
                                                VGFloat sz)
{
    return (VATransform3D){
        sx, 0,  0,  0,
        0,  sy, 0,  0,
        0,  0,  sz, 0,
        0,  0,  0,  1};
}

VATransform3D VATransform3DMakeRotation (VGFloat angle, VGFloat x,
                                                   VGFloat y, VGFloat z)
{
    /* Zero length vector returns identity */
    if (x == 0.0 && y == 0.0 && z == 0.0)
        return VATransform3DIdentity;
    
    
    /* Precalculate sin and cos */
    float s = sin(angle);
    float c = cos(angle);
    
    /* Normalize vector */
    float len = sqrt(x*x + y*y + z*z);
    x /= len; y /= len; z /= len;
    
    /* Fill the return value */
    VATransform3D t;
    
    t.m11 = c + (1-c) * x*x;
    t.m12 = (1-c) * x*y + s*z;
    t.m13 = (1-c) * x*z - s*y;
    t.m14 = 0;
    
    t.m21 = (1-c) * y*x - s*z;
    t.m22 = c + (1-c) * y*y;
    t.m23 = (1-c) * y*z + s*x;
    t.m24 = 0;
    
    t.m31 = (1-c) * z*x + s*y;
    t.m32 = (1-c) * y*z - s*x;
    t.m33 = c + (1-c) * z*z;
    t.m34 = 0;
    
    t.m41 = 0;
    t.m42 = 0;
    t.m43 = 0;
    t.m44 = 1;
    
    return t;
}

VATransform3D VATransform3DTranslate (VATransform3D t, VGFloat tx,
                                                VGFloat ty, VGFloat tz)
{
    return VATransform3DConcat (VATransform3DMakeTranslation(tx, ty, tz), t);
}

VATransform3D VATransform3DScale (VATransform3D t, VGFloat sx,
                                            VGFloat sy, VGFloat sz)
{
    return VATransform3DConcat(t, VATransform3DMakeScale(sx, sy, sz));
}

VATransform3D VATransform3DRotate (VATransform3D t, VGFloat angle,
                                             VGFloat x, VGFloat y, VGFloat z)
{
    return VATransform3DConcat(t, VATransform3DMakeRotation(angle, x, y, z));
}

VATransform3D VATransform3DConcat (VATransform3D b, VATransform3D a)
{
    VATransform3D result;
    
    result.m11  = (a.m11*b.m11)+(a.m21*b.m12)+(a.m31*b.m13)+(a.m41*b.m14);
    result.m12  = (a.m12*b.m11)+(a.m22*b.m12)+(a.m32*b.m13)+(a.m42*b.m14);
    result.m13  = (a.m13*b.m11)+(a.m23*b.m12)+(a.m33*b.m13)+(a.m43*b.m14);
    result.m14  = (a.m14*b.m11)+(a.m24*b.m12)+(a.m34*b.m13)+(a.m44*b.m14);
    
    result.m21  = (a.m11*b.m21)+(a.m21*b.m22)+(a.m31*b.m23)+(a.m41*b.m24);
    result.m22  = (a.m12*b.m21)+(a.m22*b.m22)+(a.m32*b.m23)+(a.m42*b.m24);
    result.m23  = (a.m13*b.m21)+(a.m23*b.m22)+(a.m33*b.m23)+(a.m43*b.m24);
    result.m24  = (a.m14*b.m21)+(a.m24*b.m22)+(a.m34*b.m23)+(a.m44*b.m24);
    
    result.m31  = (a.m11*b.m31)+(a.m21*b.m32)+(a.m31*b.m33)+(a.m41*b.m34);
    result.m32  = (a.m12*b.m31)+(a.m22*b.m32)+(a.m32*b.m33)+(a.m42*b.m34);
    result.m33 = (a.m13*b.m31)+(a.m23*b.m32)+(a.m33*b.m33)+(a.m43*b.m34);
    result.m34 = (a.m14*b.m31)+(a.m24*b.m32)+(a.m34*b.m33)+(a.m44*b.m34);
    
    result.m41 = (a.m11*b.m41)+(a.m21*b.m42)+(a.m31*b.m43)+(a.m41*b.m44);
    result.m42 = (a.m12*b.m41)+(a.m22*b.m42)+(a.m32*b.m43)+(a.m42*b.m44);
    result.m43 = (a.m13*b.m41)+(a.m23*b.m42)+(a.m33*b.m43)+(a.m43*b.m44);
    result.m44 = (a.m14*b.m41)+(a.m24*b.m42)+(a.m34*b.m43)+(a.m44*b.m44);
    
    return result;
}


static VGFloat determinant2x2(VGFloat m11, VGFloat m12,
                              VGFloat m21, VGFloat m22)
{
    return m11 * m22 - m12 * m21;
}


static VGFloat determinant3x3(VGFloat m11, VGFloat m12, VGFloat m13,
                              VGFloat m21, VGFloat m22, VGFloat m23,
                              VGFloat m31, VGFloat m32, VGFloat m33)
{
    return m11 * determinant2x2(m22, m23, m32, m33 )
    - m21 * determinant2x2(m12, m13, m32, m33 )
    + m31 * determinant2x2(m12, m13, m22, m23 );
}


static VGFloat determinant4x4(VATransform3D t)
{
    return t.m11 * determinant3x3(t.m22, t.m23, t.m24, t.m32, t.m33, t.m34, t.m42, t.m43, t.m44)
    - t.m21 * determinant3x3(t.m12, t.m13, t.m14, t.m32, t.m33, t.m34, t.m42, t.m43, t.m44)
    + t.m31 * determinant3x3(t.m12, t.m13, t.m14, t.m22, t.m23, t.m24, t.m42, t.m43, t.m44)
    - t.m41 * determinant3x3(t.m12, t.m13, t.m14, t.m22, t.m23, t.m24, t.m32, t.m33, t.m34);
}

VATransform3D VATransform3DInvert (VATransform3D t)
{
    static const VGFloat epsilon = 0.00001; /* TODO: which value should we use? */
    VGFloat determinant = determinant4x4(t);
    if (fabs(determinant) > epsilon)
    {
        /* can be inverted */
        
        VATransform3D m;
        
        m.m11 =   determinant3x3(t.m22, t.m23, t.m24, t.m32, t.m33, t.m34, t.m42, t.m43, t.m44);
        m.m12 = - determinant3x3(t.m12, t.m13, t.m14, t.m32, t.m33, t.m34, t.m42, t.m43, t.m44);
        m.m13 =   determinant3x3(t.m12, t.m13, t.m14, t.m22, t.m23, t.m24, t.m42, t.m43, t.m44);
        m.m14 = - determinant3x3(t.m12, t.m13, t.m14, t.m22, t.m23, t.m24, t.m32, t.m33, t.m34);
        
        m.m21 = - determinant3x3(t.m21, t.m23, t.m24, t.m31, t.m33, t.m34, t.m41, t.m43, t.m44);
        m.m22 =   determinant3x3(t.m11, t.m13, t.m14, t.m31, t.m33, t.m34, t.m41, t.m43, t.m44);
        m.m23 = - determinant3x3(t.m11, t.m13, t.m14, t.m21, t.m23, t.m24, t.m41, t.m43, t.m44);
        m.m24 =   determinant3x3(t.m11, t.m13, t.m14, t.m21, t.m23, t.m24, t.m31, t.m33, t.m34);
        
        m.m31 =   determinant3x3(t.m21, t.m22, t.m24, t.m31, t.m32, t.m34, t.m41, t.m42, t.m44);
        m.m32 = - determinant3x3(t.m11, t.m12, t.m14, t.m31, t.m32, t.m34, t.m41, t.m42, t.m44);
        m.m33 =   determinant3x3(t.m11, t.m12, t.m14, t.m21, t.m22, t.m24, t.m41, t.m42, t.m44);
        m.m34 = - determinant3x3(t.m11, t.m12, t.m14, t.m21, t.m22, t.m24, t.m31, t.m32, t.m34);
        
        m.m41 = - determinant3x3(t.m21, t.m22, t.m23, t.m31, t.m32, t.m33, t.m41, t.m42, t.m43);
        m.m42 =   determinant3x3(t.m11, t.m12, t.m13, t.m31, t.m32, t.m33, t.m41, t.m42, t.m43);
        m.m43 = - determinant3x3(t.m11, t.m12, t.m13, t.m21, t.m22, t.m23, t.m41, t.m42, t.m43);
        m.m44 =   determinant3x3(t.m11, t.m12, t.m13, t.m21, t.m22, t.m23, t.m31, t.m32, t.m33);
        
        return m;
    }
    else
    {
        /* cannot be inverted */
        return t;
    }
}

VATransform3D VATransform3DMakeAffineTransform (VGAffineTransform m)
{
    return (VATransform3D){
            m.a, m.b, 0, 0,
            m.c, m.d, 0, 0,
              0,   0, 1, 0,
            m.tx,m.ty,0, 1,
    };
}

bool VATransform3DIsAffine (VATransform3D t)
{
    if (t.m13 == 0 && t.m14 == 0 && t.m23 == 0 && t.m24 == 0
        && t.m31 == 0 && t.m32 == 0 && t.m33 == 1 && t.m34 == 0
        && t.m43 == 0 && t.m44 == 1)
    {
        return true;
    }
    
    return false;
}

VGAffineTransform VATransform3DGetAffineTransform (VATransform3D t)
{
    VGAffineTransform at;
    if (VATransform3DIsAffine(t))
    {
        return VGAffineTransformMake(t.m11, t.m12, t.m21, t.m22, t.m41, t.m42);
    }
    
    return at;
}