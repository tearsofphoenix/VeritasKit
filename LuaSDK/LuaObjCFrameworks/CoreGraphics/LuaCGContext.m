//
//  LuaCGContext.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGContext.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"
#import "LuaCGAffineTransform.h"
#import "LuaCGGeometry.h"

static const LuaSDKConst __luaCGContextConstants[] = 
{
    {"kCGPathFill", kCGPathFill},
    {"kCGPathEOFill", kCGPathEOFill},
    {"kCGPathStroke", kCGPathStroke},
    {"kCGPathFillStroke", kCGPathFillStroke},
    {"kCGPathEOFillStroke", kCGPathEOFillStroke},
    {"kCGTextFill", kCGTextFill},
    {"kCGTextStroke", kCGTextStroke},
    {"kCGTextFillStroke", kCGTextFillStroke},
    {"kCGTextInvisible", kCGTextInvisible},
    {"kCGTextFillClip", kCGTextFillClip},
    {"kCGTextStrokeClip", kCGTextStrokeClip},
    {"kCGTextFillStrokeClip", kCGTextFillStrokeClip},
    {"kCGTextClip", kCGTextClip},
    {"kCGEncodingFontSpecific", kCGEncodingFontSpecific},
    {"kCGEncodingMacRoman", kCGEncodingMacRoman},
    {"kCGInterpolationDefault", kCGInterpolationDefault},
    {"kCGInterpolationNone", kCGInterpolationNone},
    {"kCGInterpolationLow", kCGInterpolationLow},
    {"kCGInterpolationMedium", kCGInterpolationMedium},
    {"kCGInterpolationHigh", kCGInterpolationHigh},
    {"kCGBlendModeNormal", kCGBlendModeNormal},
    {"kCGBlendModeClear", kCGBlendModeClear},
    {"kCGBlendModeNormal", kCGBlendModeNormal},
    {"kCGBlendModeMultiply", kCGBlendModeMultiply},
    {"kCGBlendModeScreen", kCGBlendModeScreen},
    {"kCGBlendModeOverlay", kCGBlendModeOverlay},
    {"kCGBlendModeDarken", kCGBlendModeDarken},
    {"kCGBlendModeLighten", kCGBlendModeLighten},
    {"kCGBlendModeColorDodge", kCGBlendModeColorDodge},
    {"kCGBlendModeColorBurn", kCGBlendModeColorBurn},
    {"kCGBlendModeSoftLight", kCGBlendModeSoftLight},
    {"kCGBlendModeHardLight", kCGBlendModeHardLight},
    {"kCGBlendModeDifference", kCGBlendModeDifference},
    {"kCGBlendModeExclusion", kCGBlendModeExclusion},
    {"kCGBlendModeHue", kCGBlendModeHue},
    {"kCGBlendModeSaturation", kCGBlendModeSaturation},
    {"kCGBlendModeColor", kCGBlendModeColor},
    {"kCGBlendModeLuminosity", kCGBlendModeLuminosity},
    {"kCGBlendModeNormal", kCGBlendModeNormal},
    {"kCGBlendModeClear", kCGBlendModeClear},
    {"kCGBlendModeCopy", kCGBlendModeCopy},
    {"kCGBlendModeSourceIn", kCGBlendModeSourceIn},
    {"kCGBlendModeSourceOut", kCGBlendModeSourceOut},
    {"kCGBlendModeSourceAtop", kCGBlendModeSourceAtop},
    {"kCGBlendModeDestinationOver", kCGBlendModeDestinationOver},
    {"kCGBlendModeDestinationIn", kCGBlendModeDestinationIn},
    {"kCGBlendModeDestinationOut", kCGBlendModeDestinationOut},
    {"kCGBlendModeDestinationAtop", kCGBlendModeDestinationAtop},
    {"kCGBlendModeXOR", kCGBlendModeXOR},
    {"kCGBlendModePlusDarker", kCGBlendModePlusDarker},
    {"kCGBlendModePlusLighter", kCGBlendModePlusLighter},
    {NULL, 0},
};

static int lua_CGContextGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGContextGetTypeID());
    return 1;
}

static int lua_CGContextSaveGState(lua_State *L)
{
    CGContextSaveGState(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextRestoreGState(lua_State *L)
{
    CGContextRestoreGState(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextScaleCTM(lua_State *L)
{
    CGContextScaleCTM(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3));
    return 0;
}

static int lua_CGContextTranslateCTM(lua_State *L)
{
    CGContextTranslateCTM(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3));
    return 0;
}

static int lua_CGContextRotateCTM(lua_State *L)
{
    CGContextRotateCTM(lua_touserdata(L, 1), lua_tonumber(L, 2));
    return 0;
}

static int lua_CGContextConcatCTM(lua_State *L)
{
    CGAffineTransform *t = lua_touserdata(L, 2);
    CGContextConcatCTM(lua_touserdata(L, 1), *t);
    return 1;
}

static int lua_CGContextGetCTM(lua_State *L)
{
    lua_pushCGAffineTransform(L, CGContextGetCTM(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGContextSetLineWidth(lua_State *L)
{
    CGContextSetLineWidth(lua_touserdata(L, 1), lua_tonumber(L, 2));
    return 0;
}

static int lua_CGContextSetLineCap(lua_State *L)
{
    CGContextSetLineCap(lua_touserdata(L, 1), lua_tointeger(L, 2));
    return 0;
}

static int lua_CGContextSetLineJoin(lua_State *L)
{
    CGContextSetLineJoin(lua_touserdata(L, 1), lua_tointeger(L, 2));
    return 0;
}

static int lua_CGContextSetMiterLimit(lua_State *L)
{
    CGContextSetMiterLimit(lua_touserdata(L, 1), lua_tonumber(L, 2));
    return 0;
}

#if 0
static int lua_CGContextSetLineDash(lua_State *L)
{
    CGFloat phase = lua_tonumber(L, 2);
    CGFloat *lengths = NULL;
    
    size_t count = luasdk_get_arrayf(L, 3, &lengths);

    CGContextSetLineDash(lua_touserdata(L, 1), phase, lengths, count);
    return 0;
}
#endif

static int lua_CGContextSetFlatness(lua_State *L)
{
    CGContextSetFlatness(lua_touserdata(L, 1), lua_tonumber(L, 2));
    return 0;
}

static int lua_CGContextSetAlpha(lua_State *L)
{
    CGContextSetAlpha(lua_touserdata(L, 1), lua_tonumber(L, 2));
    return 0;
}

static int lua_CGContextSetBlendMode(lua_State *L)
{
    CGContextSetBlendMode(lua_touserdata(L, 1), lua_tointeger(L, 2));
    return 0;
}

static int lua_CGContextBeginPath(lua_State *L)
{
    CGContextBeginPath(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextMoveToPoint(lua_State *L)
{
    CGContextMoveToPoint(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3));
    return 0;
}

static int lua_CGContextAddLineToPoint(lua_State *L)
{
    CGContextAddLineToPoint(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3));
    return 0;
}

static int lua_CGContextAddCurveToPoint(lua_State *L)
{
    CGContextAddCurveToPoint(lua_touserdata(L, 1), lua_tonumber(L, 2), 
                             lua_tonumber(L, 3), lua_tonumber(L, 4), 
                             lua_tonumber(L, 5), lua_tonumber(L, 6), 
                             lua_tonumber(L, 7));
    return 0;
}

static int lua_CGContextAddQuadCurveToPoint(lua_State *L)
{
    CGContextAddQuadCurveToPoint(lua_touserdata(L, 1),lua_tonumber(L, 2), 
                                 lua_tonumber(L, 3), lua_tonumber(L, 4), 
                                 lua_tonumber(L, 5));
    return 0;
}

static int lua_CGContextClosePath(lua_State *L)
{
    CGContextClosePath(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextAddRect(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 2);
    CGContextAddRect(lua_touserdata(L, 1), *rect);
    return 0;
}

static int lua_CGContextAddRects(lua_State *L)
{
    //TODO
    //CGContextAddRects(lua_touserdata(L, 1)));
    return 0;
}

static int lua_CGContextAddLines(lua_State *L)
{
    //TODO    
    //CGContextAddLines(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextAddEllipseInRect(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 2);
    CGContextAddEllipseInRect(lua_touserdata(L, 1), *rect);
    return 0;
}

static int lua_CGContextAddArc(lua_State *L)
{
    CGContextAddArc(lua_touserdata(L, 1), lua_tonumber(L, 2),lua_tonumber(L, 3), 
                    lua_tonumber(L, 4), lua_tonumber(L, 5), 
                    lua_tonumber(L, 6), lua_tointeger(L, 7));
    return 0;
}

static int lua_CGContextAddArcToPoint(lua_State *L)
{
    CGContextAddArcToPoint(lua_touserdata(L, 1), lua_tonumber(L, 2),lua_tonumber(L, 3), 
                           lua_tonumber(L, 4), lua_tonumber(L, 5), 
                           lua_tonumber(L, 6));
    return 0;
}

static int lua_CGContextAddPath(lua_State *L)
{
    CGContextAddPath(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextReplacePathWithStrokedPath(lua_State *L)
{
    CGContextReplacePathWithStrokedPath(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextIsPathEmpty(lua_State *L)
{
    lua_pushboolean(L, CGContextIsPathEmpty(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGContextGetPathCurrentPoint(lua_State *L)
{
    lua_pushCGPoint(L, CGContextGetPathCurrentPoint(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGContextGetPathBoundingBox(lua_State *L)
{
    lua_pushCGRect(L, CGContextGetPathBoundingBox(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGContextCopyPath(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGContextCopyPath(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGContextPathContainsPoint(lua_State *L)
{
    CGPoint *p = lua_touserdata(L, 2);
    lua_pushboolean(L, CGContextPathContainsPoint(lua_touserdata(L, 1), *p, lua_tointeger(L, 3)));
    return 1;
}

static int lua_CGContextDrawPath(lua_State *L)
{
    CGContextDrawPath(lua_touserdata(L, 1), lua_tointeger(L, 2));
    return 0;
}

static int lua_CGContextFillPath(lua_State *L)
{
    CGContextFillPath(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextEOFillPath(lua_State *L)
{
    CGContextEOFillPath(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextStrokePath(lua_State *L)
{
    CGContextStrokePath(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextFillRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    CGContextFillRect(lua_touserdata(L, 1), *r);
    return 0;
}

static int lua_CGContextFillRects(lua_State *L)
{
    //TODO
    //CGContextFillRects(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextStrokeRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    CGContextStrokeRect(lua_touserdata(L, 1), *r);
    return 0;
}

static int lua_CGContextStrokeRectWithWidth(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    CGFloat width = lua_tonumber(L, 3);
    CGContextStrokeRectWithWidth(lua_touserdata(L, 1), *r, width);
    return 0;
}

static int lua_CGContextClearRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    CGContextClearRect(lua_touserdata(L, 1), *r);
    return 0;
}

static int lua_CGContextFillEllipseInRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    CGContextFillEllipseInRect(lua_touserdata(L, 1), *r);
    return 0;
}

static int lua_CGContextStrokeEllipseInRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    CGContextStrokeEllipseInRect(lua_touserdata(L, 1), *r);
    return 0;
}

static int lua_CGContextStrokeLineSegments(lua_State *L)
{
    //TODO
    //CGContextStrokeLineSegments(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextClip(lua_State *L)
{
    CGContextClip(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextEOClip(lua_State *L)
{
    CGContextEOClip(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextClipToMask(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    CGContextClipToMask(lua_touserdata(L, 1), *r, lua_touserdata(L, 3));
    return 0;
}

static int lua_CGContextGetClipBoundingBox(lua_State *L)
{    
    lua_pushCGRect(L, CGContextGetClipBoundingBox(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGContextClipToRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    CGContextClipToRect(lua_touserdata(L, 1), *r);
    return 0;
}

static int lua_CGContextClipToRects(lua_State *L)
{
    //TODO
    //lua_pushlightuserdata(L, CGContextClipToRects(lua_touserdata(L, 1)));
    return 0;
}

static int lua_CGContextSetFillColorWithColor(lua_State *L)
{
    CGContextSetFillColorWithColor(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextSetStrokeColorWithColor(lua_State *L)
{
    CGContextSetStrokeColorWithColor(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextSetFillColorSpace(lua_State *L)
{
    CGContextSetFillColorSpace(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextSetStrokeColorSpace(lua_State *L)
{
    CGContextSetStrokeColorSpace(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextSetFillColor(lua_State *L)
{
    CGContextSetFillColor(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextSetStrokeColor(lua_State *L)
{
    CGContextSetStrokeColor(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

#if 0 
static int lua_CGContextSetFillPattern(lua_State *L)
{
    CGFloat *components = NULL;
    luasdk_get_arrayf(L, 3, &components);
    CGContextSetFillPattern(lua_touserdata(L, 1), lua_touserdata(L, 2), components);
    return 0;
}

static int lua_CGContextSetStrokePattern(lua_State *L)
{
    CGFloat *components = NULL;
    luasdk_get_arrayf(L, 3, &components);
    CGContextSetStrokePattern(lua_touserdata(L, 1), lua_touserdata(L, 2), components);
    return 0;
}

#endif


static int lua_CGContextSetPatternPhase(lua_State *L)
{
    CGSize *s = lua_touserdata(L, 2);
    CGContextSetPatternPhase(lua_touserdata(L, 1), *s);
    return 0;
}

static int lua_CGContextSetGrayFillColor(lua_State *L)
{
    CGContextSetGrayFillColor(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3));
    return 0;
}

static int lua_CGContextSetGrayStrokeColor(lua_State *L)
{
    CGContextSetGrayStrokeColor(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3));
    return 0;
}

static int lua_CGContextSetRGBFillColor(lua_State *L)
{
    CGContextSetRGBFillColor(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3)
                             , lua_tonumber(L, 4), lua_tonumber(L, 5));
    return 0;
}

static int lua_CGContextSetRGBStrokeColor(lua_State *L)
{
    CGContextSetRGBStrokeColor(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3)
                               , lua_tonumber(L, 4), lua_tonumber(L, 5));
    return 0;
}

static int lua_CGContextSetCMYKFillColor(lua_State *L)
{
    CGContextSetCMYKFillColor(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3)
                              , lua_tonumber(L, 4), lua_tonumber(L, 5), lua_tonumber(L, 6));
    return 0;
}

static int lua_CGContextSetCMYKStrokeColor(lua_State *L)
{
    CGContextSetCMYKStrokeColor(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3)
                                , lua_tonumber(L, 4), lua_tonumber(L, 5), lua_tonumber(L, 6));
    return 0;
}

static int lua_CGContextSetRenderingIntent(lua_State *L)
{
    CGContextSetRenderingIntent(lua_touserdata(L, 1), lua_tointeger(L, 2));
    return 0;
}

static int lua_CGContextDrawImage(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);    
    CGContextDrawImage(lua_touserdata(L, 1), *r, lua_touserdata(L, 3));
    return 0;
}

static int lua_CGContextDrawTiledImage(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);    
    CGContextDrawTiledImage(lua_touserdata(L, 1), *r, lua_touserdata(L, 3));
    return 0;
}

static int lua_CGContextGetInterpolationQuality(lua_State *L)
{
    lua_pushinteger(L, CGContextGetInterpolationQuality(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGContextSetInterpolationQuality(lua_State *L)
{
    CGContextSetInterpolationQuality(lua_touserdata(L, 1), lua_tointeger(L, 2));
    return 0;
}

static int lua_CGContextSetShadowWithColor(lua_State *L)
{
    CGSize *offset = lua_touserdata(L, 2);
    CGFloat blur = lua_tonumber(L, 3);
    CGContextSetShadowWithColor(lua_touserdata(L, 1), *offset, blur, lua_touserdata(L, 4));
    return 0;
}

static int lua_CGContextSetShadow(lua_State *L)
{
    CGSize *offset = lua_touserdata(L, 2);
    CGFloat blur = lua_tonumber(L, 3);

    CGContextSetShadow(lua_touserdata(L, 1), *offset, blur);
    return 0;
}

static int lua_CGContextDrawLinearGradient(lua_State *L)
{
    CGPoint *startPoint = lua_touserdata(L, 3);
    CGPoint *endPoint = lua_touserdata(L, 4);
    CGContextDrawLinearGradient(lua_touserdata(L, 1), lua_touserdata(L, 2),
                                *startPoint, *endPoint, lua_tointeger(L, 5));
    return 0;
}

static int lua_CGContextDrawRadialGradient(lua_State *L)
{    
    CGGradientRef gradient = lua_touserdata(L, 1);
    CGPoint *startCenter = lua_touserdata(L, 2);
    CGFloat startRadius = lua_tonumber(L, 3);
    CGPoint *endCenter = lua_touserdata(L, 4);
    CGFloat endRadius = lua_tonumber(L, 5);
    CGGradientDrawingOptions options = lua_tointeger(L, 6);
    CGContextDrawRadialGradient(lua_touserdata(L, 1), gradient, *startCenter, startRadius, *endCenter, endRadius, options);
    return 0;
}

static int lua_CGContextDrawShading(lua_State *L)
{
    CGContextDrawShading(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextSetCharacterSpacing(lua_State *L)
{
    CGContextSetCharacterSpacing(lua_touserdata(L, 1), lua_tonumber(L, 2));
    return 0;
}

static int lua_CGContextSetTextPosition(lua_State *L)
{
    CGContextSetTextPosition(lua_touserdata(L, 1), lua_tonumber(L, 2), lua_tonumber(L, 3));
    return 0;
}

static int lua_CGContextGetTextPosition(lua_State *L)
{
   lua_pushCGPoint(L, CGContextGetTextPosition(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGContextSetTextMatrix(lua_State *L)
{
    CGAffineTransform *t = lua_touserdata(L, 2);
    CGContextSetTextMatrix(lua_touserdata(L, 1), *t);
    return 0;
}

static int lua_CGContextGetTextMatrix(lua_State *L)
{
    lua_pushCGAffineTransform(L, CGContextGetTextMatrix(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGContextSetTextDrawingMode(lua_State *L)
{
    CGContextSetTextDrawingMode(lua_touserdata(L, 1), lua_tointeger(L, 2));
    return 0;
}

static int lua_CGContextSetFont(lua_State *L)
{
    CGContextSetFont(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextSetFontSize(lua_State *L)
{
    CGContextSetFontSize(lua_touserdata(L, 1), lua_tonumber(L, 2));
    return 0;
}

static int lua_CGContextSelectFont(lua_State *L)
{
    CGContextSelectFont(lua_touserdata(L, 1), lua_tostring(L, 2), 
                        lua_tonumber(L, 3), lua_tointeger(L, 4));
    return 0;
}

static int lua_CGContextShowGlyphsAtPositions(lua_State *L)
{
    //TODO
    //CGContextShowGlyphsAtPositions(lua_touserdata(L, 1)));
    return 0;
}

static int lua_CGContextShowText(lua_State *L)
{
    size_t length;
    const char* str = lua_tolstring(L, 2, &length);
    CGContextShowText(lua_touserdata(L, 1), str, length);
    return 0;
}

static int lua_CGContextShowTextAtPoint(lua_State *L)
{
    size_t length;
    const char* str = lua_tolstring(L, 4, &length);
    CGContextShowTextAtPoint(lua_touserdata(L, 1), lua_tonumber(L, 2),
                             lua_tonumber(L, 3), str, length);
    return 0;
}

#if 0
static int lua_CGContextShowGlyphs(lua_State *L)
{
    CGGlyph *g = NULL;
    size_t count = luasdk_get_arrayui(L, 2, (unsigned int**)&g);
    CGContextShowGlyphs(lua_touserdata(L, 1), g, count);
    return 0;
}

static int lua_CGContextShowGlyphsAtPoint(lua_State *L)
{
    CGGlyph *g = NULL;
    size_t count = luasdk_get_arrayui(L, 4, (unsigned int**)&g);

    CGContextShowGlyphsAtPoint(lua_touserdata(L, 1), lua_tonumber(L, 2),
                               lua_tonumber(L, 3), g, count);
    return 0;
}

#endif

static int lua_CGContextShowGlyphsWithAdvances(lua_State *L)
{
    //TODO
    //CGContextShowGlyphsWithAdvances(lua_touserdata(L, 1)));
    return 0;
}

static int lua_CGContextDrawPDFPage(lua_State *L)
{
    CGContextDrawPDFPage(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextBeginPage(lua_State *L)
{
    CGContextBeginPage(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextEndPage(lua_State *L)
{
    CGContextEndPage(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextRelease(lua_State *L)
{
    CGContextRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextFlush(lua_State *L)
{
    CGContextFlush(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextSynchronize(lua_State *L)
{
    CGContextSynchronize(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextSetShouldAntialias(lua_State *L)
{
    CGContextSetShouldAntialias(lua_touserdata(L, 1), lua_toboolean(L, 2));
    return 0;
}

static int lua_CGContextSetAllowsAntialiasing(lua_State *L)
{
    CGContextSetAllowsAntialiasing(lua_touserdata(L, 1), lua_toboolean(L, 2));
    return 0;
}

static int lua_CGContextSetShouldSmoothFonts(lua_State *L)
{
    CGContextSetShouldSmoothFonts(lua_touserdata(L, 1), lua_toboolean(L, 2));
    return 0;
}

static int lua_CGContextSetAllowsFontSmoothing(lua_State *L)
{
    CGContextSetAllowsFontSmoothing(lua_touserdata(L, 1), lua_toboolean(L, 2));
    return 0;
}

static int lua_CGContextSetShouldSubpixelPositionFonts(lua_State *L)
{
    CGContextSetShouldSubpixelPositionFonts(lua_touserdata(L, 1), lua_toboolean(L, 2));
    return 0;
}

static int lua_CGContextSetAllowsFontSubpixelPositioning(lua_State *L)
{
    CGContextSetAllowsFontSubpixelPositioning(lua_touserdata(L, 1), lua_toboolean(L, 2));
    return 0;
}

static int lua_CGContextSetShouldSubpixelQuantizeFonts(lua_State *L)
{
    CGContextSetShouldSubpixelQuantizeFonts(lua_touserdata(L, 1), lua_toboolean(L, 2));
    return 0;
}

static int lua_CGContextSetAllowsFontSubpixelQuantization(lua_State *L)
{
    CGContextSetAllowsFontSubpixelQuantization(lua_touserdata(L, 1), lua_toboolean(L, 2));
    return 0;
}

static int lua_CGContextBeginTransparencyLayer(lua_State *L)
{
    CGContextBeginTransparencyLayer(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_CGContextBeginTransparencyLayerWithRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    CGContextBeginTransparencyLayerWithRect(lua_touserdata(L, 1), *r, lua_touserdata(L, 3));
    return 0;
}

static int lua_CGContextEndTransparencyLayer(lua_State *L)
{
    CGContextEndTransparencyLayer(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGContextGetUserSpaceToDeviceSpaceTransform(lua_State *L)
{
    lua_pushCGAffineTransform(L, CGContextGetUserSpaceToDeviceSpaceTransform(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGContextConvertPointToDeviceSpace(lua_State *L)
{
    CGPoint *p = lua_touserdata(L, 2);
    lua_pushCGPoint(L, CGContextConvertPointToDeviceSpace(lua_touserdata(L, 1), *p));
    return 1;
}

static int lua_CGContextConvertPointToUserSpace(lua_State *L)
{
    CGPoint *p = lua_touserdata(L, 2);

    lua_pushCGPoint(L, CGContextConvertPointToUserSpace(lua_touserdata(L, 1), *p));
    return 1;
}

static int lua_CGContextConvertSizeToDeviceSpace(lua_State *L)
{
    CGSize *s = lua_touserdata(L, 2);

    lua_pushCGSize(L, CGContextConvertSizeToDeviceSpace(lua_touserdata(L, 1), *s));
    return 1;
}

static int lua_CGContextConvertSizeToUserSpace(lua_State *L)
{
    CGSize *s = lua_touserdata(L, 2);
    
    lua_pushCGSize(L, CGContextConvertSizeToUserSpace(lua_touserdata(L, 1), *s));
    return 1;
}

static int lua_CGContextConvertRectToDeviceSpace(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    
    lua_pushCGRect(L, CGContextConvertRectToDeviceSpace(lua_touserdata(L, 1), *r));
    return 1;
}

static int lua_CGContextConvertRectToUserSpace(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    
    lua_pushCGRect(L, CGContextConvertRectToUserSpace(lua_touserdata(L, 1), *r));
    return 1;
}

static const luaL_Reg __LuaCGContextAPIs[] = {
    {"CGContextGetTypeID", lua_CGContextGetTypeID},
    {"CGContextSaveGState", lua_CGContextSaveGState},
    {"CGContextRestoreGState", lua_CGContextRestoreGState},
    {"CGContextScaleCTM", lua_CGContextScaleCTM},
    {"CGContextTranslateCTM", lua_CGContextTranslateCTM},
    {"CGContextRotateCTM", lua_CGContextRotateCTM},
    {"CGContextConcatCTM", lua_CGContextConcatCTM},
    {"CGContextGetCTM", lua_CGContextGetCTM},
    {"CGContextSetLineWidth", lua_CGContextSetLineWidth},
    {"CGContextSetLineCap", lua_CGContextSetLineCap},
    {"CGContextSetLineJoin", lua_CGContextSetLineJoin},
    {"CGContextSetMiterLimit", lua_CGContextSetMiterLimit},
#if 0
    {"CGContextSetLineDash", lua_CGContextSetLineDash},
#endif
    {"CGContextSetFlatness", lua_CGContextSetFlatness},
    {"CGContextSetAlpha", lua_CGContextSetAlpha},
    {"CGContextSetBlendMode", lua_CGContextSetBlendMode},
    {"CGContextBeginPath", lua_CGContextBeginPath},
    {"CGContextMoveToPoint", lua_CGContextMoveToPoint},
    {"CGContextAddLineToPoint", lua_CGContextAddLineToPoint},
    {"CGContextAddCurveToPoint", lua_CGContextAddCurveToPoint},
    {"CGContextAddQuadCurveToPoint", lua_CGContextAddQuadCurveToPoint},
    {"CGContextClosePath", lua_CGContextClosePath},
    {"CGContextAddRect", lua_CGContextAddRect},
    {"CGContextAddRects", lua_CGContextAddRects},
    {"CGContextAddLines", lua_CGContextAddLines},
    {"CGContextAddEllipseInRect", lua_CGContextAddEllipseInRect},
    {"CGContextAddArc", lua_CGContextAddArc},
    {"CGContextAddArcToPoint", lua_CGContextAddArcToPoint},
    {"CGContextAddPath", lua_CGContextAddPath},
    {"CGContextReplacePathWithStrokedPath", lua_CGContextReplacePathWithStrokedPath},
    {"CGContextIsPathEmpty", lua_CGContextIsPathEmpty},
    {"CGContextGetPathCurrentPoint", lua_CGContextGetPathCurrentPoint},
    {"CGContextGetPathBoundingBox", lua_CGContextGetPathBoundingBox},
    {"CGContextCopyPath", lua_CGContextCopyPath},
    {"CGContextPathContainsPoint", lua_CGContextPathContainsPoint},
    {"CGContextDrawPath", lua_CGContextDrawPath},
    {"CGContextFillPath", lua_CGContextFillPath},
    {"CGContextEOFillPath", lua_CGContextEOFillPath},
    {"CGContextStrokePath", lua_CGContextStrokePath},
    {"CGContextFillRect", lua_CGContextFillRect},
    {"CGContextFillRects", lua_CGContextFillRects},
    {"CGContextStrokeRect", lua_CGContextStrokeRect},
    {"CGContextStrokeRectWithWidth", lua_CGContextStrokeRectWithWidth},
    {"CGContextClearRect", lua_CGContextClearRect},
    {"CGContextFillEllipseInRect", lua_CGContextFillEllipseInRect},
    {"CGContextStrokeEllipseInRect", lua_CGContextStrokeEllipseInRect},
    {"CGContextStrokeLineSegments", lua_CGContextStrokeLineSegments},
    {"CGContextClip", lua_CGContextClip},
    {"CGContextEOClip", lua_CGContextEOClip},
    {"CGContextClipToMask", lua_CGContextClipToMask},
    {"CGContextGetClipBoundingBox", lua_CGContextGetClipBoundingBox},
    {"CGContextClipToRect", lua_CGContextClipToRect},
    {"CGContextClipToRects", lua_CGContextClipToRects},
    {"CGContextSetFillColorWithColor", lua_CGContextSetFillColorWithColor},
    {"CGContextSetStrokeColorWithColor", lua_CGContextSetStrokeColorWithColor},
    {"CGContextSetFillColorSpace", lua_CGContextSetFillColorSpace},
    {"CGContextSetStrokeColorSpace", lua_CGContextSetStrokeColorSpace},
    {"CGContextSetFillColor", lua_CGContextSetFillColor},
    {"CGContextSetStrokeColor", lua_CGContextSetStrokeColor},
#if 0
    {"CGContextSetFillPattern", lua_CGContextSetFillPattern},
    {"CGContextSetStrokePattern", lua_CGContextSetStrokePattern},
#endif
    {"CGContextSetPatternPhase", lua_CGContextSetPatternPhase},
    {"CGContextSetGrayFillColor", lua_CGContextSetGrayFillColor},
    {"CGContextSetGrayStrokeColor", lua_CGContextSetGrayStrokeColor},
    {"CGContextSetRGBFillColor", lua_CGContextSetRGBFillColor},
    {"CGContextSetRGBStrokeColor", lua_CGContextSetRGBStrokeColor},
    {"CGContextSetCMYKFillColor", lua_CGContextSetCMYKFillColor},
    {"CGContextSetCMYKStrokeColor", lua_CGContextSetCMYKStrokeColor},
    {"CGContextSetRenderingIntent", lua_CGContextSetRenderingIntent},
    {"CGContextDrawImage", lua_CGContextDrawImage},
    {"CGContextDrawTiledImage", lua_CGContextDrawTiledImage},
    {"CGContextGetInterpolationQuality", lua_CGContextGetInterpolationQuality},
    {"CGContextSetInterpolationQuality", lua_CGContextSetInterpolationQuality},
    {"CGContextSetShadowWithColor", lua_CGContextSetShadowWithColor},
    {"CGContextSetShadow", lua_CGContextSetShadow},
    {"CGContextDrawLinearGradient", lua_CGContextDrawLinearGradient},
    {"CGContextDrawRadialGradient", lua_CGContextDrawRadialGradient},
    {"CGContextDrawShading", lua_CGContextDrawShading},
    {"CGContextSetCharacterSpacing", lua_CGContextSetCharacterSpacing},
    {"CGContextSetTextPosition", lua_CGContextSetTextPosition},
    {"CGContextGetTextPosition", lua_CGContextGetTextPosition},
    {"CGContextSetTextMatrix", lua_CGContextSetTextMatrix},
    {"CGContextGetTextMatrix", lua_CGContextGetTextMatrix},
    {"CGContextSetTextDrawingMode", lua_CGContextSetTextDrawingMode},
    {"CGContextSetFont", lua_CGContextSetFont},
    {"CGContextSetFontSize", lua_CGContextSetFontSize},
    {"CGContextSelectFont", lua_CGContextSelectFont},
    {"CGContextShowGlyphsAtPositions", lua_CGContextShowGlyphsAtPositions},
    {"CGContextShowText", lua_CGContextShowText},
    {"CGContextShowTextAtPoint", lua_CGContextShowTextAtPoint},
#if 0
    {"CGContextShowGlyphs", lua_CGContextShowGlyphs},
    {"CGContextShowGlyphsAtPoint", lua_CGContextShowGlyphsAtPoint},
#endif
    {"CGContextShowGlyphsWithAdvances", lua_CGContextShowGlyphsWithAdvances},
    {"CGContextDrawPDFPage", lua_CGContextDrawPDFPage},
    {"CGContextBeginPage", lua_CGContextBeginPage},
    {"CGContextEndPage", lua_CGContextEndPage},
    {"CGContextRelease", lua_CGContextRelease},
    {"CGContextFlush", lua_CGContextFlush},
    {"CGContextSynchronize", lua_CGContextSynchronize},
    {"CGContextSetShouldAntialias", lua_CGContextSetShouldAntialias},
    {"CGContextSetAllowsAntialiasing", lua_CGContextSetAllowsAntialiasing},
    {"CGContextSetShouldSmoothFonts", lua_CGContextSetShouldSmoothFonts},
    {"CGContextSetAllowsFontSmoothing", lua_CGContextSetAllowsFontSmoothing},
    {"CGContextSetShouldSubpixelPositionFonts", lua_CGContextSetShouldSubpixelPositionFonts},
    {"CGContextSetAllowsFontSubpixelPositioning", lua_CGContextSetAllowsFontSubpixelPositioning},
    {"CGContextSetShouldSubpixelQuantizeFonts", lua_CGContextSetShouldSubpixelQuantizeFonts},
    {"CGContextSetAllowsFontSubpixelQuantization", lua_CGContextSetAllowsFontSubpixelQuantization},
    {"CGContextBeginTransparencyLayer", lua_CGContextBeginTransparencyLayer},
    {"CGContextBeginTransparencyLayerWithRect", lua_CGContextBeginTransparencyLayerWithRect},
    {"CGContextEndTransparencyLayer", lua_CGContextEndTransparencyLayer},
    {"CGContextGetUserSpaceToDeviceSpaceTransform", lua_CGContextGetUserSpaceToDeviceSpaceTransform},
    {"CGContextConvertPointToDeviceSpace", lua_CGContextConvertPointToDeviceSpace},
    {"CGContextConvertPointToUserSpace", lua_CGContextConvertPointToUserSpace},
    {"CGContextConvertSizeToDeviceSpace", lua_CGContextConvertSizeToDeviceSpace},
    {"CGContextConvertSizeToUserSpace", lua_CGContextConvertSizeToUserSpace},
    {"CGContextConvertRectToDeviceSpace", lua_CGContextConvertRectToDeviceSpace},
    {"CGContextConvertRectToUserSpace", lua_CGContextConvertRectToUserSpace},
    {NULL, 0},
};

int LuaOpenCGContext(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGContextAPIs);
    return 0;
}
