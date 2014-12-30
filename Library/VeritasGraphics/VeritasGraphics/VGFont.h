//
//  VGFont.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VGFont__
#define __VeritasGraphics__VGFont__


/* The type used to represent a CoreGraphics font. */

typedef struct VGFont *VGFontRef;

/* A type to represent indexes in a VGFontRef. */

typedef unsigned short VGFontIndex;

/* A type to represent glyph identifiers in a VGFontRef. */

typedef VGFontIndex VGGlyph;

/* The format of a PostScript font subset. Type1 is documented in "Adobe
 Type 1 Font Format"; Type3 in "PostScript Language Reference, 3rd ed."
 and Type42 in "Adobe Technical Note 5012, The Type 42 Font Format
 Specification". */

enum VGFontPostScriptFormat {
    kVGFontPostScriptFormatType1 = 1,
    kVGFontPostScriptFormatType3 = 3,
    kVGFontPostScriptFormatType42 = 42
};
typedef enum VGFontPostScriptFormat VGFontPostScriptFormat;

#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGDataProvider.h>
#include <VeritasGraphics/VGGeometry.h>
#include <CoreFoundation/CFArray.h>
#include <CoreFoundation/CFData.h>
#include <CoreFoundation/CFDictionary.h>

enum {
    /* The maximum allowed value of a VGFontIndex. Always <= USHRT_MAX - 1. */
    kVGFontIndexMax = ((1 << 16) - 2),
    
    /* A value representing an invalid VGFontIndex. Always <= USHRT_MAX. */
    kVGFontIndexInvalid = ((1 << 16) - 1),
    
    /* The maximum allowed value of a VGGlyph. */
    kVGGlyphMax = kVGFontIndexMax
};

/* Return the CFTypeID for VGFontRefs. */

VG_EXTERN CFTypeID VGFontGetTypeID(void);

/* Create a VGFontRef using `platformFontReference', a pointer to a
 platform-specific font reference. For MacOS X, `platformFontReference'
 should be a pointer to an ATSFontRef. */

VG_EXTERN VGFontRef VGFontCreateWithPlatformFont(void *platformFontReference);

/* Return the font defined by the data provided by `provider', or NULL if
 the font can't be created. */

VG_EXTERN VGFontRef VGFontCreateWithDataProvider(VGDataProviderRef provider);

/* Return the font identified by `name', corresponding to the font's
 PostScript name or its full name, or NULL if the font can't be
 created. */

VG_EXTERN VGFontRef VGFontCreateWithFontName(CFStringRef name);

/* Return a font based on `font' with the variation specification dictionary
 `variations' applied to `font'. A variation specification dictionary
 contains keys corresponding the variation axis names of the font. Each
 key is a variation axis name; the value for each key is the value
 specified for that particular variation axis represented as a
 CFNumberRef. If a variation axis name is not specified in `variations',
 then the current value from `font' is used. */

VG_EXTERN VGFontRef VGFontCreateCopyWithVariations(VGFontRef font,
                                                   CFDictionaryRef variations) ;

/* Equivalent to `CFRetain(font)', except it doesn't crash (as CFRetain
 does) if `font' is NULL. */

VG_EXTERN VGFontRef VGFontRetain(VGFontRef font);

/* Equivalent to `CFRelease(font)', except it doesn't crash (as CFRelease
 does) if `font' is NULL. */

VG_EXTERN void VGFontRelease(VGFontRef font);

/* Return the number of glyphs in `font'. */

VG_EXTERN size_t VGFontGetNumberOfGlyphs(VGFontRef font);

/* Return the glyph space units/em for `font'. */

VG_EXTERN int VGFontGetUnitsPerEm(VGFontRef font);

/* Return the PostScript name of `font'. */

VG_EXTERN CFStringRef VGFontCopyPostScriptName(VGFontRef font)
;

/* Return the "full name" of `font'. */

VG_EXTERN CFStringRef VGFontCopyFullName(VGFontRef font);

/* Return the ascent of `font'. The ascent is the maximum distance above the
 baseline of glyphs in a font. The value is specified in glyph space
 units. */

VG_EXTERN int VGFontGetAscent(VGFontRef font);

/* Return the descent of `font'. The descent is the maximum distance below
 the baseline of glyphs in a font. The value is specified in glyph space
 units. */

VG_EXTERN int VGFontGetDescent(VGFontRef font);

/* Return the leading of `font'. The leading is the spacing between
 consecutive lines of text in a font. The value is specified in glyph
 space units. */

VG_EXTERN int VGFontGetLeading(VGFontRef font);

/* Return the cap height of `font'. The cap height is the distance above the
 baseline of the top of flat capital letters of glyphs in a font. The
 value is specified in glyph space units. */

VG_EXTERN int VGFontGetCapHeight(VGFontRef font);

/* Return the x-height of `font'. The x-height is the distance above the
 baseline of the top of flat, non-ascending lowercase letters (such as
 "x") of glyphs in a font. The value is specified in glyph space units. */

VG_EXTERN int VGFontGetXHeight(VGFontRef font);

/* Return the font bounding box of `font'. The font bounding box is the
 union of all of the bounding boxes for all the glyphs in a font. The
 value is specified in glyph space units. */

VG_EXTERN VGRect VGFontGetFontBBox(VGFontRef font);

/* Return the italic angle of `font', measured in degrees counter-clockwise
 from the vertical. */

VG_EXTERN VGFloat VGFontGetItalicAngle(VGFontRef font);

/* Return the thickness of the dominant vertical stems of glyphs in `font'.
 The value is specified in glyph space units. */

VG_EXTERN VGFloat VGFontGetStemV(VGFontRef font);

/* Return an array of the variation axis dictionaries for `font'. Each
 variation axis dictionary contains values for the variation axis keys
 listed below. This function returns NULL if `font' doesn't support
 variations. */

VG_EXTERN CFArrayRef VGFontCopyVariationAxes(VGFontRef font)
;

/* Return the variation specification dictionary from `font'. This
 dictionary contains keys corresponding the variation axis names of the
 font. Each key is a variation axis name; the value for each key is the
 value specified for that particular variation axis represented as a
 CFNumberRef. This function returns NULL if `font' doesn't support
 variations. */

VG_EXTERN CFDictionaryRef VGFontCopyVariations(VGFontRef font)
;

/* Get the advance of each glyph in `glyphs', an array of `count' glyphs,
 and return it in the corresponding entry of `advances', an array of
 `count' integers. The advances are specified in glyph space. Returns
 false if advances can't be retrieved for any reason; true otherwise. */

VG_EXTERN bool VGFontGetGlyphAdvances(VGFontRef font, const VGGlyph glyphs[],
                                      size_t count, int advances[]);

/* Get the bounding box of each glyph in `glyphs', an array of `count'
 glyphs, and return it in the corresponding entry of `bboxes', an array of
 `count' rectangles. The bounding boxes are specified in glyph space.
 Returns false if bounding boxes can't be retrieved for any reason; true
 otherwise. */

VG_EXTERN bool VGFontGetGlyphBBoxes(VGFontRef font, const VGGlyph glyphs[],
                                    size_t count, VGRect bboxes[]);

/* Return the glyph associated with `name' in `font'. If `name' isn't found
 in the font, return 0. */

VG_EXTERN VGGlyph VGFontGetGlyphWithGlyphName(VGFontRef font, CFStringRef name);

/* Return the glyph name of `glyph' in `font', or NULL if `glyph' does not
 appear in `font'. */

VG_EXTERN CFStringRef VGFontCopyGlyphNameForGlyph(VGFontRef font,
                                                  VGGlyph glyph);

/* Return true if a subset in the PostScript format `format' can be created
 for `font'; false otherwise. */

VG_EXTERN bool VGFontCanCreatePostScriptSubset(VGFontRef font,
                                               VGFontPostScriptFormat format)
;

/* Create a subset of `font' named `subsetName' in the PostScript format
 `format'. The subset will contain the glyphs specified by `glyphs', an
 array of `count' VGGlyphs. If non-NULL, `encoding' specifies the default
 encoding for the subset. */

VG_EXTERN CFDataRef VGFontCreatePostScriptSubset(VGFontRef font,
                                                 CFStringRef subsetName, VGFontPostScriptFormat format,
                                                 const VGGlyph glyphs[], size_t count, const VGGlyph encoding[256])
;

/* Return a PostScript encoding of `font' containing glyphs in
 `encoding'. */

VG_EXTERN CFDataRef VGFontCreatePostScriptEncoding(VGFontRef font,
                                                   const VGGlyph encoding[256]) ;

/* Return an array of font table tags in `font'. Each entry in the array is
 a four-byte value representing a single TrueType or OpenType font table
 tag. */

VG_EXTERN CFArrayRef VGFontCopyTableTags(VGFontRef font);

/* Return the table in `font' corresponding to `tag', or NULL if no such
 table exists. */

VG_EXTERN CFDataRef VGFontCopyTableForTag(VGFontRef font, uint32_t tag);

/*** Keys for the font variation axis dictionary. ***/

/* The key used to obtain the variation axis name from a variation axis
 dictionary. The value obtained with this key is a CFStringRef specifying
 the name of the variation axis. */

VG_EXTERN const CFStringRef kCGFontVariationAxisName
;

/* The key used to obtain the minimum variation axis value from a variation
 axis dictionary. The value obtained with this key is a CFNumberRef
 specifying the minimum value of the variation axis. */

VG_EXTERN const CFStringRef kCGFontVariationAxisMinValue
;

/* The key used to obtain the maximum variation axis value from a variation
 axis dictionary. The value obtained with this key is a CFNumberRef
 specifying the maximum value of the variation axis. */

VG_EXTERN const CFStringRef kCGFontVariationAxisMaxValue
;

/* The key used to obtain the default variation axis value from a variation
 axis dictionary. The value obtained with this key is a CFNumberRef
 specifying the default value of the variation axis. */

VG_EXTERN const CFStringRef kCGFontVariationAxisDefaultValue
;

/* Obsolete; don't use these. */

enum {
    VGGlyphMin ,
    VGGlyphMax
};


#endif /* defined(__VeritasGraphics__VGFont__) */
