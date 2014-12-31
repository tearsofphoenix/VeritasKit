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
#ifndef VGSOFTMASKPRIV_H_
#define VGSOFTMASKPRIV_H_

#include <VeritasFoundation/CFRuntime.h>
#include "VGImage.h"


CF_EXTERN_C_BEGIN

typedef  struct VGSoftMask {

	CFRuntimeBase obj;				//0x00

	VGImageRef mask;				//0x44
	
} VGSoftMask, *VGSoftMaskRef;


VG_EXTERN void softMaskFinalize(CFTypeRef ctf);
VG_EXTERN VGSoftMaskRef VGSoftMaskRetain(VGSoftMaskRef softMask);
VG_EXTERN void VGSoftMaskRelease(VGSoftMaskRef softMask);
VG_EXTERN CFTypeID VGSoftMaskGetTypeID(void);



CF_EXTERN_C_END

#endif /* VGSOFTMASKPRIV_H_ */


