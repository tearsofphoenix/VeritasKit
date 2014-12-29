//
//  VALayer.cpp
//  VeritasGraphics
//
//  Created by Lei on 12/28/14.
//  Copyright (c) 2014 Lei. All rights reserved.
//

#include "VALayer.h"
#include "VALayerImpl.h"

// ---- implementation ----

#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFString.h>
#include <VeritasFoundation/CFRuntime.h>

struct __VALayer {
    CFRuntimeBase _base;
    struct _VALayerIvars {
        int32_t refcount;
        uint32_t magic;
        VALayerImplRef layer;
    } _attr;
};

static Boolean __VALayerEqual(CFTypeRef cf1, CFTypeRef cf2) {
    return cf1 == cf2;
}

static CFHashCode __VALayerHash(CFTypeRef cf) {
    return 0;
}

static CFStringRef __VALayerCopyFormattingDesc(CFTypeRef cf, CFDictionaryRef formatOpts) {

    return CFStringCreateWithFormat(CFGetAllocator(cf), formatOpts,
                                    CFSTR("%p"),cf);
}

static CFStringRef __VALayerCopyDebugDesc(CFTypeRef cf) {
    VALayerRef rangeref = (VALayerRef)cf;
    return CFStringCreateWithFormat(CFGetAllocator(rangeref), NULL,
                                    CFSTR("<VALayer %p [%p]>"),
                                    rangeref,
                                    CFGetAllocator(rangeref));
}

static void __VALayerVALayerFinalize(CFTypeRef cf) {

}

static CFTypeID _kVALayerID = _kCFRuntimeNotATypeID;

static CFRuntimeClass _kVALayerClass = {0};

/* Something external to this file is assumed to call this
 * before the VALayer class is used.
 */
void __VALayerClassInitialize(void) {
    _kVALayerClass.version = 0;
    _kVALayerClass.className = "VALayer";
    _kVALayerClass.init = NULL;
    _kVALayerClass.copy = NULL;
    _kVALayerClass.finalize = __VALayerVALayerFinalize;
    _kVALayerClass.equal = __VALayerEqual;
    _kVALayerClass.hash = __VALayerHash;
    _kVALayerClass.copyFormattingDesc = __VALayerCopyFormattingDesc;
    _kVALayerClass.copyDebugDesc = __VALayerCopyDebugDesc;
    _kVALayerID = _CFRuntimeRegisterClass((const CFRuntimeClass * const)&_kVALayerClass);
}

CFTypeID VALayerGetTypeID(void) {
    return _kVALayerID;
}

VALayerRef VALayerCreate(CFAllocatorRef allocator)
{
    struct __VALayer *newlayer;
    uint32_t extra = sizeof(struct __VALayer) - sizeof(CFRuntimeBase);
    newlayer = (struct __VALayer *)_CFRuntimeCreateInstance(allocator, _kVALayerID, extra, NULL);
    if (NULL == newlayer) {
        return NULL;
    }
    
    newlayer->_attr.layer = (VALayerImplRef)CFAllocatorAllocate(CFAllocatorGetDefault(), sizeof(struct VALayerImpl), 0);
    
    
    return (VALayerRef)newlayer;
}

#pragma mark - geometry

VGRect VALayerGetBounds(VALayerRef layer) {
    VALayerImplRef impl = layer->_attr.layer;
    return impl->bounds;
}

void VALayerSetBounds(VALayerRef layer, VGRect bounds)
{
    VALayerImplRef impl = layer->_attr.layer;

    if (!VGRectEqualToRect(impl->bounds, bounds))
    {
        impl->bounds = bounds;
    }
}

VGFloat VALayerGetPosition(VALayerRef layer)
{
    VALayerImplRef impl = layer->_attr.layer;
    return impl->position;
}
void VALayerSetPosition(VALayerRef layer, VGFloat position)
{
    VALayerImplRef impl = layer->_attr.layer;
    if (impl->position != position)
    {
        impl->position = position;
    }
}

VGFloat VALayerGetzPosition(VALayerRef layer);
void VALayerSetzPosition(VALayerRef layer, VGFloat zPosition);

VGPoint VALayerGetAnchorPoint(VALayerRef layer);
void VALayerSetAnchorPoint(VALayerRef layer, VGPoint anchorPoint);


