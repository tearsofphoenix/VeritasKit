VeritasKit
==========

Lua wrapper for Objective-C, implemented most Objective-C features


TODOs

1. memory management, gc of lua;
2. support for `@property', it has been implemented, but not tested yet;
3. support for class-ivar, you can not access to ivar by name (for example, _ivarName) in 
   method block
4. full support of block, block is almost fully supported excepted some wired condition

Features

1. support most Objective-C syntax features, which is simillar to Objective-C progammers(such as @autoreleasepool);
2. support lua syntax, so we may call this Objective-Lua;
3. support new Objective-C syntax, such as literal NSDictionary, literal NSArray, literal NSNumber,
   syntax of literal NSDictionary is not the same as in Objective-C, consider the lua syntax;
4. support enumerate syntax of collections (the for-in syntax);
5. add some extensions, such as @array, @dictionary, @table to convert value between Objective-C and lua;

Known Bugs

1. memory can not be collected yet;
2. no try-catch-final, @throw implemented, but not that good, recommanded not to use this feature;
3. will not support dot-operator (.) on instance, which is my decision;

What we know

1. I have used this framework in one of my comercial project, it works well
2. Becnmark test result on iPod Touch 4, software version: 5.1.1 :
   run +[NSString stringWithUTF8String:] 100,000 times, average cost
   NSInvocation: 2.621619s
            ffi: 1.007282s
       Lua-Call: 18.348168s
   code:
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
    static NSString * const sourceCode = @"local invoke = function() local a = [NSString stringWithUTF8String:\"你好\"] [a release] end\n"
                                         "testLuaCall = function() for i=1, 100000 do invoke() end end";
    
    LuaCall(sourceCode, @"testLuaCall", nil, 0, 0, nil);
}