//
//  VFInternal.h
//  VeritasFoundation
//
//  Created by Mac003 on 14/12/31.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef VeritasFoundation_VFInternal_h
#define VeritasFoundation_VFInternal_h

#if DEPLOYMENT_TARGET_WINDOWS
CF_INLINE bool _CFAtomicCompareAndSwap32Barrier(int32_t oldValue, int32_t newValue, volatile int32_t *theValue) {
    int32_t actualOldValue = InterlockedCompareExchange((VOLATILE LONG *)theValue, newValue, oldValue);
    return actualOldValue == oldValue ? true : false;
}
CF_INLINE bool _CFAtomicCompareAndSwapPtrBarrier(void* oldValue, void* newValue, void* volatile *theValue) {
    void *actualOldValue = InterlockedCompareExchangePointer((volatile PVOID*)theValue, newValue, (PVOID)oldValue);
    return actualOldValue == oldValue ? true : false;
}
CF_INLINE int32_t _CFAtomicIncrement32(volatile int32_t *theValue) {
    return (unsigned int)InterlockedIncrement((VOLATILE LONG*)theValue);
}

CF_INLINE int32_t _CFAtomicDecrement32(volatile int32_t *theValue) {
    return (unsigned int)InterlockedDecrement((VOLATILE LONG*)theValue);
}

#if DEPLOYMENT_TARGET_WINDOWSCE
CF_INLINE void MemoryBarrier(void) {}
#endif

CF_INLINE void _CFMemoryBarrier(void) {
    MemoryBarrier();
}
#elif DEPLOYMENT_TARGET_MACOSX
CF_INLINE bool _CFAtomicCompareAndSwap32Barrier(int32_t __oldValue, int32_t __newValue, volatile int32_t *__theValue) {
    return OSAtomicCompareAndSwap32Barrier(__oldValue, __newValue, __theValue);
}
CF_INLINE bool _CFAtomicCompareAndSwapPtrBarrier(void* __oldValue, void* __newValue, void* volatile *__theValue) {
    return OSAtomicCompareAndSwapPtrBarrier(__oldValue, __newValue, __theValue);
}
CF_INLINE int32_t _CFAtomicIncrement32(volatile int32_t *theValue) {
    return OSAtomicIncrement32(theValue);
}
CF_INLINE void _CFMemoryBarrier(void) {
    OSMemoryBarrier();
}
#elif DEPLOYMENT_TARGET_LINUX
// Simply leverage GCC's atomic built-ins (see http://gcc.gnu.org/onlinedocs/gcc-4.1.0/gcc/Atomic-Builtins.html)
CF_INLINE bool _CFAtomicCompareAndSwap32Barrier(int32_t __oldValue, int32_t __newValue, volatile int32_t *__theValue) {
    return __sync_bool_compare_and_swap(__theValue, __oldValue, __newValue);
}
CF_INLINE bool _CFAtomicCompareAndSwapPtrBarrier(void* __oldValue, void* __newValue, void* volatile *__theValue) {
    return __sync_bool_compare_and_swap(__theValue, __oldValue, __newValue);
}
CF_INLINE int32_t _CFAtomicIncrement32(volatile int32_t *theValue) {
    return __sync_fetch_and_add(theValue, 1);
}
CF_INLINE void _CFMemoryBarrier(void) {
    __sync_synchronize();
}
#else
CF_INLINE int32_t _CFAtomicIncrement32(volatile int32_t *theValue) {
    return *theValue;
}

CF_INLINE int32_t _CFAtomicDecrement32(volatile int32_t *theValue) {
    return *theValue;
}
//#error "Don't know how to perform atomic operations."
#endif

#endif
