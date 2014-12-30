//
//  VGGeometry.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGGeometry.h"
#include <string.h>
#include <limits.h>

const VGPoint VGPointZero = {0, 0};

const VGSize VGSizeZero = {0, 0};

const VGRect VGRectZero = {{0, 0}, {0, 0}};

const VGRect VGRectNull = {{FLT_MAX, FLT_MAX}, {0, 0}};

const VGRect VGRectInfinite = {{FLT_MIN, FLT_MIN}, {FLT_MAX, FLT_MAX}};

VGFloat VGRectGetMinX(VGRect rect){ return rect.origin.x; }

VGFloat VGRectGetMidX(VGRect rect){ return rect.origin.x + rect.size.width / 2; }

VGFloat VGRectGetMaxX(VGRect rect){ return rect.origin.x + rect.size.width; }

VGFloat VGRectGetMinY(VGRect rect){ return rect.origin.y; }

VGFloat VGRectGetMidY(VGRect rect){ return rect.origin.y + rect.size.height / 2; }

VGFloat VGRectGetMaxY(VGRect rect){ return rect.origin.y + rect.size.height; }

VGFloat VGRectGetWidth(VGRect rect){ return rect.size.width; }

VGFloat VGRectGetHeight(VGRect rect){ return rect.size.height; }

bool VGRectEqualToRect(VGRect r1, VGRect r2)
{
    return VGPointEqualToPoint(r1.origin, r2.origin) && VGSizeEqualToSize(r1.size, r2.size);
//    return memcmp(&r1, &r2, sizeof(r1)) == 0;
}

/* Standardize `rect' -- i.e., convert it to an equivalent rect which has
 positive width and height. */

VGRect VGRectStandardize(VGRect rect);

/* Return true if `rect' is empty (that is, if it has zero width or height),
 false otherwise. A null rect is defined to be empty. */

bool VGRectIsEmpty(VGRect rect){ return rect.size.width == 0 || rect.size.height == 0; }

bool VGRectIsNull(VGRect rect){ return VGRectEqualToRect(rect, VGRectNull); }

bool VGRectIsInfinite(VGRect rect){ return VGRectEqualToRect(rect, VGRectInfinite); }

/* Inset `rect' by `(dx, dy)' -- i.e., offset its origin by `(dx, dy)', and
 decrease its size by `(2*dx, 2*dy)'. */

VGRect VGRectInset(VGRect rect, VGFloat dx, VGFloat dy);

/* Expand `rect' to the smallest rect containing it with integral origin and
 size. */

VGRect VGRectIntegral(VGRect rect);

/* Return the union of `r1' and `r2'. */

VGRect VGRectUnion(VGRect r1, VGRect r2);

/* Return the intersection of `r1' and `r2'. This may return a null rect. */

VGRect VGRectIntersection(VGRect r1, VGRect r2);

/* Offset `rect' by `(dx, dy)'. */

VGRect VGRectOffset(VGRect rect, VGFloat dx, VGFloat dy);

/* Make two new rectangles, `slice' and `remainder', by dividing `rect' with
 a line that's parallel to one of its sides, specified by `edge' -- either
 `VGRectMinXEdge', `VGRectMinYEdge', `VGRectMaxXEdge', or
 `VGRectMaxYEdge'. The size of `slice' is determined by `amount', which
 measures the distance from the specified edge. */

void VGRectDivide(VGRect rect, VGRect *slice, VGRect *remainder,
                            VGFloat amount, VGRectEdge edge);

/* Return true if `point' is contained in `rect', false otherwise. */

bool VGRectContainsPoint(VGRect rect, VGPoint point);

/* Return true if `rect2' is contained in `rect1', false otherwise. `rect2'
 is contained in `rect1' if the union of `rect1' and `rect2' is equal to
 `rect1'. */

bool VGRectContainsRect(VGRect rect1, VGRect rect2);

/* Return true if `rect1' intersects `rect2', false otherwise. `rect1'
 intersects `rect2' if the intersection of `rect1' and `rect2' is not the
 null rect. */

bool VGRectIntersectsRect(VGRect rect1, VGRect rect2);
