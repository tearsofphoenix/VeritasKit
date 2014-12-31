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

#ifndef VGBITMAPCONTEXT_H_
#define VGBITMAPCONTEXT_H_

#include <VeritasGraphics/VGBase.h>
#include <VeritasGraphics/VGContext.h>

VG_EXTERN VGContextRef 
VGBitmapContextCreate(void *data, size_t width,
					  size_t height, size_t bitsPerComponent, size_t bytesPerRow,
					  VGColorSpaceRef colorspace, VGBitmapInfo bitmapInfo);

VG_EXTERN 
size_t VGBitmapGetAlignedBytesPerRow(size_t len);

VG_EXTERN void *
VGBitmapContextGetData(VGContextRef c);

VG_EXTERN size_t 
VGBitmapContextGetWidth(VGContextRef c);

VG_EXTERN size_t 
VGBitmapContextGetHeight(VGContextRef c);

VG_EXTERN size_t 
VGBitmapContextGetBitsPerComponent(VGContextRef c);

VG_EXTERN size_t 
VGBitmapContextGetBitsPerPixel(VGContextRef c);

VG_EXTERN size_t 
VGBitmapContextGetBytesPerRow(VGContextRef c);

VG_EXTERN VGColorSpaceRef 
VGBitmapContextGetColorSpace(VGContextRef c);

VG_EXTERN VGImageAlphaInfo 
VGBitmapContextGetAlphaInfo(VGContextRef c);

VG_EXTERN VGBitmapInfo 
VGBitmapContextGetBitmapInfo(VGContextRef c);

VG_EXTERN VGImageRef 
VGBitmapContextCreateImage(VGContextRef c);



#endif	/* VGBITMAPCONTEXT_H_ */
