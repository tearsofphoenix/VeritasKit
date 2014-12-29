//
//  VGShading.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VGShading__
#define __VeritasGraphics__VGShading__


typedef struct VGShading *VGShadingRef;

#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGColorSpace.h>
#include <VeritasGraphics/VGFunction.h>
#include <VeritasGraphics/VGGeometry.h>
#include <CoreFoundation/CFBase.h>

/* Return the CFTypeID for VGShadingRefs. */

VG_EXTERN CFTypeID VGShadingGetTypeID(void);

/* Create a shading defining a color blend which varies along a linear axis
 between two endpoints and extends indefinitely perpendicular to that
 axis. The shading may optionally extend beyond either endpoint by
 continuing the boundary colors indefinitely. The color values are
 specified in the color space `space'. The starting point of the axis is
 `start' and the ending point of the axis is `end', both specified in the
 shading's target coordinate space. The shading function, specified by
 `function', is a 1-in, N-out function, where N is one more (for alpha)
 than the number of color components in the shading's color space. The
 input value 0 corresponds to the color at the starting point of the
 shading; the input value 1 corresponds to the color at the ending point
 of the shading. If `extendStart' is true, then the shading will extend
 beyond the starting point of the axis. If `extendEnd' is true, then the
 shading will extend beyond the ending point of the axis. */

VG_EXTERN VGShadingRef VGShadingCreateAxial(VGColorSpaceRef space,
                                            VGPoint start, VGPoint end, VGFunctionRef function, bool extendStart,
                                            bool extendEnd) ;

/* Create a shading defining a color blend which varies between two circles.
 The shading may optionally extend beyond either circle by continuing the
 boundary colors. The color values are specified in the color space
 `space'. The starting circle has radius `startRadius' and is centered at
 `start', specified in the shading's target coordinate space. The ending
 circle has radius `endRadius' and is centered at `end', specified in the
 shading's target coordinate space. The shading function, specified by
 `function', is a 1-in, N-out function, where N is one more (for alpha)
 than the number of color components in the shading's color space. The
 input value 0 corresponds to the color of the starting circle; the input
 value 1 corresponds to the color of the ending circle. If `extendStart'
 is true, then the shading will extend beyond the starting circle. If
 `extendEnd' is true, then the shading will extend beyond the ending
 circle. */

VG_EXTERN VGShadingRef VGShadingCreateRadial(VGColorSpaceRef space,
                                             VGPoint start, VGFloat startRadius, VGPoint end, VGFloat endRadius,
                                             VGFunctionRef function, bool extendStart, bool extendEnd);

/* Equivalent to `CFRetain(shading)', except it doesn't crash (as CFRetain
 does) if `shading' is NULL. */

VG_EXTERN VGShadingRef VGShadingRetain(VGShadingRef shading);

/* Equivalent to `CFRelease(shading)', except it doesn't crash (as CFRelease
 does) if `shading' is NULL. */

VG_EXTERN void VGShadingRelease(VGShadingRef shading);

#endif /* defined(__VeritasGraphics__VGShading__) */
