//
//  VGDataProvider.c
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#include "VGDataProvider.h"

#include <VeritasFoundation/CFRuntime.h>
#include <string.h>

struct VGDataProvider
{
    CFRuntimeBase _base;
    void *info;
    bool isDirect;
    off_t directOffset;
    union {
        VGDataProviderSequentialCallbacks sequentialCallbacks;
        VGDataProviderDirectCallbacks     directCallbacks;
    };
};


static CFTypeID _kVGDataProviderID = _kCFRuntimeNotATypeID;

static CFRuntimeClass _kVGDataProviderClass = {0};

/* Something external to this file is assumed to call this
 * before the VALayer class is used.
 */
void __VGColorClassInitialize(void) {
    _kVGDataProviderClass.version = 0;
    _kVGDataProviderClass.className = "VGColor";
    _kVGDataProviderClass.init = NULL;
    _kVGDataProviderClass.copy = NULL;
    _kVGDataProviderClass.finalize = NULL;
    _kVGDataProviderClass.equal = NULL;
    _kVGDataProviderClass.hash = NULL;
    _kVGDataProviderClass.copyFormattingDesc = NULL;
    _kVGDataProviderClass.copyDebugDesc = NULL;
    _kVGDataProviderID = _CFRuntimeRegisterClass((const CFRuntimeClass * const)&_kVGDataProviderClass);
}
/* Return the CFTypeID for VGDataProviderRefs. */

CFTypeID VGDataProviderGetTypeID(void) { return _kVGDataProviderID; }

static VGDataProviderRef _VGDataProviderCreate()
{
    VGDataProviderRef provider;
    uint32_t extra = sizeof(*provider) - sizeof(CFRuntimeBase);
    provider = (VGDataProviderRef)_CFRuntimeCreateInstance(NULL, _kVGDataProviderID, extra, NULL);
    
    return provider;
}

/* Create a sequential-access data provider using `callbacks' to provide the
 data. `info' is passed to each of the callback functions. */

VGDataProviderRef VGDataProviderCreateSequential(void *info,
                                                 const VGDataProviderSequentialCallbacks *callbacks)
{
    VGDataProviderRef provider = _VGDataProviderCreate();
    provider->info = info;
    provider->isDirect = false;
    if (callbacks)
    {
        memcpy(&(provider->sequentialCallbacks), callbacks, sizeof(*callbacks));
    }
    return provider;
}

/* Create a direct-access data provider using `callbacks' to supply `size'
 bytes of data. `info' is passed to each of the callback functions.
 The underlying data must not change for the life of the data provider. */

VGDataProviderRef VGDataProviderCreateDirect(void *info, off_t size,
                                                       const VGDataProviderDirectCallbacks *callbacks)
{
    VGDataProviderRef provider = _VGDataProviderCreate();
    provider->info = info;
    provider->isDirect = true;
    provider->directOffset = size;
    
    if (callbacks)
    {
        memcpy(&(provider->directCallbacks), callbacks, sizeof(*callbacks));
    }
    return provider;
}

/* Create a direct-access data provider using `data', an array of `size'
 bytes. `releaseData' is called when the data provider is freed, and is
 passed `info' as its first argument. */

VGDataProviderRef VGDataProviderCreateWithData(void *info, const void *data, size_t size, VGDataProviderReleaseDataCallback releaseData)
{
    return NULL;
}

/* Create a direct-access data provider which reads from `data'. */
static VGDataProviderDirectCallbacks dataCallbacks = {
    0,
};


VGDataProviderRef VGDataProviderCreateWithCFData(CFDataRef data)
{
    return VGDataProviderCreateDirect((void *)data, 0, &dataCallbacks);
}

/* Create a data provider reading from `url'. */
static VGDataProviderSequentialCallbacks urlCallbacks = {
    0,
    
};

VGDataProviderRef VGDataProviderCreateWithURL(CFURLRef url)
{
    return VGDataProviderCreateSequential((void *)url, &urlCallbacks);
}

/* Create a data provider reading from `filename'. */
static VGDataProviderDirectCallbacks filenameCallbacks = {
    0,
};

VGDataProviderRef VGDataProviderCreateWithFilename(const char *filename)
{
    return VGDataProviderCreateDirect((void *)filename, 0, &filenameCallbacks);
}

/* Equivalent to `CFRetain(provider)', but doesn't crash (as CFRetain does)
 if `provider' is NULL. */

VGDataProviderRef VGDataProviderRetain(VGDataProviderRef provider)
{
    if (provider) { CFRetain(provider); }
    return provider;
}

/* Equivalent to `CFRelease(provider)', but doesn't crash (as CFRelease
 does) if `provider' is NULL. */

void VGDataProviderRelease(VGDataProviderRef provider)
{
    if (provider) { CFRelease(provider); }
}

/* Return a copy of the data specified by provider. Returns NULL if a
 complete copy of the data can't be obtained (for example, if the
 underlying data is too large to fit in memory). */

CFDataRef VGDataProviderCopyData(VGDataProviderRef provider)
{
    if (provider->isDirect)
    {
        
    }
    
    return NULL;
}

