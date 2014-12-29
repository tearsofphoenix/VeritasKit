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



#endif /* defined(__VeritasGraphics__VALayer__) */
