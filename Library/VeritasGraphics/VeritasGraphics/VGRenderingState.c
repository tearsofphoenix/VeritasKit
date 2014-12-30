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
#include "VGBase.h"
#include "VGRenderingStatePriv.h"
#include <stdlib.h>


VGRenderingStateRef VGRenderingStateCreate()
{
	VGRenderingStateRef rendering;

	rendering = (VGRenderingStateRef)calloc(1, sizeof(VGRenderingState));
	if (!rendering)
		return NULL;

	rendering->refcount = 1;
	
	VGRenderingStateReset(rendering);

	return rendering;
}

VGRenderingStateRef	VGRenderingStateCreateCopy(VGRenderingStateRef rendering)
{
	return NULL;
}

void VGRenderingStateRelease(VGRenderingStateRef rendering)
{
	if (!rendering) { return; }
	rendering->refcount--;

	if (rendering->refcount == 0) { 
		free(rendering);
	}
}

void VGRenderingStateReset(VGRenderingStateRef rendering)
{
	rendering->baseCTM = VGAffineTransformIdentity;
	rendering->minInterpolQuality = 0;
	rendering->maxInterpolQuality = 0;	
	rendering->allowAcceleration = true;		
	rendering->allowAntialias = true;		
	rendering->allowDithering = true;		
	rendering->allowFontAntialias = true;	
	rendering->allowFontSmoothing = true;	
	rendering->allowFontSubPos = true;		
	rendering->allowFontSubQuant = true;		
}

void 
VGRenderingStateSetRenderingResolution(VGRenderingStateRef rendering, VGFloat hRes, VGFloat vRes)
{
	rendering->hRes = hRes;
	rendering->vRes = vRes;
}

