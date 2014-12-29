//
//  VGContext.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VGContext__
#define __VeritasGraphics__VGContext__

typedef const struct __VGContext * VGContextRef;

#include <CoreFoundation/CoreFoundation.h>
#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGAffineTransform.h>
#include <VeritasGraphics/VGColor.h>
#include <VeritasGraphics/VGColorSpace.h>
#include <VeritasGraphics/VGFont.h>
#include <VeritasGraphics/VGGradient.h>
#include <VeritasGraphics/VGImage.h>
#include <VeritasGraphics/VGPath.h>
#include <VeritasGraphics/VGPattern.h>
#include <VeritasGraphics/VGShading.h>

/* Drawing modes for paths. */

enum VGPathDrawingMode {
    kVGPathFill,
    kVGPathEOFill,
    kVGPathStroke,
    kVGPathFillStroke,
    kVGPathEOFillStroke
};
typedef enum VGPathDrawingMode VGPathDrawingMode;

/* Drawing modes for text. */

enum VGTextDrawingMode {
    kVGTextFill,
    kVGTextStroke,
    kVGTextFillStroke,
    kVGTextInvisible,
    kVGTextFillClip,
    kVGTextStrokeClip,
    kVGTextFillStrokeClip,
    kVGTextClip
};
typedef enum VGTextDrawingMode VGTextDrawingMode;

/* Text encodings. */

enum VGTextEncoding {
    kVGEncodingFontSpecific,
    kVGEncodingMacRoman
};
typedef enum VGTextEncoding VGTextEncoding;

/* Interpolation quality. */

enum VGInterpolationQuality {
    kVGInterpolationDefault = 0,	/* Let the context decide. */
    kVGInterpolationNone = 1,	/* Never interpolate. */
    kVGInterpolationLow = 2,	/* Low quality, fast interpolation. */
    kVGInterpolationMedium = 4,	/* Medium quality, slower than
                                 kVGInterpolationLow. */
    kVGInterpolationHigh = 3	/* Highest quality, slower than
                                 kVGInterpolationMedium. */
};
typedef enum VGInterpolationQuality VGInterpolationQuality;

/* Blend modes.
 
 The blend modes from kVGBlendModeNormal to kVGBlendModeLuminosity are
 supported in Mac OS X 10.4 and later. The Porter-Duff blend modes (from
 kVGBlendModeClear to kVGBlendModePlusLighter) are supported in Mac OS X
 10.5 and later. The names of the Porter-Duff blend modes are historical.
 
 Note that the Porter-Duff blend modes are not necessarily supported in
 every context. In particular, they are only guaranteed to work in
 bitmap-based contexts, such as those created by VGBitmapContextCreate. It
 is your responsibility to make sure that they do what you want when you
 use them in a VGContext. */

enum VGBlendMode {
    /* Available in Mac OS X 10.4 & later. */
    kVGBlendModeNormal,
    kVGBlendModeMultiply,
    kVGBlendModeScreen,
    kVGBlendModeOverlay,
    kVGBlendModeDarken,
    kVGBlendModeLighten,
    kVGBlendModeColorDodge,
    kVGBlendModeColorBurn,
    kVGBlendModeSoftLight,
    kVGBlendModeHardLight,
    kVGBlendModeDifference,
    kVGBlendModeExclusion,
    kVGBlendModeHue,
    kVGBlendModeSaturation,
    kVGBlendModeColor,
    kVGBlendModeLuminosity,
    
    /* Available in Mac OS X 10.5 & later. R, S, and D are, respectively,
     premultiplied result, source, and destination colors with alpha; Ra,
     Sa, and Da are the alpha components of these colors.
     
     The Porter-Duff "source over" mode is called `kVGBlendModeNormal':
     R = S + D*(1 - Sa)
     
     Note that the Porter-Duff "XOR" mode is only titularly related to the
     classical bitmap XOR operation (which is unsupported by
     CoreGraphics). */
    
    kVGBlendModeClear,			/* R = 0 */
    kVGBlendModeCopy,			/* R = S */
    kVGBlendModeSourceIn,		/* R = S*Da */
    kVGBlendModeSourceOut,		/* R = S*(1 - Da) */
    kVGBlendModeSourceAtop,		/* R = S*Da + D*(1 - Sa) */
    kVGBlendModeDestinationOver,	/* R = S*(1 - Da) + D */
    kVGBlendModeDestinationIn,		/* R = D*Sa */
    kVGBlendModeDestinationOut,		/* R = D*(1 - Sa) */
    kVGBlendModeDestinationAtop,	/* R = S*(1 - Da) + D*Sa */
    kVGBlendModeXOR,			/* R = S*(1 - Da) + D*(1 - Sa) */
    kVGBlendModePlusDarker,		/* R = MAX(0, (1 - D) + (1 - S)) */
    kVGBlendModePlusLighter		/* R = MIN(1, S + D) */
};
typedef enum VGBlendMode VGBlendMode; /* Available in Mac OS X 10.4 & later. */

/* Return the CFTypeID for VGContextRefs. */

VG_EXTERN CFTypeID VGContextGetTypeID(void);

/** Graphics state functions. **/

/* Push a copy of the current graphics state onto the graphics state stack.
 Note that the path is not considered part of the graphics state, and is
 not saved. */

VG_EXTERN void VGContextSaveGState(VGContextRef c);

/* Restore the current graphics state from the one on the top of the
 graphics state stack, popping the graphics state stack in the process. */

VG_EXTERN void VGContextRestoreGState(VGContextRef c);

/** Coordinate space transformations. **/

/* Scale the current graphics state's transformation matrix (the CTM) by
 `(sx, sy)'. */

VG_EXTERN void VGContextScaleCTM(VGContextRef c, VGFloat sx, VGFloat sy);

/* Translate the current graphics state's transformation matrix (the CTM) by
 `(tx, ty)'. */

VG_EXTERN void VGContextTranslateCTM(VGContextRef c, VGFloat tx, VGFloat ty);

/* Rotate the current graphics state's transformation matrix (the CTM) by
 `angle' radians. */

VG_EXTERN void VGContextRotateCTM(VGContextRef c, VGFloat angle);

/* Concatenate the current graphics state's transformation matrix (the CTM)
 with the affine transform `transform'. */

VG_EXTERN void VGContextConcatCTM(VGContextRef c, VGAffineTransform transform);

/* Return the current graphics state's transformation matrix. */

VG_EXTERN VGAffineTransform VGContextGetCTM(VGContextRef c);

/** Drawing attribute functions. **/

/* Set the line width in the current graphics state to `width'. */

VG_EXTERN void VGContextSetLineWidth(VGContextRef c, VGFloat width);

/* Set the line cap in the current graphics state to `cap'. */

VG_EXTERN void VGContextSetLineCap(VGContextRef c, VGLineCap cap);

/* Set the line join in the current graphics state to `join'. */

VG_EXTERN void VGContextSetLineJoin(VGContextRef c, VGLineJoin join);

/* Set the miter limit in the current graphics state to `limit'. */

VG_EXTERN void VGContextSetMiterLimit(VGContextRef c, VGFloat limit);

/* Set the line dash patttern in the current graphics state of `c'. */

VG_EXTERN void VGContextSetLineDash(VGContextRef c, VGFloat phase,
                                    const VGFloat lengths[], size_t count);

/* Set the path flatness parameter in the current graphics state of `c' to
 `flatness'. */

VG_EXTERN void VGContextSetFlatness(VGContextRef c, VGFloat flatness);

/* Set the alpha value in the current graphics state of `c' to `alpha'. */

VG_EXTERN void VGContextSetAlpha(VGContextRef c, VGFloat alpha);

/* Set the blend mode of `context' to `mode'. */

VG_EXTERN void VGContextSetBlendMode(VGContextRef context, VGBlendMode mode);

/** Path construction functions. **/

/* Note that a context has a single path in use at any time: a path is not
 part of the graphics state. */

/* Begin a new path. The old path is discarded. */

VG_EXTERN void VGContextBeginPath(VGContextRef c);

/* Start a new subpath at point `(x, y)' in the context's path. */

VG_EXTERN void VGContextMoveToPoint(VGContextRef c, VGFloat x, VGFloat y);

/* Append a straight line segment from the current point to `(x, y)'. */

VG_EXTERN void VGContextAddLineToPoint(VGContextRef c, VGFloat x, VGFloat y);

/* Append a cubic Bezier curve from the current point to `(x,y)', with
 control points `(cp1x, cp1y)' and `(cp2x, cp2y)'. */

VG_EXTERN void VGContextAddCurveToPoint(VGContextRef c, VGFloat cp1x,
                                        VGFloat cp1y, VGFloat cp2x, VGFloat cp2y, VGFloat x, VGFloat y);

/* Append a quadratic curve from the current point to `(x, y)', with control
 point `(cpx, cpy)'. */

VG_EXTERN void VGContextAddQuadCurveToPoint(VGContextRef c, VGFloat cpx,
                                            VGFloat cpy, VGFloat x, VGFloat y);

/* Close the current subpath of the context's path. */

VG_EXTERN void VGContextClosePath(VGContextRef c);

/** Path construction convenience functions. **/

/* Add a single rect to the context's path. */

VG_EXTERN void VGContextAddRect(VGContextRef c, VGRect rect);

/* Add a set of rects to the context's path. */

VG_EXTERN void VGContextAddRects(VGContextRef c, const VGRect rects[],
                                 size_t count) ;

/* Add a set of lines to the context's path. */

VG_EXTERN void VGContextAddLines(VGContextRef c, const VGPoint points[],
                                 size_t count) ;

/* Add an ellipse inside `rect' to the current path of `context'. See the
 function `VGPathAddEllipseInRect' for more information on how the path
 for the ellipse is constructed. */

VG_EXTERN void VGContextAddEllipseInRect(VGContextRef context, VGRect rect);

/* Add an arc of a circle to the context's path, possibly preceded by a
 straight line segment. `(x, y)' is the center of the arc; `radius' is its
 radius; `startAngle' is the angle to the first endpoint of the arc;
 `endAngle' is the angle to the second endpoint of the arc; and
 `clockwise' is 1 if the arc is to be drawn clockwise, 0 otherwise.
 `startAngle' and `endAngle' are measured in radians. */

VG_EXTERN void VGContextAddArc(VGContextRef c, VGFloat x, VGFloat y,
                               VGFloat radius, VGFloat startAngle, VGFloat endAngle, int clockwise);

/* Add an arc of a circle to the context's path, possibly preceded by a
 straight line segment. `radius' is the radius of the arc. The arc is
 tangent to the line from the current point to `(x1, y1)', and the line
 from `(x1, y1)' to `(x2, y2)'. */

VG_EXTERN void VGContextAddArcToPoint(VGContextRef c, VGFloat x1, VGFloat y1,
                                      VGFloat x2, VGFloat y2, VGFloat radius);

/* Add `path' to the path of context. The points in `path' are transformed
 by the CTM of context before they are added. */

VG_EXTERN void VGContextAddPath(VGContextRef context, VGPathRef path);

/** Path stroking. **/

/* Replace the path in `context' with the stroked version of the path, using
 the parameters of `context' to calculate the stroked path. The resulting
 path is created such that filling it with the appropriate color will
 produce the same results as stroking the original path. You can use this
 path in the same way you can use the path of any context; for example,
 you can clip to the stroked version of a path by calling this function
 followed by a call to "VGContextClip". */

VG_EXTERN void VGContextReplacePathWithStrokedPath(VGContextRef c);

/** Path information functions. **/

/* Return true if the path of `context' contains no elements, false
 otherwise. */

VG_EXTERN bool VGContextIsPathEmpty(VGContextRef context);

/* Return the current point of the current subpath of the path of
 `context'. */

VG_EXTERN VGPoint VGContextGetPathCurrentPoint(VGContextRef context);

/* Return the bounding box of the path of `context'. The bounding box is the
 smallest rectangle completely enclosing all points in the path, including
 control points for Bezier and quadratic curves. */

VG_EXTERN VGRect VGContextGetPathBoundingBox(VGContextRef context);

/* Return a copy of the path of `context'. The returned path is specified in
 the current user space of `context'. */

VG_EXTERN VGPathRef VGContextCopyPath(VGContextRef context);

/* Return true if `point' is contained in the current path of `context'. A
 point is contained within a context's path if it is inside the painted
 region when the path is stroked or filled with opaque colors using the
 path drawing mode `mode'. `point' is specified is user space. */

VG_EXTERN bool VGContextPathContainsPoint(VGContextRef context, VGPoint point,
                                          VGPathDrawingMode mode);

/** Path drawing functions. **/

/* Draw the context's path using drawing mode `mode'. */

VG_EXTERN void VGContextDrawPath(VGContextRef c, VGPathDrawingMode mode);

/** Path drawing convenience functions. **/

/* Fill the context's path using the winding-number fill rule. Any open
 subpath of the path is implicitly closed. */

VG_EXTERN void VGContextFillPath(VGContextRef c);

/* Fill the context's path using the even-odd fill rule. Any open subpath of
 the path is implicitly closed. */

VG_EXTERN void VGContextEOFillPath(VGContextRef c);

/* Stroke the context's path. */

VG_EXTERN void VGContextStrokePath(VGContextRef c);

/* Fill `rect' with the current fill color. */

VG_EXTERN void VGContextFillRect(VGContextRef c, VGRect rect);

/* Fill `rects', an array of `count' VGRects, with the current fill
 color. */

VG_EXTERN void VGContextFillRects(VGContextRef c, const VGRect rects[],
                                  size_t count) ;

/* Stroke `rect' with the current stroke color and the current linewidth. */

VG_EXTERN void VGContextStrokeRect(VGContextRef c, VGRect rect);

/* Stroke `rect' with the current stroke color, using `width' as the the
 line width. */

VG_EXTERN void VGContextStrokeRectWithWidth(VGContextRef c, VGRect rect,
                                            VGFloat width) ;

/* Clear `rect' (that is, set the region within the rect to transparent). */

VG_EXTERN void VGContextClearRect(VGContextRef c, VGRect rect);

/* Fill an ellipse (an oval) inside `rect'. */

VG_EXTERN void VGContextFillEllipseInRect(VGContextRef context, VGRect rect);

/* Stroke an ellipse (an oval) inside `rect'. */

VG_EXTERN void VGContextStrokeEllipseInRect(VGContextRef context, VGRect rect);

/* Stroke a sequence of line segments one after another in `context'. The
 line segments are specified by `points', an array of `count' VGPoints.
 This function is equivalent to
 
 VGContextBeginPath(context);
 for (k = 0; k < count; k += 2) {
 VGContextMoveToPoint(context, s[k].x, s[k].y);
 VGContextAddLineToPoint(context, s[k+1].x, s[k+1].y);
 }
 VGContextStrokePath(context); */

VG_EXTERN void VGContextStrokeLineSegments(VGContextRef c,
                                           const VGPoint points[], size_t count);

/** Clipping functions. **/

/* Intersect the context's path with the current clip path and use the
 resulting path as the clip path for subsequent rendering operations. Use
 the winding-number fill rule for deciding what's inside the path. */

VG_EXTERN void VGContextClip(VGContextRef c);

/* Intersect the context's path with the current clip path and use the
 resulting path as the clip path for subsequent rendering operations. Use
 the even-odd fill rule for deciding what's inside the path. */

VG_EXTERN void VGContextEOClip(VGContextRef c);

/* Add `mask' transformed to `rect' to the clipping area of `context'. The
 mask, which may be either an image mask or an image, is mapped into the
 specified rectangle and intersected with the current clipping area of the
 context.
 
 If `mask' is an image mask, then it clips in a manner identical to the
 behavior if it were used with "VGContextDrawImage": it indicates an area
 to be masked out (left unchanged) when drawing. The source samples of the
 image mask determine which points of the clipping area are changed,
 acting as an "inverse alpha": if the value of a source sample in the
 image mask is S, then the corresponding point in the current clipping
 area will be multiplied by an alpha of (1-S). (For example, if S is 1,
 then the point in the clipping area becomes clear, while if S is 0, the
 point in the clipping area is unchanged.
 
 If `mask' is an image, then it serves as alpha mask and is blended with
 the current clipping area. The source samples of mask determine which
 points of the clipping area are changed: if the value of the source
 sample in mask is S, then the corresponding point in the current clipping
 area will be multiplied by an alpha of S. (For example, if S is 0, then
 the point in the clipping area becomes clear, while if S is 1, the point
 in the clipping area is unchanged.
 
 If `mask' is an image, then it must be in the DeviceGray color space, may
 not have alpha, and may not be masked by an image mask or masking
 color. */

VG_EXTERN void VGContextClipToMask(VGContextRef c, VGRect rect,
                                   VGImageRef mask);

/* Return the bounding box of the clip path of `c' in user space. The
 bounding box is the smallest rectangle completely enclosing all points in
 the clip. */

VG_EXTERN VGRect VGContextGetClipBoundingBox(VGContextRef c);

/** Clipping convenience functions. **/

/* Intersect the current clipping path with `rect'. Note that this function
 resets the context's path to the empty path. */

VG_EXTERN void VGContextClipToRect(VGContextRef c, VGRect rect);

/* Intersect the current clipping path with the clipping region formed by
 creating a path consisting of all rects in `rects'. Note that this
 function resets the context's path to the empty path. */

VG_EXTERN void VGContextClipToRects(VGContextRef c, const VGRect rects[],
                                    size_t count) ;

/** Primitive color functions. **/

/* Set the current fill color in the context `c' to `color'. */

VG_EXTERN void VGContextSetFillColorWithColor(VGContextRef c, VGColorRef color);

/* Set the current stroke color in the context `c' to `color'. */

VG_EXTERN void VGContextSetStrokeColorWithColor(VGContextRef c,
                                                VGColorRef color) ;

/** Color space functions. **/

/* Set the current fill color space in `context' to `space'. As a
 side-effect, set the fill color to a default value appropriate for the
 color space. */

VG_EXTERN void VGContextSetFillColorSpace(VGContextRef context,
                                          VGColorSpaceRef space) ;

/* Set the current stroke color space in `context' to `space'. As a
 side-effect, set the stroke color to a default value appropriate for the
 color space. */

VG_EXTERN void VGContextSetStrokeColorSpace(VGContextRef context,
                                            VGColorSpaceRef space) ;

/** Color functions. **/

/* Set the components of the current fill color in `context' to the values
 specifed by `components'. The number of elements in `components' must be
 one greater than the number of components in the current fill color space
 (N color components + 1 alpha component). The current fill color space
 must not be a pattern color space. */

VG_EXTERN void VGContextSetFillColor(VGContextRef context,
                                     const VGFloat components[]);

/* Set the components of the current stroke color in `context' to the values
 specifed by `components'. The number of elements in `components' must be
 one greater than the number of components in the current stroke color
 space (N color components + 1 alpha component). The current stroke color
 space must not be a pattern color space. */

VG_EXTERN void VGContextSetStrokeColor(VGContextRef context,
                                       const VGFloat components[]);

/** Pattern functions. **/

/* Set the components of the current fill color in `context' to the values
 specifed by `components', and set the current fill pattern to `pattern'.
 The number of elements in `components' must be one greater than the
 number of components in the current fill color space (N color components
 + 1 alpha component). The current fill color space must be a pattern
 color space. */

VG_EXTERN void VGContextSetFillPattern(VGContextRef context,
                                       VGPatternRef pattern, const VGFloat components[]);

/* Set the components of the current stroke color in `context' to the values
 specifed by `components', and set the current stroke pattern to
 `pattern'. The number of elements in `components' must be one greater
 than the number of components in the current stroke color space (N color
 components + 1 alpha component). The current stroke color space must be a
 pattern color space. */

VG_EXTERN void VGContextSetStrokePattern(VGContextRef context,
                                         VGPatternRef pattern, const VGFloat components[]);

/* Set the pattern phase in the current graphics state of `context' to
 `phase'. */

VG_EXTERN void VGContextSetPatternPhase(VGContextRef context, VGSize phase);

/** Color convenience functions. **/

/* Set the current fill color space in `context' to `DeviceGray' and set the
 components of the current fill color to `(gray, alpha)'. */

VG_EXTERN void VGContextSetGrayFillColor(VGContextRef context, VGFloat gray,
                                         VGFloat alpha) ;

/* Set the current stroke color space in `context' to `DeviceGray' and set
 the components of the current stroke color to `(gray, alpha)'. */

VG_EXTERN void VGContextSetGrayStrokeColor(VGContextRef context, VGFloat gray,
                                           VGFloat alpha) ;

/* Set the current fill color space in `context' to `DeviceRGB' and set the
 components of the current fill color to `(red, green, blue, alpha)'. */

VG_EXTERN void VGContextSetRGBFillColor(VGContextRef context, VGFloat red,
                                        VGFloat green, VGFloat blue, VGFloat alpha);

/* Set the current stroke color space in `context' to `DeviceRGB' and set
 the components of the current stroke color to `(red, green, blue,
 alpha)'. */

VG_EXTERN void VGContextSetRGBStrokeColor(VGContextRef context, VGFloat red,
                                          VGFloat green, VGFloat blue, VGFloat alpha);

/* Set the current fill color space in `context' to `DeviceCMYK' and set the
 components of the current fill color to `(cyan, magenta, yellow, black,
 alpha)'. */

VG_EXTERN void VGContextSetCMYKFillColor(VGContextRef context, VGFloat cyan,
                                         VGFloat magenta, VGFloat yellow, VGFloat black, VGFloat alpha);

/* Set the current stroke color space in `context' to `DeviceCMYK' and set
 the components of the current stroke color to `(cyan, magenta, yellow,
 black, alpha)'. */

VG_EXTERN void VGContextSetCMYKStrokeColor(VGContextRef context, VGFloat cyan,
                                           VGFloat magenta, VGFloat yellow, VGFloat black, VGFloat alpha);

/** Rendering intent. **/

/* Set the rendering intent in the current graphics state of `context' to
 `intent'. */

VG_EXTERN void VGContextSetRenderingIntent(VGContextRef context,
                                           VGColorRenderingIntent intent);

/** Image functions. **/

/* Draw `image' in the rectangular area specified by `rect' in the context
 `c'. The image is scaled, if necessary, to fit into `rect'. */

VG_EXTERN void VGContextDrawImage(VGContextRef c, VGRect rect,
                                  VGImageRef image) ;

/* Draw `image' tiled in the context `c'. The image is scaled to the size
 specified by `rect' in user space, positioned at the origin of `rect' in
 user space, then replicated, stepping the width of `rect' horizontally
 and the height of `rect' vertically, to fill the current clip region.
 Unlike patterns, the image is tiled in user space, so transformations
 applied to the CTM affect the final result. */

VG_EXTERN void VGContextDrawTiledImage(VGContextRef c, VGRect rect,
                                       VGImageRef image) ;

/* Return the interpolation quality for image rendering of `context'. The
 interpolation quality is a gstate parameter which controls the level of
 interpolation performed when an image is interpolated (for example, when
 scaling the image). Note that it is merely a hint to the context: not all
 contexts support all interpolation quality levels. */

VG_EXTERN VGInterpolationQuality
VGContextGetInterpolationQuality(VGContextRef context);

/* Set the interpolation quality of `context' to `quality'. */

VG_EXTERN void VGContextSetInterpolationQuality(VGContextRef context,
                                                VGInterpolationQuality quality);

/** Shadow support. **/

/* Set the shadow parameters in `context'. `offset' specifies a translation
 in base-space; `blur' is a non-negative number specifying the amount of
 blur; `color' specifies the color of the shadow, which may contain a
 non-opaque alpha value. If `color' is NULL, it's equivalent to specifying
 a fully transparent color. The shadow is a gstate parameter. After a
 shadow is specified, all objects drawn subsequently will be shadowed. To
 turn off shadowing, set the shadow color to a fully transparent color (or
 pass NULL as the color), or use the standard gsave/grestore mechanism. */

VG_EXTERN void VGContextSetShadowWithColor(VGContextRef context, VGSize offset,
                                           VGFloat blur, VGColorRef color);

/* Equivalent to calling
 VGContextSetShadowWithColor(context, offset, blur, color)
 where color is black with 1/3 alpha (i.e., RGBA = {0, 0, 0, 1.0/3.0}) in
 the DeviceRGB color space. */

VG_EXTERN void VGContextSetShadow(VGContextRef context, VGSize offset,
                                  VGFloat blur) ;

/** Gradient and shading functions. **/

/* Fill the current clipping region of `context' with a linear gradient from
 `startPoint' to `endPoint'. The location 0 of `gradient' corresponds to
 `startPoint'; the location 1 of `gradient' corresponds to `endPoint';
 colors are linearly interpolated between these two points based on the
 values of the gradient's locations. The option flags control whether the
 gradient is drawn before the start point or after the end point. */

VG_EXTERN void VGContextDrawLinearGradient(VGContextRef context,
                                           VGGradientRef gradient, VGPoint startPoint, VGPoint endPoint,
                                           VGGradientDrawingOptions options);

/* Fill the current clipping region of `context' with a radial gradient
 between two circles defined by the center point and radius of each
 circle. The location 0 of `gradient' corresponds to a circle centered at
 `startCenter' with radius `startRadius'; the location 1 of `gradient'
 corresponds to a circle centered at `endCenter' with radius `endRadius';
 colors are linearly interpolated between these two circles based on the
 values of the gradient's locations. The option flags control whether the
 gradient is drawn before the start circle or after the end circle. */

VG_EXTERN void VGContextDrawRadialGradient(VGContextRef context,
                                           VGGradientRef gradient, VGPoint startCenter, VGFloat startRadius,
                                           VGPoint endCenter, VGFloat endRadius, VGGradientDrawingOptions options);

/* Fill the current clipping region of `context' with `shading'. */

VG_EXTERN void VGContextDrawShading(VGContextRef context, VGShadingRef shading);

/** Text functions. **/

/* Set the current character spacing in `context' to `spacing'. The
 character spacing is added to the displacement between the origin of one
 character and the origin of the next. */

VG_EXTERN void VGContextSetCharacterSpacing(VGContextRef context,
                                            VGFloat spacing) ;

/* Set the user-space point at which text will be drawn in the context `c'
 to `(x, y)'. */

VG_EXTERN void VGContextSetTextPosition(VGContextRef c, VGFloat x, VGFloat y);

/* Return the user-space point at which text will be drawn in `context'. */

VG_EXTERN VGPoint VGContextGetTextPosition(VGContextRef context);

/* Set the text matrix in the context `c' to `t'. */

VG_EXTERN void VGContextSetTextMatrix(VGContextRef c, VGAffineTransform t);

/* Return the text matrix in the context `c'. */

VG_EXTERN VGAffineTransform VGContextGetTextMatrix(VGContextRef c);

/* Set the text drawing mode in the current graphics state of the context
 `c' to `mode'. */

VG_EXTERN void VGContextSetTextDrawingMode(VGContextRef c,
                                           VGTextDrawingMode mode) ;

/* Set the font in the current graphics state of the context `c' to
 `font'. */

VG_EXTERN void VGContextSetFont(VGContextRef c, VGFontRef font);

/* Set the font size in the current graphics state of the context `c' to
 `size'. */

VG_EXTERN void VGContextSetFontSize(VGContextRef c, VGFloat size);

/* Draw `glyphs', an array of `count' VGGlyphs, at the points specified by
 `positions'. Each element of `positions' specifies the position from the
 associated glyph; the positions are specified in user space. */

VG_EXTERN void VGContextShowGlyphsAtPositions(VGContextRef context,
                                              const VGGlyph glyphs[], const VGPoint positions[], size_t count);

/** Context functions. **/

/* Equivalent to `CFRetain(c)'. */

VG_EXTERN VGContextRef VGContextRetain(VGContextRef c);

/* Equivalent to `CFRelease(c)'. */

VG_EXTERN void VGContextRelease(VGContextRef c);

/* Flush all drawing to the destination. */

VG_EXTERN void VGContextFlush(VGContextRef c);

/* Synchronized drawing. */

VG_EXTERN void VGContextSynchronize(VGContextRef c);

/** Antialiasing functions. **/

/* Turn on antialiasing if `shouldAntialias' is true; turn it off otherwise.
 This parameter is part of the graphics state. */

VG_EXTERN void VGContextSetShouldAntialias(VGContextRef context,
                                           bool shouldAntialias) ;

/* Allow antialiasing in `context' if `allowsAntialiasing' is true; don't
 allow it otherwise. This parameter is not part of the graphics state. A
 context will perform antialiasing if both `allowsAntialiasing' and the
 graphics state parameter `shouldAntialias' are true. */

VG_EXTERN void VGContextSetAllowsAntialiasing(VGContextRef context,
                                              bool allowsAntialiasing);

/** Font display functions. **/

/* Turn on font smoothing if `shouldSmoothFonts' is true; turn it off
 otherwise. This parameter is part of the graphics state. Note that this
 doesn't guarantee that font smoothing will occur: not all destination
 contexts support font smoothing. */

VG_EXTERN void VGContextSetShouldSmoothFonts(VGContextRef context,
                                             bool shouldSmoothFonts);

/* If `allowsFontSmoothing' is true, then allow font smoothing when
 displaying text in `context'; otherwise, don't allow font smoothing. This
 parameter is not part of the graphics state. Fonts will be smoothed if
 they are antialiased when drawn and if both `allowsFontSmoothing' and the
 graphics state parameter `shouldSmoothFonts' are true. */

VG_EXTERN void VGContextSetAllowsFontSmoothing(VGContextRef context,
                                               bool allowsFontSmoothing);

/* If `shouldSubpixelPositionFonts' is true, then glyphs may be placed at
 subpixel positions (if allowed) when displaying text in `context';
 otherwise, glyphs will be forced to integer pixel boundaries. This
 parameter is part of the graphics state. */

VG_EXTERN void VGContextSetShouldSubpixelPositionFonts(VGContextRef context,
                                                       bool shouldSubpixelPositionFonts);

/* If `allowsFontSubpixelPositioning' is true, then allow font subpixel
 positioning when displaying text in `context'; otherwise, don't allow
 subpixel positioning. This parameter is not part of the graphics state. A
 context will place glyphs at subpixel positions if fonts will be
 antialiased when drawn and if both `allowsFontSubpixelPositioning' and
 the graphics state parameter `shouldSubpixelPositionFonts' are true. */

VG_EXTERN void VGContextSetAllowsFontSubpixelPositioning(VGContextRef context,
                                                         bool allowsFontSubpixelPositioning);

/* If `shouldSubpixelQuantizeFonts' is true, then quantize the subpixel
 positions of glyphs when displaying text in `context'; otherwise, don't
 quantize the subpixel positions. This parameter is part of the graphics
 state. */

VG_EXTERN void VGContextSetShouldSubpixelQuantizeFonts(VGContextRef context,
                                                       bool shouldSubpixelQuantizeFonts);

/* If `allowsFontSubpixelQuantization' is true, then allow font subpixel
 quantization when displaying text in `context'; otherwise, don't allow
 subpixel quantization. This parameter is not part of the graphics state.
 A context quantizes subpixel positions if glyphs will be drawn at
 subpixel positions and `allowsFontSubpixelQuantization' and the graphics
 state parameter `shouldSubpixelQuantizeFonts' are both true. */

VG_EXTERN void VGContextSetAllowsFontSubpixelQuantization(VGContextRef context,
                                                          bool allowsFontSubpixelQuantization);

/** Transparency layer support. **/

/* Begin a transparency layer in `context'. All subsequent drawing
 operations until a corresponding `VGContextEndTransparencyLayer' are
 composited into a fully transparent backdrop (which is treated as a
 separate destination buffer from the context). After the transparency
 layer is ended, the result is composited into the context using the
 global alpha and shadow state of the context. This operation respects the
 clipping region of the context. After a call to this function, all of the
 parameters in the graphics state remain unchanged with the exception of
 the following:
 - The global alpha is set to 1.
 - The shadow is turned off.
 - The blend mode is set to `kVGBlendModeNormal'.
 Ending the transparency layer restores these parameters to the values
 they had before `VGContextBeginTransparencyLayer' was called.
 Transparency layers may be nested. */

VG_EXTERN void VGContextBeginTransparencyLayer(VGContextRef context,
                                               CFDictionaryRef auxiliaryInfo);

/* Begin a transparency layer in `context'. This function is identical to
 `VGContextBeginTransparencyLayer' except that the content of the
 transparency layer will be bounded by `rect' (specified in user space). */

VG_EXTERN void VGContextBeginTransparencyLayerWithRect(VGContextRef context,
                                                       VGRect rect, CFDictionaryRef auxiliaryInfo);

/* End a tranparency layer. */

VG_EXTERN void VGContextEndTransparencyLayer(VGContextRef context);

/** User space to device space tranformations. **/

/* Return the affine transform mapping the user space (abstract coordinates)
 of `context' to device space (pixels). */

VG_EXTERN VGAffineTransform
VGContextGetUserSpaceToDeviceSpaceTransform(VGContextRef context);

/* Transform `point' from the user space of `context' to device space. */

VG_EXTERN VGPoint VGContextConvertPointToDeviceSpace(VGContextRef context,
                                                     VGPoint point);

/* Transform `point' from device space to the user space of `context'. */

VG_EXTERN VGPoint VGContextConvertPointToUserSpace(VGContextRef context,
                                                   VGPoint point);

/* Transform `size' from the user space of `context' to device space. */

VG_EXTERN VGSize VGContextConvertSizeToDeviceSpace(VGContextRef context,
                                                   VGSize size);

/* Transform `size' from device space to the user space of `context'. */

VG_EXTERN VGSize VGContextConvertSizeToUserSpace(VGContextRef context,
                                                 VGSize size);

/* Transform `rect' from the user space of `context' to device space. Since
 affine transforms do not preserve rectangles in general, this function
 returns the smallest rectangle which contains the transformed corner
 points of `rect'. */

VG_EXTERN VGRect VGContextConvertRectToDeviceSpace(VGContextRef context,
                                                   VGRect rect);

/* Transform `rect' from device space to the user space of `context'. Since
 affine transforms do not preserve rectangles in general, this function
 returns the smallest rectangle which contains the transformed corner
 points of `rect'. */

VG_EXTERN VGRect VGContextConvertRectToUserSpace(VGContextRef context,
                                                 VGRect rect);

/** Deprecated functions. **/

/* DEPRECATED; use the CoreText API instead. */

VG_EXTERN void VGContextSelectFont(VGContextRef c, const char *name,
                                   VGFloat size, VGTextEncoding textEncoding);

/* DEPRECATED; use the CoreText API instead. */

VG_EXTERN void VGContextShowText(VGContextRef c, const char *string,
                                 size_t length);

/* DEPRECATED; use the CoreText API instead. */

VG_EXTERN void VGContextShowTextAtPoint(VGContextRef c, VGFloat x, VGFloat y,
                                        const char *string, size_t length);

/* DEPRECATED; use the CoreText API instead. */

VG_EXTERN void VGContextShowGlyphs(VGContextRef c, const VGGlyph g[],
                                   size_t count);

/* DEPRECATED; use the CoreText API instead. */

VG_EXTERN void VGContextShowGlyphsAtPoint(VGContextRef context, VGFloat x,
                                          VGFloat y, const VGGlyph glyphs[], size_t count);

/* DEPRECATED; use the CoreText API instead. */

VG_EXTERN void VGContextShowGlyphsWithAdvances(VGContextRef context,
                                               const VGGlyph glyphs[], const VGSize advances[], size_t count);

#endif /* defined(__VeritasGraphics__VGContext__) */
