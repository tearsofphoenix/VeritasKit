//
//  VGColorSpace.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGColorSpace.h"

#include <VeritasFoundation/CFRuntime.h>

struct VGColorSpace
{
    CFRuntimeBase base;
    size_t numComponents;
    VGColorSpaceModel model;
    VGColorSpaceRef baseColorSpace;
    size_t colorTableCount;
};


static CFTypeID _kVGColorSpaceID = _kCFRuntimeNotATypeID;

static CFRuntimeClass _kVGColorSpaceClass = {0};

/* Something external to this file is assumed to call this
 * before the VALayer class is used.
 */
void __VGColorSpaceClassInitialize(void) {
    _kVGColorSpaceClass.version = 0;
    _kVGColorSpaceClass.className = "VGColorSpace";
    _kVGColorSpaceClass.init = NULL;
    _kVGColorSpaceClass.copy = NULL;
    _kVGColorSpaceClass.finalize = NULL;
    _kVGColorSpaceClass.equal = NULL;
    _kVGColorSpaceClass.hash = NULL;
    _kVGColorSpaceClass.copyFormattingDesc = NULL;
    _kVGColorSpaceClass.copyDebugDesc = NULL;
    _kVGColorSpaceID = _CFRuntimeRegisterClass((const CFRuntimeClass * const)&_kVGColorSpaceClass);
}

/* Create a DeviceGray color space. */

VGColorSpaceRef VGColorSpaceCreateDeviceGray(void)
{
    return NULL;
}

/* Create a DeviceRGB color space. */

VGColorSpaceRef VGColorSpaceCreateDeviceRGB(void)
{
    VGColorSpaceRef colorSpace;
    uint32_t extra = sizeof(*colorSpace) - sizeof(CFRuntimeBase);
    colorSpace = (VGColorSpaceRef)_CFRuntimeCreateInstance(NULL, _kVGColorSpaceID, extra, NULL);
    if (NULL == colorSpace) {
        return NULL;
    }
    
    colorSpace->numComponents = 4;
    colorSpace->model = kVGColorSpaceModelRGB;
    colorSpace->baseColorSpace = NULL;
    colorSpace->colorTableCount = 0;
    
    return colorSpace;
}

/* Create a DeviceCMYK color space. */

VGColorSpaceRef VGColorSpaceCreateDeviceCMYK(void)
{
    return NULL;
}

/* Create a calibrated gray color space. `whitePoint' is an array of 3
 numbers specifying the tristimulus value, in the CIE 1931 XYZ-space, of
 the diffuse white point. `blackPoint' is an array of 3 numbers specifying
 the tristimulus value, in CIE 1931 XYZ-space, of the diffuse black point.
 `gamma' defines the gamma for the gray component. */

VGColorSpaceRef VGColorSpaceCreateCalibratedGray(const VGFloat whitePoint[3],
                                                 const VGFloat blackPoint[3],
                                                 VGFloat gamma)
{
    return NULL;
}

/* Create a calibrated RGB color space. `whitePoint' is an array of 3
 numbers specifying the tristimulus value, in the CIE 1931 XYZ-space, of
 the diffuse white point. `blackPoint' is an array of 3 numbers specifying
 the tristimulus value, in CIE 1931 XYZ-space, of the diffuse black point.
 `gamma' is an array of 3 numbers specifying the gamma for the red, green,
 and blue components of the color space. `matrix' is an array of 9 numbers
 specifying the linear interpretation of the gamma-modified RGB values of
 the color space with respect to the final XYZ representation. */

VGColorSpaceRef VGColorSpaceCreateCalibratedRGB(const VGFloat whitePoint[3],
                                                const VGFloat blackPoint[3],
                                                const VGFloat gamma[3],
                                                const VGFloat matrix[9])
{
    return NULL;
}

/* Create an L*a*b* color space. `whitePoint' is an array of 3 numbers
 specifying the tristimulus value, in the CIE 1931 XYZ-space, of the
 diffuse white point. `blackPoint' is an array of 3 numbers specifying the
 tristimulus value, in CIE 1931 XYZ-space, of the diffuse black point.
 `range' is an array of four numbers specifying the range of valid values
 for the a* and b* components of the color space. */

VGColorSpaceRef VGColorSpaceCreateLab(const VGFloat whitePoint[3],
                                      const VGFloat blackPoint[3],
                                      const VGFloat range[4])
{
    return NULL;
}

/* Create an ICC-based color space using the ICC profile specified by
 `data'. */

VGColorSpaceRef VGColorSpaceCreateWithICCProfile(CFDataRef data)
{
    return NULL;
}

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

VGColorSpaceRef VGColorSpaceCreateICCBased(size_t nComponents,
                                                     const VGFloat *range, VGDataProviderRef profile, VGColorSpaceRef alternate)
{
    return NULL;
}

/* Create an indexed color space. A sample value in an indexed color space
 is treated as an index into the color table of the color space. `base'
 specifies the base color space in which the values in the color table are
 to be interpreted. `lastIndex' is an integer which specifies the maximum
 valid index value; it must be less than or equal to 255. `colorTable' is
 an array of m * (lastIndex + 1) bytes, where m is the number of color
 components in the base color space. Each byte is an unsigned integer in
 the range 0 to 255 that is scaled to the range of the corresponding color
 component in the base color space. */

VGColorSpaceRef VGColorSpaceCreateIndexed(VGColorSpaceRef baseSpace,
                                                    size_t lastIndex, const unsigned char *colorTable)
{
    return NULL;
}

/* Create a pattern color space. `baseSpace' is the underlying color space
 of the pattern color space. For colored patterns, `baseSpace' should be
 NULL; for uncolored patterns, `baseSpace' specifies the color space of
 colors which will be painted through the pattern. */

VGColorSpaceRef VGColorSpaceCreatePattern(VGColorSpaceRef baseSpace)
{
    return NULL;
}

/* Create a color space using `name' as the identifier for the color
 space. */

VGColorSpaceRef VGColorSpaceCreateWithName(CFStringRef name)
{
    return NULL;
}

VGColorSpaceRef VGColorSpaceRetain(VGColorSpaceRef space)
{
    if (space) { CFRetain(space); }
    return space;
}

void VGColorSpaceRelease(VGColorSpaceRef space)
{
    if (space) { CFRelease(space); }
}

/* Return the CFTypeID for VGColorSpaces. */

CFTypeID VGColorSpaceGetTypeID(void)
{
    return _kVGColorSpaceID;
}

size_t VGColorSpaceGetNumberOfComponents(VGColorSpaceRef space)
{
    return space->numComponents;
}

/* Return the color space model of `space'. */

VGColorSpaceModel VGColorSpaceGetModel(VGColorSpaceRef space)
{
    return space->model;
}

/* Return the base color space of `space' if `space' is a pattern or indexed
 color space; otherwise, return NULL. To determine whether a color space
 is an indexed or pattern color space, use `VGColorSpaceGetModel'. */

VGColorSpaceRef VGColorSpaceGetBaseColorSpace(VGColorSpaceRef space)
{
    return space->baseColorSpace;
}

/* Return the number of entries in the color table of `space' if `space' is
 an indexed color space; otherwise, return 0. To determine whether a color
 space is an indexed color space, use `VGColorSpaceGetModel'. */

size_t VGColorSpaceGetColorTableCount(VGColorSpaceRef space)
{
    return space->colorTableCount;
}

/* Copy the entries in the color table of `space' to `table' if `space' is
 an indexed color space; otherwise, do nothing. The array pointed to by
 `table' should be at least as large as the number of entries in the color
 table; the returned data is in the same format as that passed to
 `VGColorSpaceCreateIndexed'. To determine whether a color space is an
 indexed color space, use `VGColorSpaceGetModel'. */

void VGColorSpaceGetColorTable(VGColorSpaceRef space, uint8_t *table)
{
    
}

/* Return a copy of the ICC profile of `space', or NULL if the color space
 doesn't have an ICC profile. */

CFDataRef VGColorSpaceCopyICCProfile(VGColorSpaceRef space)
{
    return NULL;
}
