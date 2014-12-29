//
//  VGColor.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VGColor__
#define __VeritasGraphics__VGColor__


typedef struct VGColor *VGColorRef;

#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGColorSpace.h>
#include <VeritasGraphics/VGPattern.h>

/* Create a color in the color space `space' with color components
 (including alpha) specified by `components'. `space' may be any color
 space except a pattern color space. */

VG_EXTERN VGColorRef VGColorCreate(VGColorSpaceRef space,
                                   const VGFloat components[]);

/* Create a color in the "Generic" gray color space. */

VG_EXTERN VGColorRef VGColorCreateGenericGray(VGFloat gray, VGFloat alpha);

/* Create a color in the "Generic" RGB color space. */

VG_EXTERN VGColorRef VGColorCreateGenericRGB(VGFloat red, VGFloat green,
                                             VGFloat blue, VGFloat alpha);

/* Create a color in the "Generic" CMYK color space. */

VG_EXTERN VGColorRef VGColorCreateGenericCMYK(VGFloat cyan, VGFloat magenta,
                                              VGFloat yellow, VGFloat black, VGFloat alpha);

/* Return a constant color. As `VGColorGetConstantColor' is not a "Copy" or
 "Create" function, it does not necessarily return a new reference each
 time it's called. As a consequence, you should not release the returned
 value. However, colors returned from `VGColorGetConstantColor' can be
 retained and released in a properly nested fashion, just like any other
 CF type. */

VG_EXTERN VGColorRef VGColorGetConstantColor(CFStringRef colorName);

/* Create a color in color space `space' with pattern `pattern' and
 components `components'. `space' must be a pattern color space. */

VG_EXTERN VGColorRef VGColorCreateWithPattern(VGColorSpaceRef space,
                                              VGPatternRef pattern, const VGFloat components[]);

/* Create a copy of `color'. */

VG_EXTERN VGColorRef VGColorCreateCopy(VGColorRef color);

/* Create a copy of `color' with alpha set to `alpha'. */

VG_EXTERN VGColorRef VGColorCreateCopyWithAlpha(VGColorRef color,
                                                VGFloat alpha);

/* Equivalent to `CFRetain(color)', except it doesn't crash (as CFRetain
 does) if `color' is NULL. */

VG_EXTERN VGColorRef VGColorRetain(VGColorRef color);

/* Equivalent to `CFRelease(color)', except it doesn't crash (as CFRelease
 does) if `color' is NULL. */

VG_EXTERN void VGColorRelease(VGColorRef color);

/* Return true if `color1' is equal to `color2'; false otherwise. */

VG_EXTERN bool VGColorEqualToColor(VGColorRef color1, VGColorRef color2);

/* Return the number of color components (including alpha) associated with
 `color'. */

VG_EXTERN size_t VGColorGetNumberOfComponents(VGColorRef color);

/* Return the color components (including alpha) associated with `color'. */

VG_EXTERN const VGFloat *VGColorGetComponents(VGColorRef color);

/* Return the alpha component associated with `color'. */

VG_EXTERN VGFloat VGColorGetAlpha(VGColorRef color);

/* Return the color space associated with `color'. */

VG_EXTERN VGColorSpaceRef VGColorGetColorSpace(VGColorRef color);

/* Return the pattern associated with `color', if it's a color in a pattern
 color space; NULL otherwise. */

VG_EXTERN VGPatternRef VGColorGetPattern(VGColorRef color);

/* Return the CFTypeID for VGColors. */

VG_EXTERN CFTypeID VGColorGetTypeID(void);

/*** Names of colors for use with `VGColorGetConstantColor'. ***/

/* Colors in the "Generic" gray color space. */

VG_EXTERN const CFStringRef kCGColorWhite;

VG_EXTERN const CFStringRef kCGColorBlack;

VG_EXTERN const CFStringRef kCGColorClear;


#endif /* defined(__VeritasGraphics__VGColor__) */
