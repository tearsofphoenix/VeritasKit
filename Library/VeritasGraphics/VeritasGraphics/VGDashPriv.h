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
#ifndef VGDASHPRIV_H_
#define VGDASHPRIV_H_

#include <CoreFoundation/CFRuntime.h>
#include "VGBase.h"

typedef  struct VGDash {

	signed long refcount;				//0x00
	VGFloat phase;						//0x04
	size_t count;						//0x08
	VGFloat* lengths;					//0x0C

} VGDash, *VGDashRef;



VG_EXTERN VGDashRef VGDashCreate(VGFloat phase, const VGFloat lengths[], size_t count);
VG_EXTERN Boolean VGDashEqualToDash(VGDashRef dash1, VGDashRef dash2);
VG_EXTERN const VGFloat* VGDashGetPattern(VGDashRef dash, VGFloat* phase, size_t* count);
VG_EXTERN VGDashRef VGDashRetain(VGDashRef dash);
VG_EXTERN void VGDashRelease(VGDashRef dash);


#endif /* VGDASHPRIV_H_ */


