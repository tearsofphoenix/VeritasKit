//
//  VMKInternal.h
//  freetype-gles
//
//  Created by tearsofphoenix on 13-1-16.
//  Copyright (c) 2013年 tearsofphoenix. All rights reserved.
//

#ifndef __VMK_VMKInternal__
#define __VMK_VMKInternal__ 1

#include <CoreFoundation/CFBase.h>

CF_EXPORT void *VMKTypeCreateInstance_(CFAllocatorRef allocator, CFTypeID typeID, CFIndex extraSize);

#define _VMKGetTypeID(class) do{\
                                    static CFTypeID typeID = _kCFRuntimeNotATypeID;\
                                    if(_kCFRuntimeNotATypeID == typeID)\
                                    {\
                                        typeID = _CFRuntimeRegisterClass(&class);\
                                    }\
                                    return typeID;\
                                } while( 0 )


#define _VMKCreateInstance3(allocator, typeID, instanceName) (VMKTypeCreateInstance_(allocator, typeID, sizeof(*instanceName) - sizeof(CFRuntimeBase)))

#define _VMKCreateInstance2(typeID, instanceName) _VMKCreateInstance3(kCFAllocatorDefault, typeID, instanceName)

#define _VMKFianalize(target) do{\
                                    if (target)\
                                    {\
                                        CFRelease(target);\
                                        target = NULL;\
                                    }\
                                }while( 0 )

#define _VMKCFSetValue(target, src) do{\
                                          if(target)\
                                          {\
                                             CFRelease(target);\
                                          }\
                                          target = src;\
                                          if(target)\
                                          {\
                                             CFRetain(target);\
                                          }\
                                      }while( 0 )

#define VMKCStringEqual(str1, str2) (!strcmp(str1, str2))

#endif
