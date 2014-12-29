//
//  VGPattern.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VGPattern__
#define __VeritasGraphics__VGPattern__


typedef struct VGPattern *VGPatternRef;

#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGContext.h>
#include <CoreFoundation/CFBase.h>

/* kVGPatternTilingNoDistortion: The pattern cell is not distorted when
 painted, however the spacing between pattern cells may vary by as much as
 1 device pixel.
 
 kVGPatternTilingConstantSpacingMinimalDistortion: Pattern cells are
 spaced consistently, however the pattern cell may be distorted by as much
 as 1 device pixel when the pattern is painted.
 
 kVGPatternTilingConstantSpacing: Pattern cells are spaced consistently as
 with kVGPatternTilingConstantSpacingMinimalDistortion, however the
 pattern cell may be distorted additionally to permit a more efficient
 implementation. */

enum VGPatternTiling {
    kVGPatternTilingNoDistortion,
    kVGPatternTilingConstantSpacingMinimalDistortion,
    kVGPatternTilingConstantSpacing
};
typedef enum VGPatternTiling VGPatternTiling;

/* The drawing of the pattern is delegated to the callbacks. The callbacks
 may be called one or many times to draw the pattern.
 `version' is the version number of the structure passed in as a
 parameter to the VGPattern creation functions. The structure defined
 below is version 0.
 `drawPattern' should draw the pattern in the context `c'. `info' is the
 parameter originally passed to the VGPattern creation functions.
 `releaseInfo' is called when the pattern is deallocated. */

typedef void (*VGPatternDrawPatternCallback)(void *info, VGContextRef c);
typedef void (*VGPatternReleaseInfoCallback)(void *info);

struct VGPatternCallbacks {
    unsigned int version;
    VGPatternDrawPatternCallback drawPattern;
    VGPatternReleaseInfoCallback releaseInfo;
};
typedef struct VGPatternCallbacks VGPatternCallbacks;

/* Return the CFTypeID for VGPatternRefs. */

VG_EXTERN CFTypeID VGPatternGetTypeID(void);

/* Create a pattern. */

VG_EXTERN VGPatternRef VGPatternCreate(void *info, VGRect bounds,
                                       VGAffineTransform matrix, VGFloat xStep, VGFloat yStep,
                                       VGPatternTiling tiling, bool isColored, const VGPatternCallbacks *callbacks);

/* Equivalent to `CFRetain(pattern)', except it doesn't crash (as CF does)
 if `pattern' is NULL. */

VG_EXTERN VGPatternRef VGPatternRetain(VGPatternRef pattern);

/* Equivalent to `CFRelease(pattern)', except it doesn't crash (as CF does)
 if `pattern' is NULL. */

VG_EXTERN void VGPatternRelease(VGPatternRef pattern);

#endif /* defined(__VeritasGraphics__VGPattern__) */
