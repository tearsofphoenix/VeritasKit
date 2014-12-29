//
//  VGPath.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VGPath__
#define __VeritasGraphics__VGPath__


typedef struct VGPath *VGMutablePathRef;
typedef const struct VGPath *VGPathRef;

#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGAffineTransform.h>
#include <CoreFoundation/CFBase.h>

/* Line join styles. */

enum VGLineJoin {
    kVGLineJoinMiter,
    kVGLineJoinRound,
    kVGLineJoinBevel
};
typedef enum VGLineJoin VGLineJoin;

/* Line cap styles. */

enum VGLineCap {
    kVGLineCapButt,
    kVGLineCapRound,
    kVGLineCapSquare
};
typedef enum VGLineCap VGLineCap;

/* Return the CFTypeID for VGPathRefs. */

VG_EXTERN CFTypeID VGPathGetTypeID(void);

/* Create a mutable path. */

VG_EXTERN VGMutablePathRef VGPathCreateMutable(void);

/* Create a copy of `path'. */

VG_EXTERN VGPathRef VGPathCreateCopy(VGPathRef path);

/* Create a copy of `path' transformed by `transform'. */

VG_EXTERN VGPathRef VGPathCreateCopyByTransformingPath(VGPathRef path,
                                                       const VGAffineTransform *transform);

/* Create a mutable copy of `path'. */

VG_EXTERN VGMutablePathRef VGPathCreateMutableCopy(VGPathRef path);

/* Create a mutable copy of `path' transformed by `transform'. */

VG_EXTERN VGMutablePathRef VGPathCreateMutableCopyByTransformingPath(VGPathRef
                                                                     path, const VGAffineTransform *transform);

/* Return a path representing a rectangle bounded by `rect'. The rectangle
 forms a complete subpath of the path --- that is, it begins with a "move
 to" and ends with a "close subpath" --- oriented in the clockwise
 direction. If `transform' is non-NULL, then the lines representing the
 rectangle will be transformed by `transform' before they are added to the
 path. */

VG_EXTERN VGPathRef VGPathCreateWithRect(VGRect rect,
                                         const VGAffineTransform *transform);

/* Return a path representing an ellipse bounded by `rect'. The ellipse is
 approximated by a sequence of Bézier curves. The center of the ellipse is
 the midpoint of `rect'. If `rect' is square, then the ellipse will be
 circular with radius equal to one-half the width (equivalently, one-half
 the height) of `rect'. If `rect' is rectangular, then the major- and
 minor-axes will be the `width' and `height' of rect. The ellipse forms a
 complete subpath of the path --- that is, it begins with a "move to" and
 ends with a "close subpath" --- oriented in the clockwise direction. If
 `transform' is non-NULL, then the constructed Bézier curves representing
 the ellipse will be transformed by `transform' before they are added to
 the path. */

VG_EXTERN VGPathRef VGPathCreateWithEllipseInRect(VGRect rect,
                                                  const VGAffineTransform *transform);

/* Return a path representing a rounded rectangle. The rounded rectangle
 coincides with the edges of `rect'. Each corner is consists of
 one-quarter of an ellipse with axes equal to `cornerWidth' and
 `cornerHeight'. The rounded rectangle forms a complete subpath of the
 path --- that is, it begins with a "move to" and ends with a "close
 subpath" --- oriented in the clockwise direction. If `transform' is
 non-NULL, then the path elements representing the rounded rectangle will
 be transformed by `transform' before they are added to the path. */

VG_EXTERN VGPathRef VGPathCreateWithRoundedRect(VGRect rect,
                                                VGFloat cornerWidth, VGFloat cornerHeight,
                                                const VGAffineTransform *transform);

/* Add a rounded rectangle to `path'. The rounded rectangle coincides with
 the edges of `rect'. Each corner is consists of one-quarter of an ellipse
 with axes equal to `cornerWidth' and `cornerHeight'. The rounded
 rectangle forms a complete subpath of the path --- that is, it begins
 with a "move to" and ends with a "close subpath" --- oriented in the
 clockwise direction. If `transform' is non-NULL, then the path elements
 representing the rounded rectangle will be transformed by `transform'
 before they are added to the path. */

VG_EXTERN void VGPathAddRoundedRect(VGMutablePathRef path,
                                    const VGAffineTransform *transform, VGRect rect, VGFloat cornerWidth,
                                    VGFloat cornerHeight) ;

/* Create a dashed path from `path'. The parameters `phase', `lengths', and
 `count' have the same meaning as the corresponding parameters for
 `VGContextSetLineDash'. If `transform' is non-NULL, then the elements of
 the constructed path will be transformed by `transform' before they are
 added to the path. */

VG_EXTERN VGPathRef VGPathCreateCopyByDashingPath(VGPathRef path,
                                                  const VGAffineTransform *transform, VGFloat phase, const VGFloat *lengths,
                                                  size_t count) ;

/* Create a stroked path from `path'. The parameters `lineWidth', `lineCap',
 `lineJoin', and `miterLimit' have the same meaning as the corresponding
 VGContext parameters. If `transform' is non-NULL, then the elements of
 the constructed path will be transformed by `transform' before they are
 added to the path. */

VG_EXTERN VGPathRef VGPathCreateCopyByStrokingPath(VGPathRef path,
                                                   const VGAffineTransform *transform, VGFloat lineWidth, VGLineCap lineCap,
                                                   VGLineJoin lineJoin, VGFloat miterLimit);

/* Equivalent to `CFRetain(path)', except it doesn't crash (as CFRetain
 does) if `path' is NULL. */

VG_EXTERN VGPathRef VGPathRetain(VGPathRef path);

/* Equivalent to `CFRelease(path)', except it doesn't crash (as CFRelease
 does) if `path' is NULL. */

VG_EXTERN void VGPathRelease(VGPathRef path);

/* Return true if `path1' is equal to `path2'; false otherwise. */

VG_EXTERN bool VGPathEqualToPath(VGPathRef path1, VGPathRef path2);

/*** Path construction functions. ***/

/* Move the current point to `(x, y)' in `path' and begin a new subpath. If
 `m' is non-NULL, then transform `(x, y)' by `m' first. */

VG_EXTERN void VGPathMoveToPoint(VGMutablePathRef path,
                                 const VGAffineTransform *m, VGFloat x, VGFloat y);

/* Append a straight line segment from the current point to `(x, y)' in
 `path' and move the current point to `(x, y)'. If `m' is non-NULL, then
 transform `(x, y)' by `m' first. */

VG_EXTERN void VGPathAddLineToPoint(VGMutablePathRef path,
                                    const VGAffineTransform *m, VGFloat x, VGFloat y);

/* Append a quadratic curve from the current point to `(x, y)' with control
 point `(cpx, cpy)' in `path' and move the current point to `(x, y)'. If
 `m' is non-NULL, then transform all points by `m' first. */

VG_EXTERN void VGPathAddQuadCurveToPoint(VGMutablePathRef path,
                                         const VGAffineTransform *m, VGFloat cpx, VGFloat cpy, VGFloat x, VGFloat y);

/* Append a cubic Bézier curve from the current point to `(x,y)' with
 control points `(cp1x, cp1y)' and `(cp2x, cp2y)' in `path' and move the
 current point to `(x, y)'. If `m' is non-NULL, then transform all points
 by `m' first. */

VG_EXTERN void VGPathAddCurveToPoint(VGMutablePathRef path,
                                     const VGAffineTransform *m, VGFloat cp1x, VGFloat cp1y,
                                     VGFloat cp2x, VGFloat cp2y, VGFloat x, VGFloat y);

/* Append a line from the current point to the starting point of the current
 subpath of `path' and end the subpath. */

VG_EXTERN void VGPathCloseSubpath(VGMutablePathRef path);

/*** Path construction convenience functions. ***/

/* Add `rect' to `path'. If `m' is non-NULL, then first transform `rect' by
 `m' before adding it to `path'. */

VG_EXTERN void VGPathAddRect(VGMutablePathRef path, const VGAffineTransform *m,
                             VGRect rect) ;

/* Add each rectangle specified by `rects', an array of `count' VGRects, to
 `path'. If `m' is non-NULL, then first transform each rectangle by `m'
 before adding it to `path'. */

VG_EXTERN void VGPathAddRects(VGMutablePathRef path,
                              const VGAffineTransform *m, const VGRect rects[], size_t count);

/* Move to the first element of `points', an array of `count' VGPoints, and
 append a line from each point to the next point in `points'. If `m' is
 non-NULL, then first transform each point by `m'. */

VG_EXTERN void VGPathAddLines(VGMutablePathRef path,
                              const VGAffineTransform *m, const VGPoint points[], size_t count);

/* Add an ellipse (an oval) inside `rect' to `path'. The ellipse is
 approximated by a sequence of Bézier curves. The center of the ellipse is
 the midpoint of `rect'. If `rect' is square, then the ellipse will be
 circular with radius equal to one-half the width (equivalently, one-half
 the height) of `rect'. If `rect' is rectangular, then the major- and
 minor-axes will be the `width' and `height' of rect. The ellipse forms a
 complete subpath of `path' --- that is, it begins with a "move to" and
 ends with a "close subpath" --- oriented in the clockwise direction. If
 `m' is non-NULL, then the constructed Bézier curves representing the
 ellipse will be transformed by `m' before they are added to `path'. */

VG_EXTERN void VGPathAddEllipseInRect(VGMutablePathRef path,
                                      const VGAffineTransform *m, VGRect rect);

/* Add an arc of a circle to `path', possibly preceded by a straight line
 segment. The arc is approximated by a sequence of Bézier curves. The
 center of the arc is `(x,y)'; `radius' is its radius. `startAngle' is the
 angle to the first endpoint of the arc, measured counter-clockwise from
 the positive x-axis. `startAngle + delta' is the angle to the second
 endpoint of the arc. If `delta' is positive, then the arc is drawn
 counter-clockwise; if negative, clockwise. `startAngle' and `delta' are
 measured in radians. If `matrix' is non-NULL, then the constructed Bézier
 curves representing the arc will be transformed by `matrix' before they
 are added to the path. */

VG_EXTERN void VGPathAddRelativeArc(VGMutablePathRef path,
                                    const VGAffineTransform *matrix, VGFloat x, VGFloat y, VGFloat radius,
                                    VGFloat startAngle, VGFloat delta);

/* Add an arc of a circle to `path', possibly preceded by a straight line
 segment. The arc is approximated by a sequence of Bézier curves. `(x, y)'
 is the center of the arc; `radius' is its radius; `startAngle' is the
 angle to the first endpoint of the arc; `endAngle' is the angle to the
 second endpoint of the arc; and `clockwise' is true if the arc is to be
 drawn clockwise, false otherwise. `startAngle' and `endAngle' are
 measured in radians. If `m' is non-NULL, then the constructed Bézier
 curves representing the arc will be transformed by `m' before they are
 added to `path'.
 
 Note that using values very near 2π can be problematic. For example,
 setting `startAngle' to 0, `endAngle' to 2π, and `clockwise' to true will
 draw nothing. (It's easy to see this by considering, instead of 0 and 2π,
 the values ε and 2π - ε, where ε is very small.) Due to round-off error,
 however, it's possible that passing the value `2 * M_PI' to approximate
 2π will numerically equal to 2π + δ, for some small δ; this will cause a
 full circle to be drawn.
 
 If you want a full circle to be drawn clockwise, you should set
 `startAngle' to 2π, `endAngle' to 0, and `clockwise' to true. This avoids
 the instability problems discussed above. */

VG_EXTERN void VGPathAddArc(VGMutablePathRef path, const VGAffineTransform *m,
                            VGFloat x, VGFloat y, VGFloat radius, VGFloat startAngle, VGFloat endAngle,
                            bool clockwise) ;

/* Add an arc of a circle to `path', possibly preceded by a straight line
 segment. The arc is approximated by a sequence of Bézier curves. `radius'
 is the radius of the arc. The resulting arc is tangent to the line from
 the current point of `path' to `(x1, y1)', and the line from `(x1, y1)'
 to `(x2, y2)'. If `m' is non-NULL, then the constructed Bézier curves
 representing the arc will be transformed by `m' before they are added to
 `path'. */

VG_EXTERN void VGPathAddArcToPoint(VGMutablePathRef path,
                                   const VGAffineTransform *m, VGFloat x1, VGFloat y1, VGFloat x2, VGFloat y2,
                                   VGFloat radius) ;

/* Add `path2' to `path1'. If `m' is non-NULL, then the points in `path2'
 will be transformed by `m' before they are added to `path1'. */

VG_EXTERN void VGPathAddPath(VGMutablePathRef path1,
                             const VGAffineTransform *m, VGPathRef path2);

/*** Path information functions. ***/

/* Return true if `path' contains no elements, false otherwise. */

VG_EXTERN bool VGPathIsEmpty(VGPathRef path);

/* Return true if `path' represents a rectangle, false otherwise. */

VG_EXTERN bool VGPathIsRect(VGPathRef path, VGRect *rect);

/* Return the current point of the current subpath of `path'. If there is no
 current point, then return VGPointZero. */

VG_EXTERN VGPoint VGPathGetCurrentPoint(VGPathRef path);

/* Return the bounding box of `path'. The bounding box is the smallest
 rectangle completely enclosing all points in the path, including control
 points for Bézier cubic and quadratic curves. If the path is empty, then
 return `VGRectNull'. */

VG_EXTERN VGRect VGPathGetBoundingBox(VGPathRef path);

/* Return the path bounding box of `path'. The path bounding box is the
 smallest rectangle completely enclosing all points in the path, *not*
 including control points for Bézier cubic and quadratic curves. If the
 path is empty, then return `VGRectNull'. */

VG_EXTERN VGRect VGPathGetPathBoundingBox(VGPathRef path);

/* Return true if `point' is contained in `path'; false otherwise. A point
 is contained in a path if it is inside the painted region when the path
 is filled; if `eoFill' is true, then the even-odd fill rule is used to
 evaluate the painted region of the path, otherwise, the winding-number
 fill rule is used. If `m' is non-NULL, then the point is transformed by
 `m' before determining whether the path contains it. */

VG_EXTERN bool VGPathContainsPoint(VGPathRef path,
                                   const VGAffineTransform *m, VGPoint point, bool eoFill);

/* The types of path elements returned by `VGPathApply'. */

enum VGPathElementType {
    kVGPathElementMoveToPoint,
    kVGPathElementAddLineToPoint,
    kVGPathElementAddQuadCurveToPoint,
    kVGPathElementAddCurveToPoint,
    kVGPathElementCloseSubpath
};
typedef enum VGPathElementType VGPathElementType;

/* An element of a path returned by `VGPathApply'. */

struct VGPathElement {
    VGPathElementType type;
    VGPoint *points;
};
typedef struct VGPathElement VGPathElement;

/* The prototype for the function called by `VGPathApplyFunction'. */

typedef void (*VGPathApplierFunction)(void *info,
const VGPathElement *element);

/* For element of `path', call `function', passing it the path element and
 `info'. */

VG_EXTERN void VGPathApply(VGPathRef path, void *info,
                           VGPathApplierFunction function);

#endif /* defined(__VeritasGraphics__VGPath__) */
