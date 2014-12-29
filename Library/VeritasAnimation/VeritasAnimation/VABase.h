//
//  VABase.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef VeritasGraphics_VABase_h
#define VeritasGraphics_VABase_h

#ifdef VA_BUILDING_VA
# undef __OSX_AVAILABLE_STARTING
# undef __OSX_AVAILABLE_BUT_DEPREVATED
#endif
#ifndef __OSX_AVAILABLE_STARTING
# define __OSX_AVAILABLE_STARTING(m,i)
# define __OSX_AVAILABLE_BUT_DEPREVATED(m0,m1,i0,i1)
#endif

#if !TARGET_OS_IPHONE
#define VA_OS_VERSION(m, i) ((m) > 0 && MAC_OS_X_VERSION_MIN_REQUIRED >= (m))
#else
#define VA_OS_VERSION(m, i) ((i) > 0 && __IPHONE_OS_VERSION_MIN_REQUIRED >= (i))
#endif

#ifdef __cplusplus
# define VA_EXTERN_C_BEGIN extern "C" {
# define VA_EXTERN_C_END   }
#else
# define VA_EXTERN_C_BEGIN
# define VA_EXTERN_C_END
#endif

#ifdef __GNUC__
# define VA_GNUC(major, minor) \
(__GNUC__ > (major) || (__GNUC__ == (major) && __GNUC_MINOR__ >= (minor)))
#else
# define VA_GNUC(major, minor) 0
#endif

#ifndef VA_EXTERN
# define VA_EXTERN extern
#endif

#ifndef VA_INLINE
# if defined (__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
#  define VA_INLINE static inline
# elif defined (__MWERKS__) || defined (__cplusplus)
#  define VA_INLINE static inline
# elif VA_GNUC (3, 0)
#  define VA_INLINE static __inline__ __attribute__ ((always_inline))
# else
#  define VA_INLINE static
# endif
#endif

#ifndef VA_HIDDEN
# if VA_GNUC (4,0)
#  define VA_HIDDEN __attribute__ ((visibility ("hidden")))
# else
#  define VA_HIDDEN /* no hidden */
# endif
#endif

#ifndef VA_PURE
# if VA_GNUC (3, 0)
#  define VA_PURE __attribute__ ((pure))
# else
#  define VA_PURE /* no pure */
# endif
#endif

#ifndef VA_CONST
# if VA_GNUC (3, 0)
#  define VA_CONST __attribute__ ((const))
# else
#  define VA_CONST /* no const */
# endif
#endif

#ifndef VA_NORETURN
# if VA_GNUC (3, 0)
#  define VA_NORETURN __attribute__ ((noreturn))
# else
#  define VA_NORETURN /* no noreturn */
# endif
#endif

#ifndef VA_MALLOC
# if VA_GNUC (3, 0)
#  define VA_MALLOC __attribute__ ((malloc))
# else
#  define VA_MALLOC /* no malloc */
# endif
#endif

#ifndef VA_WARN_UNUSED
# if VA_GNUC (3, 4)
#  define VA_WARN_UNUSED __attribute__ ((warn_unused_result))
# else
#  define VA_WARN_UNUSED /* no warn_unused */
# endif
#endif

#ifndef VA_WARN_DEPREVATED
# define VA_WARN_DEPREVATED 1
#endif

#ifndef VA_DEPREVATED
# if VA_GNUC (3, 0) && VA_WARN_DEPREVATED
#  define VA_DEPREVATED __attribute__ ((deprecated))
# else
#  define VA_DEPREVATED
# endif
#endif


#endif
