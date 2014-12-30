//
//  VGDataProvider.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef __VeritasGraphics__VGDataProvider__
#define __VeritasGraphics__VGDataProvider__


typedef struct VGDataProvider *VGDataProviderRef;

#include <VeritasGraphics/VGBase.h>
#include <CoreFoundation/CFURL.h>
#include <sys/types.h>

/* This callback is called to copy `count' bytes from the sequential data
 stream to `buffer'. */

typedef size_t (*VGDataProviderGetBytesCallback)(void *info, void *buffer,
                                                 size_t count);

/* This callback is called to skip `count' bytes forward in the sequential
 data stream. It should return the number of bytes that were actually
 skipped. */

typedef off_t (*VGDataProviderSkipForwardCallback)(void *info, off_t count);

/* This callback is called to rewind to the beginning of sequential data
 stream. */

typedef void (*VGDataProviderRewindCallback)(void *info);

/* This callback is called to release the `info' pointer when the data
 provider is freed. */

typedef void (*VGDataProviderReleaseInfoCallback)(void *info);

/* Callbacks for sequentially accessing data.
 `version' is the version of this structure. It should be set to 0.
 `getBytes' is called to copy `count' bytes from the sequential data
 stream to `buffer'. It should return the number of bytes copied, or 0
 if there's no more data.
 `skipForward' is called to skip ahead in the sequential data stream by
 `count' bytes.
 `rewind' is called to rewind the sequential data stream to the beginning
 of the data.
 `releaseInfo', if non-NULL, is called to release the `info' pointer when
 the provider is freed. */

struct VGDataProviderSequentialCallbacks {
    unsigned int version;
    VGDataProviderGetBytesCallback getBytes;
    VGDataProviderSkipForwardCallback skipForward;
    VGDataProviderRewindCallback rewind;
    VGDataProviderReleaseInfoCallback releaseInfo;
};
typedef struct VGDataProviderSequentialCallbacks VGDataProviderSequentialCallbacks;

/* This callback is called to get a pointer to the entire block of data. */

typedef const void *(*VGDataProviderGetBytePointerCallback)(void *info);

/* This callback is called to release the pointer to entire block of
 data. */

typedef void (*VGDataProviderReleaseBytePointerCallback)(void *info, const void *pointer);

/* This callback is called to copy `count' bytes at byte offset `position'
 into `buffer'. */

typedef size_t (*VGDataProviderGetBytesAtPositionCallback)(void *info,
                                                           void *buffer, off_t position, size_t count);

/* Callbacks for directly accessing data.
 `version' is the version of this structure. It should be set to 0.
 `getBytePointer', if non-NULL, is called to return a pointer to the
 provider's entire block of data.
 `releaseBytePointer', if non-NULL, is called to release a pointer to the
 provider's entire block of data.
 `getBytesAtPosition', if non-NULL, is called to copy `count' bytes at
 offset `position' from the provider's data to `buffer'. It should
 return the number of bytes copied, or 0 if there's no more data.
 `releaseInfo', if non-NULL, is called to release the `info' pointer when
 the provider is freed.
 
 At least one of `getBytePointer' or `getBytesAtPosition' must be
 non-NULL. */

struct VGDataProviderDirectCallbacks {
    unsigned int version;
    VGDataProviderGetBytePointerCallback getBytePointer;
    VGDataProviderReleaseBytePointerCallback releaseBytePointer;
    VGDataProviderGetBytesAtPositionCallback getBytesAtPosition;
    VGDataProviderReleaseInfoCallback releaseInfo;
};
typedef struct VGDataProviderDirectCallbacks VGDataProviderDirectCallbacks;

/* Return the CFTypeID for VGDataProviderRefs. */

VG_EXTERN CFTypeID VGDataProviderGetTypeID(void);

/* Create a sequential-access data provider using `callbacks' to provide the
 data. `info' is passed to each of the callback functions. */

VG_EXTERN VGDataProviderRef VGDataProviderCreateSequential(void *info,
                                                           const VGDataProviderSequentialCallbacks *callbacks);

/* Create a direct-access data provider using `callbacks' to supply `size'
 bytes of data. `info' is passed to each of the callback functions.
 The underlying data must not change for the life of the data provider. */

VG_EXTERN VGDataProviderRef VGDataProviderCreateDirect(void *info, off_t size,
                                                       const VGDataProviderDirectCallbacks *callbacks);

/* The callback used by `VGDataProviderCreateWithData'. */

typedef void (*VGDataProviderReleaseDataCallback)(void *info, const void *data,
size_t size);

/* Create a direct-access data provider using `data', an array of `size'
 bytes. `releaseData' is called when the data provider is freed, and is
 passed `info' as its first argument. */

VG_EXTERN VGDataProviderRef VGDataProviderCreateWithData(void *info,
                                                         const void *data, size_t size, VGDataProviderReleaseDataCallback releaseData);

/* Create a direct-access data provider which reads from `data'. */

VG_EXTERN VGDataProviderRef VGDataProviderCreateWithCFData(CFDataRef data);

/* Create a data provider reading from `url'. */

VG_EXTERN VGDataProviderRef VGDataProviderCreateWithURL(CFURLRef url);

/* Create a data provider reading from `filename'. */

VG_EXTERN VGDataProviderRef VGDataProviderCreateWithFilename(const char *filename);

/* Equivalent to `CFRetain(provider)', but doesn't crash (as CFRetain does)
 if `provider' is NULL. */

VG_EXTERN VGDataProviderRef VGDataProviderRetain(VGDataProviderRef provider);

/* Equivalent to `CFRelease(provider)', but doesn't crash (as CFRelease
 does) if `provider' is NULL. */

VG_EXTERN void VGDataProviderRelease(VGDataProviderRef provider);

/* Return a copy of the data specified by provider. Returns NULL if a
 complete copy of the data can't be obtained (for example, if the
 underlying data is too large to fit in memory). */

VG_EXTERN CFDataRef VGDataProviderCopyData(VGDataProviderRef provider);


#endif /* defined(__VeritasGraphics__VGDataProvider__) */
