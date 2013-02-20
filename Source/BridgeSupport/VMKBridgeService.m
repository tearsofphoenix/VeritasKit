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
#import <dlfcn.h>
#import <objc/runtime.h>

#pragma mark - parser support

typedef void (* VMKBridgeNodeParserBlock)(XMLNode *node, NSMutableDictionary *result);

static void _luaBridgeConstantNodeParser(XMLNode *node, NSMutableDictionary *result)
{
    NSString *name = [node attributeWithName: @"name"];
    VMKBridgeInfo *info = [[VMKBridgeInfo alloc] init];
    
    [info setType: VMKBridgeConstantType];
    [info setName: name];
    
    NSMutableDictionary *constantInfo = [[NSMutableDictionary alloc] init];
    NSString *type = [node attributeWithName: @"type"];
    [constantInfo setObject: type
                     forKey: @"type"];
    
    switch(*[type UTF8String])
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
            NSInteger *address = dlsym(RTLD_DEFAULT, [name UTF8String]);
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
            CGFloat * address = dlsym(RTLD_DEFAULT, [name UTF8String]);
            if (address)
            {
                [constantInfo setObject: @(*address)
                                 forKey: @"value"];
            }
            break;
        }
        case _C_ID:
        {
            id * address = dlsym(RTLD_DEFAULT, [name UTF8String]);
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
               forKey: name];
    
    [info release];
}

static void _luaBridgeEnumNodeParser(XMLNode *node, NSMutableDictionary *result)
{
    NSString *name = [node attributeWithName: @"name"];
    VMKBridgeInfo *info = [[VMKBridgeInfo alloc] init];
    
    [info setType: VMKBridgeEnumType];
    [info setName: name];
    
    NSString *value = [node attributeWithName: @"value"];
    if (value)
    {
        [info setInfo: @{@"value" : value}];
    }
    
    [result setObject: info
               forKey: name];
    
    [info release];
}


static void _luaBridgeFunctionNodeParser(XMLNode *node, NSMutableDictionary *result)
{
    NSString *name = [node attributeWithName: @"name"];
    VMKBridgeInfo *info = [[VMKBridgeInfo alloc] init];
    
    [info setType: VMKBridgeFunctionType];
    [info setName: name];
    
    NSMutableDictionary *functionInfos = [[NSMutableDictionary alloc] init];
    NSMutableArray *arguments = [[NSMutableArray alloc] init];
    
    XMLNode *argNode = [node firstChild];
    NSString *elementnameLooper = nil;
    
    while(argNode)
    {
        elementnameLooper = [argNode elementName];
        if ([elementnameLooper isEqualToString: @"arg"])
        {
            VMKBridgeArgumentInfo *argInfo = [[VMKBridgeArgumentInfo alloc] init];
            [argInfo setType: [argNode attributeWithName: @"type"]];
            [argInfo setType64: [argNode attributeWithName: @"type64"]];
            
            [arguments addObject: argInfo];
            [argInfo release];
        }
        
        if ([elementnameLooper isEqualToString: @"retval"])
        {
            [functionInfos setObject: [argNode attributeWithName: @"type"]
                              forKey: elementnameLooper];
        }
        
        argNode = [argNode nextSibling];
    }
    
    [functionInfos setObject: arguments
                      forKey: @"arg"];
    [arguments release];
    
    [info setInfo: functionInfos];
    [functionInfos release];
    
    [result setObject: info
               forKey: name];
    
    [info release];
};

static CFMutableDictionaryRef __VMKBridgeRegisteredNodeParsers = NULL;

static NSDictionary *VMKBridgeSupportParseFileContents(NSString *fileContents)
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    @autoreleasepool
    {
        XMLDocument *document = [[XMLDocument alloc] initWithData: [fileContents dataUsingEncoding: NSUTF8StringEncoding]];
        NSArray *signaturesNodes = [document evaluateXPathExpression: @"/signatures"
                                                      withNamespaces: nil];
        if ([signaturesNodes count] > 0)
        {
            XMLNode *signatureNode = [signaturesNodes objectAtIndex: 0];
            XMLNode *nodeLooper = [signatureNode firstChild];
            while (nodeLooper)
            {
                NSString *typeName = [nodeLooper elementName];
                VMKBridgeNodeParserBlock block = [(id)CFDictionaryGetValue(__VMKBridgeRegisteredNodeParsers, typeName) pointerValue];
                if (block)
                {
                    block(nodeLooper, result);
                }
                
                nodeLooper = [nodeLooper nextSibling];
            }
        }
        
        [document release];
    }
    
    NSDictionary *returnValue = [NSDictionary dictionaryWithDictionary: result];
    [result release];
    
    return returnValue;
}


#pragma mark - service

static CFMutableDictionaryRef __registeredFrameworks = nil;

@implementation VMKBridgeService

+ (void)initialize
{
    @autoreleasepool
    {
        if (!__VMKBridgeRegisteredNodeParsers)
        {
            __VMKBridgeRegisteredNodeParsers = (CFMutableDictionaryRef)[[NSMutableDictionary alloc] initWithCapacity: 3];
            
            CFDictionaryAddValue(__VMKBridgeRegisteredNodeParsers, @"constant", [NSValue valueWithPointer: _luaBridgeConstantNodeParser]);
            CFDictionaryAddValue(__VMKBridgeRegisteredNodeParsers, @"enum", [NSValue valueWithPointer: _luaBridgeEnumNodeParser]);
            CFDictionaryAddValue(__VMKBridgeRegisteredNodeParsers, @"function", [NSValue valueWithPointer: _luaBridgeFunctionNodeParser]);
        }
    }
    
}

- (id)init
{
    if ((self = [super init]))
    {
        __registeredFrameworks = (CFMutableDictionaryRef)[[NSMutableDictionary alloc] init];
    }
    
    return self;
}

static VMKBridgeService *s_SharedService = nil;

+ (id)sharedService
{
    if (!s_SharedService)
    {
        s_SharedService = [[[self class] alloc] init];
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
            CFDictionaryAddValue(__registeredFrameworks, frameworkName, VMKBridgeSupportParseFileContents( bridgeFileContent ));
        }
    }
}

- (void)resolveName: (NSString *)name
          intoState: (VMKLuaStateRef)state
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

