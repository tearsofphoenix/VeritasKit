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
#ifndef VGGSTATE_H_
#define VGGSTATE_H_

#include <CoreFoundation/CFRuntime.h>

#include "VGDashPriv.h"
#include "VGColorSpace.h"
#include "VGRenderingStatePriv.h"
#include "VGFunction.h"
#include "VGPath.h"
#include "VGColor.h"
#include "VGStylePriv.h"
#include "VGSoftMaskPriv.h"

CF_EXTERN_C_BEGIN

enum VGCompositeMode {
	// Thanks to cairo
	kVGCompositeSourceOver = 0,
	kVGCompositeSourceIn,
	kVGCompositeSourceOut,
	kVGCompositeSourceAtop,
	kVGCompositeCopy,
	kVGCompositeDestinationOver,
	kVGCompositeDestinationIn,
	kVGCompositeDestinationOut,
	kVGCompositeDestinationAtop, 
	kVGCompositeXOR,
	kVGCompositePlusLighter,
	kVGCompositePlusDarker,
};
typedef enum VGCompositeMode VGCompositeMode;

////////////////////////////////////////////
// VGClip
typedef struct __VGClip {
	
	signed long refcount;

} VGClip, *VGClipRef;

enum {
    kVGClipHasMask = 1
};
typedef uint32_t VGClipInfo;



////////////////////////////////////////////
//VGDevice - sizeof = 0x1C
typedef struct VGDevice {
	
	signed long refcount;				//0x00
	VGFloat flatness;					//0x04
	uint32_t overprint;					//0x0C
	uint32_t overprintMode;				//0x10
	VGFunctionRef blackGeneration;		//0x14
	VGFunctionRef underColorRemoval;	//0x18


} VGDevice, *VGDeviceRef;


////////////////////////////////////////////
//VGStateStroke - sizeof = 0x24
typedef struct VGStateStroke {
	
	signed long refcount;		//0x00
	VGFloat lineWidth;			//0x04
	VGLineCap lineCap;			//0x08
	VGLineJoin lineJoin;		//0x0C
	VGFloat miterLimit;			//0x10
	VGFloat strokeAdjust;		//0x18
	VGDashRef dash;				//0x1C
	VGColorRef color;			//0x20

} VGStateStroke, *VGStateStrokeRef;

////////////////////////////////////////////
//VGDevice - sizeof = 0x28
typedef struct VGStateText {
	
	signed long refcount;		//0x00
	VGFontRef font;				//0x04
	VGFloat size;				//0x08
	VGFloat spacing;			//0x0C
	VGTextDrawingMode mode;		//0x10
	Boolean bUnknown1;			//0x18
	Boolean bUnknown2;			//0x24
	Boolean bUnknown3;			//0x25
	Boolean bUnknown4;			//0x26
	Boolean bUnknown5;			//0x27

} VGStateText, *VGStateTextRef;

////////////////////////////////////////////
//VGGStateRendering - sizeof = 0x2C
typedef struct VGGStateRendering {
	
	signed long refcount;		//0x00
	VGFloat alpha;				//0x04
	VGBlendMode mode;			//0x08 // Change with VGCompositeMode
	VGStyleRef style;			//0x0C
	VGSize size;				//0x10
	Boolean bUnknown1;			//0x24
	Boolean bUnknown2;			//0x25
	VGSoftMaskRef softMask;		//0x28


} VGGStateRendering, *VGGStateRenderingRef;



////////////////////////////////////////////
//VGClipStack
typedef struct VGClipStack {
	
	signed long refcount;		//0x00
	CFTypeID id;				//0x04
	VGClipInfo clipInfo;		//0x08
	VGRect rect;				//0x0C
	VGRect rect2;				//0x1C
	VGRect rect3;				//0x2C
	int field3C;				//0x3C			
	size_t count;				//0x40
	VGClipRef *clips;			//0x44

}	VGClipStack, *VGClipStackRef;


typedef struct VGGState {

	signed long refcount;			//0x00

	VGAffineTransform CTM;			//0x04
	VGFloat fontSize;				//0x08
	VGColorSpaceRef colorSpace;		//0x10
	VGColorRef fillColor;			//0x1C
	VGColorRef strokeColor;			//0x20 ???
	VGRect clipRect;				//0x20 ??? (see VGGStateResetClip)
	bool shouldAntialias;			//0x24
	VGBlendMode blendMode;
	
	VGFontRef font;					
	
	
	bool hasClipping;				//0x30
	VGClipStackRef clipStack;		//0x34
	Boolean hasRendering;			//0x38
	VGGStateRenderingRef rendering; //0x3C
	Boolean hasStroke;				//0x40
	VGStateStrokeRef stateStroke;	//0x44
	Boolean hasText;				//0x48
	VGStateTextRef stateText;		//0x4C
	Boolean hasDevice;				//0x50
	VGDeviceRef device;				//0x54

} VGGState, *VGGStateRef;


typedef struct __VGGStack {

	signed long refcount;	//0x00
	long capacity;			//0x04
	size_t count;			//0x08
	VGGStateRef *gstate;	//0x0C
	

} VGGStack, *VGGStackRef;


/* Private functions */

VGGStateRef push(VGGStackRef stack, VGGStateRef agState);

void deviceStateRelease(VGDeviceRef device);
void maybeCopyDeviceState(VGGStateRef agstate);
void strokeStateReset(VGStateStrokeRef stateStroke);
void strokeStateRelease(VGStateStrokeRef stateStroke);
void maybeCopyStrokeState(VGGStateRef agstate);
void textStateRelease(VGStateTextRef textState);
void maybeCopyRenderingState(VGGStateRef agstate);
void renderingStateReset(VGGStateRenderingRef gStateRendering);
void renderingStateRelease(VGGStateRenderingRef gStateRendering);
void maybeCopyTextState(VGGStateRef agstate);

/* Stack for Graphic context */
VG_EXTERN VGGStackRef		VGGStackCreate();
VG_EXTERN VGGStackRef		VGGStackCreateWithGState(VGGStateRef gstate);
VG_EXTERN VGGStateRef		VGGStackGetGState(VGGStackRef stack);
VG_EXTERN VGGStateRef		VGGStackSave(VGGStackRef stack);
VG_EXTERN VGGStateRef		VGGStackRestore(VGGStackRef stack);

VG_EXTERN void				VGGStackReset(VGGStackRef stack);
VG_EXTERN void				VGGStackRelease(VGGStackRef stack);


VG_EXTERN VGGStateRef		VGGStateCreate();
VG_EXTERN VGGStateRef		VGGStateCreateCopy(VGGStateRef state);
VG_EXTERN void				VGGStateClipCopy(VGGStateRef state, VGGStateRef stateSrc);
VG_EXTERN void				VGGStateDeviceCopy(VGGStateRef state, VGGStateRef stateSrc);
VG_EXTERN void				VGGStateRenderingCopy(VGGStateRef state, VGGStateRef stateSrc);
VG_EXTERN void				VGGStateStrokeCopy(VGGStateRef state, VGGStateRef stateSrc);
VG_EXTERN void				VGGStateTextCopy(VGGStateRef state, VGGStateRef stateSrc);

/* reset */
VG_EXTERN void				VGGStateReset(VGGStateRef state);
VG_EXTERN void				VGGStateClipReset(VGGStateRef state);
VG_EXTERN void				deviceStateReset(VGDeviceRef device);
VG_EXTERN void				VGGStateResetClip(VGGStateRef state);


/* getters */
VG_EXTERN VGAffineTransform	VGGStateGetCTM(VGGStateRef state);
VG_EXTERN VGColorRef		VGGStateGetFillColor(VGGStateRef state);
VG_EXTERN VGColorRef		VGGStateGetStrokeColor(VGGStateRef state);
VG_EXTERN void				VGGStateSetAlpha(VGGStateRef state, VGFloat alpha);
VG_EXTERN VGFloat			VGGStateGetLineWidth(VGGStateRef state);
VG_EXTERN VGFloat			VGGStateGetFlatness(VGGStateRef state);

/* setters */
VG_EXTERN void				VGGStateSetCTM(VGGStateRef state, VGAffineTransform ctm);
VG_EXTERN void				VGGStateSetCompositeOperation(VGGStateRef gstate, VGCompositeMode compositeMode);
VG_EXTERN void				VGGStateSetLineWidth(VGGStateRef state, VGFloat width);
VG_EXTERN void				VGGStateSetLineCap(VGGStateRef state, VGLineCap cap);
VG_EXTERN void				VGGStateSetLineDash(VGGStateRef state, VGDashRef dash);
VG_EXTERN void				VGGStateSetLineJoin(VGGStateRef state, VGLineJoin join);
VG_EXTERN void				VGGStateSetMiterLimit(VGGStateRef state, VGFloat miter);
VG_EXTERN void				VGGStateSetFlatness(VGGStateRef state, VGFloat flatness);
VG_EXTERN void				VGGStateSetStrokeAdjust(VGGStateRef state, VGFloat strokeAdjust);
VG_EXTERN void				VGGStateSetFillColor(VGGStateRef agstate, VGColorRef color);
VG_EXTERN void				VGGStateSetFontSize(VGGStateRef agstate, VGFloat size);
VG_EXTERN void				VGGStateSetBlackGeneration(VGGStateRef gstate, VGFunctionRef blackGeneration);
VG_EXTERN void				VGGStateSetUndercolorRemoval(VGGStateRef gstate, VGFunctionRef underColorRemoval);

/* Reset states */
VG_EXTERN void				VGGStateDeviceReset(VGGStateRef agstate);
VG_EXTERN void				VGGStateTextReset(VGGStateRef agstate);
VG_EXTERN void				VGGStateRenderingReset(VGGStateRef agstate);
VG_EXTERN void				VGGStateStrokeReset(VGGStateRef agstate);


/* Release states */
VG_EXTERN void				VGGStateRelease(VGGStateRef state);
VG_EXTERN void				VGGStateClipRelease(VGGStateRef state);
VG_EXTERN void				VGGStateDeviceRelease(VGGStateRef state);
VG_EXTERN void				VGGStateRenderingRelease(VGGStateRef state);
VG_EXTERN void				VGGStateStrokeRelease(VGGStateRef state);
VG_EXTERN void				VGGStateTextRelease(VGGStateRef state);

/* Clipping */
VG_EXTERN void				VGClipRelease(VGClipRef clip);
VG_EXTERN VGClipStackRef	VGClipStackCreateMutable();
VG_EXTERN void				VGClipStackRelease(VGClipStackRef clipStack);
VG_EXTERN VGClipStackRef	VGClipStackRetain(VGClipStackRef clipStack);

VG_EXTERN void				VGGStateClipToPath(VGGStateRef state, VGPathRef path, VGPathDrawingMode mode);

CF_EXTERN_C_END

#endif /* VGGSTATE_H_ */


