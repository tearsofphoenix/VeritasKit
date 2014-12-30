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

#include "VGBase.h"
#include "VGStylePriv.h"


static CFRuntimeClass VGStyleClass = 
  {
    0,							// version
    "VGStyle",					// className
    0,							// init
    0,							// copy
    styleFinalize,				// finalize
	0,							// equal
	0,							// hash
	0,							// copyFormattingDesc
	0							// copyDebugDesc
  };
CFTypeID __kVGStyleID = _kCFRuntimeNotATypeID;


CFTypeID VGStyleGetTypeID(void)
{
    if (_kCFRuntimeNotATypeID == __kVGStyleID)
    {
        __kVGStyleID = _CFRuntimeRegisterClass(&VGStyleClass);
    }
	return __kVGStyleID;
}

void styleFinalize(CFTypeRef c)
{

}

void VGStyleRelease(VGStyleRef style)
{
	if (!style) { return; }
	CFRelease((CFTypeRef)style);
}
