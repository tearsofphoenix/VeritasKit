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
#include "VGBitmapContext.h"
#include "VGBitmapContextPriv.h"
#include "VGDataProviderPriv.h"
#include "VGBasePriv.h"
#include "VGColorSpacePriv.h"
#include "VGContextPrivate.h"
#include <VeritasFoundation/VFInternal.h>

static pthread_once_t	bitmap_delegate_once = PTHREAD_ONCE_INIT;
static VGBitmapContextDelegateCreateCallback VGBitmapContextDelegateCreate = NULL;


void
loadBitmapContextDelegateCreator(void)
{
    VGBitmapContextDelegateCreateCallback bitmapContextDelegate;
    
    bitmapContextDelegate = NULL;
    //(VGBitmapContextDelegateCreateCallback)(void *)VGLibraryLoadFunction("VGRD2D", "__VGBitmapContextDelegateCreate");
    
    if (bitmapContextDelegate) {
        VGBitmapContextDelegateCreate = bitmapContextDelegate;
    }
    else {
        VGPostError("Failed to load bitmap context.");
    }
}

static VGContextDelegateRef
bitmap_context_delegate_create(VGBitmapContextInfoRef bitmapContextInfo,
                               CFDictionaryRef theDict)
{
    VGContextDelegateRef ctxDelegate;
    
    if (VGBitmapContextDelegateCreate == NULL)
        pthread_once(&bitmap_delegate_once, loadBitmapContextDelegateCreator);
    
    if (VGBitmapContextDelegateCreate)
        ctxDelegate = VGBitmapContextDelegateCreate(bitmapContextInfo, theDict);
    else
        ctxDelegate = NULL;
    
    return ctxDelegate;
}

VGBitmapContextInfoRef
VGBitmapContextInfoCreate(void *data, size_t width, size_t height,
                          size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow,
                          VGColorSpaceRef colorspace, VGBitmapInfo bitmapInfo,
                          void* alphaData, Boolean b, Boolean c, Boolean d,Boolean e,
                          VGFloat hRes, VGFloat vRes)
{
    VGBitmapContextInfoRef bitmapCtxInfo;
    VGColorSpaceType csType;
    bool isValid;
    size_t numberOfComponents;
    
    bitmapCtxInfo = (VGBitmapContextInfoRef)calloc(1, sizeof(*bitmapCtxInfo));
    if (!bitmapCtxInfo) {
        goto Error;
    }
    
    bitmapCtxInfo->refcount = 1;
    
    if ((bitmapInfo & kVGBitmapAlphaInfoMask) != kVGImageAlphaOnly) {
        bitmapCtxInfo->colorspace = VGColorSpaceRetain(colorspace);
    }
    else {
        bitmapCtxInfo->colorspace = NULL;
    }
    bitmapCtxInfo->bitmapInfo = bitmapInfo;
    bitmapCtxInfo->dataAllocated = FALSE;
    bitmapCtxInfo->data = NULL;
    bitmapCtxInfo->bytesPerRow = VGBitmapGetAlignedBytesPerRow((width * bitsPerPixel + 7) / 8);
    
    csType = VGColorSpaceGetType(bitmapCtxInfo->colorspace);
    switch(csType)
    {
        case kVGColorSpaceTypeDeviceUnknown:
            
            break;
            
            //case kVGColorSpaceTypeDisplayGray:
        case kVGColorSpaceTypeDeviceGray:
            isValid = validate_gray_bitmap_info(bitmapCtxInfo);
            break;
            
            //case kVGColorSpaceTypeDisplayRGB:
        case kVGColorSpaceTypeDeviceRGB:
            isValid = validate_rgb_bitmap_info(bitmapCtxInfo);
            break;
            
        case kVGColorSpaceTypeDeviceCMYK:
            isValid = validate_cmyk_bitmap_info(bitmapCtxInfo);
            break;
            
        case kVGColorSpaceTypePattern:
            numberOfComponents = VGColorSpaceGetNumberOfComponents(bitmapCtxInfo->colorspace);
            if (numberOfComponents == 3)
                isValid = validate_rgb_bitmap_info(bitmapCtxInfo);
            else if (numberOfComponents == 4)
                isValid = validate_cmyk_bitmap_info(bitmapCtxInfo);
            else if (numberOfComponents == 1)
                isValid = validate_gray_bitmap_info(bitmapCtxInfo);
            break;
        default:
            break;
    };
    
    bitmapCtxInfo->data = VGBitmapAllocateData(bitmapCtxInfo->bytesPerRow * height);
    if (bitmapCtxInfo->data == NULL) {
        VGPostError("%s: unable to allocate %zu bytes for bitmap data",
                    "VGBitmapContextInfoCreate", bitmapCtxInfo->bytesPerRow * height);
        VGBitmapContextInfoRelease(bitmapCtxInfo);
        bitmapCtxInfo = NULL;
    }
    bitmapCtxInfo->dataAllocated = TRUE;
    
Error:
    return bitmapCtxInfo;
}


bool
validate_rgb_bitmap_info(VGBitmapContextInfoRef bitmapContextInfo)
{
    return TRUE;
}

bool
validate_gray_bitmap_info(VGBitmapContextInfoRef bitmapContextInfo)
{
    return TRUE;
}

bool
validate_cmyk_bitmap_info(VGBitmapContextInfoRef bitmapContextInfo)
{
    return TRUE;
}

void
bitmap_context_finalize(VGContextRef context)
{
    if (!context || context->contextType != kVGContextTypeBitmap)
        return;
    
    VGBitmapContextInfoRelease(context->bitmapContextInfo);
}

void
VGBitmapContextInfoRelease(VGBitmapContextInfoRef bitmapInfo)
{
    if (!bitmapInfo || !bitmapInfo->refcount )
        return;
    
    _CFAtomicDecrement32(&bitmapInfo->refcount);
    
    if (bitmapInfo->refcount == 0)
    {
        VGColorSpaceRelease(bitmapInfo->colorspace);
        
        if (bitmapInfo->dataAllocated == TRUE)
            VGBitmapFreeData(bitmapInfo->data);
        
        if (bitmapInfo->alphaAllocated == TRUE)
            VGBitmapFreeData(bitmapInfo->alphaData);
        
        free(bitmapInfo);
    }
    
    return;
}

void
VGBitmapFreeData(void *data)
{
    if (!data)  { return; }
    
#if defined(DEPLOYMENT_TARGET_WINDOWS)
    
    VirtualFree(data, 0, MEM_RELEASE);
    
#else
    
#endif
}


void *
VGBitmapAllocateData(size_t len)
{
    void* data;
    
#if defined(DEPLOYMENT_TARGET_WINDOWS)
    
    data = VirtualAlloc(NULL, len, MEM_RESERVE, PAGE_READWRITE);
    
#else
    
    //#define VM_MAKE_TAG(tag) ((tag) << 24)
    //0x34000000 = VM_MAKE_TAG(VM_MEMORY_VGIMAGE)
    //void *  mmap(void *addr, size_t len, int prot, int flags, int fildes, off_t offset);
    //data = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE, 0, 0);
    
#endif
    
    return data;
}

VGContextRef
VGBitmapContextCreate(void *data, size_t width,
                      size_t height, size_t bitsPerComponent,
                      size_t bytesPerRow,
                      VGColorSpaceRef colorspace,
                      VGBitmapInfo bitmapInfo)
{
    return VGBitmapContextCreateWithData(
                                         data,
                                         width,
                                         height,
                                         bitsPerComponent,
                                         bytesPerRow,
                                         colorspace,
                                         bitmapInfo,
                                         0,
                                         0);
}


VGContextRef
VGBitmapContextCreateWithData(void *data, size_t width,
                              size_t height, size_t bitsPerComponent,
                              size_t bytesPerRow,
                              VGColorSpaceRef colorspace,
                              VGBitmapInfo bitmapInfo,
                              VGFloat hRes, VGFloat vRes)
{
    VGContextRef context;
    VGBitmapContextInfoRef bitmapCtxInfo;
    size_t numberOfComponents;
    size_t bitsPerPixel;
    
    numberOfComponents = VGColorSpaceGetNumberOfComponents(colorspace);
    if (((bitmapInfo & kVGBitmapAlphaInfoMask) != kVGImageAlphaNone) &&
        ((bitmapInfo & kVGBitmapAlphaInfoMask) != kVGImageAlphaOnly) )
    {
        numberOfComponents += 1;
    }
    
    if ( bitsPerComponent == 5 )
    {
        bitsPerPixel= 16;
    }
    else
    {
        bitsPerPixel = (numberOfComponents == 0) ? bitsPerComponent : numberOfComponents * bitsPerComponent;
    }
    
    bitmapCtxInfo = VGBitmapContextInfoCreate( data, width, height, bitsPerComponent,
                                              bitsPerPixel, bytesPerRow, colorspace, bitmapInfo, 0,0,0,0,0, hRes, vRes);
    
    if (bitmapCtxInfo)
    {
        context = bitmap_context_create(bitmapCtxInfo, NULL, "VGBitmapContextCreateWithData");
    }
    else
    {
        context = 0;
    }
    
    
    return context;
}


VGContextRef
VGBitmapContextCreateWithDictionary(void *data, size_t width,
                                    size_t height, size_t bitsPerComponent,
                                    size_t bitsPerPixel, size_t bytesPerRow,
                                    VGColorSpaceRef colorspace,
                                    VGBitmapInfo bitmapInfo,
                                    VGFloat hRes, VGFloat vRes,
                                    CFDictionaryRef theDict)
{
    
    VGContextRef context;
    VGBitmapContextInfoRef bitmapCtxInfo;
    
    bitmapCtxInfo = VGBitmapContextInfoCreate( data, width, height, bitsPerComponent,
                                              bitsPerPixel, bytesPerRow, colorspace, bitmapInfo, 0,0,0,0,0, hRes, vRes);
    if (bitmapCtxInfo)
    {
        context = bitmap_context_create(bitmapCtxInfo, theDict, "VGBitmapContextCreateWithDictionary");
    }
    else
    {
        context = 0;
    }
    
    return context;
}


VGContextRef
bitmap_context_create(VGBitmapContextInfoRef bitmapContextInfo, CFDictionaryRef theDict, const char* name)
{
    VGContextRef context;
    void* filterInfo;
    
    context = VGContextCreate();
    if (!context) {
        VGPostError("%s: failed to create bitmap context.", name);
        VGBitmapContextInfoRelease(bitmapContextInfo);
        goto Error;
    }
    
    context->contextType = kVGContextTypeBitmap;
    context->bitmapContextInfo = bitmapContextInfo;
    context->finalize = bitmap_context_finalize;
    
    VGRenderingStateSetRenderingResolution(
                                           context->rendering,
                                           context->bitmapContextInfo->horzRes,
                                           context->bitmapContextInfo->vertRes);
    
    
    context->ctxDelegate = bitmap_context_delegate_create(bitmapContextInfo, theDict);
    if (!context->ctxDelegate) {
        VGPostError("%s: failed to create delegate.", "createBitmapContext");
        VGContextRelease(context);
        context = NULL;
        goto Error;
    }
    
    if (theDict != NULL) {
        
        filterInfo = (void*)CFDictionaryGetValue(theDict, kVGContextFilterInfo);
        if (filterInfo){
            context = VGContextAddFilter(context, filterInfo, 0);
        }
    }
    
Error:
    return context;
}

size_t VGBitmapGetFastestAlignment()
{
    return 128;
}

size_t VGBitmapGetAlignedRowBytes(size_t bytesPerRow)
{
    return VGBitmapGetAlignedBytesPerRow(bytesPerRow);
}

size_t VGBitmapGetAlignedBytesPerRow(size_t bytesPerRow)
{
    return ((bytesPerRow+31)&~0x1f);
}

void *VGBitmapContextGetData(VGContextRef c)
{
    void* data;
    
    if (!c || c->contextType != kVGContextTypeBitmap) {
        VGPostError("%s: invalid context", "VGBitmapContextGetData");
        return NULL;
    }
    
    if (c->bitmapContextInfo->dataAllocated == FALSE)
        data = c->bitmapContextInfo->data;
    else
        data = NULL;
    
    return data;
}

size_t VGBitmapContextGetWidth(VGContextRef c)
{
    if (!c || c->contextType != kVGContextTypeBitmap) { return 0; }
    return c->bitmapContextInfo->width;
}


size_t VGBitmapContextGetHeight(VGContextRef c)
{
    if (!c || c->contextType != kVGContextTypeBitmap) { return 0; }
    return c->bitmapContextInfo->height;
}


size_t VGBitmapContextGetBitsPerComponent(VGContextRef c)
{
    if (!c || c->contextType != kVGContextTypeBitmap) { return 0; }
    return c->bitmapContextInfo->bitsPerComponent;
}


size_t VGBitmapContextGetBitsPerPixel(VGContextRef c)
{
    if (!c || c->contextType != kVGContextTypeBitmap) { return 0; }
    return c->bitmapContextInfo->bitsPerPixel;
}


size_t VGBitmapContextGetBytesPerRow(VGContextRef c)
{
    if (!c || c->contextType != kVGContextTypeBitmap) { return 0; }
    return c->bitmapContextInfo->bytesPerRow;
}

VGColorSpaceRef VGBitmapContextGetColorSpace(VGContextRef c)
{
    if (!c || c->contextType != kVGContextTypeBitmap) { return 0; }
    return c->bitmapContextInfo->colorspace;
}


void* VGBitmapContextGetAlphaData(VGContextRef c)
{
    void* alphaData;
    
    if (!c || c->contextType != kVGContextTypeBitmap) { 
        VGPostError("%s: invalid context", "VGBitmapContextGetAlphaData");	
        return NULL; 
    }
    
    if (c->bitmapContextInfo->alphaAllocated == FALSE)
        alphaData = c->bitmapContextInfo->alphaData;
    else
        alphaData = NULL;
    
    return alphaData;
}


VGImageAlphaInfo VGBitmapContextGetAlphaInfo(VGContextRef c)
{
    VGImageAlphaInfo alphaInfo;
    
    if (!c || c->contextType != kVGContextTypeBitmap) { 
        return kVGImageAlphaNone; 
    }
    
    alphaInfo = (VGImageAlphaInfo)(c->bitmapContextInfo->bitmapInfo & kVGBitmapAlphaInfoMask);
    return alphaInfo;
}

VGBitmapInfo VGBitmapContextGetBitmapInfo(VGContextRef c)
{
    if (!c) { return 0; }
    return c->bitmapContextInfo->bitmapInfo;
}


VGImageRef VGBitmapContextCreateImage(VGContextRef c)
{
    size_t dataLen;
    
    if (!c || c->contextType != kVGContextTypeBitmap) { 
        VGPostError("");
        return NULL; 
    }
    
    dataLen = c->bitmapContextInfo->height * c->bitmapContextInfo->bytesPerRow;
    VGDataProviderCreateWithCopyOfData(c->bitmapContextInfo->data, dataLen);
    
    
    return 0;
}


