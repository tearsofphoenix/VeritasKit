//
//  main.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaEngineService.h"
#import "LuaObjCInternal.h"
#import "LuaObjCProfile.h"
#import "ffi.h"
#import <objc/runtime.h>

static const char * _testString = "你好";

static void testInvocation()
{
    
    Method method = class_getClassMethod(objc_getMetaClass("NSString"), @selector(stringWithUTF8String:));

    const char *encoding = method_getTypeEncoding(method);
    
    NSMethodSignature *sig = [NSMethodSignature signatureWithObjCTypes: encoding];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature: sig];
    [invocation setTarget: [NSString class]];
    [invocation setSelector: @selector(stringWithUTF8String:)];
    [invocation setArgument: (void*)&_testString
                    atIndex: 2];
    [invocation invoke];
    NSString *returnValue = nil;
    [invocation getReturnValue: &returnValue];
    
    //printf("returnValue: %s\n", [returnValue UTF8String]);
}

static id _testIMP(id obj, SEL selector, const char *aString)
{
    return [NSString stringWithUTF8String: aString];
}

static void testFFI(void)
{
    Class metaClass = objc_getClass("NSString");
    SEL selector = @selector(stringWithUTF8String:);

    IMP impRef = class_getMethodImplementation(objc_getMetaClass("NSString"), selector);
     
    ffi_cif cif;
    ffi_type *argTypes[3];
    void *args[3];

    
    /* Initialize the argument info vectors */
    argTypes[0] = &ffi_type_pointer;
    argTypes[1] = &ffi_type_pointer;
    argTypes[2] = &ffi_type_pointer;
    
    args[0] = &metaClass;
    args[1] = &selector;
    args[2] = &_testString;
      
    /* Initialize the cif */
    if (ffi_prep_cif(&cif, FFI_DEFAULT_ABI, 3,
                     &ffi_type_pointer, argTypes) == FFI_OK)
    {
        NSString *returnValue = nil;
        ffi_call(&cif, FFI_FN(impRef), &returnValue, args);
        //printf("returnValue: %s\n", [returnValue UTF8String]);
    }
}

static void testLuaCall(void)
{
    static NSString * const sourceCode = @"local invocation = function()"
                                                                " local a = [NSString stringWithUTF8String: \"你好\"]"
                                                                " [a release]"
                                                              "end;\n"
                                          "testLuaCall = function()"
                                                            " for i = 1, 100000 do"
                                                            " invocation()"
                                                            " end end";
    LuaCall(sourceCode, @"testLuaCall", nil, 0, 0, nil);
}

int main(int argc, char *argv[])
{    
    @autoreleasepool 
    {      
        
        NSTimeInterval start_time = [NSDate timeIntervalSinceReferenceDate];
        printf("start-time: %f\n", start_time);
        
        for (NSInteger iLooper = 0; iLooper < 100000; ++iLooper)
        {
            //testInvocation();
            //testFFI();
        }
        
        //testLuaCall();
        
        NSTimeInterval end_time = [NSDate timeIntervalSinceReferenceDate];
        
        printf("end-time: %f interval: %f\n", end_time, end_time - start_time);        
        
        NSString *sourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Test.v"];
        NSString *sourceCode = [NSString stringWithContentsOfFile: sourceFilePath
                                                         encoding: NSUTF8StringEncoding
                                                            error: NULL];        
        
        LuaCall(sourceCode, @"main", nil, 0, 1, nil);
    }
}
