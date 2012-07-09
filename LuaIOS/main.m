//
//  main.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaEngineService.h"
#import "ffi.h"
#import <OpenGLES/ES1/gl.h>
#import <dlfcn.h>
#import "LuaBridgeSupportFileParser.h"

static void puts_binding(ffi_cif *cif, unsigned int *ret, void* args[],
                  FILE *stream)
{
    *ret = fputs(*(char **)args[0], stream);
}

static void test(void)
{
    ffi_cif cif;
    ffi_type *args[1];
    ffi_closure *closure;
    
    int (*bound_puts)(char *);
    int rc;

    /* Allocate closure and bound_puts */
    closure = ffi_closure_alloc(sizeof(ffi_closure), &bound_puts);
    
    if (closure)
    {
        /* Initialize the argument info vectors */
        args[0] = &ffi_type_pointer;
        
        /* Initialize the cif */
        if (ffi_prep_cif(&cif, FFI_DEFAULT_ABI, 1,
                         &ffi_type_uint, args) == FFI_OK)
        {
            /* Initialize the closure, setting stream to stdout */
            if (ffi_prep_closure_loc(closure, &cif, puts_binding,
                                     stdout, bound_puts) == FFI_OK)
            {
                rc = bound_puts("Hello World!");
                /* rc now holds the result of the call to fputs */
            }
        }
    }
    
    /* Deallocate both closure, and bound_puts */
    ffi_closure_free(closure);    
}

static void test2(void * func)
{
    ffi_cif cif;
    ffi_type *args[1];
    void *values[1];
    int s;
    int rc;
    
    /* Initialize the argument info vectors */
    args[0] = &ffi_type_uint32;
    values[0] = &s;
    
    /* Initialize the cif */
    if (ffi_prep_cif(&cif, FFI_DEFAULT_ABI, 1,
                     &ffi_type_uint, args) == FFI_OK)
    {
        s = GL_DEPTH_TEST;
        ffi_call(&cif, func, &rc, values);
    }
}

static void initialize()
{
   void *function = dlsym(RTLD_DEFAULT, "glEnable");
    printf("function pointer: %p", function);
    test2(function);
    NSString *testFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"OpenGLES.bridgesupport"];
    [LuaBridgeSupportFileParser parseFileContents: [NSString stringWithContentsOfFile: testFilePath
                                                                             encoding: NSUTF8StringEncoding
                                                                                error: NULL]];
}

int main(int argc, char *argv[])
{
    initialize();
    //test();
    printf("\t\t\n%lu  \t\t %lu\n", sizeof(unsigned long long), sizeof(long double));
    
    @autoreleasepool 
    {           
        NSString *sourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Test.v"];
        NSString *sourceCode = [NSString stringWithContentsOfFile: sourceFilePath
                                                         encoding: NSUTF8StringEncoding
                                                            error: NULL];        
        
        LuaCall(sourceCode, @"main", nil, 0, 1, nil);
    }
}
