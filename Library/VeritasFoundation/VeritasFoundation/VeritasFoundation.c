//
//  VeritasFoundation.m
//  VeritasFoundation
//
//  Created by Lei on 12/28/14.
//  Copyright (c) 2014 Lei. All rights reserved.
//

#include "VeritasFoundation.h"
#include <stdio.h>

void VFLog(const char*format, ...)
{
    va_list ap;
    va_start(ap, format);
    
    VFLogv(format, ap);
    
    va_end(ap);
}

void VFLogv(const char* format, va_list args)
{
    vprintf(format, args);
}