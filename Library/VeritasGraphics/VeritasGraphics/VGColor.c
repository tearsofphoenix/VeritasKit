//
//  VGColor.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGColor.h"
#include <VeritasFoundation/CFRuntime.h>

struct VGColor
{
    CFRuntimeBase _base;
    VGFloat *components;
    VGColorSpaceRef space;
    VGPatternRef pattern;
};


static CFTypeID _kVGColorID = _kCFRuntimeNotATypeID;

static CFRuntimeClass _kVGColorClass = {0};

static CFTypeRef _VGColorCreateCopy(CFAllocatorRef allocator, CFTypeRef cf)
{
    return cf;
}

/* Something external to this file is assumed to call this
 * before the VALayer class is used.
 */
void __VGColorClassInitialize(void) {
    _kVGColorClass.version = 0;
    _kVGColorClass.className = "VGColor";
    _kVGColorClass.init = NULL;
    _kVGColorClass.copy = _VGColorCreateCopy;
    _kVGColorClass.finalize = NULL;
    _kVGColorClass.equal = (Boolean (*)(CFTypeRef cf1, CFTypeRef cf2))VGColorEqualToColor;
    _kVGColorClass.hash = NULL;
    _kVGColorClass.copyFormattingDesc = NULL;
    _kVGColorClass.copyDebugDesc = NULL;
    _kVGColorID = _CFRuntimeRegisterClass((const CFRuntimeClass * const)&_kVGColorClass);
}

VGColorRef VGColorCreate(VGColorSpaceRef space,
                         const VGFloat components[])
{
    VGColorRef color;
    uint32_t extra = sizeof(*color) - sizeof(CFRuntimeBase);
    color = (VGColorRef)_CFRuntimeCreateInstance(NULL, _kVGColorID, extra, NULL);
    
    if (NULL == color) {
        return NULL;
    }
    
    color->space = VGColorSpaceRetain(space);
    size_t num = VGColorSpaceGetNumberOfComponents(space);
    CFIndex size = sizeof(VGFloat) * num;
    
    color->components = CFAllocatorAllocate(CFGetAllocator(space), size, 0);
    memcpy(color->components, components, size);
    
    return color;
}

/* Create a color in the "Generic" gray color space. */

VGColorRef VGColorCreateGenericGray(VGFloat gray, VGFloat alpha)
{
    VGFloat components[] = {gray, alpha};

    return VGColorCreate(VGColorSpaceCreateDeviceGray(), components);
}

/* Create a color in the "Generic" RGB color space. */

VGColorRef VGColorCreateGenericRGB(VGFloat red, VGFloat green,
                                             VGFloat blue, VGFloat alpha)
{
    VGFloat components[] = {red, green, blue, alpha};
    return VGColorCreate(VGColorSpaceCreateDeviceRGB(), components);
}

/* Create a color in the "Generic" CMYK color space. */

VGColorRef VGColorCreateGenericCMYK(VGFloat cyan, VGFloat magenta,
                                    VGFloat yellow, VGFloat black, VGFloat alpha)
{
    VGFloat components[] = {cyan, magenta, yellow, black, alpha};
    return VGColorCreate(VGColorSpaceCreateDeviceCMYK(), components);
}

/* Return a constant color. As `VGColorGetConstantColor' is not a "Copy" or
 "Create" function, it does not necessarily return a new reference each
 time it's called. As a consequence, you should not release the returned
 value. However, colors returned from `VGColorGetConstantColor' can be
 retained and released in a properly nested fashion, just like any other
 CF type. */

VGColorRef VGColorGetConstantColor(CFStringRef colorName)
{
    return NULL;
}

/* Create a color in color space `space' with pattern `pattern' and
 components `components'. `space' must be a pattern color space. */

VGColorRef VGColorCreateWithPattern(VGColorSpaceRef space,
                                              VGPatternRef pattern, const VGFloat components[])
{
    return NULL;
}

/* Create a copy of `color'. */

VGColorRef VGColorCreateCopy(VGColorRef color)
{
    return (VGColorRef)_VGColorCreateCopy(CFGetAllocator(color), color);
}

/* Create a copy of `color' with alpha set to `alpha'. */

VGColorRef VGColorCreateCopyWithAlpha(VGColorRef color,
                                      VGFloat alpha)
{
    return NULL;
}

/* Equivalent to `CFRetain(color)', except it doesn't crash (as CFRetain
 does) if `color' is NULL. */

VGColorRef VGColorRetain(VGColorRef color)
{
    if (color) { CFRetain(color); }
    return color;
}

/* Equivalent to `CFRelease(color)', except it doesn't crash (as CFRelease
 does) if `color' is NULL. */

void VGColorRelease(VGColorRef color)
{
    if (color) { CFRelease(color); }
}

/* Return true if `color1' is equal to `color2'; false otherwise. */

bool VGColorEqualToColor(VGColorRef color1, VGColorRef color2)
{
    VGColorSpaceRef space = color1->space;
    if (space == color2->space)
    {
        size_t num = VGColorSpaceGetNumberOfComponents(space);
        CFIndex size = sizeof(VGFloat) * num;

        return memcmp(color1->components, color2->components, size);
    }
    
    return false;
}

/* Return the number of color components (including alpha) associated with
 `color'. */

size_t VGColorGetNumberOfComponents(VGColorRef color)
{
    return VGColorSpaceGetNumberOfComponents(VGColorGetColorSpace(color));
}

/* Return the color components (including alpha) associated with `color'. */

const VGFloat *VGColorGetComponents(VGColorRef color)
{
    return color->components;
}

/* Return the alpha component associated with `color'. */

VGFloat VGColorGetAlpha(VGColorRef color)
{
    return 1;
}

/* Return the color space associated with `color'. */

VGColorSpaceRef VGColorGetColorSpace(VGColorRef color)
{
    return color->space;
}

/* Return the pattern associated with `color', if it's a color in a pattern
 color space; NULL otherwise. */

VGPatternRef VGColorGetPattern(VGColorRef color)
{
    return color->pattern;
}

/* Return the CFTypeID for VGColors. */

CFTypeID VGColorGetTypeID(void)
{
    return _kVGColorID;
}
