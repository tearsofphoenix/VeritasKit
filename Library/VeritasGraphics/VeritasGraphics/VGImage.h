//
//  VGImage.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VGImage__
#define __VeritasGraphics__VGImage__

typedef struct VGImage *VGImageRef;

#include <VeritasGraphics/VGColorSpace.h>
#include <VeritasGraphics/VGDataProvider.h>
#include <VeritasGraphics/VGGeometry.h>

typedef CF_ENUM(uint32_t, VGImageAlphaInfo) {
    kVGImageAlphaNone,               /* For example, RGB. */
    kVGImageAlphaPremultipliedLast,  /* For example, premultiplied RGBA */
    kVGImageAlphaPremultipliedFirst, /* For example, premultiplied ARGB */
    kVGImageAlphaLast,               /* For example, non-premultiplied RGBA */
    kVGImageAlphaFirst,              /* For example, non-premultiplied ARGB */
    kVGImageAlphaNoneSkipLast,       /* For example, RBGX. */
    kVGImageAlphaNoneSkipFirst,      /* For example, XRGB. */
    kVGImageAlphaOnly                /* No color data, alpha data only */
};

typedef CF_OPTIONS(uint32_t, VGBitmapInfo) {
    kVGBitmapAlphaInfoMask = 0x1F,
    kVGBitmapFloatComponents = (1 << 8),
    
    kVGBitmapByteOrderMask = 0x7000,
    kVGBitmapByteOrderDefault = (0 << 12),
    kVGBitmapByteOrder16Little = (1 << 12),
    kVGBitmapByteOrder32Little = (2 << 12),
    kVGBitmapByteOrder16Big = (3 << 12),
    kVGBitmapByteOrder32Big = (4 << 12)
} CF_ENUM_AVAILABLE(10_4, 2_0);

#ifdef __BIG_ENDIAN__
# define kVGBitmapByteOrder16Host kVGBitmapByteOrder16Big
# define kVGBitmapByteOrder32Host kVGBitmapByteOrder32Big
#else    /* Little endian. */
# define kVGBitmapByteOrder16Host kVGBitmapByteOrder16Little
# define kVGBitmapByteOrder32Host kVGBitmapByteOrder32Little
#endif

/* Return the CFTypeID for VGImageRefs. */

VG_EXTERN CFTypeID VGImageGetTypeID(void);

/* Create an image. */

VG_EXTERN VGImageRef VGImageCreate(size_t width, size_t height,
                                   size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow,
                                   VGColorSpaceRef space, VGBitmapInfo bitmapInfo, VGDataProviderRef provider,
                                   const VGFloat decode[], bool shouldInterpolate,
                                   VGColorRenderingIntent intent);

/* Create an image mask. */

VG_EXTERN VGImageRef VGImageMaskCreate(size_t width, size_t height,
                                       size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow,
                                       VGDataProviderRef provider, const VGFloat decode[], bool shouldInterpolate);

/* Return a copy of `image'. Only the image structure itself is copied; the
 underlying data is not. */

VG_EXTERN VGImageRef VGImageCreateCopy(VGImageRef image)
;

/* Create an image from `source', a data provider of JPEG-encoded data. */

VG_EXTERN VGImageRef VGImageCreateWithJPEGDataProvider(VGDataProviderRef
                                                       source, const VGFloat decode[], bool shouldInterpolate,
                                                       VGColorRenderingIntent intent);

/* Create an image using `source', a data provider for PNG-encoded data. */

VG_EXTERN VGImageRef VGImageCreateWithPNGDataProvider(VGDataProviderRef source,
                                                      const VGFloat decode[], bool shouldInterpolate,
                                                      VGColorRenderingIntent intent);

/* Create an image using the data contained within the subrectangle `rect'
 of `image'.
 
 The new image is created by
 1) adjusting `rect' to integral bounds by calling "VGRectIntegral";
 2) intersecting the result with a rectangle with origin (0, 0) and size
 equal to the size of `image';
 3) referencing the pixels within the resulting rectangle, treating the
 first pixel of the image data as the origin of the image.
 If the resulting rectangle is the null rectangle, this function returns
 NULL.
 
 If W and H are the width and height of image, respectively, then the
 point (0,0) corresponds to the first pixel of the image data; the point
 (W-1, 0) is the last pixel of the first row of the image data; (0, H-1)
 is the first pixel of the last row of the image data; and (W-1, H-1) is
 the last pixel of the last row of the image data.
 
 The resulting image retains a reference to the original image, so you may
 release the original image after calling this function. */

VG_EXTERN VGImageRef VGImageCreateWithImageInRect(VGImageRef image,
                                                  VGRect rect) ;

/* Create a new image from `image' masked by `mask', which may be an image
 mask or an image.
 
 If `mask' is an image mask, then it indicates which parts of the context
 are to be painted with the image when drawn in a context, and which are
 to be masked out (left unchanged). The source samples of the image mask
 determine which areas are painted, acting as an "inverse alpha": if the
 value of a source sample in the image mask is S, then the corresponding
 region in `image' is blended with the destination using an alpha of
 (1-S). (For example, if S is 1, then the region is not painted, while if
 S is 0, the region is fully painted.)
 
 If `mask' is an image, then it serves as alpha mask for blending the
 image onto the destination. The source samples of `mask' determine which
 areas are painted: if the value of the source sample in mask is S, then
 the corresponding region in image is blended with the destination with an
 alpha of S. (For example, if S is 0, then the region is not painted,
 while if S is 1, the region is fully painted.)
 
 The parameter `image' may not be an image mask and may not have an image
 mask or masking color associated with it.
 
 If `mask' is an image, then it must be in the DeviceGray color space, may
 not have alpha, and may not itself be masked by an image mask or a
 masking color. */

VG_EXTERN VGImageRef VGImageCreateWithMask(VGImageRef image, VGImageRef mask)
;

/* Create a new image from `image' masked by `components', an array of 2N
 values { min[1], max[1], ... min[N], max[N] } where N is the number of
 components in color space of `image'. Any image sample with color value
 {c[1], ... c[N]} where min[i] <= c[i] <= max[i] for 1 <= i <= N is masked
 out (that is, not painted).
 
 Each value in `components' must be a valid image sample value: if `image'
 has integral pixel components, then each value of must be in the range
 [0..2**bitsPerComponent - 1] (where `bitsPerComponent' is the number of
 bits/component of `image'); if `image' has floating-point pixel
 components, then each value may be any floating-point number which is a
 valid color component.
 
 The parameter `image' may not be an image mask, and may not already have
 an image mask or masking color associated with it. */

VG_EXTERN VGImageRef VGImageCreateWithMaskingColors(VGImageRef image,
                                                    const VGFloat components[])
;

/* Create a copy of `image', replacing the image's color space with `space'.
 Returns NULL if `image' is an image mask, or if the number of components
 of `space' isn't the same as the number of components of the color space
 of `image'. */

VG_EXTERN VGImageRef VGImageCreateCopyWithColorSpace(VGImageRef image,
                                                     VGColorSpaceRef space) ;

/* Equivalent to `CFRetain(image)'. */

VG_EXTERN VGImageRef VGImageRetain(VGImageRef image);

/* Equivalent to `CFRelease(image)'. */

VG_EXTERN void VGImageRelease(VGImageRef image);

/* Return true if `image' is an image mask, false otherwise. */

VG_EXTERN bool VGImageIsMask(VGImageRef image);

/* Return the width of `image'. */

VG_EXTERN size_t VGImageGetWidth(VGImageRef image);

/* Return the height of `image'. */

VG_EXTERN size_t VGImageGetHeight(VGImageRef image);

/* Return the number of bits/component of `image'. */

VG_EXTERN size_t VGImageGetBitsPerComponent(VGImageRef image);

/* Return the number of bits/pixel of `image'. */

VG_EXTERN size_t VGImageGetBitsPerPixel(VGImageRef image);

/* Return the number of bytes/row of `image'. */

VG_EXTERN size_t VGImageGetBytesPerRow(VGImageRef image);

/* Return the color space of `image', or NULL if `image' is an image
 mask. */

VG_EXTERN VGColorSpaceRef VGImageGetColorSpace(VGImageRef image);

/* Return the alpha info of `image'. */

VG_EXTERN VGImageAlphaInfo VGImageGetAlphaInfo(VGImageRef image);

/* Return the data provider of `image'. */

VG_EXTERN VGDataProviderRef VGImageGetDataProvider(VGImageRef image);

/* Return the decode array of `image'. */

VG_EXTERN const VGFloat *VGImageGetDecode(VGImageRef image);

/* Return the interpolation parameter of `image'. */

VG_EXTERN bool VGImageGetShouldInterpolate(VGImageRef image);

/* Return the rendering intent of `image'. */

VG_EXTERN VGColorRenderingIntent VGImageGetRenderingIntent(VGImageRef image);

/* Return the bitmap info of `image'. */

VG_EXTERN VGBitmapInfo VGImageGetBitmapInfo(VGImageRef image)
;

#endif /* defined(__VeritasGraphics__VGImage__) */
