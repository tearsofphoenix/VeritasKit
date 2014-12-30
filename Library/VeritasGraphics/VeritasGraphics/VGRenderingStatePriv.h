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
#ifndef VGRENDERINGSTATE_H_
#define VGRENDERINGSTATE_H_

#include "VGAffineTransform.h"
#include <VeritasFoundation/CFRuntime.h>


CF_EXTERN_C_BEGIN

////////////////////////////////////////////
//VGGStateRendering - sizeof = 0x34
typedef struct VGRenderingState {
	signed long refcount;		//0x00

	VGFloat hRes;				//0x04
	VGFloat vRes;				//0x04
	VGAffineTransform baseCTM;	//0x0C
	int	 minInterpolQuality;	//0x24
	int	 maxInterpolQuality;	//0x28 
	Boolean allowAcceleration;	//0x2C
	Boolean allowAntialias;		//0x2D
	Boolean allowDithering;		//0x2E
	Boolean allowFontAntialias;	//0x2F
	Boolean allowFontSmoothing;	//0x30
	Boolean allowFontSubPos;	//0x31
	Boolean allowFontSubQuant;	//0x32

} VGRenderingState, *VGRenderingStateRef;


VG_EXTERN VGRenderingStateRef		VGRenderingStateCreate();
VG_EXTERN VGRenderingStateRef		VGRenderingStateCreateCopy(VGRenderingStateRef rendering);
VG_EXTERN void						VGRenderingStateReset(VGRenderingStateRef rendering);
VG_EXTERN void						VGRenderingStateRelease(VGRenderingStateRef rendering);
VG_EXTERN void						VGRenderingStateSetRenderingResolution(VGRenderingStateRef rendering, VGFloat hRes, VGFloat vRes);

CF_EXTERN_C_END

#endif /* VGRENDERINGSTATE_H_ */


