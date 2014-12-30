//
//  VALayer.cpp
//  VeritasGraphics
//
//  Created by Lei on 12/28/14.
//  Copyright (c) 2014 Lei. All rights reserved.
//

#include "VALayer.h"
#include "VALayerImpl.h"


#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFString.h>
#include <VeritasFoundation/CFRuntime.h>

typedef struct __VALayer * VAMutableLayerRef;

struct __VALayer {
    CFRuntimeBase _base;
    struct _VALayerIvars {
        int32_t refcount;
        unsigned int needDisplay: 1;
        unsigned int reserved: 31;
        VALayerImplRef layer;
        VALayerRef superlayer;
        CFMutableArrayRef sublayers;
        CFTypeRef delegate;
        VALayerLayoutManager layoutManager;
        VALayerDelegate layerDelegate;
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
    uint32_t extra = sizeof(*newlayer) - sizeof(CFRuntimeBase);
    newlayer = (struct __VALayer *)_CFRuntimeCreateInstance(allocator, _kVALayerID, extra, NULL);
    if (NULL == newlayer) {
        return NULL;
    }
    
    VALayerImplRef impl = (VALayerImplRef)CFAllocatorAllocate(allocator, sizeof(*impl), 0);
    VALayerImplInit(impl);
    
    newlayer->_attr.layer = impl;
    newlayer->_attr.sublayers = CFArrayCreateMutable(allocator, 8, &kCFTypeArrayCallBacks);
    newlayer->_attr.superlayer = NULL;
    
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

VATransform3D VALayerGetTransform(VALayerRef layer)
{
    VALayerImplRef impl = layer->_attr.layer;
    return impl->transform;
}

void VALayerSetTransform(VALayerRef layer, VATransform3D t)
{
    VALayerImplRef impl = layer->_attr.layer;
    if (!VATransform3DEqualToTransform(impl->transform, t))
    {
        impl->transform = t;
    }
}

VGAffineTransform VALayerGetAffineTransform(VALayerRef layer)
{
    VALayerImplRef impl = layer->_attr.layer;
    return impl->affineTransform;
}
void VALayerSetAffineTransform(VALayerRef layer, VGAffineTransform t)
{
    VALayerImplRef impl = layer->_attr.layer;
    if (!VGAffineTransformEqualToTransform(impl->affineTransform, t))
    {
        impl->affineTransform = t;
    }
}

VGRect VALayerGetFrame(VALayerRef layer)
{
    VALayerImplRef impl = layer->_attr.layer;
    return impl->frame;
}
void VALayerSetFrame(VALayerRef layer, VGRect frame)
{
    VALayerImplRef impl = layer->_attr.layer;
    if (!VGRectEqualToRect(impl->frame, frame))
    {
        impl->frame = frame;
    }
}

Boolean VALayerIsHidden(VALayerRef layer)
{
    VALayerImplRef impl = layer->_attr.layer;
    return impl->hidden;
}
void VALayerSetHidden(VALayerRef layer, Boolean hidden)
{
    VALayerImplRef impl = layer->_attr.layer;
    if (impl->hidden != hidden)
    {
        impl->hidden = hidden;
    }
}

/* The receiver's superlayer object. Implicitly changed to match the
 * hierarchy described by the `sublayers' properties. */

VALayerRef VALayerGetSuperlayer(VALayerRef layer)
{
    return layer->_attr.superlayer;
}
void VALayerSetSuperlayer(VALayerRef layer, VALayerRef superlayer)
{
    VALayerAddSublayer(superlayer, layer);
}

/* Removes the layer from its superlayer, works both if the receiver is
 * in its superlayer's `sublayers' array or set as its `mask' value. */
static CFIndex _VALayerRemoveFromSuperlayer(VALayerRef layer)
{
    CFMutableArrayRef sublayers = layer->_attr.superlayer->_attr.sublayers;
    CFIndex idx = CFArrayGetFirstIndexOfValue(sublayers, CFRangeMake(0, CFArrayGetCount(sublayers)), layer);
    CFArrayRemoveValueAtIndex(sublayers, idx);
    ((VAMutableLayerRef)layer)->_attr.superlayer = NULL;
    return idx;
}

void VALayerRemoveFromSuperlayer(VALayerRef layer)
{
    _VALayerRemoveFromSuperlayer(layer);
}

/* The array of sublayers of this layer. The layers are listed in back
 * to front order. Defaults to nil. When setting the value of the
 * property, any newly added layers must have nil superlayers, otherwise
 * the behavior is undefined. Note that the returned array is not
 * guaranteed to retain its elements. */
CFArrayRef VALayerGetSublayers(VALayerRef layer)
{
    return layer->_attr.sublayers;
}
void VALayerSetSublayers(VALayerRef layer, CFArrayRef sublayers)
{
    CFMutableArrayRef s = layer->_attr.sublayers;
    for (CFIndex i = 0; i < CFArrayGetCount(s); ++i)
    {
        VALayerRef l = CFArrayGetValueAtIndex(s, i);
        VALayerRemoveFromSuperlayer(l);
    }
    
    s = CFArrayCreateMutableCopy(CFGetAllocator(sublayers), CFArrayGetCount(sublayers), sublayers);
    
    ((VAMutableLayerRef)layer)->_attr.sublayers = s;

    for (CFIndex i = 0; i < CFArrayGetCount(s); ++i)
    {
        VALayerRef l = CFArrayGetValueAtIndex(s, i);
        VALayerSetSuperlayer(l, layer);
    }
}

/* Add 'layer' to the end of the receiver's sublayers array. If 'layer'
 * already has a superlayer, it will be removed before being added. */

void VALayerAddSublayer(VALayerRef self, VALayerRef layer)
{
    VALayerRef superlayer = VALayerGetSuperlayer(layer);
    if (superlayer != self)
    {
        if (superlayer)
        {
            VALayerRemoveFromSuperlayer(layer);
        }
        
        CFMutableArrayRef sublayers = self->_attr.sublayers;
        CFArrayInsertValueAtIndex(sublayers, CFArrayGetCount(sublayers), layer);
        VALayerSetSuperlayer(layer, self);
    }
}

/* Insert 'layer' at position 'idx' in the receiver's sublayers array.
 * If 'layer' already has a superlayer, it will be removed before being
 * inserted. */

void VALayerInsertSublayerAtIndex(VALayerRef self, VALayerRef layer, unsigned idx)
{
    VALayerRef superlayer = VALayerGetSuperlayer(layer);
    if (superlayer != self)
    {
        if (superlayer)
        {
            VALayerRemoveFromSuperlayer(layer);
        }
        
        CFMutableArrayRef sublayers = self->_attr.sublayers;
        CFArrayInsertValueAtIndex(sublayers, idx, layer);
        VALayerSetSuperlayer(layer, self);
    }
}

/* Insert 'layer' either above or below the specified layer in the
 * receiver's sublayers array. If 'layer' already has a superlayer, it
 * will be removed before being inserted. */
void VALayerInsertSublayerBelow(VALayerRef self, VALayerRef layer, VALayerRef sibling)
{
    CFMutableArrayRef sublayers = self->_attr.sublayers;
    CFIndex count = CFArrayGetCount(sublayers);
    unsigned idx = (unsigned)CFArrayGetFirstIndexOfValue(sublayers, CFRangeMake(0, count), sibling);
    
    VALayerInsertSublayerAtIndex(self, layer, idx);
}

void VALayerInsertSublayerAbove(VALayerRef self, VALayerRef layer, VALayerRef sibling)
{
    CFMutableArrayRef sublayers = self->_attr.sublayers;
    CFIndex count = CFArrayGetCount(sublayers);
    unsigned idx = (unsigned)CFArrayGetFirstIndexOfValue(sublayers, CFRangeMake(0, count), sibling);

    VALayerInsertSublayerAtIndex(self, layer, idx + 1);
}

/* Remove 'layer' from the sublayers array of the receiver and insert
 * 'layer2' if non-nil in its position. If the superlayer of 'layer'
 * is not the receiver, the behavior is undefined. */
void VALayerReplaceSublayer(VALayerRef self, VALayerRef layer, VALayerRef layer2)
{
    CFIndex idx = _VALayerRemoveFromSuperlayer(layer);
    
    if (layer2)
    {
        CFMutableArrayRef sublayers = self->_attr.sublayers;
        CFArrayInsertValueAtIndex(sublayers, idx, layer2);
        VALayerSetSuperlayer(layer2, self);
    }
}

void VALayerDisplay(VALayerRef layer)
{
    VALayerDrawInContext(layer, NULL);
    
    void (* displayLayer)(CFTypeRef delegate, VALayerRef layer) = layer->_attr.layerDelegate.displayLayer;
    if (displayLayer)
    {
        displayLayer(layer->_attr.delegate, layer);
    }
}

void VALayerSetNeedsDisplay(VALayerRef layer)
{
    VALayerSetNeedsDisplayInRect(layer, VALayerGetBounds(layer));
}

void VALayerSetNeedsDisplayInRect(VALayerRef layer, VGRect r)
{
    ((VAMutableLayerRef)layer)->_attr.needDisplay = true;
}

/* Returns true when the layer is marked as needing redrawing. */

Boolean VALayerNeedsDisplay(VALayerRef layer)
{
    return layer->_attr.needDisplay;
}

/* Call -display if receiver is marked as needing redrawing. */

void VALayerDisplayIfNeeded(VALayerRef layer)
{
    if (VALayerNeedsDisplay(layer))
    {
        VALayerDisplay(layer);
    }
}

void VALayerDrawInContext(VALayerRef layer, VGContextRef ctx)
{
    void (* drawLayerInContext)(CFTypeRef, VALayerRef, VGContextRef) = layer->_attr.layerDelegate.drawLayerInContext;
    if (drawLayerInContext)
    {
        drawLayerInContext(layer->_attr.delegate, layer, ctx);
    }
}

void VALayerRenderInContext(VALayerRef layer, VGContextRef ctx)
{
    CFArrayRef sublayers = layer->_attr.sublayers;
    CFIndex count = CFArrayGetCount(sublayers);
    
    for (CFIndex i = 0; i < count; ++i)
    {
        VALayerRef l = CFArrayGetValueAtIndex(sublayers, i);
        VALayerRenderInContext(l, ctx);
    }
}


VGColorRef VALayerGetBackgroundColor(VALayerRef layer)
{
    return layer->_attr.layer->backgroundColor;
}
void VALayerSetBackgroundColor(VALayerRef layer, VGColorRef color)
{
    VALayerImplRef impl = layer->_attr.layer;
    if (!VGColorEqualToColor(impl->backgroundColor, color))
    {
        impl->backgroundColor = VGColorRetain(color);
    }
}

/* When positive, the background of the layer will be drawn with
 * rounded corners. Also effects the mask generated by the
 * `masksToBounds' property. Defaults to zero. Animatable. */

VGFloat VALayerGetCornerRadius(VALayerRef layer)
{
    VALayerImplRef impl = layer->_attr.layer;
    return impl->cornerRadius;
}
void VALayerSetCornerRadius(VALayerRef layer, VGFloat r)
{
    VALayerImplRef impl = layer->_attr.layer;
    if (impl->cornerRadius != r)
    {
        impl->cornerRadius = r;
    }
}

/* The width of the layer's border, inset from the layer bounds. The
 * border is composited above the layer's content and sublayers and
 * includes the effects of the `cornerRadius' property. Defaults to
 * zero. Animatable. */
VGFloat VALayerGetBorderWidth(VALayerRef layer)
{
    VALayerImplRef impl = layer->_attr.layer;
    return impl->borderWidth;
}
void VALayerSetBorderWidth(VALayerRef layer, VGFloat w)
{
    VALayerImplRef impl = layer->_attr.layer;
    if (impl->borderWidth != w)
    {
        impl->borderWidth = w;
    }
}
/* The color of the layer's border. Defaults to opaque black. Colors
 * created from tiled patterns are supported. Animatable. */

VGColorRef VALayerGetBorderColor(VALayerRef layer)
{
    VALayerImplRef impl = layer->_attr.layer;
    return impl->borderColor;
}
void VALayerSetBorderColor(VALayerRef layer, VGColorRef color)
{
    VALayerImplRef impl = layer->_attr.layer;
    if (!VGColorEqualToColor(impl->borderColor, color))
    {
        impl->borderColor = VGColorRetain(color);
    }
}

/* The opacity of the layer, as a value between zero and one. Defaults
 * to one. Specifying a value outside the [0,1] range will give undefined
 * results. Animatable. */
float VALayerGetOpacity(VALayerRef layer)
{
    VALayerImplRef impl = layer->_attr.layer;
    return impl->opacity;
}
void VALayerSetOpacity(VALayerRef layer, float o)
{
    VALayerImplRef impl = layer->_attr.layer;
    if (impl->opacity != o)
    {
        impl->opacity = o;
    }
}
