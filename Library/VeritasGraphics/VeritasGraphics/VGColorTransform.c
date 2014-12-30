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
#include "VGColorTransformPriv.h"
#include "VGColorSpacePriv.h"
#include <pthread.h>
#include <VeritasFoundation/CFRuntime.h>

static pthread_mutex_t cacheMutex	= PTHREAD_MUTEX_INITIALIZER;
static CFArrayRef baseCache	= NULL;


/* CoreFoundation runtime class for VGPath.  */
static CFRuntimeClass VGColorTransformClass =  {
    0,							/* version */
    "VGColorTransformClass",	/* Name of class.  */
    0,							/* init */
    0,							/* copy  */
    colortransformFinalize,		/* finalize  */
	0,							/* equal  */
	0,							/* hash  */
	0,							/* copyFormattingDesc */
	0							/* copyDebugDesc */
  };
static CFTypeID __kVGColorTransformID = _kCFRuntimeNotATypeID;

CFTypeID VGColorTransformGetTypeID(void)
{
    if (_kCFRuntimeNotATypeID == __kVGColorTransformID)
    {
        __kVGColorTransformID = _CFRuntimeRegisterClass(&VGColorTransformClass);
    }
	return __kVGColorTransformID;
}

void colortransformFinalize(CFTypeRef ctf)
{

}

VGColorTransformRef VGColorTransformRetain(VGColorTransformRef colorTransform)
{
	if (!colorTransform) { return 0; }
	CFRetain((CFTypeRef) colorTransform);

	return colorTransform;
}

void VGColorTransformRelease(VGColorTransformRef colorTransform)
{
	if (!colorTransform) { return; }
	CFRelease((CFTypeRef) colorTransform);
}

int VGColorTransformGetIdentifier(VGColorTransformRef colorTransform)
{
	if (!colorTransform) { return 0; }
	return colorTransform->identifier;
}


VGColorTransformRef VGColorTransformCreate(VGColorSpaceRef space, CFDictionaryRef theDict)
{
    return NULL;
#if 0
	VGColorTransformRef colorTransform;
	VGColorTransformRef colTransformTmp;
	size_t numComponents;
	VGColorSpaceType spaceType;
	CFIndex extraBytes;
	VGColorSpaceRef space2;
	unsigned char* md5;

	if (!space || !VGColorSpaceSupportsOutput(space))
		return NULL;

	numComponents = VGColorSpaceGetNumberOfComponents(space);
	extraBytes = (numComponents <= 4) ? 328 : 16; // 0x148 : 0x10
	
	colorTransform = (VGColorTransformRef)_CFRuntimeCreateInstance(NULL, VGColorTransformGetTypeID(), extraBytes, NULL);
	if (!colorTransform)
		return NULL;

	spaceType = VGColorSpaceGetType(space);
	switch(spaceType)
	{
	case kVGColorSpaceTypeDeviceGray:
		space2 = VGColorSpaceCreateDisplayGray();
		break;
	case kVGColorSpaceTypeDeviceRGB:
		space2 = VGColorSpaceCreateDisplayRGB();
		break;
	case kVGColorSpaceTypeDeviceCMYK:
		space2 = VGColorSpaceCreateSystemDefaultCMYK();
		break;
	}

	if (space2)
	{
		pthread_mutex_lock(&cacheMutex);
		if (baseCache)
		{
			md5 = VGColorSpaceGetMD5Digest(space2);
			for (int i=0; i < CFArrayGetCount(baseCache); i++)
			{
				/*colTransformTmp = (VGColorTransformRef) CFArrayGetValueAtIndex(baseCache, i);
				 if (!memcmp((unsigned char *)CFArrayGetValueAtIndex(baseCache, i), md5, 16))
				 {

				 }*/
			}
		}
	}
	else
	{
		CFRelease(colorTransform);
		colorTransform = NULL;
	}

	return colorTransform;
#endif
}