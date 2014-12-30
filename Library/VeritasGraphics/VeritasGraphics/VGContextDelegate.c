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
#include <VeritasGraphics/VGContext.h>
#include "VGContextDelegatePriv.h"


static void delegate_finalize(CFTypeRef c)
{
    //VGContextDelegateRef cdt = (VGContextDelegateRef) (c);
}

static CFRuntimeClass _kVGContextDelegateClass =
{
    0,							// version
    "VGContextDelegate",		// className
    0,							// init
    0,							// copy
    delegate_finalize,			// finalize
    0,							// equal
    0,							// hash
    0,							// copyFormattingDesc
    0							// copyDebugDesc
};

CFTypeID __kVGContextDelegateID = _kCFRuntimeNotATypeID;

void __VGContextDelegateClassInitialize(void) {
    
    __kVGContextDelegateID = _CFRuntimeRegisterClass((const CFRuntimeClass * const)&_kVGContextDelegateClass);
}

CFTypeID VGContextDelegateGetTypeID(void)
{
    return __kVGContextDelegateID;
}


VGContextDelegateRef VGContextDelegateCreate(void* info)
{
    VGContextDelegateRef ctxDelegate;
    CFIndex size;
    
    size = sizeof(VGContextDelegate) - sizeof(CFRuntimeBase);
    ctxDelegate = (VGContextDelegateRef)_CFRuntimeCreateInstance(NULL, VGContextDelegateGetTypeID(), size, NULL);
    if (!ctxDelegate) { return NULL; }
    ctxDelegate->info = (VGContextDelegateInfoRef)info;
    
    return ctxDelegate;
}

void VGContextDelegateFinalize(VGContextDelegateRef ctxDelegate)
{
    if (!ctxDelegate) {
        return;
    }
    //VGContextDelegateRelease(ctxDelegate->delegates);
}


VGContextDelegateRef VGContextDelegateRetain(VGContextDelegateRef ctxDelegate)
{
    if (!ctxDelegate) { return NULL; }
    CFRetain((CFTypeRef)ctxDelegate);
    
    return ctxDelegate;
}

void VGContextDelegateRelease(VGContextDelegateRef ctxDelegate)
{
    if (!ctxDelegate) { return; }
    CFRelease((CFTypeRef)ctxDelegate);
}


VGContextDelegateInfoRef VGContextDelegateGetInfo(VGContextDelegateRef ctxDelegate)
{
    if (!ctxDelegate) { return NULL; }
    return ctxDelegate->info;
}


void VGContextDelegateSetCallbacks(VGContextDelegateRef ctxDelegate, const VGCallback* dlArray, int count)
{
    int i;
    if (!ctxDelegate) { return; }
    
    for (i = 0; i < count; i++) {
        VGContextDelegateSetCallback(ctxDelegate, dlArray[i].type, dlArray[i].delegateAddr);
    }
    
}


void VGContextDelegateSetCallback(VGContextDelegateRef ctxDelegate, VGContextDelegateType type, void* callback)
{
    VGFunctionPtr* addr;
    
    if (!ctxDelegate)
        return;
    
    addr = get_callback_address(ctxDelegate, type, "VGContextDelegateSetCallback");
    if (addr) {
        *addr = (VGFunctionPtr) callback;
    }
}


VGFunctionPtr* get_callback_address(VGContextDelegateRef ctxDelegate, VGContextDelegateType type, const char* callerName)
{
    switch(type) {
            
        case kVGContextDelegateFinalize:			{ return (VGFunctionPtr*)&ctxDelegate->finalize;  }
        case kVGContextDelegateGetColorTransform:	{ return (VGFunctionPtr*)&ctxDelegate->getColorTransform; }
        case kVGContextDelegateGetBounds:			{ return (VGFunctionPtr*)&ctxDelegate->getBounds; }
        case kVGContextDelegateDrawLines:			{ return (VGFunctionPtr*)&ctxDelegate->drawLines; }
        case kVGContextDelegateDrawRects:			{ return (VGFunctionPtr*)&ctxDelegate->drawRects; }
        case kVGContextDelegateDrawPath:			{ return (VGFunctionPtr*)&ctxDelegate->drawPath; }
        case kVGContextDelegateDrawImage:			{ return (VGFunctionPtr*)&ctxDelegate->drawImage; }
        case kVGContextDelegateDrawGlyphs:			{ return (VGFunctionPtr*)&ctxDelegate->drawGlyphs; }
        case kVGContextDelegateDrawShading:			{ return (VGFunctionPtr*)&ctxDelegate->drawShading; }
        case kVGContextDelegateDrawDisplayList:		{ return (VGFunctionPtr*)&ctxDelegate->drawDisplayList; }
        case kVGContextDelegateDrawImages:			{ return (VGFunctionPtr*)&ctxDelegate->drawImages; }
        case kVGContextDelegateBeginPage:			{ return (VGFunctionPtr*)&ctxDelegate->beginPage; }
        case kVGContextDelegateEndPage:				{ return (VGFunctionPtr*)&ctxDelegate->endPage; }
        case kVGContextDelegateOperation:			{ return (VGFunctionPtr*)&ctxDelegate->operation; }
        case kVGContextDelegateDrawWindowContents:	{ return (VGFunctionPtr*)&ctxDelegate->drawWindowContents; }
        case kVGContextDelegateDirtyWindowContents:	{ return (VGFunctionPtr*)&ctxDelegate->dirtyWindowContents; }
        case kVGContextDelegateBeginLayer:			{ return (VGFunctionPtr*)&ctxDelegate->beginLayer; }
        case kVGContextDelegateEndLayer:			{ return (VGFunctionPtr*)&ctxDelegate->endLayer; }
        case kVGContextDelegateGetLayer:			{ return (VGFunctionPtr*)&ctxDelegate->getLayer; }
        case kVGContextDelegateDrawLayer:			{ return (VGFunctionPtr*)&ctxDelegate->drawLayer; }
        default:
        {
            printf("%s: Unsupported delegate callback: %d.", callerName, (int)type);
            abort();
        }
    };
    
    return NULL;
}


VGError VGContextDelegateDrawLines(VGContextDelegateRef ctxDelegate,
                                   VGRenderingStateRef rendering,
                                   VGGStateRef state,
                                   const VGPoint points[], size_t count)
{
    if (ctxDelegate == NULL)
        return kVGErrorSuccess;
    if (ctxDelegate->drawLines == NULL)
        return kVGErrorNotImplemented;
    
    return ctxDelegate->drawLines(ctxDelegate, rendering, state, points, count);
}


VGError VGContextDelegateDrawPath(VGContextDelegateRef ctxDelegate,
                                  VGRenderingStateRef rendering,
                                  VGGStateRef state,
                                  VGPathDrawingMode mode,
                                  VGMutablePathRef path)
{
    if (ctxDelegate == NULL)
        return kVGErrorSuccess;
    if (ctxDelegate->drawPath == NULL)
        return kVGErrorNotImplemented;
    
    return ctxDelegate->drawPath(ctxDelegate, rendering, state, mode, path);
}


VGError VGContextDelegateDrawImage(VGContextDelegateRef ctxDelegate,
                                   VGRenderingStateRef rendering,
                                   VGGStateRef state,
                                   VGRect rect,
                                   VGImageRef image)
{
    if (ctxDelegate == NULL)
        return kVGErrorSuccess;
    if (ctxDelegate->drawImage == NULL)
        return kVGErrorNotImplemented;
    
    return ctxDelegate->drawImage(ctxDelegate, rendering, state, rect, image);
}


VGError 
VGContextDelegateOperation(VGContextDelegateRef ctxDelegate,
                           VGRenderingStateRef rendering,
                           VGGStateRef state,
                           CFStringRef op,
                           void* tmp)
{
    if (ctxDelegate == NULL)
        return kVGErrorSuccess;
    if (ctxDelegate->operation == NULL)
        return kVGErrorNotImplemented;
    
    return ctxDelegate->operation(ctxDelegate, rendering, state, op, tmp);
}