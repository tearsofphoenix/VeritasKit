//
//  VGGeometry.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef VeritasGraphics_VGGeometry_h
#define VeritasGraphics_VGGeometry_h

#include <VeritasGraphics/VGBase.h>

/* Points. */

struct VGPoint {
    VGFloat x;
    VGFloat y;
};
typedef struct VGPoint VGPoint;

/* Sizes. */

struct VGSize {
    VGFloat width;
    VGFloat height;
};
typedef struct VGSize VGSize;

/* Vectors. */

#define VGVECTOR_DEFINED 1

struct VGVector {
    VGFloat dx;
    VGFloat dy;
};
typedef struct VGVector VGVector;

/* Rectangles. */

struct VGRect {
    VGPoint origin;
    VGSize size;
};
typedef struct VGRect VGRect;

/* Rectangle edges. */
enum
{
    VGRectMinXEdge, VGRectMinYEdge, VGRectMaxXEdge, VGRectMaxYEdge
};
typedef uint32_t  VGRectEdge;

/* The "zero" point -- equivalent to VGPointMake(0, 0). */

VG_EXTERN const VGPoint VGPointZero;

/* The "zero" size -- equivalent to VGSizeMake(0, 0). */

VG_EXTERN const VGSize VGSizeZero;

/* The "zero" rectangle -- equivalent to VGRectMake(0, 0, 0, 0). */

VG_EXTERN const VGRect VGRectZero;

/* The "empty" rect. This is the rectangle returned when, for example, we
 intersect two disjoint rectangles. Note that the null rect is not the
 same as the zero rect. */

VG_EXTERN const VGRect VGRectNull;

/* The infinite rectangle. */

VG_EXTERN const VGRect VGRectInfinite;

/* Make a point from `(x, y)'. */

VG_INLINE VGPoint VGPointMake(VGFloat x, VGFloat y);

/* Make a size from `(width, height)'. */

VG_INLINE VGSize VGSizeMake(VGFloat width, VGFloat height);

/* Make a vector from `(dx, dy)'. */

VG_INLINE VGVector VGVectorMake(VGFloat dx, VGFloat dy);

/* Make a rect from `(x, y; width, height)'. */

VG_INLINE VGRect VGRectMake(VGFloat x, VGFloat y, VGFloat width,
                            VGFloat height);

/* Return the leftmost x-value of `rect'. */

VG_EXTERN VGFloat VGRectGetMinX(VGRect rect);

/* Return the midpoint x-value of `rect'. */

VG_EXTERN VGFloat VGRectGetMidX(VGRect rect);

/* Return the rightmost x-value of `rect'. */

VG_EXTERN VGFloat VGRectGetMaxX(VGRect rect);

/* Return the bottommost y-value of `rect'. */

VG_EXTERN VGFloat VGRectGetMinY(VGRect rect);

/* Return the midpoint y-value of `rect'. */

VG_EXTERN VGFloat VGRectGetMidY(VGRect rect);

/* Return the topmost y-value of `rect'. */

VG_EXTERN VGFloat VGRectGetMaxY(VGRect rect);

/* Return the width of `rect'. */

VG_EXTERN VGFloat VGRectGetWidth(VGRect rect);

/* Return the height of `rect'. */

VG_EXTERN VGFloat VGRectGetHeight(VGRect rect);

/* Return true if `point1' and `point2' are the same, false otherwise. */

VG_EXTERN bool VGPointEqualToPoint(VGPoint point1, VGPoint point2);

/* Return true if `size1' and `size2' are the same, false otherwise. */

VG_EXTERN bool VGSizeEqualToSize(VGSize size1, VGSize size2);

/* Return true if `rect1' and `rect2' are the same, false otherwise. */

VG_EXTERN bool VGRectEqualToRect(VGRect rect1, VGRect rect2);

/* Standardize `rect' -- i.e., convert it to an equivalent rect which has
 positive width and height. */

VG_EXTERN VGRect VGRectStandardize(VGRect rect);

/* Return true if `rect' is empty (that is, if it has zero width or height),
 false otherwise. A null rect is defined to be empty. */

VG_EXTERN bool VGRectIsEmpty(VGRect rect);

/* Return true if `rect' is the null rectangle, false otherwise. */

VG_EXTERN bool VGRectIsNull(VGRect rect);

/* Return true if `rect' is the infinite rectangle, false otherwise. */

VG_EXTERN bool VGRectIsInfinite(VGRect rect);

/* Inset `rect' by `(dx, dy)' -- i.e., offset its origin by `(dx, dy)', and
 decrease its size by `(2*dx, 2*dy)'. */

VG_EXTERN VGRect VGRectInset(VGRect rect, VGFloat dx, VGFloat dy);

/* Expand `rect' to the smallest rect containing it with integral origin and
 size. */

VG_EXTERN VGRect VGRectIntegral(VGRect rect);

/* Return the union of `r1' and `r2'. */

VG_EXTERN VGRect VGRectUnion(VGRect r1, VGRect r2);

/* Return the intersection of `r1' and `r2'. This may return a null rect. */

VG_EXTERN VGRect VGRectIntersection(VGRect r1, VGRect r2);

/* Offset `rect' by `(dx, dy)'. */

VG_EXTERN VGRect VGRectOffset(VGRect rect, VGFloat dx, VGFloat dy);

/* Make two new rectangles, `slice' and `remainder', by dividing `rect' with
 a line that's parallel to one of its sides, specified by `edge' -- either
 `VGRectMinXEdge', `VGRectMinYEdge', `VGRectMaxXEdge', or
 `VGRectMaxYEdge'. The size of `slice' is determined by `amount', which
 measures the distance from the specified edge. */

VG_EXTERN void VGRectDivide(VGRect rect, VGRect *slice, VGRect *remainder,
                            VGFloat amount, VGRectEdge edge);

/* Return true if `point' is contained in `rect', false otherwise. */

VG_EXTERN bool VGRectContainsPoint(VGRect rect, VGPoint point);

/* Return true if `rect2' is contained in `rect1', false otherwise. `rect2'
 is contained in `rect1' if the union of `rect1' and `rect2' is equal to
 `rect1'. */

VG_EXTERN bool VGRectContainsRect(VGRect rect1, VGRect rect2);

/* Return true if `rect1' intersects `rect2', false otherwise. `rect1'
 intersects `rect2' if the intersection of `rect1' and `rect2' is not the
 null rect. */

VG_EXTERN bool VGRectIntersectsRect(VGRect rect1, VGRect rect2);

/*** Persistent representations. ***/

 
/*** Definitions of inline functions. ***/

VG_INLINE VGPoint
VGPointMake(VGFloat x, VGFloat y)
{
    VGPoint p; p.x = x; p.y = y; return p;
}

VG_INLINE VGSize
VGSizeMake(VGFloat width, VGFloat height)
{
    VGSize size; size.width = width; size.height = height; return size;
}

VG_INLINE VGVector
VGVectorMake(VGFloat dx, VGFloat dy)
{
    VGVector vector; vector.dx = dx; vector.dy = dy; return vector;
}

VG_INLINE VGRect
VGRectMake(VGFloat x, VGFloat y, VGFloat width, VGFloat height)
{
    VGRect rect;
    rect.origin.x = x; rect.origin.y = y;
    rect.size.width = width; rect.size.height = height;
    return rect;
}

VG_INLINE bool
__CGPointEqualToPoint(VGPoint point1, VGPoint point2)
{
    return point1.x == point2.x && point1.y == point2.y;
}
#define VGPointEqualToPoint __CGPointEqualToPoint

VG_INLINE bool
__CGSizeEqualToSize(VGSize size1, VGSize size2)
{
    return size1.width == size2.width && size1.height == size2.height;
}
#define VGSizeEqualToSize __CGSizeEqualToSize


#endif
