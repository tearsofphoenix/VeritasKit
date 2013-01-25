//
//  VMKBridgeService.m
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKBridgeService.h"
#import "VMKBridgeInfo.h"
#import "XMLDocument.h"
#include "VMKInternal.h"
#include "CFRuntime.h"
#include "VMKClass.h"
#import <dlfcn.h>
#import <objc/runtime.h>

#pragma mark - parser support

typedef void (* VMKBridgeNodeParserBlock)(VMKXMLNodeRef node, NSMutableDictionary *result);

static void _luaBridgeConstantNodeParser(VMKXMLNodeRef node, NSMutableDictionary *result)
{
    const char *name = VMKXMLNodeGetAttributeWithName(node, "name");
    VMKBridgeInfo *info = [[VMKBridgeInfo alloc] init];
    
    [info setType: VMKBridgeConstantType];
    [info setName: @(name)];
    
    NSMutableDictionary *constantInfo = [[NSMutableDictionary alloc] init];
    const char *type = VMKXMLNodeGetAttributeWithName(node, "type");
    [constantInfo setObject: @(type)
                     forKey: @"type"];
    
    switch(*type)
    {
        case _C_CHR:
        case _C_INT:
        case _C_SHT:
        case _C_LNG:
        case _C_LNG_LNG:
        case _C_UCHR:
        case _C_UINT:
        case _C_USHT:
        case _C_ULNG:
        case _C_ULNG_LNG:
        case _C_BOOL:
        {
            NSInteger *address = dlsym(RTLD_DEFAULT, name);
            if (address)
            {
                [constantInfo setObject: @(*address)
                                 forKey: @"value"];
            }
            break;
        }
        case _C_FLT:
        case _C_DBL:
        {
            CGFloat * address = dlsym(RTLD_DEFAULT, name);
            if (address)
            {
                [constantInfo setObject: @(*address)
                                 forKey: @"value"];
            }
            break;
        }
        case _C_ID:
        {
            id * address = dlsym(RTLD_DEFAULT, name);
            if (address && *address)
            {
                [constantInfo setObject: *address
                                 forKey: @"value"];
            }
            break;
        }
        case _C_STRUCT_B:
        {
            //TODO
            //
        }
        default:
        {
            break;
        }
    }
    
    [info setInfo: constantInfo];
    [constantInfo release];
    
    [result setObject: info
               forKey: @(name)];
    
    [info release];
}

static void _luaBridgeEnumNodeParser(VMKXMLNodeRef node, NSMutableDictionary *result)
{
    const char *name = VMKXMLNodeGetAttributeWithName(node, "name");
    VMKBridgeInfo *info = [[VMKBridgeInfo alloc] init];
    
    [info setType: VMKBridgeEnumType];
    [info setName: @(name)];
    
    const char *value = VMKXMLNodeGetAttributeWithName(node, "value");
    if (value)
    {
        [info setInfo: @{@"value" : @(value)}];
    }
    
    [result setObject: info
               forKey: @(name)];
    
    [info release];
}


static void _luaBridgeFunctionNodeParser(VMKXMLNodeRef node, NSMutableDictionary *result)
{
    const char *name = VMKXMLNodeGetAttributeWithName(node, "name");
    VMKBridgeInfo *info = [[VMKBridgeInfo alloc] init];
    
    [info setType: VMKBridgeFunctionType];
    [info setName: @(name)];
    
    NSMutableDictionary *functionInfos = [[NSMutableDictionary alloc] init];
    NSMutableArray *arguments = [[NSMutableArray alloc] init];
    
    VMKXMLNodeRef argNode = VMKXMLNodeGetFirstChild(node);
    const char *elementnameLooper = NULL;
    
    while(argNode)
    {
        elementnameLooper = VMKXMLNodeGetElementName(argNode);
        if (VMKCStringEqual(elementnameLooper, "arg"))
        {
            VMKBridgeArgumentInfo *argInfo = [[VMKBridgeArgumentInfo alloc] init];
            [argInfo setType: @(VMKXMLNodeGetAttributeWithName(argNode, "type"))];
            [argInfo setType64: @(VMKXMLNodeGetAttributeWithName(argNode, "type64") ?: "")];
            
            [arguments addObject: argInfo];
            [argInfo release];
        }
        
        if (VMKCStringEqual(elementnameLooper, "retval"))
        {
            [functionInfos setObject: @(VMKXMLNodeGetAttributeWithName(argNode, "type"))
                              forKey: @(elementnameLooper)];
        }
        
        argNode = VMKXMLNodeGetNextSibling(argNode);
    }
    
    [functionInfos setObject: arguments
                      forKey: @"arg"];
    [arguments release];
    
    [info setInfo: functionInfos];
    [functionInfos release];
    
    [result setObject: info
               forKey: @(name)];
    
    [info release];
};

static CFMutableDictionaryRef __VMKBridgeRegisteredNodeParsers = NULL;

static NSDictionary *VMKBridgeSupportParseFileContents(NSString *fileContents)
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    @autoreleasepool
    {
        VMKXMLDocumentRef document = VMKXMLDocumentCreateWithData( (CFDataRef)[fileContents dataUsingEncoding: NSUTF8StringEncoding]);
        NSArray *signaturesNodes = (NSArray *)VMKXMLDocumentEvaluateXPathExpression(document, "/signatures", NULL);
        
        if ([signaturesNodes count] > 0)
        {
            VMKXMLNodeRef signatureNode = (VMKXMLNodeRef)[signaturesNodes objectAtIndex: 0];
            VMKXMLNodeRef nodeLooper = VMKXMLNodeGetFirstChild(signatureNode);
            while (nodeLooper)
            {
                const char *typeName = VMKXMLNodeGetElementName(nodeLooper);
                
                VMKBridgeNodeParserBlock block = CFDictionaryGetValue(__VMKBridgeRegisteredNodeParsers, typeName);
                
                if (block)
                {
                    block(nodeLooper, result);
                }
                
                nodeLooper = VMKXMLNodeGetNextSibling(nodeLooper);
            }
        }
        
        //[document release];
    }
    
    NSDictionary *returnValue = [NSDictionary dictionaryWithDictionary: result];
    [result release];
    
    return returnValue;
}


#pragma mark - service

static CFMutableDictionaryRef __registeredFrameworks = nil;

@implementation VMKBridgeService

- (id)init
{
    if ((self = [super init]))
    {
        __VMKBridgeRegisteredNodeParsers = CFDictionaryCreateMutable(NULL, 3, &kVMKCStringDictionaryKeyCallBacks, NULL);
        
        CFDictionaryAddValue(__VMKBridgeRegisteredNodeParsers, "constant", _luaBridgeConstantNodeParser);
        CFDictionaryAddValue(__VMKBridgeRegisteredNodeParsers, "enum", _luaBridgeEnumNodeParser);
        CFDictionaryAddValue(__VMKBridgeRegisteredNodeParsers, "function", _luaBridgeFunctionNodeParser);

        __registeredFrameworks = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    
    return self;
}

static VMKBridgeService *s_SharedService = nil;

+ (id)sharedService
{
    if (!s_SharedService)
    {
        s_SharedService = [[self alloc] init];
    }
    
    return s_SharedService;
}

- (void)importFramework: (NSString *)frameworkName
{
    
    if (! CFDictionaryContainsKey(__registeredFrameworks, frameworkName) )
    {
        NSString *bridgeFilePath = [[NSBundle bundleForClass: [self class]] pathForResource: frameworkName
                                                                                     ofType: @"bridgesupport"];
        NSError *error = nil;
        NSString *bridgeFileContent = [NSString stringWithContentsOfFile: bridgeFilePath
                                                                encoding: NSUTF8StringEncoding
                                                                   error: &error];
        if (error)
        {
#if DEBUG
            //NSLog(@"in func error: %@ framework name: %@", error, frameworkName);
#endif
        }else
        {
            CFDictionarySetValue(__registeredFrameworks, frameworkName, VMKBridgeSupportParseFileContents( bridgeFileContent ));
        }
    }
}

- (void)resolveName: (NSString *)name
          intoState: (struct lua_State *)state
{
    for (NSDictionary *framework in [(NSDictionary *)__registeredFrameworks allValues])
    {
        VMKBridgeInfo *info = CFDictionaryGetValue((CFDictionaryRef)framework, name);
        if (info)
        {
            [info resolveIntoLuaState: state];
            break;
        }
    }
}

@end

struct __VMKBridgeService
{
    CFRuntimeBase base;
    
};


static CFStringRef _VMKBridgeServiceCFCopyDebugDescription(CFTypeRef cf)
{
    return CFStringCreateWithFormat(CFGetAllocator(cf), NULL, CFSTR("<VMKBridgeService %p>"), cf);
}
static CFStringRef _VMKBridgeServiceCFCopyFormatDescription(CFTypeRef cf, CFDictionaryRef formatOptions)
{
    return CFStringCreateWithFormat(CFGetAllocator(cf), formatOptions, CFSTR("<VMKBridgeService %p>"), cf);
}
static Boolean _VMKBridgeServiceCFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
    return cf1 == cf2;
}
static void _VMKBridgeServiceCFFinalize(CFTypeRef cf)
{
    //Done
}

static CFHashCode _VMKBridgeServiceCFHash(CFTypeRef cf)
{
    return (CFHashCode)cf;
}
static void _VMKBridgeServiceCFInit(CFTypeRef cf)
{
    
}
static CFRuntimeClass kVMKBridgeServiceContextClass =
{
    .version = 0,
    .className = "VMKBridgeService",
    .init = _VMKBridgeServiceCFInit,
    .copy = NULL,
    .finalize = _VMKBridgeServiceCFFinalize,
    .equal = _VMKBridgeServiceCFEqual,
    .hash = _VMKBridgeServiceCFHash,
    .copyFormattingDesc = _VMKBridgeServiceCFCopyFormatDescription,
    .copyDebugDesc = _VMKBridgeServiceCFCopyDebugDescription,
    
};
CFTypeID VMKBridgeServiceGetTypeID(void)
{
    _VMKGetTypeID(kVMKBridgeServiceContextClass);
}

VMKBridgeServiceRef sSharedService = NULL;

VMKBridgeServiceRef VMKBridgeServiceGetSharedService(void)
{
    if (!sSharedService)
    {
        sSharedService = _VMKCreateInstance2(VMKBridgeServiceGetTypeID(), sSharedService);
        
        if (!__VMKBridgeRegisteredNodeParsers)
        {
            __VMKBridgeRegisteredNodeParsers = CFDictionaryCreateMutable(NULL, 3, &kCFTypeDictionaryKeyCallBacks, NULL);
            
            CFDictionaryAddValue(__VMKBridgeRegisteredNodeParsers, @"constant", _luaBridgeConstantNodeParser);
            CFDictionaryAddValue(__VMKBridgeRegisteredNodeParsers, @"enum", _luaBridgeEnumNodeParser);
            CFDictionaryAddValue(__VMKBridgeRegisteredNodeParsers, @"function", _luaBridgeFunctionNodeParser);
        }

    }
    
    return sSharedService;
}

void VMKBridgeServiceImportFrameworkWithName(VMKBridgeServiceRef service, CFStringRef frameworkName)
{
//    if (! CFDictionaryContainsKey(__registeredFrameworks, frameworkName) )
//    {
//        NSString *bridgeFilePath = [[NSBundle bundleForClass: [self class]] pathForResource: frameworkName
//                                                                                     ofType: @"bridgesupport"];
//        NSError *error = nil;
//        NSString *bridgeFileContent = [NSString stringWithContentsOfFile: bridgeFilePath
//                                                                encoding: NSUTF8StringEncoding
//                                                                   error: &error];
//        if (error)
//        {
//#if DEBUG
//            //NSLog(@"in func error: %@ framework name: %@", error, frameworkName);
//#endif
//        }else
//        {
//            CFDictionaryAddValue(__registeredFrameworks, frameworkName, VMKBridgeSupportParseFileContents( bridgeFileContent ));
//        }
//    }
}

void VMKBridgeServiceResolveNameIntoState(VMKBridgeServiceRef service, CFStringRef name, struct lua_State *state)
{
    for (NSDictionary *framework in [(NSDictionary *)__registeredFrameworks allValues])
    {
        VMKBridgeInfo *info = CFDictionaryGetValue((CFDictionaryRef)framework, name);
        if (info)
        {
            [info resolveIntoLuaState: state];
            break;
        }
    }
}

