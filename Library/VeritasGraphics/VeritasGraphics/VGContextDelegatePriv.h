/* Copyright 2010 Smartmobili SARL
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef VGCONTEXTDELEGATEPRIV_H_
#define VGCONTEXTDELEGATEPRIV_H_

#include <VeritasFoundation/CFRuntime.h>
#include "VGError.h"
#include "VGRenderingStatePriv.h"
#include "VGGStatePriv.h"
#include "VGColorTransformPriv.h"

// Forward declaration
typedef struct VGContextDelegate *VGContextDelegateRef;


enum VGContextDelegateType
{
    kVGContextDelegateFinalize = 0,
	kVGContextDelegateGetColorTransform,
	kVGContextDelegateGetBounds,
	kVGContextDelegateDrawLines,
	kVGContextDelegateDrawRects,
	kVGContextDelegateDrawPath,
	kVGContextDelegateDrawImage,
	kVGContextDelegateDrawGlyphs,
	kVGContextDelegateDrawShading,
	kVGContextDelegateDrawDisplayList,
	kVGContextDelegateDrawImages,
	kVGContextDelegateBeginPage,
	kVGContextDelegateEndPage,
	kVGContextDelegateOperation,
	kVGContextDelegateDrawWindowContents,
	kVGContextDelegateDirtyWindowContents,
	kVGContextDelegateBeginLayer,
	kVGContextDelegateEndLayer,
	kVGContextDelegateGetLayer,
	kVGContextDelegateDrawLayer
};
typedef enum VGContextDelegateType VGContextDelegateType;

// Callbacks

typedef int (*VGFunctionPtr)();

typedef VGColorTransformRef (*VGCallbackGetColorTransform) (VGContextDelegateRef ctxDelegate, 
															VGRenderingStateRef rendering, 
															VGGStateRef state);

typedef VGError (*VGCallbackDrawPath) (VGContextDelegateRef ctxDelegate, 
									   VGRenderingStateRef rendering, 
									   VGGStateRef state, 
									   VGPathDrawingMode mode,
									   VGMutablePathRef path);

typedef VGError (*VGCallbackDrawLines) (VGContextDelegateRef ctxDelegate, 
										VGRenderingStateRef rendering, 
										VGGStateRef state,
										const VGPoint points[],
										size_t count);

typedef VGError (*VGCallbackDrawRects) (VGContextDelegateRef ctxDelegate, 
										VGRenderingStateRef rendering, 
										VGGStateRef state,
										const VGRect rects[],
										size_t count);

typedef VGError (*VGCallbackDrawImage) (VGContextDelegateRef ctxDelegate, 
										VGRenderingStateRef rendering, 
										VGGStateRef state,
										VGRect rect,
										VGImageRef image);

typedef VGError (*VGCallbackDrawGlyphs) (VGContextDelegateRef ctxDelegate,
										 VGRenderingStateRef rendering,
										 VGGStateRef state,
										 VGAffineTransform ctm);

typedef VGError (*VGCallbackOperation) (VGContextDelegateRef ctxDelegate,
										VGRenderingStateRef rendering,
										VGGStateRef state,
										CFStringRef op,
										void* tmp);

typedef VGError (*VGCallbackDrawShading) (VGContextDelegateRef ctxDelegate, 
										  VGRenderingStateRef rendering,
										  VGGStateRef state,
										  VGShadingRef shading);


typedef struct VGCallback {

	VGContextDelegateType type;
	void* delegateAddr;
} VGCallback, *VGCallbackRef;

extern VGCallback _kVGCallbacks[];


struct VGContextDelegateInfo {

	VGContextDelegateRef ctxDelegate;	//0x00
										//0x24
	Boolean allowDithering;				//0x35
	Boolean shouldAntialias;			//0x36
	Boolean allowAcceleration;			//0x37

	VGColorTransformRef colorTrans;		//0x3C
	CFTypeID colorTransformID;			//0x44
	//colorTransformMD5					//0x48 - 0x4B
};
typedef struct VGContextDelegateInfo VGContextDelegateInfo, *VGContextDelegateInfoRef;

//sizeof(struct VGContext) = 0x60;
struct VGContextDelegate {

	CFRuntimeBase obj;								//0x00

	VGColorTransformRef	colorTransform;				//0x08
	void* finalize;									//0x0C
	VGCallbackGetColorTransform getColorTransform;	//0x10
	void* getBounds;								//0x14
	VGCallbackDrawLines drawLines;					//0x18
	VGCallbackDrawRects drawRects;					//0x1C
	VGCallbackDrawPath drawPath;					//0x20
	VGCallbackDrawImage drawImage;					//0x24
	VGCallbackDrawGlyphs drawGlyphs;				//0x28
	VGCallbackDrawShading drawShading;				//0x2C
	void* drawDisplayList;							//0x30
	void* drawImages;								//0x34
	void* beginPage;								//0x38
	void* endPage;									//0x3C
	VGCallbackOperation operation;					//0x40
	void* drawWindowContents;						//0x44
	void* dirtyWindowContents;						//0x48
	void* beginLayer;								//0x4C
	void* endLayer;									//0x50
	void* getLayer;									//0x54
	void* drawLayer;								//0x58
	VGContextDelegateInfoRef info;					//0x5C
};
typedef struct VGContextDelegate VGContextDelegate, *VGContextDelegateRef;



//VG_EXTERN VGContextDelegateGetNext();

VG_EXTERN VGContextDelegateRef VGContextDelegateCreate(void* info);

VG_EXTERN VGContextDelegateRef VGContextDelegateRetain(VGContextDelegateRef ctxDelegate);
VG_EXTERN void VGContextDelegateRelease(VGContextDelegateRef ctxDelegate);
VG_EXTERN void VGContextSetDelegate(VGContextRef c, VGContextDelegateRef ctxDelegate);

VG_EXTERN void VGContextDelegateSetCallbacks(VGContextDelegateRef ctxDelegate, const VGCallback* dlArray, int count);
VG_EXTERN void VGContextDelegateSetCallback(VGContextDelegateRef ctxDelegate, VGContextDelegateType type, void* callback);


VG_EXTERN VGContextDelegateInfoRef VGContextDelegateGetInfo(VGContextDelegateRef ctxDelegate);

VG_EXTERN VGError VGContextDelegateOperation(VGContextDelegateRef ctxDelegate,
											 VGRenderingStateRef rendering,
											 VGGStateRef state,
											 CFStringRef op,
											 void* tmp);

VG_EXTERN VGError VGContextDelegateDrawPath(VGContextDelegateRef ctxDelegate, 
											VGRenderingStateRef rendering, 
											VGGStateRef state,
											VGPathDrawingMode mode,
											VGMutablePathRef path);


VG_EXTERN VGError VGContextDelegateDrawRects(VGContextDelegateRef ctxDelegate, 
											 VGRenderingStateRef rendering, 
											 VGGStateRef state,
											 const VGRect rects[],
											 size_t count);

VG_EXTERN VGError VGContextDelegateDrawImage(VGContextDelegateRef ctxDelegate, 
											 VGRenderingStateRef rendering,
											 VGGStateRef state,
											 VGRect rect,
											 VGImageRef image);

VG_EXTERN VGError VGContextDelegateDrawShading(VGContextDelegateRef ctxDelegate, 
											   VGRenderingStateRef rendering,
											   VGGStateRef state,
											   VGShadingRef shading);


VGFunctionPtr* get_callback_address(VGContextDelegateRef ctxDelegate, VGContextDelegateType type, const char* callerName);

#endif /* VGCONTEXTDELEGATEPRIV_H_ */


