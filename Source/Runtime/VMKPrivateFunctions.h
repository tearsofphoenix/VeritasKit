//
//  VMKPrivateFunctions.h
//  SceneKit
//
//  Created by tearsofphoenix on 12-11-28.
//  Copyright (c) 2012年 tearsofphoenix. All rights reserved.
//

#ifndef __VMK_VMKPrivateFunctions__
#define __VMK_VMKPrivateFunctions__ 1

#define _VMKCreateInstance3(allocator, typeID, instanceName) (VMKTypeCreateInstance_(allocator, typeID, sizeof(*instanceName) - sizeof(CFRuntimeBase)))
#define _VMKCreateInstance2(typeID, instanceName) _VMKCreateInstance3(kCFAllocatorDefault, typeID, instanceName)


#define _VMKGetTypeID(class) do{\
                                    static CFTypeID typeID = _kCFRuntimeNotATypeID;\
                                    if(_kCFRuntimeNotATypeID == typeID)\
                                    {\
                                        typeID = _CFRuntimeRegisterClass(&class);\
                                    }\
                                    return typeID;\
                                } while( 0 )


#pragma mark - assert

#define _VMKAssert(condition, reason) do{\
                                            if(!(condition))\
                                            {\
                                                printf("%s %s %s %s\n", #condition, __FILE__, __func__, reason);\
                                                abort();\
                                            }\
                                        } while( 0 )

#define _VMKAssertArgument(arg) _VMKAssert(arg, "null argument")

#pragma mark - setter

#define _VMKCFSetValue(target, source) do{\
                                            if(target != source)\
                                            {\
                                                VMKRelease(target);\
                                                target = VMKRetain(source);\
                                            }\
                                         } while( 0 )

#define _VMKFinalizeField(field) do{ VMKRelease(field); field = NULL; }while( 0 )

#include "CFRuntime.h"

#endif
