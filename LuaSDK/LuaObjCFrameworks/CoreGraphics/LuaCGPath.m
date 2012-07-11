//
//  LuaCGPath.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPath.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"
#import "LuaCGGeometry.h"

static const LuaSDKConst __luaCGContextConstants[] = {
    {"kCGLineJoinMiter", kCGLineJoinMiter},
    {"kCGLineJoinRound", kCGLineJoinRound},
    {"kCGLineJoinBevel", kCGLineJoinBevel},
    {"kCGLineCapButt", kCGLineCapButt},
    {"kCGLineCapRound", kCGLineCapRound},
    {"kCGLineCapSquare", kCGLineCapSquare},
    {"kCGPathElementMoveToPoint", kCGPathElementMoveToPoint},
    {"kCGPathElementAddLineToPoint", kCGPathElementAddLineToPoint},
    {"kCGPathElementAddQuadCurveToPoint", kCGPathElementAddQuadCurveToPoint},
    {"kCGPathElementAddCurveToPoint", kCGPathElementAddCurveToPoint},
    {"kCGPathElementCloseSubpath", kCGPathElementCloseSubpath},
    {NULL, 0},
};

static int lua_CGPathGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGPathGetTypeID());
    return 1;
}

static int lua_CGPathCreateMutable(lua_State *L)
{
    lua_pushlightuserdata(L, CGPathCreateMutable());
    return 1;
}

static int lua_CGPathCreateCopy(lua_State *L)
{
    lua_pushlightuserdata(L,(void*) CGPathCreateCopy(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPathCreateCopyByTransformingPath(lua_State *L)
{
    CGAffineTransform *transform = lua_touserdata(L, 2);
    lua_pushlightuserdata(L, (void*)CGPathCreateCopyByTransformingPath(lua_touserdata(L, 1), transform));
    return 1;
}

static int lua_CGPathCreateMutableCopy(lua_State *L)
{
    lua_pushlightuserdata(L, CGPathCreateMutableCopy(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPathCreateMutableCopyByTransformingPath(lua_State *L)
{
    CGAffineTransform *transform = lua_touserdata(L, 2);

    lua_pushlightuserdata(L, CGPathCreateMutableCopyByTransformingPath(lua_touserdata(L, 1), transform));
    return 1;
}

static int lua_CGPathCreateWithRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 1);
    CGAffineTransform *transform = lua_touserdata(L, 2);

    lua_pushlightuserdata(L, (void*)CGPathCreateWithRect(*r, transform));
    return 1;
}

static int lua_CGPathCreateWithEllipseInRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 1);
    CGAffineTransform *transform = lua_touserdata(L, 2);

    lua_pushlightuserdata(L, (void*)CGPathCreateWithEllipseInRect(*r, transform));
    return 1;
}

static int lua_CGPathCreateCopyByDashingPath(lua_State *L)
{
    const CGAffineTransform *transform = lua_touserdata(L, 2);
    CGFloat phase = lua_tonumber(L, 3);
    const CGFloat *lengths = lua_touserdata(L, 4);
    size_t count = lua_tointeger(L, 5);
    lua_pushlightuserdata(L, (void*)CGPathCreateCopyByDashingPath(lua_touserdata(L, 1),
                                                           transform, phase,
                                                           lengths, count));
    return 1;
}

static int lua_CGPathCreateCopyByStrokingPath(lua_State *L)
{
    const CGAffineTransform *transform = lua_touserdata(L, 2);
    CGFloat lineWidth = lua_tonumber(L, 3);
    CGLineCap lineCap = lua_tointeger(L, 4);
    CGLineJoin lineJoin = lua_tointeger(L, 5);
    CGFloat miterLimit = lua_tonumber(L, 6);
    lua_pushlightuserdata(L, (void*)CGPathCreateCopyByStrokingPath(lua_touserdata(L, 1),
                                                            transform, lineWidth,
                                                            lineCap, lineJoin,
                                                            miterLimit));
    return 1;
}

static int lua_CGPathRetain(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGPathRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPathRelease(lua_State *L)
{
    CGPathRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGPathEqualToPath(lua_State *L)
{
    lua_pushboolean(L, CGPathEqualToPath(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGPathMoveToPoint(lua_State *L)
{
    const CGAffineTransform *m = lua_touserdata(L, 2);
    CGFloat x = lua_tonumber(L, 3);
    CGFloat y = lua_tonumber(L, 4);
    
    CGPathMoveToPoint(lua_touserdata(L, 1), m, x, y);
    return 0;
}

static int lua_CGPathAddLineToPoint(lua_State *L)
{
    const CGAffineTransform *m = lua_touserdata(L, 2);
    CGFloat x = lua_tonumber(L, 3);
    CGFloat y = lua_tonumber(L, 4);

    CGPathAddLineToPoint(lua_touserdata(L, 1), m, x, y);
    return 0;
}

static int lua_CGPathAddQuadCurveToPoint(lua_State *L)
{
    const CGAffineTransform *m = lua_touserdata(L, 2);
    CGFloat cpx = lua_tonumber(L, 3);
    CGFloat cpy = lua_tonumber(L, 4);
    CGFloat x = lua_tonumber(L, 5);
    CGFloat y = lua_tonumber(L, 6);
    
    CGPathAddQuadCurveToPoint(lua_touserdata(L, 1), m, cpx, cpy, x, y);
    return 0;
}

static int lua_CGPathAddCurveToPoint(lua_State *L)
{
    const CGAffineTransform *m = lua_touserdata(L, 2);
    CGFloat cp1x = lua_tonumber(L, 3);
    CGFloat cp1y = lua_tonumber(L, 4);
    CGFloat cp2x = lua_tonumber(L, 5);
    CGFloat cp2y = lua_tonumber(L, 6);
    CGFloat x = lua_tonumber(L, 7);
    CGFloat y = lua_tonumber(L, 8);
    
    CGPathAddCurveToPoint(lua_touserdata(L, 1), m, cp1x, cp1y, cp2x, cp2y, x, y);
    return 0;
}

static int lua_CGPathCloseSubpath(lua_State *L)
{
    CGPathCloseSubpath(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGPathAddRect(lua_State *L)
{
    const CGAffineTransform *m = lua_touserdata(L, 2);
    CGRect *rect = lua_touserdata(L, 3);

    CGPathAddRect(lua_touserdata(L, 1) , m, *rect);
    return 0;
}

static int lua_CGPathAddRects(lua_State *L)
{
    //TODO
//    lua_pushlightuserdata(L, CGPathAddRects(lua_touserdata(L, 1)));
    return 0;
}

static int lua_CGPathAddLines(lua_State *L)
{
    //TODO
//    lua_pushlightuserdata(L, CGPathAddLines(lua_touserdata(L, 1)));
    return 0;
}

static int lua_CGPathAddEllipseInRect(lua_State *L)
{
    const CGAffineTransform *m = lua_touserdata(L, 2);
    CGRect *rect = lua_touserdata(L, 3);

    CGPathAddEllipseInRect(lua_touserdata(L, 1), m, *rect);
    return 0;
}

static int lua_CGPathAddRelativeArc(lua_State *L)
{
    const CGAffineTransform *matrix = lua_touserdata(L, 2);
    CGFloat x = lua_tonumber(L, 3);
    CGFloat y = lua_tonumber(L, 4);
    CGFloat radius = lua_tonumber(L, 5);
    CGFloat startAngle = lua_tonumber(L, 6);
    CGFloat delta = lua_tonumber(L, 7);
    CGPathAddRelativeArc(lua_touserdata(L, 1), matrix, x, y, radius, startAngle, delta);
    return 0;
}

static int lua_CGPathAddArc(lua_State *L)
{
    const CGAffineTransform *m = lua_touserdata(L, 2);
    CGFloat x = lua_tonumber(L, 3);
    CGFloat y = lua_tonumber(L, 4);
    CGFloat radius = lua_tonumber(L, 5);
    CGFloat startAngle = lua_tonumber(L, 6);
    CGFloat endAngle = lua_tonumber(L, 7);
    bool clockwise = lua_toboolean(L, 8);
    CGPathAddArc(lua_touserdata(L, 1), m, x, y, radius, startAngle, endAngle, clockwise);
    return 0;
}

static int lua_CGPathAddArcToPoint(lua_State *L)
{
    const CGAffineTransform *m = lua_touserdata(L, 2);
    CGFloat x1 = lua_tonumber(L, 3);
    CGFloat y1 = lua_tonumber(L, 4);
    CGFloat x2 = lua_tonumber(L, 5);
    CGFloat y2 = lua_tonumber(L, 6);
    CGFloat radius = lua_tonumber(L, 7);
    CGPathAddArcToPoint(lua_touserdata(L, 1), m, x1, y1, x2, y2, radius);
    return 0;
}

static int lua_CGPathAddPath(lua_State *L)
{
    CGPathAddPath(lua_touserdata(L, 1), 
                                           lua_touserdata(L, 2),
                                           lua_touserdata(L, 3));
    return 0;
}

static int lua_CGPathIsEmpty(lua_State *L)
{
    lua_pushboolean(L, CGPathIsEmpty(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPathIsRect(lua_State *L)
{
    lua_pushboolean(L, CGPathIsRect(lua_touserdata(L, 1),
                                    lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGPathGetCurrentPoint(lua_State *L)
{
    lua_pushCGPoint(L, CGPathGetCurrentPoint(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPathGetBoundingBox(lua_State *L)
{
    lua_pushCGRect(L, CGPathGetBoundingBox(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPathGetPathBoundingBox(lua_State *L)
{    
    lua_pushCGRect(L, CGPathGetPathBoundingBox(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPathContainsPoint(lua_State *L)
{
    const CGAffineTransform *m = lua_touserdata(L, 2);
    CGPoint *point = lua_touserdata(L, 3);
    bool eoFill = lua_toboolean(L, 4);

    lua_pushboolean(L, CGPathContainsPoint(lua_touserdata(L, 1), m, *point, eoFill));
    return 1;
}

static int lua_CGPathApply(lua_State *L)
{
    void *info = lua_touserdata(L, 2);
    CGPathApplierFunction function = lua_touserdata(L, 3);
    CGPathApply(lua_touserdata(L, 1), info, function);
    return 0;
}

static const luaL_Reg __LuaCGPathAPIs[] = {
    {"CGPathGetTypeID", lua_CGPathGetTypeID},
    {"CGPathCreateMutable", lua_CGPathCreateMutable},
    {"CGPathCreateCopy", lua_CGPathCreateCopy},
    {"CGPathCreateCopyByTransformingPath", lua_CGPathCreateCopyByTransformingPath},
    {"CGPathCreateMutableCopy", lua_CGPathCreateMutableCopy},
    {"CGPathCreateMutableCopyByTransformingPath", lua_CGPathCreateMutableCopyByTransformingPath},
    {"CGPathCreateWithRect", lua_CGPathCreateWithRect},
    {"CGPathCreateWithEllipseInRect", lua_CGPathCreateWithEllipseInRect},
    {"CGPathCreateCopyByDashingPath", lua_CGPathCreateCopyByDashingPath},
    {"CGPathCreateCopyByStrokingPath", lua_CGPathCreateCopyByStrokingPath},
    {"CGPathRetain", lua_CGPathRetain},
    {"CGPathRelease", lua_CGPathRelease},
    {"CGPathEqualToPath", lua_CGPathEqualToPath},
    {"CGPathMoveToPoint", lua_CGPathMoveToPoint},
    {"CGPathAddLineToPoint", lua_CGPathAddLineToPoint},
    {"CGPathAddQuadCurveToPoint", lua_CGPathAddQuadCurveToPoint},
    {"CGPathAddCurveToPoint", lua_CGPathAddCurveToPoint},
    {"CGPathCloseSubpath", lua_CGPathCloseSubpath},
    {"CGPathAddRect", lua_CGPathAddRect},
    {"CGPathAddRects", lua_CGPathAddRects},
    {"CGPathAddLines", lua_CGPathAddLines},
    {"CGPathAddEllipseInRect", lua_CGPathAddEllipseInRect},
    {"CGPathAddRelativeArc", lua_CGPathAddRelativeArc},
    {"CGPathAddArc", lua_CGPathAddArc},
    {"CGPathAddArcToPoint", lua_CGPathAddArcToPoint},
    {"CGPathAddPath", lua_CGPathAddPath},
    {"CGPathIsEmpty", lua_CGPathIsEmpty},
    {"CGPathIsRect", lua_CGPathIsRect},
    {"CGPathGetCurrentPoint", lua_CGPathGetCurrentPoint},
    {"CGPathGetBoundingBox", lua_CGPathGetBoundingBox},
    {"CGPathGetPathBoundingBox", lua_CGPathGetPathBoundingBox},
    {"CGPathContainsPoint", lua_CGPathContainsPoint},
    {"CGPathApply", lua_CGPathApply},
    {NULL, NULL},
};

int LuaOpenCGPath(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGContextConstants);
    luaObjC_loadGlobalFunctions(L, __LuaCGPathAPIs);
    return 0;
}
