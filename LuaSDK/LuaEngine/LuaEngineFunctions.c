//
//  LuaEngineFunctions.c
//  AZenecaExhibit
//
//  Created by tearsofphoenix on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "luaconf.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

FILE *g_luaOutputFilePointer = NULL;

int LuaEngine_fflush(void);
int LuaEngine_fflush(void)
{
    int returnValue = fflush(g_luaOutputFilePointer);    
    return  returnValue;
}

size_t LuaEngine_fwrite( const void * ptr, size_t size, size_t count);
size_t LuaEngine_fwrite( const void * ptr, size_t size, size_t count)
{
    return fwrite(ptr, size, count, g_luaOutputFilePointer);
}


int LuaEngine_fprintf(FILE* file, const char * format, ...);
int LuaEngine_fprintf(FILE* file, const char * format, ...)
{
    va_list args;
    va_start( args, format );
    printf(format, args);
    int returnValue = fprintf( g_luaOutputFilePointer, format, args);
    va_end( args );
    
    return returnValue;
}