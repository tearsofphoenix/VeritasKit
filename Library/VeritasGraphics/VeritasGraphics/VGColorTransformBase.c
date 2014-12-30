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
#include "VGColor.h"

#include "VGBase.h"
#include "VGColorTransformBasePriv.h"


/* CoreFoundation runtime class for VGPath.  */
static CFRuntimeClass VGColorTransformBaseClass =  {
    0,							/* version */
    "VGColorTransformBaseClass",	/* Name of class.  */
    0,							/* init */
    0,							/* copy  */
    colortransformBaseFinalize,	/* finalize  */
	0,							/* equal  */
	0,							/* hash  */
	0,							/* copyFormattingDesc */
	0							/* copyDebugDesc */
  };
static CFTypeID __kVGColorTransformBaseID = _kCFRuntimeNotATypeID;

CFTypeID VGColorTransformBaseGetTypeID(void)
{
    if (_kCFRuntimeNotATypeID == __kVGColorTransformBaseID)
    {
        __kVGColorTransformBaseID = _CFRuntimeRegisterClass(&VGColorTransformBaseClass);
    }
	return __kVGColorTransformBaseID;
}

void colortransformBaseFinalize(CFTypeRef ctf)
{

}

VGColorTransformBaseRef VGColorTransformBaseRetain(VGColorTransformBaseRef colorTransform)
{
	if (!colorTransform) { return 0; }
	CFRetain((CFTypeRef) colorTransform);

	return colorTransform;
}

void VGColorTransformBaseRelease(VGColorTransformBaseRef colorTransform)
{
	if (!colorTransform) { return; }
	CFRelease((CFTypeRef) colorTransform);
}