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

typedef const struct __VALayer * VALayerRef;
typedef struct __VALayer * VAMutableLayerRef;

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

#endif /* defined(__VeritasGraphics__VALayer__) */
