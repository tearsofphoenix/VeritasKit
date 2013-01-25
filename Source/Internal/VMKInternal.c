//
//  VMKInternal.c
//  freetype-gles
//
//  Created by tearsofphoenix on 13-1-16.
//  Copyright (c) 2013年 tearsofphoenix. All rights reserved.
//

#include "VMKInternal.h"
#include "CFRuntime.h"
#include <stdio.h>

void *VMKTypeCreateInstance_(CFAllocatorRef allocator, CFTypeID typeID, CFIndex extraSize)
{
    if(extraSize > UINT32_MAX)
    {
        printf("%s %s Failed to create instance of type %li. Extra size too large", __FILE__, __func__, extraSize);
    }
    
    return (void *)_CFRuntimeCreateInstance(allocator, typeID, extraSize, NULL);
}