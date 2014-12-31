//
//  VGContextPrivate.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/30.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef VeritasGraphics_VGContextPrivate_h
#define VeritasGraphics_VGContextPrivate_h

#include <VeritasFoundation/CFRuntime.h>
#include "VGColor.h"
#include "VGGStatePriv.h"
#include "VGContextDelegatePriv.h"
#include "VGContext.h"

VG_EXTERN const CFStringRef kVGContextDisplayList;
VG_EXTERN const CFStringRef kVGContextLog;
VG_EXTERN const CFStringRef kVGContextBackgroundColor;
VG_EXTERN const CFStringRef kVGContextBoundingBox;
VG_EXTERN const CFStringRef kVGContextColorSpace;
VG_EXTERN const CFStringRef kVGContextGroup;
VG_EXTERN const CFStringRef kVGContextResolution;
VG_EXTERN const CFStringRef kVGContextFilterInfo;
VG_EXTERN const CFStringRef kVGContextFilterOptionsData;
VG_EXTERN const CFStringRef kVGContextFilterOptionsURL;
VG_EXTERN const CFStringRef kVGContextFilterInfo;
VG_EXTERN const CFStringRef kVGContextFilterOptionsData;
VG_EXTERN const CFStringRef kVGContextFilterOptionsURL;
VG_EXTERN const CFStringRef kVGTransparencyLayerContentBounds;
VG_EXTERN const CFStringRef kVGContextErase;
VG_EXTERN const CFStringRef kVGContextClear;
VG_EXTERN const CFStringRef kVGContextWait;
VG_EXTERN const CFStringRef kVGContextSynchronize;
VG_EXTERN const CFStringRef kVGContextFlush;

typedef enum {
    kVGContextTypeGeneric		= 0,
    kVGContextTypePDF			= 1,
    kVGContextTypeBitmap		= 4,
    kVGContextTypeDisplayList	= 6
    
} VGContextType;

//sizeof(struct VGBitmapContextInfo) = 0x4C;
struct VGBitmapContextInfo {
    
    int32_t refcount;							//0x00 - +0
    size_t	width;								//0x04 - +1
    size_t	height;								//0x08 - +2
    void* dataWithAlpha;						//0x0C - +3
    VGFloat alpha;								//0x10 - +4
    VGColorSpaceRef colorspace;					//0x14 - +5
    VGBitmapInfo bitmapInfo;					//0x18 - +6
    VGFloat horzRes;							//0x1C - +7
    VGFloat vertRes;							//0x20 - +8
    void* data;									//0x24 - +9
    size_t bitsPerPixel;						//0x28 - +10
    size_t bitsPerComponent;					//0x2C - +11
    size_t bytesPerRow;							//0x30 - +12
    bool dataAllocated;							//0x34
    void* alphaData;							//0x38
    bool unknown_3C;							//0x3C d
    bool unknown_40;							//0x40 c
    bool unknown_44;							//0x44 e
    bool alphaAllocated;						//0x48
};

typedef struct VGBitmapContextInfo *VGBitmapContextInfoRef;

struct VGContext
{
    
    CFRuntimeBase base;								//0x00
    
    size_t magic;									//0x08
    VGContextType contextType;						//0x0C
    VGBitmapContextInfoRef bitmapContextInfo;		//0x10
    void* finalize;									//0x14
    void* reserved_18;								//0x18 ??? create a VGImageRef
    //0x24
    VGGStackRef stack;								//0x2C
    VGRenderingStateRef rendering;					//0x30
    VGGStateRef state;								//0x34	(x86 -> + 13)
    VGAffineTransform ctm;							//0x38
    VGMutablePathRef path;							//0x50	(x86 -> + 20)
    VGContextDelegateRef ctxDelegate;				//0x54	(x86 -> + 21)
    void* unknown58;								//0x58
};



VG_EXTERN void VGContextCreatePaths(VGContextRef c);

VG_EXTERN VGContextRef VGContextCreate();

VG_EXTERN VGContextRef VGContextCreateWithDelegate(VGContextDelegateRef ctxDelegate,
                                                   VGRenderingStateRef renderState,
                                                   VGGStateRef gState);

VG_EXTERN void VGContextSetDelegate(VGContextRef c,
                                    VGContextDelegateRef ctxDelegate);

VG_EXTERN VGContextRef VGContextAddFilter(VGContextRef c, void* unknown1, void* unknown2);

VG_EXTERN void		VGContextDestroy(CFTypeRef c);
VG_EXTERN void		VGContextResetState(VGContextRef c);
VG_EXTERN void		VGContextSetRenderingResolution(VGContextRef c);
VG_EXTERN void		VGContextSetStrokeAdjust(VGContextRef c, VGFloat strokeAdjust);
VG_EXTERN void		VGContextSetBlackGeneration(VGContextRef c, VGFunctionRef blackGeneration);
VG_EXTERN void		VGContextSetUndercolorRemoval(VGContextRef c, VGFunctionRef underColorRemoval);


#endif
