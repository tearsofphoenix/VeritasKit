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
#include "VGContext.h"
#include "VGSoftMaskPriv.h"
#include "VGBase.h"
#include <VeritasFoundation/CFRuntime.h>

static CFRuntimeClass VGSoftMaskClass = 
  {
    0,							// version
    "VGSoftMask",				// className
    0,							// init
    0,							// copy
    softMaskFinalize,			// finalize
	0,							// equal
	0,							// hash
	0,							// copyFormattingDesc
	0							// copyDebugDesc
  };
CFTypeID __kVGSoftMaskID = _kCFRuntimeNotATypeID;


CFTypeID VGSoftMaskGetTypeID(void)
{
    if (__kVGSoftMaskID == _kCFRuntimeNotATypeID)
    {
        __kVGSoftMaskID = _CFRuntimeRegisterClass(&VGSoftMaskClass);
    }
    return __kVGSoftMaskID;
}

void softMaskFinalize(CFTypeRef c)
{
	VGImageRelease(((VGSoftMaskRef)c)->mask);
}

void VGSoftMaskRelease(VGSoftMaskRef softMask)
{
	if (!softMask) { return; }
	CFRelease((CFTypeRef)softMask);
}