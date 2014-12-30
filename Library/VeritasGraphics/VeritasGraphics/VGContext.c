//
//  VGContext.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGContext.h"
#include "VGContextPrivate.h"


static CFTypeID _kVGContextID = _kCFRuntimeNotATypeID;

static CFRuntimeClass _kVGContextClass = {0};

/* Something external to this file is assumed to call this
 * before the VALayer class is used.
 */
void __VGColorClassInitialize(void) {
    _kVGContextClass.version = 0;
    _kVGContextClass.className = "VGColor";
    _kVGContextClass.init = NULL;
    _kVGContextClass.copy = NULL;
    _kVGContextClass.finalize = NULL;
    _kVGContextClass.equal = NULL;
    _kVGContextClass.hash = NULL;
    _kVGContextClass.copyFormattingDesc = NULL;
    _kVGContextClass.copyDebugDesc = NULL;
    _kVGContextID = _CFRuntimeRegisterClass((const CFRuntimeClass * const)&_kVGContextClass);
}

/* Return the CFTypeID for VGContextRefs. */

CFTypeID VGContextGetTypeID(void) { return _kVGContextID; }

/** Graphics state functions. **/

/* Push a copy of the current graphics state onto the graphics state stack.
 Note that the path is not considered part of the graphics state, and is
 not saved. */

void VGContextSaveGState(VGContextRef c)
{
    
}

/* Restore the current graphics state from the one on the top of the
 graphics state stack, popping the graphics state stack in the process. */

void VGContextRestoreGState(VGContextRef c)
{
    
}

/** Coordinate space transformations. **/

/* Scale the current graphics state's transformation matrix (the CTM) by
 `(sx, sy)'. */

void VGContextScaleCTM(VGContextRef c, VGFloat sx, VGFloat sy)
{
    c->ctm = VGAffineTransformScale(c->ctm, sx, sy);
}

/* Translate the current graphics state's transformation matrix (the CTM) by
 `(tx, ty)'. */

void VGContextTranslateCTM(VGContextRef c, VGFloat tx, VGFloat ty)
{
    c->ctm = VGAffineTransformTranslate(c->ctm, tx, ty);
}

/* Rotate the current graphics state's transformation matrix (the CTM) by
 `angle' radians. */

void VGContextRotateCTM(VGContextRef c, VGFloat angle)
{
    c->ctm = VGAffineTransformRotate(c->ctm, angle);
}

/* Concatenate the current graphics state's transformation matrix (the CTM)
 with the affine transform `transform'. */

void VGContextConcatCTM(VGContextRef c, VGAffineTransform transform)
{
    c->ctm = VGAffineTransformConcat(transform, c->ctm);
}

/* Return the current graphics state's transformation matrix. */

VGAffineTransform VGContextGetCTM(VGContextRef c)
{
    return c->ctm;
}

/** Drawing attribute functions. **/

/* Set the line width in the current graphics state to `width'. */

void VGContextSetLineWidth(VGContextRef c, VGFloat width)
{

}

/* Set the line cap in the current graphics state to `cap'. */

void VGContextSetLineCap(VGContextRef c, VGLineCap cap)
{

}

/* Set the line join in the current graphics state to `join'. */

void VGContextSetLineJoin(VGContextRef c, VGLineJoin join)
{

}

/* Set the miter limit in the current graphics state to `limit'. */

void VGContextSetMiterLimit(VGContextRef c, VGFloat limit)
{

}

/* Set the line dash patttern in the current graphics state of `c'. */

void VGContextSetLineDash(VGContextRef c, VGFloat phase,
                                    const VGFloat lengths[], size_t count)
{
    //TODO
}

/* Set the path flatness parameter in the current graphics state of `c' to
 `flatness'. */

void VGContextSetFlatness(VGContextRef c, VGFloat flatness)
{

}

/* Set the alpha value in the current graphics state of `c' to `alpha'. */

void VGContextSetAlpha(VGContextRef c, VGFloat alpha)
{

}

/* Set the blend mode of `context' to `mode'. */

void VGContextSetBlendMode(VGContextRef context, VGBlendMode mode)
{

}

/** Path construction functions. **/

/* Note that a context has a single path in use at any time: a path is not
 part of the graphics state. */

/* Begin a new path. The old path is discarded. */

void VGContextBeginPath(VGContextRef c)
{
}

/* Start a new subpath at point `(x, y)' in the context's path. */

void VGContextMoveToPoint(VGContextRef c, VGFloat x, VGFloat y)
{
}

/* Append a straight line segment from the current point to `(x, y)'. */

void VGContextAddLineToPoint(VGContextRef c, VGFloat x, VGFloat y)
{
}

/* Append a cubic Bezier curve from the current point to `(x,y)', with
 control points `(cp1x, cp1y)' and `(cp2x, cp2y)'. */

void VGContextAddCurveToPoint(VGContextRef c, VGFloat cp1x,
                                        VGFloat cp1y, VGFloat cp2x, VGFloat cp2y, VGFloat x, VGFloat y)
{
}

/* Append a quadratic curve from the current point to `(x, y)', with control
 point `(cpx, cpy)'. */

void VGContextAddQuadCurveToPoint(VGContextRef c, VGFloat cpx,
                                            VGFloat cpy, VGFloat x, VGFloat y)
{
}

/* Close the current subpath of the context's path. */

void VGContextClosePath(VGContextRef c)
{
}

/** Path construction convenience functions. **/

/* Add a single rect to the context's path. */

void VGContextAddRect(VGContextRef c, VGRect rect)
{
}

/* Add a set of rects to the context's path. */

void VGContextAddRects(VGContextRef c, const VGRect rects[],
                                 size_t count)
{
}

/* Add a set of lines to the context's path. */

void VGContextAddLines(VGContextRef c, const VGPoint points[],
                                 size_t count)
{
}

/* Add an ellipse inside `rect' to the current path of `context'. See the
 function `VGPathAddEllipseInRect' for more information on how the path
 for the ellipse is constructed. */

void VGContextAddEllipseInRect(VGContextRef context, VGRect rect)
{
}

/* Add an arc of a circle to the context's path, possibly preceded by a
 straight line segment. `(x, y)' is the center of the arc; `radius' is its
 radius; `startAngle' is the angle to the first endpoint of the arc;
 `endAngle' is the angle to the second endpoint of the arc; and
 `clockwise' is 1 if the arc is to be drawn clockwise, 0 otherwise.
 `startAngle' and `endAngle' are measured in radians. */

void VGContextAddArc(VGContextRef c, VGFloat x, VGFloat y,
                               VGFloat radius, VGFloat startAngle, VGFloat endAngle, int clockwise)
{
}

/* Add an arc of a circle to the context's path, possibly preceded by a
 straight line segment. `radius' is the radius of the arc. The arc is
 tangent to the line from the current point to `(x1, y1)', and the line
 from `(x1, y1)' to `(x2, y2)'. */

void VGContextAddArcToPoint(VGContextRef c, VGFloat x1, VGFloat y1,
                                      VGFloat x2, VGFloat y2, VGFloat radius)
{
}

/* Add `path' to the path of context. The points in `path' are transformed
 by the CTM of context before they are added. */

void VGContextAddPath(VGContextRef context, VGPathRef path)
{
}

/** Path stroking. **/

/* Replace the path in `context' with the stroked version of the path, using
 the parameters of `context' to calculate the stroked path. The resulting
 path is created such that filling it with the appropriate color will
 produce the same results as stroking the original path. You can use this
 path in the same way you can use the path of any context; for example,
 you can clip to the stroked version of a path by calling this function
 followed by a call to "VGContextClip". */

void VGContextReplacePathWithStrokedPath(VGContextRef c)
{
    
}

/** Path information functions. **/

/* Return true if the path of `context' contains no elements, false
 otherwise. */

bool VGContextIsPathEmpty(VGContextRef context)
{
    return false;
}
