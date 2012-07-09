//
//  LuaBridgeSupportFileParser.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaBridgeSupportFileParser.h"
#import "XMLDocument.h"
#import "LuaBridgeInfo.h"

typedef void (^LuaBridgeNodeParserBlock)(XMLNode *node, NSMutableDictionary *result);

static LuaBridgeNodeParserBlock __LuaBridgeConstantNodeParser = (^(XMLNode *node, NSMutableDictionary *result)
                                                                {
                                                                    NSString *name = [node attributeWithName: @"name"];
                                                                    LuaBridgeInfo *info = [[LuaBridgeInfo alloc] init];
                                                                    
                                                                    [info setType: LuaBridgeConstantType];
                                                                    [info setName: name];
                                                                    
                                                                    NSDictionary *constantInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                                                                                  [node attributeWithName: @"type"], @"type", nil];
                                                                    [info setInfo: constantInfo];
                                                                    [constantInfo release];
                                                                    
                                                                    [result setObject: info
                                                                               forKey: name];
                                                                    
                                                                    [info release];
                                                                });

static LuaBridgeNodeParserBlock __LuaBridgeEnumNodeParser = (^(XMLNode *node, NSMutableDictionary *result)
                                                             {
                                                                 NSString *name = [node attributeWithName: @"name"];
                                                                 LuaBridgeInfo *info = [[LuaBridgeInfo alloc] init];
                                                                 
                                                                 [info setType: LuaBridgeEnumType];
                                                                 [info setName: name];
                                                                 
                                                                 NSDictionary *constantInfo = [[NSDictionary alloc] initWithObjectsAndKeys: 
                                                                                               [node attributeWithName: @"value"], @"value", nil];
                                                                 [info setInfo: constantInfo];
                                                                 [constantInfo release];
                                                                 
                                                                 [result setObject: info
                                                                            forKey: name];
                                                                 
                                                                 [info release];
                                                             });


static LuaBridgeNodeParserBlock __LuaBridgeFunctionNodeParser = (^(XMLNode *node, NSMutableDictionary *result)
                                                                 {
                                                                     NSString *name = [node attributeWithName: @"name"];
                                                                     LuaBridgeInfo *info = [[LuaBridgeInfo alloc] init];
                                                                     
                                                                     [info setType: LuaBridgeFunctionType];
                                                                     [info setName: name];
                                                                     
                                                                     NSMutableArray *arguments = [[NSMutableArray alloc] init];
                                                                                                   
                                                                     XMLNode *argNode = [node firstChild];
                                                                     while(argNode)
                                                                     {
                                                                         LuaBridgeArgumentInfo *argInfo = [[LuaBridgeArgumentInfo alloc] init];
                                                                         [argInfo setType: [argNode attributeWithName: @"type"]];
                                                                         [argInfo setType64: [argNode attributeWithName: @"type64"]];
                                                                         
                                                                         [arguments addObject: argInfo];
                                                                         [argInfo release];
                                                                         
                                                                         argNode = [argNode nextSibling];
                                                                     }
                                                                     
                                                                     [info setInfo: arguments];
                                                                     [arguments release];
                                                                     
                                                                     [result setObject: info
                                                                                forKey: name];
                                                                     
                                                                     [info release];
                                                                 });

static NSMutableDictionary *__LuaBridgeRegisteredNodeParsers = nil;

@implementation LuaBridgeSupportFileParser

+ (void)load
{
    if (!__LuaBridgeRegisteredNodeParsers)
    {
        __LuaBridgeRegisteredNodeParsers = [[NSMutableDictionary alloc] init];
        [__LuaBridgeRegisteredNodeParsers setObject: __LuaBridgeConstantNodeParser
                                             forKey: @"constant"];
        [__LuaBridgeRegisteredNodeParsers setObject: __LuaBridgeEnumNodeParser
                                             forKey: @"enum"];
        [__LuaBridgeRegisteredNodeParsers setObject: __LuaBridgeFunctionNodeParser
                                             forKey: @"function"];
    }
    [super load];
}

+ (NSDictionary *)parseFileContents: (NSString *)fileContents
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
                LuaBridgeNodeParserBlock block = [__LuaBridgeRegisteredNodeParsers objectForKey: typeName];
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

@end
