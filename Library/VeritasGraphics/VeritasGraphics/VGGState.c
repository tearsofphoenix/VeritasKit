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
#include "VGGStatePriv.h"

#include "VGBase.h"
#include "VGPath.h"
#include "VGColorSpace.h"
#include "VGSoftMaskPriv.h"




VGGStackRef VGGStackCreate()
{
	return VGGStackCreateWithGState(NULL);
}


VGGStackRef	VGGStackCreateWithGState(VGGStateRef stateSrc)
{
	VGGStackRef stack;

	stack = (VGGStackRef)calloc(1, sizeof(VGGStack));
	if (!stack)
		return NULL;

	stack->refcount = 1;
	stack->capacity = 8;
	stack->count = 0;

	stack->gstate = (VGGStateRef *) malloc( sizeof(VGGStateRef) * stack->capacity);
	if (stack->gstate == NULL) {
		VGGStackRelease(stack);
		return NULL;
	}

	if (stateSrc == NULL)
		stack->gstate[stack->count] = VGGStateCreate();
	else
		stack->gstate[stack->count] = VGGStateCreateCopy(stateSrc);

	stack->count++;

	return stack;
}

VGGStateRef	VGGStackSave(VGGStackRef stack)
{
	VGGStateRef gStateCopy;

	gStateCopy = VGGStateCreateCopy(stack->gstate[stack->count - 1]);
	return push(stack, gStateCopy);
}

VGGStateRef push(VGGStackRef stack, VGGStateRef agState)
{
	VGGStateRef *gStateTmp;
	long lCapacity;

	if (stack->count == 0) {
		// TODO : error stack->count must be > 0
		return NULL;
	}

	if (stack->count == stack->capacity) {

		lCapacity = stack->capacity + 8;
		gStateTmp = (VGGStateRef *)realloc(stack->gstate, sizeof(VGGStateRef) * lCapacity);
		if (gStateTmp == NULL) { return NULL; }

		stack->capacity = lCapacity;
		stack->gstate = gStateTmp;
	}
	
	stack->gstate[stack->count++] = agState;

	return agState;
}


VGGStateRef	VGGStackRestore(VGGStackRef gstack)
{
	if (gstack->count == 0) {
		// TODO : error stack->count must be > 0
		return NULL;
	}
	
	if (gstack->count == 1) {
		printf("%s: gstack count must be > 1.", "VGGStackRestore");
		return gstack->gstate[0];
	}

	gstack->count--;
	VGGStateRelease(gstack->gstate[gstack->count]);

	return (gstack->gstate[gstack->count - 1]);
}


void VGGStackReset(VGGStackRef gstack)
{
	if (gstack->count > 0) {

		/* Release all states except first one */
		for (size_t i = gstack->count; i > 1; i--) {
			gstack->count--;
			VGGStateRelease(gstack->gstate[gstack->count]);
		}

		VGGStateSetCTM(gstack->gstate[0], VGAffineTransformIdentity);
		VGGStateResetClip(gstack->gstate[0]);
		VGGStateReset(gstack->gstate[0]);
	}
}

VGGStateRef	VGGStateCreateCopy(VGGStateRef stateSrc)
{
	VGGStateRef stateCopy;

	stateCopy = (VGGStateRef)calloc(1, sizeof(VGGState));
	if (!stateCopy) 
		return NULL;

	stateCopy->refcount = 1;

	VGGStateClipCopy(stateCopy, stateSrc);
	VGGStateDeviceCopy(stateCopy, stateSrc);
	VGGStateRenderingCopy(stateCopy, stateSrc);
	VGGStateStrokeCopy(stateCopy, stateSrc);
	VGGStateTextCopy(stateCopy, stateSrc);

	stateCopy->CTM = stateSrc->CTM;
	stateCopy->fillColor = VGColorRetain(stateSrc->fillColor);

	return stateCopy;
}


void VGGStateClipCopy(VGGStateRef state, VGGStateRef stateSrc)
{
	state->clipStack = VGClipStackRetain(stateSrc->clipStack);
	stateSrc->hasClipping = TRUE;
	state->hasClipping = TRUE;
	state->clipRect = stateSrc->clipRect;
}

void VGGStateDeviceCopy(VGGStateRef state, VGGStateRef stateSrc)
{
	if (stateSrc->device) {
		stateSrc->device->refcount++;
	}
	state->device = stateSrc->device;
	state->hasDevice = TRUE;
	stateSrc->hasDevice = TRUE;
}

void VGGStateRenderingCopy(VGGStateRef state, VGGStateRef stateSrc)
{
	if (stateSrc->rendering) {
		stateSrc->device->refcount++;
	}
	state->rendering = stateSrc->rendering;
	state->hasDevice = TRUE;
	stateSrc->hasDevice = TRUE;
}

void VGGStateStrokeCopy(VGGStateRef state, VGGStateRef stateSrc)
{
	if (stateSrc->stateStroke) {
		stateSrc->stateStroke->refcount++;
	}
	state->stateStroke = stateSrc->stateStroke;
	state->hasStroke = TRUE;
	stateSrc->hasStroke = TRUE;
}

void VGGStateTextCopy(VGGStateRef state, VGGStateRef stateSrc)
{
	textStateRelease(state->stateText);
	if (stateSrc->stateText) {
		stateSrc->stateText->refcount++;
	}
	state->stateText = stateSrc->stateText;
	state->hasText = TRUE;
	stateSrc->hasText = TRUE;
}

void textStateRelease(VGStateTextRef textState)
{
	if (!textState)
		return;
	
	textState->refcount--;
	if (textState->refcount) {
		VGFontRelease(textState->font);
		free(textState);
	}
}

VGGStateRef	VGGStackGetGState(VGGStackRef stack)
{
	if (!stack->gstate) { return NULL; }

	return stack->gstate[stack->count - 1];
}

VGGStateRef	VGGStateCreate()
{
	VGGStateRef state;

	state = (VGGStateRef) calloc(1, sizeof(VGGState));
	if (!state) { return NULL; }

	state->refcount = 1;
	state->CTM = VGAffineTransformIdentity;

	VGGStateClipReset(state);
	VGGStateReset(state);

	return state;
}



void VGGStateReset(VGGStateRef agstate)
{
	VGGStateDeviceReset(agstate);
	VGGStateTextReset(agstate);
	VGGStateRenderingReset(agstate);
	VGGStateStrokeReset(agstate);
	VGGStateSetFillColor(agstate, 0);
	
	return;
}

void VGGStateClipReset(VGGStateRef agstate)
{
	VGGStateResetClip(agstate);
	return;
}

void VGGStateResetClip(VGGStateRef state)
{
	//VGClipStackRef clipStack;

	VGClipStackRelease(state->clipStack);
	state->clipStack = VGClipStackCreateMutable();
	
	state->clipRect = VGRectInfinite;
	state->hasClipping = FALSE;
}


void VGGStateDeviceReset(VGGStateRef agstate)
{
	VGDeviceRef device;

	if (agstate->device == NULL) {
		device = (VGDeviceRef) calloc(1, sizeof(VGDevice));
		if (device == NULL) {
			agstate->hasDevice = FALSE;
			return;
		}
		device->refcount = 1;
		deviceStateReset(device);
	}
	else {
		maybeCopyDeviceState(agstate);
		deviceStateReset(agstate->device);
	}
}



void deviceStateReset(VGDeviceRef device)
{
	VGFunctionRelease(device->blackGeneration);
	device->blackGeneration = NULL;

	VGFunctionRelease(device->underColorRemoval);
	device->underColorRemoval = NULL;
}	

void maybeCopyDeviceState(VGGStateRef state)
{
	VGDeviceRef device;

	if( state->hasDevice == FALSE)
		return;

	device = (VGDeviceRef) calloc(1, sizeof(VGDevice));
	if (!device) {

		deviceStateRelease(state->device);
		state->hasDevice = FALSE;
	}
	else {
		device->refcount = 1;
		VGFunctionRetain(device->blackGeneration);
		VGFunctionRetain(device->underColorRemoval);
	}

}

void VGGStateTextReset(VGGStateRef gstate)
{

}

void VGGStateRenderingReset(VGGStateRef agstate)
{
	VGGStateRenderingRef gStateRendering;

	if (agstate->rendering == NULL) {
		gStateRendering = (VGGStateRenderingRef) calloc(1, sizeof(VGGStateRendering));
		if (gStateRendering == NULL) {
			agstate->hasStroke = FALSE;
			return;
		}
		gStateRendering->refcount = 1;
		renderingStateReset(gStateRendering);
		agstate->rendering = gStateRendering;
		agstate->hasRendering = FALSE;
	}
	else {
		maybeCopyRenderingState(agstate); 
		renderingStateReset(agstate->rendering);
	}
}

void maybeCopyRenderingState(VGGStateRef state)
{
	VGGStateRenderingRef gStateRendering;

	if (state->hasRendering == FALSE)
		return;

	gStateRendering = (VGGStateRenderingRef) calloc(1, sizeof(VGGStateRendering));
	if (!gStateRendering) {

		renderingStateRelease(state->rendering);
		state->rendering = NULL;
		state->hasRendering = FALSE;
	}
	else {
		gStateRendering->refcount = 1;

	}

}

void renderingStateReset(VGGStateRenderingRef gStateRendering)
{
	if (gStateRendering->style) {
		VGStyleRelease(gStateRendering->style);
		gStateRendering->style = NULL;
	}

	if (gStateRendering->softMask) {
		VGSoftMaskRelease(gStateRendering->softMask);
		gStateRendering->softMask = NULL;
	}

}

void renderingStateRelease(VGGStateRenderingRef gStateRendering)
{

}


void VGGStateStrokeReset(VGGStateRef agstate)
{
	VGStateStrokeRef stateStroke;

	if (agstate->stateStroke == NULL) {
		stateStroke = (VGStateStrokeRef) calloc(1, sizeof(VGStateStroke));
		if (stateStroke == NULL) {
			agstate->hasStroke = FALSE;
			return;
		}
		stateStroke->refcount = 1;
		strokeStateReset(stateStroke);
		agstate->stateStroke = stateStroke;
		agstate->hasStroke = FALSE;
	}
	else {
		maybeCopyStrokeState(agstate); 
		strokeStateReset(agstate->stateStroke);
	}
}

void maybeCopyStrokeState(VGGStateRef state)
{
	VGStateStrokeRef stroke;

	stroke = (VGStateStrokeRef) calloc(1, sizeof(VGStateStroke));
	if (!stroke) {
		strokeStateRelease(state->stateStroke);
		state->stateStroke = NULL;
		state->hasStroke = FALSE;
		
	}
	else {
		stroke->dash = VGDashRetain(state->stateStroke->dash);
		stroke->color = VGColorRetain(state->stateStroke->color);
	}
}

void strokeStateReset(VGStateStrokeRef stateStroke)
{
	VGDashRelease(stateStroke->dash);
	stateStroke->dash = NULL;
	
	VGColorRelease(stateStroke->color);
	stateStroke->color = NULL;
}

void strokeStateRelease(VGStateStrokeRef stateStroke)
{
	if (!stateStroke)
		return;

	stateStroke->refcount--;
	if (stateStroke->refcount == 0) {

		VGDashRelease(stateStroke->dash);
		VGColorRelease(stateStroke->color);
		free(stateStroke);
	}
}

void VGGStateSetCompositeOperation(VGGStateRef gstate, VGCompositeMode compositeMode)
{

}

VGColorRef VGGStateGetFillColor(VGGStateRef state)
{
    return NULL;
#if 0
	VGColorSpaceRef colorSpace;

	if (state->fillColor) { return state->fillColor; }
	
	colorSpace = VGColorSpaceCreateDeviceGray();
	state->fillColor = VGColorSpaceCopyDefaultColor(colorSpace); 
	VGColorSpaceRelease(colorSpace);

	return state->fillColor;
#endif
}



void VGGStateSetFillColor(VGGStateRef state, VGColorRef color)
{
	if (VGColorEqualToColor(state->fillColor, color))
		return;

	VGColorRelease(state->fillColor);
	state->fillColor = VGColorRetain(color);
}


void VGGStackRelease(VGGStackRef stack)
{
	int i;
	if (!stack) { return; }

	stack->refcount--;
	if (stack->refcount != 0)
		return;
	
	for (i = 0; i < stack->capacity; i++) {
		VGGStateRelease( stack->gstate[i] ); 
	}

	free(stack->gstate);
	free(stack);
}


void VGGStateRelease(VGGStateRef state)
{
	if (!state) { return; }
	state->refcount--;
	if (state->refcount != 0) { return;}

	VGGStateClipRelease(state);
	VGGStateDeviceRelease(state);
	VGGStateRenderingRelease(state);
	VGGStateStrokeRelease(state);
	VGGStateTextRelease(state);
	VGColorRelease(state->fillColor);
	
	free(state);
}

VGAffineTransform VGGStateGetCTM(VGGStateRef state)
{
	return state->CTM;
}

void VGGStateSetCTM(VGGStateRef state, VGAffineTransform ctm)
{
	state->CTM = ctm;
}


void VGGStateSetAlpha(VGGStateRef state, VGFloat alpha)
{
	if (state->rendering->alpha == alpha)
		return;

	maybeCopyRenderingState(state);
	state->rendering->alpha = alpha;

}

VGFloat	VGGStateGetLineWidth(VGGStateRef state)
{
	return state->stateStroke->lineWidth;
}

void VGGStateSetLineWidth(VGGStateRef state, VGFloat width)
{
	if (state->stateStroke->lineWidth == width)
		return;
	
	maybeCopyStrokeState(state);
	state->stateStroke->lineWidth = width;
}

void VGGStateSetLineCap(VGGStateRef state, VGLineCap cap)
{
	if (state->stateStroke->lineCap == cap)
		return;

	maybeCopyStrokeState(state);
	state->stateStroke->lineCap = cap;

}

void VGGStateSetLineJoin(VGGStateRef state, VGLineJoin join)
{
	if (state->stateStroke->lineJoin == join)
		return;

	maybeCopyStrokeState(state);
	state->stateStroke->lineJoin = join;
}

void VGGStateSetMiterLimit(VGGStateRef state, VGFloat miter)
{
	if (state->stateStroke->miterLimit == miter)
		return;

	maybeCopyStrokeState(state);
	state->stateStroke->miterLimit = miter;
}


void VGGStateSetLineDash(VGGStateRef state, VGDashRef dash)
{
	if (VGDashEqualToDash(state->stateStroke->dash, dash) == TRUE)
		return;
	
	maybeCopyStrokeState(state);
	VGDashRelease(state->stateStroke->dash);
	state->stateStroke->dash = VGDashRetain(dash);
}

void VGGStateSetFlatness(VGGStateRef state, VGFloat flatness)
{
	if (state->device->flatness == flatness)
		return;

	maybeCopyDeviceState(state);
	state->device->flatness = flatness;
}

void VGGStateSetStrokeAdjust(VGGStateRef state, VGFloat strokeAdjust)
{
	if (state->stateStroke->strokeAdjust == strokeAdjust)
		return;

	maybeCopyStrokeState(state);
	state->stateStroke->strokeAdjust = strokeAdjust;
}


VGFloat	VGGStateGetFlatness(VGGStateRef state)
{
	return state->device->flatness;
}



void VGGStateSetBlackGeneration(VGGStateRef gstate, VGFunctionRef blackGeneration)
{

}

void VGGStateSetUndercolorRemoval(VGGStateRef gstate, VGFunctionRef underColorRemoval)
{

}

void VGGStateSetFontSize(VGGStateRef state, VGFloat size)
{
	if (state->stateText->size == size)
		return;

	maybeCopyTextState(state);
	state->stateText->size = size;
}


void maybeCopyTextState(VGGStateRef state)
{
	VGStateTextRef stateText;

	if (state->hasText == FALSE)
		return;

	stateText = (VGStateTextRef) calloc(1, sizeof(VGStateText));
	if (!stateText) {

		textStateRelease(state->stateText);
		state->hasText = FALSE;
	}
	else {
		stateText->refcount = 1;
		stateText->font = VGFontRetain(state->stateText->font);

	}
}

void VGGStateClipRelease(VGGStateRef state)
{
	//VGClipStackRelease(state->clipping);
}

void VGGStateDeviceRelease(VGGStateRef state)
{
	deviceStateRelease(state->device);
	return;
}

void deviceStateRelease(VGDeviceRef device)
{
	if (!device) return;

	device->refcount--;
	if (device->refcount == 0) {
		VGFunctionRelease(device->blackGeneration);
		VGFunctionRelease(device->underColorRemoval);
		free(device);
	}
}


void VGGStateRenderingRelease(VGGStateRef state)
{
}

void VGGStateStrokeRelease(VGGStateRef state)
{
}

void VGGStateTextRelease(VGGStateRef state)
{
}


void VGGStateClipToPath(VGGStateRef state, VGPathRef path, VGPathDrawingMode mode)
{
#if 0
	VGFloat flatness;
	VGClipRef clip, clipStroke;
	bool shouldAntialias;

	if (mode == kVGPathStroke) {
		
		clipStroke = VGClipStrokeCreateWithGState(state, path);
		clip = VGClipCreateWithStrokedPath(path, clipStroke);
		VGClipStrokeRelease(clipStroke);
	}
	else {
		flatness = VGGStateGetFlatness(state);
		shouldAntialias = VGGStateGetShouldAntialias(state);
		clip = VGClipCreateWithPath(path, mode, shouldAntialias ,flatness);
	}

	if (clip) {  
		maybeCopyClipState(state);
		VGClipStackAddClip(state->clipping, clip);
		VGClipRelease(clip);
	}
#endif
}

VGClipRef VGClipStrokeCreateWithGState(VGGStateRef state, VGPathRef path)
{
#if 0
	VGGStateGetCTM(state);
	VGGStateGetLineWidth(state);
	VGGStateGetLineCap(state);
	VGGStateGetLineJoin(state);
	VGGStateGetMiterLimit(state);
	VGGStateGetStrokeAdjust(state);
	VGGStateGetShouldAntialias(state);
	VGGStateGetLineDash();
	VGGStateGetFlatness();

	VGClipStrokeCreate();
#endif
	return NULL;
}


void VGClipRelease(VGClipRef clip)
{

}

VGClipStackRef VGClipStackCreateMutable()
{
	VGClipStackRef clipStack;

	clipStack = (VGClipStackRef)calloc(1, sizeof(VGClipStack));
	if (!clipStack)
		return NULL;
	
	clipStack->refcount = 1;
	clipStack->id = 0;
	clipStack->field3C = 0;
	clipStack->count = 0;
	clipStack->clips = NULL;
	clipStack->rect = VGRectInfinite;
	clipStack->rect2 = VGRectInfinite;
	clipStack->rect3 = VGRectInfinite;

	return clipStack;

}

void VGClipStackRelease(VGClipStackRef clipStack)
{
	size_t i;

	if (!clipStack)
		return;

	clipStack->refcount--;
	if (clipStack->refcount == 0) {
		
		for (i = 0; i < clipStack->count; i++) {
			VGClipRelease(clipStack->clips[i]);
		}

		free(clipStack->clips);
		free(clipStack);
	}
}

VGClipStackRef VGClipStackRetain(VGClipStackRef clipStack)
{
	if (!clipStack) { return NULL; }
	clipStack->refcount++;
	return clipStack;
}