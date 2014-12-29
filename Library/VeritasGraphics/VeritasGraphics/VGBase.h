//
//  VGBase.h
//  VeritasGraphics
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef VeritasGraphics_VGBase_h
#define VeritasGraphics_VGBase_h


#include <stdbool.h>
#include <stddef.h>
#include <float.h>

/* Definition of `__VG_HAS_COMPILER_ATTRIBUTE'. */

#if !defined(__VG_HAS_COMPILER_ATTRIBUTE)
# if defined(__has_attribute)
#  define __VG_HAS_COMPILER_ATTRIBUTE(attribute) __has_attribute(attribute)
# elif defined(__GNUC__) && __GNUC__ >= 4
#  define __VG_HAS_COMPILER_ATTRIBUTE(attribute) (1)
# else
#  define __VG_HAS_COMPILER_ATTRIBUTE(attribute) (0)
# endif
#endif

/* Definition of `__VG_HAS_COMPILER_EXTENSION'. */

#if !defined(__VG_HAS_COMPILER_EXTENSION)
# if defined(__has_extension)
#  define __VG_HAS_COMPILER_EXTENSION(extension) __has_extension(extension)
# elif defined(__has_feature)
#  define __VG_HAS_COMPILER_EXTENSION(extension) __has_feature(extension)
# else
#  define __VG_HAS_COMPILER_EXTENSION(extension) (0)
# endif
#endif

/* Define `__WIN32__' where appropriate if it's not already defined. */

#if !defined(__WIN32__)
# if defined(_WIN32) || defined(__CYGWIN32__)
#  define __WIN32__ 1
# endif
#endif

/* Definition of `VG_EXTERN'. */

#if !defined(VG_EXTERN)
# if defined(__WIN32__)
#  if defined(VG_BUILDING_VG)
#   if defined(__cplusplus)
#    define VG_EXTERN extern "C" __declspec(dllexport)
#   else
#    define VG_EXTERN extern __declspec(dllexport)
#   endif
#  else /* !defined(VG_BUILDING_VG) */
#   if defined(__cplusplus)
#    define VG_EXTERN extern "C" __declspec(dllimport)
#   else
#    define VG_EXTERN extern __declspec(dllimport)
#   endif
#  endif /* !defined(VG_BUILDING_VG) */
# else /* !defined(__WIN32__) */
#  if defined(__cplusplus)
#   define VG_EXTERN extern "C"
#  else
#   define VG_EXTERN extern
#  endif
# endif /* !defined(__WIN32__) */
#endif /* !defined(VG_EXTERN) */

/* Definition of `VG_LOCAL'. */

#if !defined(VG_LOCAL)
# if __VG_HAS_COMPILER_ATTRIBUTE(visibility)
#  if defined(__cplusplus)
#   define VG_LOCAL extern "C" __attribute__((visibility("hidden")))
#  else
#   define VG_LOCAL extern __attribute__((visibility("hidden")))
#  endif
# else
#  define VG_LOCAL VG_EXTERN
# endif
#endif /* !defined(VG_LOCAL) */

/* Definition of `VG_EXTERN_64` */

#if !defined(VG_EXTERN_64)
# if defined(__LP64__)
#  define VG_EXTERN_64 VG_EXTERN
# else /* !defined(__LP64__) */
#  define VG_EXTERN_64 VG_LOCAL
# endif /* defined(__LP64__) */
#endif /* !defined(VG_EXTERN_64) */

/* Definition of `VG_EXTERN_32` */

#if !defined(VG_EXTERN_32)
# if defined(__LP64__)
#  define VG_EXTERN_32 VG_LOCAL __attribute__((unused))
# else /* !defined(__LP64__) */
#  define VG_EXTERN_32 VG_EXTERN
# endif /* defined(__LP64__) */
#endif /* !defined(VG_EXTERN_32) */

/* Definition of `VG_LOCAL_64` */

#if !defined(VG_LOCAL_64)
# if defined(__LP64__)
#  define VG_LOCAL_64 VG_LOCAL
# else /* !defined(__LP64__) */
#  define VG_LOCAL_64 VG_LOCAL __attribute__((unused))
# endif /* defined(__LP64__) */
#endif /* !defined(VG_LOCAL_64) */

/* Definition of `VG_LOCAL_32` */

#if !defined(VG_LOCAL_32)
# if defined(__LP64__)
#  define VG_LOCAL_32 VG_LOCAL __attribute__((unused))
# else /* !defined(__LP64__) */
#  define VG_LOCAL_32 VG_LOCAL
# endif /* defined(__LP64__) */
#endif /* !defined(VG_LOCAL_32) */

/* Definition of `__VG_DEPRECATED'. */

#if !defined(__VG_DEPRECATED)
# if __VG_HAS_COMPILER_ATTRIBUTE(deprecated) && !defined(VG_BUILDING_VG)
#  define __VG_DEPRECATED __attribute__((deprecated))
# else
#  define __VG_DEPRECATED
# endif
#endif

/* Definition of `__VG_DEPRECATED_WITH_MSG'. */

#if !defined(__VG_DEPRECATED_WITH_MSG)
# if __VG_HAS_COMPILER_ATTRIBUTE(deprecated)				      \
&& __VG_HAS_COMPILER_EXTENSION(attribute_deprecated_with_message)	      \
&& !defined(VG_BUILDING_VG)
#  define __VG_DEPRECATED_WITH_MSG(msg) __attribute__((deprecated(msg)))
# else
#  define __VG_DEPRECATED_WITH_MSG(msg) __VG_DEPRECATED
# endif
#endif

/* Definition of `__VG_DEPRECATED_ENUMERATOR'. */

#if !defined(__VG_DEPRECATED_ENUMERATOR)
# if __VG_HAS_COMPILER_ATTRIBUTE(deprecated)				      \
&& __VG_HAS_COMPILER_EXTENSION(enumerator_attributes)		      \
&& !defined(VG_BUILDING_VG)
#  define __VG_DEPRECATED_ENUMERATOR __attribute__((deprecated))
# else
#  define __VG_DEPRECATED_ENUMERATOR
# endif
#endif

/* Definition of `__VG_DEPRECATED_ENUMERATOR_WITH_MSG'. */

#if !defined(__VG_DEPRECATED_ENUMERATOR_WITH_MSG)
# if __VG_HAS_COMPILER_ATTRIBUTE(deprecated)				      \
&& __VG_HAS_COMPILER_EXTENSION(attribute_deprecated_with_message) \
&& __VG_HAS_COMPILER_EXTENSION(enumerator_attributes)		      \
&& !defined(VG_BUILDING_VG)
#  define __VG_DEPRECATED_ENUMERATOR_WITH_MSG(msg) __attribute__((deprecated(msg)))
# else
#  define __VG_DEPRECATED_ENUMERATOR_WITH_MSG(msg) __VG_DEPRECATED_ENUMERATOR
# endif
#endif

/* Define `VG_AVAILABLE_STARTING' and `VG_AVAILABLE_BUT_DEPRECATED'. */

#if defined(VG_BUILDING_VG)
# define VG_AVAILABLE_STARTING(_mac, _iphone)
# define VG_AVAILABLE_BUT_DEPRECATED(_mac, _macDep, _iphone, _iphoneDep)
#else
# include <Availability.h>
# define VG_AVAILABLE_STARTING __OSX_AVAILABLE_STARTING
# define VG_AVAILABLE_BUT_DEPRECATED __OSX_AVAILABLE_BUT_DEPRECATED
#endif

/* Definition of `__VG_STATIC_ASSERT'. */

#if !defined(__VG_STATIC_ASSERT)
# if defined(__cplusplus) && __VG_HAS_COMPILER_EXTENSION(cxx_static_assert)
#  define __VG_STATIC_ASSERT(constant_expression)			      \
static_assert(constant_expression, #constant_expression)
# elif !defined(__cplusplus) && __VG_HAS_COMPILER_EXTENSION(c_static_assert)
#  define __VG_STATIC_ASSERT(constant_expression)			      \
_Static_assert(constant_expression, #constant_expression)
# else
#  define __VG_STATIC_ASSERT(constant_expression)
# endif
#endif

/* Definition of `VG_INLINE'. */

#if !defined(VG_INLINE)
# if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
#  define VG_INLINE static inline
# elif defined(__cplusplus)
#  define VG_INLINE static inline
# elif defined(__GNUC__)
#  define VG_INLINE static __inline__
# elif defined(__WIN32__)
#  define VG_INLINE static __inline
# else
#  define VG_INLINE static
# endif
#endif

/* Definition of `__VG_NO_INLINE'. */

#if !defined(__VG_NO_INLINE)
# if __VG_HAS_COMPILER_ATTRIBUTE(noinline)
#  define __VG_NO_INLINE static __attribute__((noinline))
# else
#  define __VG_NO_INLINE static
# endif
#endif

/* Definition of `__VG_FORMAT_PRINTF'. */

#if !defined(__VG_FORMAT_PRINTF)
# if __VG_HAS_COMPILER_ATTRIBUTE(format)
#  define __VG_FORMAT_PRINTF(FORMAT_STRING, STARTING_ARG)		      \
__attribute__((format(printf, FORMAT_STRING, STARTING_ARG)))	      \
__attribute__((nonnull(FORMAT_STRING)))
# else
#  define __VG_FORMAT_PRINTF(FORMAT_STRING, STARTING_ARG)
# endif
#endif

/* Definition of `__VG_FORMAT_VPRINTF'. */

#if !defined(__VG_FORMAT_VPRINTF)
# if __VG_HAS_COMPILER_ATTRIBUTE(format)
#  define __VG_FORMAT_VPRINTF(FORMAT_STRING)				      \
__attribute__((format(printf, FORMAT_STRING, 0)))
# else
#  define __VG_FORMAT_VPRINTF(FORMAT_STRING)
# endif
#endif

/* Definition of `VGFLOAT_TYPE', `VGFLOAT_IS_DOUBLE', `VGFLOAT_MIN', and
 `VGFLOAT_MAX'. */

#if defined(__LP64__) && __LP64__
# define VGFLOAT_TYPE double
# define VGFLOAT_IS_DOUBLE 1
# define VGFLOAT_MIN DBL_MIN
# define VGFLOAT_MAX DBL_MAX
#else
# define VGFLOAT_TYPE float
# define VGFLOAT_IS_DOUBLE 0
# define VGFLOAT_MIN FLT_MIN
# define VGFLOAT_MAX FLT_MAX
#endif

/* Definition of the `VGFloat' type and `VGFLOAT_DEFINED'. */

typedef VGFLOAT_TYPE VGFloat;
#define VGFLOAT_DEFINED 1

/* Definition of `VG_OBSOLETE'. Deprecated; to be removed. */

#if !defined(VG_OBSOLETE)
# define VG_OBSOLETE __VG_DEPRECATED
#endif

/* Definition of `VG_PRIVATE_EXTERN'. Deprecated; to be removed. */

#if !defined(VG_PRIVATE_EXTERN) && !defined(VG_BUILDING_VG)
# define VG_PRIVATE_EXTERN VG_LOCAL
#endif

#endif
