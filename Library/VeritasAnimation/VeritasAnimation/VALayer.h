//
//  VALayer.h
//  VeritasGraphics
//
//  Created by Lei on 12/28/14.
//  Copyright (c) 2014 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VALayer__
#define __VeritasGraphics__VALayer__

#include <CoreFoundation/CoreFoundation.h>
#include <VeritasAnimation/VATransform3D.h>
#include <VeritasGraphics/VGContext.h>

typedef const struct __VALayer * VALayerRef;

VA_EXTERN CFTypeID VALayerGetTypeID(void);

VA_EXTERN VALayerRef VALayerCreate(CFAllocatorRef allocator);

VA_EXTERN VALayerRef VALayerCreateWithLayer(CFAllocatorRef allocator, VALayerRef layer);

VA_EXTERN VALayerRef VALayerGetPresentationLayer(VALayerRef layer);

VA_EXTERN VALayerRef VALayerGetModelLayer(VALayerRef layer);

VA_EXTERN CFStringRef VALayerDefaultValueForKey(CFStringRef key);

VA_EXTERN Boolean VALayerRefNeedsDisplayForKey(CFStringRef key);

VA_EXTERN Boolean VALayerShouldArchiveValueForKey(VALayerRef layer, CFStringRef key);

#pragma mark - geometry

VA_EXTERN VGRect VALayerGetBounds(VALayerRef layer);
VA_EXTERN void VALayerSetBounds(VALayerRef layer, VGRect bounds);

VA_EXTERN VGFloat VALayerGetPosition(VALayerRef layer);
VA_EXTERN void VALayerSetPosition(VALayerRef layer, VGFloat position);

VA_EXTERN VGFloat VALayerGetzPosition(VALayerRef layer);
VA_EXTERN void VALayerSetzPosition(VALayerRef layer, VGFloat zPosition);

VA_EXTERN VGPoint VALayerGetAnchorPoint(VALayerRef layer);
VA_EXTERN void VALayerSetAnchorPoint(VALayerRef layer, VGPoint anchorPoint);

VA_EXTERN VATransform3D VALayerGetTransform(VALayerRef layer);
VA_EXTERN void VALayerSetTransform(VALayerRef layer, VATransform3D t);

VA_EXTERN VGAffineTransform VALayerGetAffineTransform(VALayerRef layer);
VA_EXTERN void VALayerSetAffineTransform(VALayerRef layer, VGAffineTransform t);

VA_EXTERN VGRect VALayerGetFrame(VALayerRef layer);
VA_EXTERN void VALayerSetFrame(VALayerRef layer, VGRect frame);

VA_EXTERN Boolean VALayerIsHidden(VALayerRef layer);
VA_EXTERN void VALayerSetHidden(VALayerRef layer, Boolean hidden);


/* The receiver's superlayer object. Implicitly changed to match the
 * hierarchy described by the `sublayers' properties. */

VA_EXTERN VALayerRef VALayerGetSuperlayer(VALayerRef layer);
VA_EXTERN void VALayerSetSuperlayer(VALayerRef layer, VALayerRef superlayer);

/* Removes the layer from its superlayer, works both if the receiver is
 * in its superlayer's `sublayers' array or set as its `mask' value. */

VA_EXTERN void VALayerRemoveFromSuperlayer(VALayerRef layer);

/* The array of sublayers of this layer. The layers are listed in back
 * to front order. Defaults to nil. When setting the value of the
 * property, any newly added layers must have nil superlayers, otherwise
 * the behavior is undefined. Note that the returned array is not
 * guaranteed to retain its elements. */
VA_EXTERN CFArrayRef VALayerGetSublayers(VALayerRef layer);
VA_EXTERN void VALayerSetSublayers(VALayerRef layer, CFArrayRef sublayers);

/* Add 'layer' to the end of the receiver's sublayers array. If 'layer'
 * already has a superlayer, it will be removed before being added. */

VA_EXTERN void VALayerAddSublayer(VALayerRef layer, VALayerRef sublayer);

/* Insert 'layer' at position 'idx' in the receiver's sublayers array.
 * If 'layer' already has a superlayer, it will be removed before being
 * inserted. */

VA_EXTERN void VALayerInsertSublayerAtIndex(VALayerRef layer, VALayerRef alayer, unsigned idx);

/* Insert 'layer' either above or below the specified layer in the
 * receiver's sublayers array. If 'layer' already has a superlayer, it
 * will be removed before being inserted. */
VA_EXTERN void VALayerInsertSublayerBelow(VALayerRef layer, VALayerRef insertLayer, VALayerRef sibling);
VA_EXTERN void VALayerInsertSublayerAbove(VALayerRef layer, VALayerRef insertLayer, VALayerRef sibling);

/* Remove 'layer' from the sublayers array of the receiver and insert
 * 'layer2' if non-nil in its position. If the superlayer of 'layer'
 * is not the receiver, the behavior is undefined. */
VA_EXTERN void VALayerReplaceSublayer(VALayerRef layer, VALayerRef l1, VALayerRef l2);

/* Reload the content of this layer. Calls the -drawInContext: method
 * then updates the `contents' property of the layer. Typically this is
 * not called directly. */

VA_EXTERN void VALayerDisplay(VALayerRef layer);

/* Marks that -display needs to be called before the layer is next
 * committed. If a region is specified, only that region of the layer
 * is invalidated. */

VA_EXTERN void VALayerSetNeedsDisplay(VALayerRef layer);
VA_EXTERN void VALayerSetNeedsDisplayInRect(VALayerRef layer, VGRect r);

/* Returns true when the layer is marked as needing redrawing. */

VA_EXTERN Boolean VALayerNeedsDisplay(VALayerRef layer);

/* Call -display if receiver is marked as needing redrawing. */

VA_EXTERN void VALayerDisplayIfNeeded(VALayerRef layer);


/* Called via the -display method when the `contents' property is being
 * updated. Default implementation does nothing. The context may be
 * clipped to protect valid layer content. Subclasses that wish to find
 * the actual region to draw can call CGContextGetClipBoundingBox(). */

VA_EXTERN void VALayerDrawInContext(VALayerRef layer, VGContextRef ctx);

/** Rendering properties and methods. **/

/* Renders the receiver and its sublayers into 'ctx'. This method
 * renders directly from the layer tree. Renders in the coordinate space
 * of the layer.
 *
 * WARNING: currently this method does not implement the full
 * CoreAnimation composition model, use with caution. */

VA_EXTERN void VALayerRenderInContext(VALayerRef layer, VGContextRef ctx);

/* The background color of the layer. Default value is nil. Colors
 * created from tiled patterns are supported. Animatable. */

VA_EXTERN VGColorRef VALayerGetBackgroundColor(VALayerRef layer);
VA_EXTERN void VALayerSetBackgroundColor(VALayerRef layer, VGColorRef color);

/* When positive, the background of the layer will be drawn with
 * rounded corners. Also effects the mask generated by the
 * `masksToBounds' property. Defaults to zero. Animatable. */

VA_EXTERN VGFloat VALayerGetCornerRadius(VALayerRef layer);
VA_EXTERN void VALayerSetCornerRadius(VALayerRef layer, VGFloat r);

/* The width of the layer's border, inset from the layer bounds. The
 * border is composited above the layer's content and sublayers and
 * includes the effects of the `cornerRadius' property. Defaults to
 * zero. Animatable. */
VA_EXTERN VGFloat VALayerGetBorderWidth(VALayerRef layer);
VA_EXTERN void VALayerSetBorderWidth(VALayerRef layer, VGFloat w);
/* The color of the layer's border. Defaults to opaque black. Colors
 * created from tiled patterns are supported. Animatable. */

VA_EXTERN VGColorRef VALayerGetBorderColor(VALayerRef layer);
VA_EXTERN void VALayerSetBorderColor(VALayerRef layer, VGColorRef color);

/* The opacity of the layer, as a value between zero and one. Defaults
 * to one. Specifying a value outside the [0,1] range will give undefined
 * results. Animatable. */
VA_EXTERN float VALayerGetOpacity(VALayerRef layer);
VA_EXTERN void VALayerSetOpacity(VALayerRef layer, float o);


#pragma mark - layer delegate

typedef struct __VALayerLayoutManager
{
    /* Called when the preferred size of 'layer' may have changed. The
     * receiver is responsible for recomputing the preferred size and
     * returning it. */
    VGSize (* preferredSizeOfLayer)(CFTypeRef, VALayerRef);;
    
    /* Called when the preferred size of 'layer' may have changed. The
     * receiver should invalidate any cached state. */
    
    void (* invalidateLayoutOfLayer)(CFTypeRef, VALayerRef);
    
    /* Called when the sublayers of 'layer' may need rearranging (e.g. if
     * something changed size). The receiver is responsible for changing
     * the frame of each sublayer that needs a new layout. */
    
    void (* layoutSublayersOfLayer)(CFTypeRef,  VALayerRef);
    
} VALayerLayoutManager;

typedef struct __VALayerDelegate
{
    /* If defined, called by the default implementation of the -display
     * method, in which case it should implement the entire display
     * process (typically by setting the `contents' property). */
    void (* displayLayer)(CFTypeRef delegate, VALayerRef layer);
    
    /* If defined, called by the default implementation of -drawInContext: */
    void (* drawLayerInContext)(CFTypeRef delegate, VALayerRef layer, VGContextRef ctx);
    
    /* Called by the default -layoutSublayers implementation before the layout
     * manager is checked. Note that if the delegate method is invoked, the
     * layout manager will be ignored. */
    void (* layoutSublayersOfLayer)(CFTypeRef delegate, VALayerRef layer);
    
} VALayerDelegate;

#endif /* defined(__VeritasGraphics__VALayer__) */
