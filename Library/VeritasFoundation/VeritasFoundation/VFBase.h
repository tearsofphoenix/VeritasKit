//
//  VFBase.h
//  VeritasFoundation
//
//  Created by Mac003 on 14/12/29.
//  Copyright (c) 2014年 Lei. All rights reserved.
//

#ifndef VeritasFoundation_VFBase_h
#define VeritasFoundation_VFBase_h


#if defined(__cplusplus)
#define FOUNDATION_EXTERN extern "C"
#else
#define FOUNDATION_EXTERN extern
#endif

#if TARGET_OS_WIN32

#if defined(VFBUILDINGFOUNDATION)
#define FOUNDATION_EXPORT FOUNDATION_EXTERN __declspec(dllexport)
#else
#define FOUNDATION_EXPORT FOUNDATION_EXTERN __declspec(dllimport)
#endif

#define FOUNDATION_IMPORT FOUNDATION_EXTERN __declspec(dllimport)

#else
#define FOUNDATION_EXPORT  FOUNDATION_EXTERN
#define FOUNDATION_IMPORT FOUNDATION_EXTERN
#endif

#if !defined(VF_INLINE)
#if defined(__GNUC__)
#define VF_INLINE static __inline__ __attribute__((always_inline))
#elif defined(__MWERKS__) || defined(__cplusplus)
#define VF_INLINE static inline
#elif defined(_MSC_VER)
#define VF_INLINE static __inline
#elif TARGET_OS_WIN32
#define VF_INLINE static __inline__
#endif
#endif

#if !defined(FOUNDATION_STATIC_INLINE)
#define FOUNDATION_STATIC_INLINE static __inline__
#endif

#if !defined(FOUNDATION_EXTERN_INLINE)
#define FOUNDATION_EXTERN_INLINE extern __inline__
#endif

#if !defined(VF_REQUIRES_NIL_TERMINATION)
#if TARGET_OS_WIN32
#define VF_REQUIRES_NIL_TERMINATION
#else
#if defined(__APPLE_CC__) && (__APPLE_CC__ >= 5549)
#define VF_REQUIRES_NIL_TERMINATION __attribute__((sentinel(0,1)))
#else
#define VF_REQUIRES_NIL_TERMINATION __attribute__((sentinel))
#endif
#endif
#endif

#if !defined(VF_BLOCKS_AVAILABLE)
#if __BLOCKS__ && (MAC_OS_X_VERSION_10_6 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_4_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED)
#define VF_BLOCKS_AVAILABLE 1
#else
#define VF_BLOCKS_AVAILABLE 0
#endif
#endif

// Marks APIs whose iOS versions are nonatomic, that is cannot be set/get from multiple threads safely without additional synchronization
#if !defined(VF_NONATOMIC_IOSONLY)
#if TARGET_OS_IPHONE
#define VF_NONATOMIC_IOSONLY nonatomic
#else
#if __has_feature(objc_property_explicit_atomic)
#define VF_NONATOMIC_IOSONLY atomic
#else
#define VF_NONATOMIC_IOSONLY
#endif
#endif
#endif

// Use VF_NONATOMIC_IOSONLY instead of this older macro
#if !defined(VF_NONATOMIC_IPHONEONLY)
#define VF_NONATOMIC_IPHONEONLY VF_NONATOMIC_IOSONLY
#endif

// Marks APIs which format strings by taking a format string and optional varargs as arguments
#if !defined(VF_FORMAT_FUNCTION)
#if (__GNUC__*10+__GNUC_MINOR__ >= 42) && (TARGET_OS_MAC || TARGET_OS_EMBEDDED)
#define VF_FORMAT_FUNCTION(F,A) __attribute__((format(__NSString__, F, A)))
#else
#define VF_FORMAT_FUNCTION(F,A)
#endif
#endif

// Marks APIs which are often used to process (take and return) format strings, so they can be used in place of a constant format string parameter in APIs
#if !defined(VF_FORMAT_ARGUMENT)
#if defined(__clang__)
#define VF_FORMAT_ARGUMENT(A) __attribute__ ((format_arg(A)))
#else
#define VF_FORMAT_ARGUMENT(A)
#endif
#endif

// Some compilers provide the capability to test if certain features are available. This macro provides a compatibility path for other compilers.
#ifndef __has_feature
#define __has_feature(x) 0
#endif

#ifndef __has_extension
#define __has_extension(x) 0
#endif

// Some compilers provide the capability to test if certain attributes are available. This macro provides a compatibility path for other compilers.
#ifndef __has_attribute
#define __has_attribute(x) 0
#endif

// Marks methods and functions which return an object that needs to be released by the caller but whose names are not consistent with Cocoa naming rules. The recommended fix to this is to rename the methods or functions, but this macro can be used to let the clang static analyzer know of any exceptions that cannot be fixed.
// This macro is ONLY to be used in exceptional circumstances, not to annotate functions which conform to the Cocoa naming rules.
#if __has_feature(attribute_ns_returns_retained)
#define VF_RETURNS_RETAINED __attribute__((ns_returns_retained))
#else
#define VF_RETURNS_RETAINED
#endif

// Marks methods and functions which return an object that may need to be retained by the caller but whose names are not consistent with Cocoa naming rules. The recommended fix to this is to rename the methods or functions, but this macro can be used to let the clang static analyzer know of any exceptions that cannot be fixed.
// This macro is ONLY to be used in exceptional circumstances, not to annotate functions which conform to the Cocoa naming rules.
#if __has_feature(attribute_ns_returns_not_retained)
#define VF_RETURNS_NOT_RETAINED __attribute__((ns_returns_not_retained))
#else
#define VF_RETURNS_NOT_RETAINED
#endif

#ifndef VF_RETURNS_INNER_POINTER
#if __has_attribute(objc_returns_inner_pointer)
#define VF_RETURNS_INNER_POINTER __attribute__((objc_returns_inner_pointer))
#else
#define VF_RETURNS_INNER_POINTER
#endif
#endif

// Marks methods and functions which cannot be used when compiling in automatic reference counting mode.
#if __has_feature(objc_arc)
#define VF_AUTOMATED_REFCOUNT_UNAVAILABLE __attribute__((unavailable("not available in automatic reference counting mode")))
#else
#define VF_AUTOMATED_REFCOUNT_UNAVAILABLE
#endif

// Marks classes which cannot participate in the ARC weak reference feature.
#if __has_attribute(objc_arc_weak_reference_unavailable)
#define VF_AUTOMATED_REFCOUNT_WEAK_UNAVAILABLE __attribute__((objc_arc_weak_reference_unavailable))
#else
#define VF_AUTOMATED_REFCOUNT_WEAK_UNAVAILABLE
#endif

// Marks classes that must specify @dynamic or @synthesize for properties in their @implementation (property getters & setters will not be synthesized unless the @synthesize directive is used)
#if __has_attribute(objc_requires_property_definitions)
#define VF_REQUIRES_PROPERTY_DEFINITIONS __attribute__((objc_requires_property_definitions))
#else
#define VF_REQUIRES_PROPERTY_DEFINITIONS
#endif

// Decorates methods in which the receiver may be replaced with the result of the method.
#if __has_feature(attribute_ns_consumes_self)
#define VF_REPLACES_RECEIVER __attribute__((ns_consumes_self)) VF_RETURNS_RETAINED
#else
#define VF_REPLACES_RECEIVER
#endif

#if __has_feature(attribute_ns_consumed)
#define VF_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
#define VF_RELEASES_ARGUMENT
#endif

// Mark local variables of type 'id' or pointer-to-ObjC-object-type so that values stored into that local variable are not aggressively released by the compiler during optimization, but are held until either the variable is assigned to again, or the end of the scope (such as a compound statement, or method definition) of the local variable.
#ifndef VF_VALID_UNTIL_END_OF_SCOPE
#if __has_attribute(objc_precise_lifetime)
#define VF_VALID_UNTIL_END_OF_SCOPE __attribute__((objc_precise_lifetime))
#else
#define VF_VALID_UNTIL_END_OF_SCOPE
#endif
#endif

// Annotate classes which are root classes as really being root classes
#ifndef VF_ROOT_CLASS
#if __has_attribute(objc_root_class)
#define VF_ROOT_CLASS __attribute__((objc_root_class))
#else
#define VF_ROOT_CLASS
#endif
#endif

#ifndef VF_REQUIRES_SUPER
#if __has_attribute(objc_requires_super)
#define VF_REQUIRES_SUPER __attribute__((objc_requires_super))
#else
#define VF_REQUIRES_SUPER
#endif
#endif

#ifndef VF_DESIGNATED_INITIALIZER
#if __has_attribute(objc_designated_initializer)
#define VF_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
#else
#define VF_DESIGNATED_INITIALIZER
#endif
#endif

#ifndef VF_PROTOCOL_REQUIRES_EXPLICIT_IMPLEMENTATION
#if __has_attribute(objc_protocol_requires_explicit_implementation)
#define VF_PROTOCOL_REQUIRES_EXPLICIT_IMPLEMENTATION __attribute__((objc_protocol_requires_explicit_implementation))
#else
#define VF_PROTOCOL_REQUIRES_EXPLICIT_IMPLEMENTATION
#endif
#endif

#if !__has_feature(objc_instancetype)
#undef instancetype
#define instancetype id
#endif

#if !defined(VF_UNAVAILABLE)
#define VF_UNAVAILABLE UNAVAILABLE_ATTRIBUTE
#endif

#if !defined(__unsafe_unretained)
#define __unsafe_unretained
#endif

#if TARGET_OS_WIN32
#import <objc/objc.h>
#include <stdarg.h>
#include <stdint.h>
#include <limits.h>
#endif 

FOUNDATION_EXPORT double VFFoundationVersionNumber;

#if TARGET_OS_WIN32
typedef long VFInteger;
typedef unsigned long VFUInteger;

#define VFIntegerMax    LONG_MAX
#define VFIntegerMin    LONG_MIN
#define VFUIntegerMax   ULONG_MAX

#define VFINTEGER_DEFINED 1
#endif

#if __LP64__ || TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
typedef long NSInteger;
typedef unsigned long NSUInteger;
#else
typedef int NSInteger;
typedef unsigned int NSUInteger;
#endif

FOUNDATION_EXPORT void VFLog(VFString *format, ...) VF_FORMAT_FUNCTION(1,2);
FOUNDATION_EXPORT void VFLogv(VFString *format, va_list args) VF_FORMAT_FUNCTION(1,0);

enum
{
    VFOrderedAscending = -1L, VFOrderedSame, VFOrderedDescending
};
typedef VFInteger VFComparisonResult;

enum {VFNotFound = VFIntegerMax};

#if !defined(YES)
#define YES	(BOOL)1
#endif

#if !defined(NO)
#define NO	(BOOL)0
#endif

#if !defined(VF_SUPPRESS_MIN_MAX_ABS)

#if (defined(__GNUC__) || defined(__clang__)) && !defined(__STRICT_ANSI__)

#if __clang__

#define __NSX_PASTE__(A,B) A##B

#if !defined(MIN)
#define __NSMIN_IMPL__(A,B,L) ({ __typeof__(A) __NSX_PASTE__(__a,L) = (A); __typeof__(B) __NSX_PASTE__(__b,L) = (B); (__NSX_PASTE__(__a,L) < __NSX_PASTE__(__b,L)) ? __NSX_PASTE__(__a,L) : __NSX_PASTE__(__b,L); })
#define MIN(A,B) __NSMIN_IMPL__(A,B,__COUNTER__)
#endif

#if !defined(MAX)
#define __NSMAX_IMPL__(A,B,L) ({ __typeof__(A) __NSX_PASTE__(__a,L) = (A); __typeof__(B) __NSX_PASTE__(__b,L) = (B); (__NSX_PASTE__(__a,L) < __NSX_PASTE__(__b,L)) ? __NSX_PASTE__(__b,L) : __NSX_PASTE__(__a,L); })
#define MAX(A,B) __NSMAX_IMPL__(A,B,__COUNTER__)
#endif

#if !defined(ABS)
#define __NSABS_IMPL__(A,L) ({ __typeof__(A) __NSX_PASTE__(__a,L) = (A); (__NSX_PASTE__(__a,L) < 0) ? - __NSX_PASTE__(__a,L) : __NSX_PASTE__(__a,L); })
#define ABS(A) __NSABS_IMPL__(A,__COUNTER__)
#endif

#else

#if !defined(MIN)
#define MIN(A,B)	({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a < __b ? __a : __b; })
#endif

#if !defined(MAX)
#define MAX(A,B)	({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a < __b ? __b : __a; })
#endif

#if !defined(ABS)
#define ABS(A)	({ __typeof__(A) __a = (A); __a < 0 ? -__a : __a; })
#endif

#endif

#else

#if !defined(MIN)
#define MIN(A,B)	((A) < (B) ? (A) : (B))
#endif

#if !defined(MAX)
#define MAX(A,B)	((A) > (B) ? (A) : (B))
#endif

#if !defined(ABS)
#define ABS(A)	((A) < 0 ? (-(A)) : (A))
#endif

#endif

#endif

#endif
