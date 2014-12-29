//
//  VGGradient.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VGGradient__
#define __VeritasGraphics__VGGradient__


typedef struct VGGradient *VGGradientRef;

#include <stdint.h>

enum {
    kVGGradientDrawsBeforeStartLocation = (1 << 0),
    kVGGradientDrawsAfterEndLocation = (1 << 1)
};
typedef uint32_t VGGradientDrawingOptions;

#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGColorSpace.h>
#include <VeritasGraphics/VGContext.h>

/* A VGGradient defines a transition between colors. The transition is
 defined over a range from 0 to 1 inclusive. A gradient specifies a color
 at location 0, one at location 1, and possibly additional colors assigned
 to locations between 0 and 1.
 
 A VGGradient has a color space. When a gradient is created, all colors
 specified are converted to that color space, and interpolation of colors
 occurs using the components of that color space. See the documentation of
 each creation function for more details. */

/* Return the CFTypeID for VGGradients. */

VG_EXTERN CFTypeID VGGradientGetTypeID(void);

/* Creates a gradient by pairing the color components provided in
 `components' with locations provided in `locations'. If `locations' is
 NULL, the first color in `colors' will be at location 0, the last color
 in `colors' will be at location 1, and intervening colors will be at
 equal intervals in between. Otherwise, each location in `locations'
 should be a VGFloat between 0 and 1. Each set of color components should
 specify a color in the color space `space' (which may not be a pattern or
 indexed color space). The number of locations is specified by `count';
 the number of color components is the product of `count' and the number
 of color components of `space'. If no color is provided for 0 or 1, the
 gradient will use the color provided at the locations closest to 0 and 1
 for those values. */

VG_EXTERN VGGradientRef VGGradientCreateWithColorComponents(VGColorSpaceRef
                                                            space, const VGFloat components[], const VGFloat locations[], size_t count);

/* Creates a gradient by pairing the colors provided in `colors' with the
 locations provided in `locations'. `colors' should be a non-empty array
 of VGColor objects. The colors may be in any color space other than a
 pattern or indexed color space. If `space' is non-NULL, each color will
 be converted to that color space and the gradient will drawn in that
 space; otherwise, each color will be converted to and drawn in the
 "Generic" RGB color space. If `space' is specified, it may not be a
 pattern or indexed color space. If `locations' is NULL, the first color
 in `colors' will be at location 0, the last color in `colors' will be at
 location 1, and intervening colors will be at equal intervals in between.
 Otherwise, each location in `locations' should be a VGFloat between 0 and
 1; the array of locations should should contain the same number of items
 as `colors'. If no color is provided for 0 or 1, the gradient will use
 the color provided at the locations closest to 0 and 1 for those
 values. */

VG_EXTERN VGGradientRef VGGradientCreateWithColors(VGColorSpaceRef space,
                                                   CFArrayRef colors, const VGFloat locations[]);

/* Equivalent to `CFRetain' except that it doesn't crash (as `CFRetain'
 does) if `gradient' is NULL. */

VG_EXTERN VGGradientRef VGGradientRetain(VGGradientRef gradient);

/* Equivalent to `CFRelease' except that it doesn't crash (as `CFRelease'
 does) if `gradient' is NULL. */

VG_EXTERN void VGGradientRelease(VGGradientRef gradient);

#endif /* defined(__VeritasGraphics__VGGradient__) */
