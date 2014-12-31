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
#ifndef VGBITMAPCONTEXTPRIV_H_
#define VGBITMAPCONTEXTPRIV_H_

#include "VGBase.h"
#include "VGContextPrivate.h"
#include "VGContextDelegatePriv.h"

typedef VGContextDelegateRef  (*VGBitmapContextDelegateCreateCallback)(
	VGBitmapContextInfoRef bitmapContextInfo, 
	CFDictionaryRef theDict);

VG_EXTERN void loadBitmapContextDelegateCreator(void);


VG_EXTERN VGBitmapContextInfoRef VGBitmapContextInfoCreate(void *data, 
														   size_t width, size_t height,
														   size_t bitsPerComponent,
														   size_t bitsPerPixel,
														   size_t bytesPerRow,
														   VGColorSpaceRef colorspace, 
														   VGBitmapInfo bitmapInfo, 
														   void* alphaData,
														   Boolean b,
														   Boolean c,
														   Boolean d,
														   Boolean e,
														   VGFloat hRes,
														   VGFloat vRes);

VG_EXTERN void VGBitmapContextInfoRelease(VGBitmapContextInfoRef bitmapInfo);

VGContextRef
VGBitmapContextCreateWithData(void *data, size_t width,
							  size_t height, size_t bitsPerComponent,
							  size_t bytesPerRow,
							  VGColorSpaceRef colorspace, 
							  VGBitmapInfo bitmapInfo, 
							  VGFloat hRes, VGFloat vRes);

VG_EXTERN VGContextRef VGBitmapContextCreateWithDictionary(void *data, 
												 size_t width, size_t height,
												 size_t bitsPerComponent,
												 size_t bitsPerPixel,
												 size_t bytesPerRow,
												 VGColorSpaceRef colorspace, 
												 VGBitmapInfo bitmapInfo,
												 VGFloat hRes, 
												 VGFloat vRes, 
												 CFDictionaryRef theDict);



VG_EXTERN void * VGBitmapAllocateData(size_t len);

VG_EXTERN void VGBitmapFreeData(void *data);


VG_EXTERN VGContextRef bitmap_context_create(VGBitmapContextInfoRef bitmapContextInfo, 
										     CFDictionaryRef theDict, const char* name);

void bitmap_context_finalize(VGContextRef context);



bool validate_gray_bitmap_info(VGBitmapContextInfoRef bitmapContextInfo);

bool validate_rgb_bitmap_info(VGBitmapContextInfoRef bitmapContextInfo);

bool validate_gray_bitmap_info(VGBitmapContextInfoRef bitmapContextInfo);

bool validate_cmyk_bitmap_info(VGBitmapContextInfoRef bitmapContextInfo);

#endif /* VGBITMAPCONTEXTPRIV_H_ */


