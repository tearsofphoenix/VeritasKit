//
//  LuaCoreGraphics.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCoreGraphics.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"

#import "LuaCGAffineTransform.h"
#import "LuaCGBitmapContext.h"
#import "LuaCGColor.h"
#import "LuaCGColorSpace.h"
#import "LuaCGContext.h"
#import "LuaCGDataConsumer.h"
#import "LuaCGDataProvider.h"
#import "LuaCGError.h"
#import "LuaCGFont.h"
#import "LuaCGFunction.h"
#import "LuaCGGeometry.h"
#import "LuaCGGradient.h"
#import "LuaCGImage.h"
#import "LuaCGLayer.h"
#import "LuaCGPDFArray.h"
#import "LuaCGPDFContentStream.h"
#import "LuaCGPDFContext.h"
#import "LuaCGPDFDictionary.h"
#import "LuaCGPDFDocument.h"
#import "LuaCGPDFObject.h"
#import "LuaCGPDFOperatorTable.h"
#import "LuaCGPDFPage.h"
#import "LuaCGPDFScanner.h"
#import "LuaCGPDFStream.h"
#import "LuaCGPDFString.h"
#import "LuaCGPath.h"
#import "LuaCGPattern.h"
#import "LuaCGShading.h"

int LuaOpenCoreGraphics(lua_State *L)
{
    LuaOpenCGAffineTransform(L);
    LuaOpenCGBitmapContext(L);
    LuaOpenCGColor(L);
    LuaOpenCGColorSpace(L);
    LuaOpenCGContext(L);
    LuaOpenCGDataConsumer(L);
    LuaOpenCGDataProvider(L);
    LuaOpenCGError(L);
    LuaOpenCGFont(L);
    LuaOpenCGFunction(L);
    LuaOpenCGGeometry(L);
    LuaOpenCGGradient(L);
    LuaOpenCGImage(L);
    LuaOpenCGLayer(L);
    LuaOpenCGPDFArray(L);
    LuaOpenCGPDFContentStream(L);
    LuaOpenCGPDFContext(L);
    LuaOpenCGPDFDictionary(L);
    LuaOpenCGPDFDocument(L);
    LuaOpenCGPDFObject(L);
    LuaOpenCGPDFOperatorTable(L);
    LuaOpenCGPDFPage(L);
    LuaOpenCGPDFScanner(L);
    LuaOpenCGPDFStream(L);
    LuaOpenCGPDFString(L);
    LuaOpenCGPath(L);
    LuaOpenCGPattern(L);
    LuaOpenCGShading(L);

    return 0;
}
