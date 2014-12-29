//
//  VGColorSpace.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VGColorSpace__
#define __VeritasGraphics__VGColorSpace__


typedef struct VGColorSpace *VGColorSpaceRef;

#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGDataProvider.h>

/* Color rendering intents. */

enum VGColorRenderingIntent {
    kVGRenderingIntentDefault,
    kVGRenderingIntentAbsoluteColorimetric,
    kVGRenderingIntentRelativeColorimetric,
    kVGRenderingIntentPerceptual,
    kVGRenderingIntentSaturation
};
typedef enum VGColorRenderingIntent VGColorRenderingIntent;

/* The model of a color space. */

enum VGColorSpaceModel {
    kVGColorSpaceModelUnknown = -1,
    kVGColorSpaceModelMonochrome,
    kVGColorSpaceModelRGB,
    kVGColorSpaceModelCMYK,
    kVGColorSpaceModelLab,
    kVGColorSpaceModelDeviceN,
    kVGColorSpaceModelIndexed,
    kVGColorSpaceModelPattern
};
typedef enum VGColorSpaceModel VGColorSpaceModel;

/* Create a DeviceGray color space. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateDeviceGray(void);

/* Create a DeviceRGB color space. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateDeviceRGB(void);

/* Create a DeviceCMYK color space. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateDeviceCMYK(void);

/* Create a calibrated gray color space. `whitePoint' is an array of 3
 numbers specifying the tristimulus value, in the CIE 1931 XYZ-space, of
 the diffuse white point. `blackPoint' is an array of 3 numbers specifying
 the tristimulus value, in CIE 1931 XYZ-space, of the diffuse black point.
 `gamma' defines the gamma for the gray component. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateCalibratedGray(const VGFloat
                                                           whitePoint[3], const VGFloat blackPoint[3], VGFloat gamma);

/* Create a calibrated RGB color space. `whitePoint' is an array of 3
 numbers specifying the tristimulus value, in the CIE 1931 XYZ-space, of
 the diffuse white point. `blackPoint' is an array of 3 numbers specifying
 the tristimulus value, in CIE 1931 XYZ-space, of the diffuse black point.
 `gamma' is an array of 3 numbers specifying the gamma for the red, green,
 and blue components of the color space. `matrix' is an array of 9 numbers
 specifying the linear interpretation of the gamma-modified RGB values of
 the color space with respect to the final XYZ representation. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateCalibratedRGB(const VGFloat
                                                          whitePoint[3], const VGFloat blackPoint[3], const VGFloat gamma[3],
                                                          const VGFloat matrix[9]);

/* Create an L*a*b* color space. `whitePoint' is an array of 3 numbers
 specifying the tristimulus value, in the CIE 1931 XYZ-space, of the
 diffuse white point. `blackPoint' is an array of 3 numbers specifying the
 tristimulus value, in CIE 1931 XYZ-space, of the diffuse black point.
 `range' is an array of four numbers specifying the range of valid values
 for the a* and b* components of the color space. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateLab(const VGFloat whitePoint[3],
                                                const VGFloat blackPoint[3], const VGFloat range[4]);

/* Create an ICC-based color space using the ICC profile specified by
 `data'. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateWithICCProfile(CFDataRef data);

/* Create an ICC-based color space. `nComponents' specifies the number of
 color components in the color space defined by the ICC profile data. This
 must match the number of components actually in the ICC profile, and must
 be 1, 3, or 4. `range' is an array of 2*nComponents numbers specifying
 the minimum and maximum valid values of the corresponding color
 components, so that for color component k, range[2*k] <= c[k] <=
 range[2*k+1], where c[k] is the k'th color component. `profile' is a data
 provider specifying the ICC profile. `alternate' specifies an alternate
 color space to be used in case the ICC profile is not supported. It must
 have `nComponents' color components. If `alternate' is NULL, then the
 color space used will be DeviceGray, DeviceRGB, or DeviceCMYK, depending
 on whether `nComponents' is 1, 3, or 4, respectively. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateICCBased(size_t nComponents,
                                                     const VGFloat *range, VGDataProviderRef profile, VGColorSpaceRef alternate);

/* Create an indexed color space. A sample value in an indexed color space
 is treated as an index into the color table of the color space. `base'
 specifies the base color space in which the values in the color table are
 to be interpreted. `lastIndex' is an integer which specifies the maximum
 valid index value; it must be less than or equal to 255. `colorTable' is
 an array of m * (lastIndex + 1) bytes, where m is the number of color
 components in the base color space. Each byte is an unsigned integer in
 the range 0 to 255 that is scaled to the range of the corresponding color
 component in the base color space. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateIndexed(VGColorSpaceRef baseSpace,
                                                    size_t lastIndex, const unsigned char *colorTable);

/* Create a pattern color space. `baseSpace' is the underlying color space
 of the pattern color space. For colored patterns, `baseSpace' should be
 NULL; for uncolored patterns, `baseSpace' specifies the color space of
 colors which will be painted through the pattern. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreatePattern(VGColorSpaceRef baseSpace);

/* Create a color space using `name' as the identifier for the color
 space. */

VG_EXTERN VGColorSpaceRef VGColorSpaceCreateWithName(CFStringRef name);

/* Equivalent to `CFRetain(space)', except it doesn't crash (as CFRetain
 does) if `space' is NULL. */

VG_EXTERN VGColorSpaceRef VGColorSpaceRetain(VGColorSpaceRef space);

/* Equivalent to `CFRelease(space)', except it doesn't crash (as CFRelease
 does) if `space' is NULL. */

VG_EXTERN void VGColorSpaceRelease(VGColorSpaceRef space);

/* Return the CFTypeID for VGColorSpaces. */

VG_EXTERN CFTypeID VGColorSpaceGetTypeID(void);

/* Return the number of color components in the color space `space'. */

VG_EXTERN size_t VGColorSpaceGetNumberOfComponents(VGColorSpaceRef space);

/* Return the color space model of `space'. */

VG_EXTERN VGColorSpaceModel VGColorSpaceGetModel(VGColorSpaceRef space);

/* Return the base color space of `space' if `space' is a pattern or indexed
 color space; otherwise, return NULL. To determine whether a color space
 is an indexed or pattern color space, use `VGColorSpaceGetModel'. */

VG_EXTERN VGColorSpaceRef VGColorSpaceGetBaseColorSpace(VGColorSpaceRef space);

/* Return the number of entries in the color table of `space' if `space' is
 an indexed color space; otherwise, return 0. To determine whether a color
 space is an indexed color space, use `VGColorSpaceGetModel'. */

VG_EXTERN size_t VGColorSpaceGetColorTableCount(VGColorSpaceRef space);

/* Copy the entries in the color table of `space' to `table' if `space' is
 an indexed color space; otherwise, do nothing. The array pointed to by
 `table' should be at least as large as the number of entries in the color
 table; the returned data is in the same format as that passed to
 `VGColorSpaceCreateIndexed'. To determine whether a color space is an
 indexed color space, use `VGColorSpaceGetModel'. */

VG_EXTERN void VGColorSpaceGetColorTable(VGColorSpaceRef space, uint8_t *table);

/* Return a copy of the ICC profile of `space', or NULL if the color space
 doesn't have an ICC profile. */

VG_EXTERN CFDataRef VGColorSpaceCopyICCProfile(VGColorSpaceRef space);

#endif /* defined(__VeritasGraphics__VGColorSpace__) */
