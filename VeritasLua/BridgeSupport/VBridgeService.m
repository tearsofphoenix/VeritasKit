//
//  VBridgeService.m
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VBridgeService.h"
#import "LuaBridgeInfo.h"
#import "XMLDocument.h"
#import <dlfcn.h>
#import <objc/runtime.h>

#pragma mark - parser support

typedef void (* LuaBridgeNodeParserBlock)(XMLNode *node, NSMutableDictionary *result);

static void _luaBridgeConstantNodeParser(XMLNode *node, NSMutableDictionary *result)
{
    NSString *name = [node attributeWithName: @"name"];
    LuaBridgeInfo *info = [[LuaBridgeInfo alloc] init];
    
    [info setType: LuaBridgeConstantType];
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
                [constantInfo setObject: [NSNumber numberWithInteger: *address]
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
                [constantInfo setObject: [NSNumber numberWithDouble: *address]
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
    LuaBridgeInfo *info = [[LuaBridgeInfo alloc] init];
    
    [info setType: LuaBridgeEnumType];
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
    LuaBridgeInfo *info = [[LuaBridgeInfo alloc] init];
    
    [info setType: LuaBridgeFunctionType];
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
            LuaBridgeArgumentInfo *argInfo = [[LuaBridgeArgumentInfo alloc] init];
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

static NSMutableDictionary *__LuaBridgeRegisteredNodeParsers = nil;

static NSDictionary *LuaBridgeSupportParseFileContents(NSString *fileContents)
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
                LuaBridgeNodeParserBlock block = [(id)CFDictionaryGetValue((CFDictionaryRef)__LuaBridgeRegisteredNodeParsers, typeName) pointerValue];
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

static NSMutableDictionary *__registeredFrameworks = nil;

@implementation VBridgeService

+ (void)load
{
    @autoreleasepool
    {
        if (!__LuaBridgeRegisteredNodeParsers)
        {
            __LuaBridgeRegisteredNodeParsers = [[NSMutableDictionary alloc] init];
            
            [__LuaBridgeRegisteredNodeParsers setObject: [NSValue valueWithPointer: _luaBridgeConstantNodeParser]
                                                 forKey: @"constant"];
            [__LuaBridgeRegisteredNodeParsers setObject: [NSValue valueWithPointer: _luaBridgeEnumNodeParser]
                                                 forKey: @"enum"];
            [__LuaBridgeRegisteredNodeParsers setObject: [NSValue valueWithPointer: _luaBridgeFunctionNodeParser]
                                                 forKey: @"function"];
        }
    }
    
    [super registerService: self];
}

+ (id)identity
{
    return VBridgeServiceIdentifier;
}

- (id)init
{
    if ((self = [super init]))
    {
        __registeredFrameworks = [[NSMutableDictionary alloc] init];
        
        [self initServerProcessors];
    }
    
    return self;
}

- (void)initServerProcessors
{
    [self registerBlock: (^(VCallbackBlock callback, NSArray *arguments)
                          {
                              NSString *frameworkName = [arguments objectAtIndex: 0];
                              
                              if (! CFDictionaryGetValue((CFDictionaryRef)__registeredFrameworks, frameworkName) )
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
                                      [__registeredFrameworks setObject: LuaBridgeSupportParseFileContents( bridgeFileContent )
                                                                 forKey: frameworkName];
                                  }
                              }
                          })
              forAction: VBridgeServiceImportFrameworkAction];
    
    [self registerBlock: (^(VCallbackBlock callback, NSArray *arguments)
                          {
                              NSString *name = [arguments objectAtIndex: 0];
                              struct lua_State *state = [[arguments objectAtIndex: 1] pointerValue];
                              
                              for (NSDictionary *framework in [__registeredFrameworks allValues])
                              {
                                  LuaBridgeInfo *info = CFDictionaryGetValue((CFDictionaryRef)framework, name);
                                  if (info)
                                  {
                                      [info resolveIntoLuaState: state];
                                      break;
                                  }
                              }
                          })
              forAction: VBridgeServiceResolveNameIntoStateAction];
}

@end

NSString * const VBridgeServiceIdentifier = @"com.veritas.service.bridge-support";

NSString * const VBridgeServiceImportFrameworkAction = @"lua-engine.action.importFramework";

NSString * const VBridgeServiceResolveNameIntoStateAction = @"lua-engine.action.resolveNameIntoState";

