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
#ifndef VGCOLORTRANSFORMPRIV_H_
#define VGCOLORTRANSFORMPRIV_H_

#include <VeritasFoundation/CFRuntime.h>
#include "VGColorSpace.h"
#include "VGPattern.h"
#include "VGColorTransform.h"

CF_EXTERN_C_BEGIN

typedef struct VGColorTransform {
	CFRuntimeBase obj;
	
	int identifier;					//0x08	

} VGColorTransform, *VGColorTransformRef;

VG_EXTERN void colortransformFinalize(CFTypeRef ctf);

VG_EXTERN VGColorTransformRef VGColorTransformRetain(VGColorTransformRef colorTransform);

VG_EXTERN void VGColorTransformRelease(VGColorTransformRef colorTransform);

VG_EXTERN CFTypeID VGColorTransformGetTypeID(void);

VG_EXTERN int VGColorTransformGetIdentifier(VGColorTransformRef colorTransform);

CF_EXTERN_C_END

#endif /* VGCOLORTRANSFORMPRIV_H_ */


