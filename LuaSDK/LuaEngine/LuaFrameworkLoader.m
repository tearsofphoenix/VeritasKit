//
//  LuaFrameworkLoader.m
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaFrameworkLoader.h"
#import "XMLDocument.h"

static NSMutableDictionary *__luaLoadedFrameworks = nil;

@implementation LuaFrameworkLoader

+ (void)load
{
    if (!__luaLoadedFrameworks)
    {
        __luaLoadedFrameworks = [[NSMutableDictionary alloc] init];
    }
    
    [super load];
}

+ (void)loadFrameworkWithName:(NSString *)frameworkName
{
    NSMutableString *result = [NSMutableString string];
    NSMutableString *functionList = [NSMutableString string];
    frameworkName = @"OpenGLES";
    [functionList appendFormat: @"static const luaL_Reg __luaObjC_%@_Functions[]=\n{", frameworkName];
    
    @autoreleasepool 
    {
        NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"/OpenGLES.bridgesupport"];
        NSData *data = [NSData dataWithContentsOfFile: filePath];
        XMLDocument *document = [[XMLDocument alloc] initWithData: data];
        NSArray *array = [document evaluateXPathExpression: @"/signatures" 
                                            withNamespaces: nil];
        
        if ([array count] > 0)
        {
            XMLNode *rootNode = [array objectAtIndex: 0];
            XMLNode *nodeLooper = [rootNode firstChild];
            NSString *elementName = nil;
            while (nodeLooper)
            {
                elementName = [nodeLooper elementName];
                //                if([elementName isEqualToString: @"enum"])
                //                {
                //                    NSString *value = [nodeLooper attributeWithName: @"name"];
                //                    [result appendFormat: @"{\"%@\", %@},\n", value, value];
                //                }
                if ([elementName isEqualToString: @"function"])
                {
                    NSString *value = [nodeLooper attributeWithName: @"name"];
                    NSString *luaFunctionName = [NSString stringWithFormat: @"_luaObjC_%@", value];
                    [result appendFormat: @"static int %@(lua_State *L)\n{\n", luaFunctionName];
                    [functionList appendFormat: @"{\"%@\", %@},\n", value, luaFunctionName];
                    
                    XMLNode *argNodeLooper = [nodeLooper childWithName: @"arg"];
                    NSInteger argIndex = 1;
                    NSString *typeLooper = [argNodeLooper attributeWithName: @"type"];
                    
                    XMLNode *returnNode = [nodeLooper childWithName: @"retval"];
                    if (returnNode)
                    {
                        switch (*[[returnNode attributeWithName: @"type"] UTF8String])
                        {
                            case 'c':
                            case 'i':
                            case 's':
                            case 'l':
                            case 'q':
                            case 'C':
                            case 'I':
                            case 'S':
                            case 'L':
                            case 'Q':
                            case 'B':
                            {
                                [result appendString: @"lua_pushinteger(L, "];
                                break;
                            }
                            case 'f':
                            case 'd':
                            {
                                [result appendString: @"lua_pushnumber(L, "];
                                break;
                            }
                            case '*':
                            {
                                [result appendString: @"lua_pushstring(L, "];
                                break;
                            }
                            case '#':
                            case '@':
                            {
                                [result appendString: @"luaObjC_pushNSObject(L, "];
                                break;
                            }
                            case ':':
                            {
                                [result appendString: @"lua_pushlightuserdata(L, "];
                                break;
                            }
                            case '{':
                            {
                                //TODO
                                //
                                break;
                            }
                            case '^':
                            case '[':
                            case 'v':
                            {
                                [result appendString: @"lua_pushlightuserdata(L, "];
                                break;
                            }
                            default:
                            {
                                break;
                            }
                        }
                    }
                    
                    [result appendFormat: @"%@(", value];

                    while (argNodeLooper)
                    {
                        
                        if (typeLooper && [[argNodeLooper elementName] isEqualToString: @"arg"])
                        {
                            switch (*[typeLooper UTF8String]) 
                            {
                                case 'c':
                                case 'i':
                                case 's':
                                case 'l':
                                case 'q':
                                case 'C':
                                case 'I':
                                case 'S':
                                case 'L':
                                case 'Q':
                                case 'B':
                                {
                                    [result appendFormat: @"lua_tointeger(L, %d),\n", argIndex];
                                    break;
                                }
                                case 'f':
                                case 'd':
                                {
                                    [result appendFormat: @"lua_tonumber(L, %d),\n", argIndex];
                                    break;
                                }
                                case '*':
                                {
                                    [result appendFormat: @"lua_tostring(L, %d),\n", argIndex];
                                    break;
                                }
                                case '#':
                                case '@':
                                {
                                    [result appendFormat: @"luaObjC_checkNSObject(L, %d),\n", argIndex];
                                    break;
                                }
                                case ':':
                                {
                                    [result appendFormat: @"luaObjC_checkNSObject(L, %d),\n", argIndex];
                                    break;
                                }
                                case '{':
                                {
                                    //TODO
                                    //
                                    break;
                                }
                                case '^':
                                case '[':
                                case 'v':
                                {
                                    [result appendFormat: @"lua_touserdata(L, %d),\n", argIndex];
                                    break;
                                }
                                default:
                                {
                                    break;
                                }
                            }
                            ++argIndex;
                        }
                        argNodeLooper = [argNodeLooper nextSibling];
                        typeLooper = [argNodeLooper attributeWithName: @"type"];
                        
                    }
                    NSInteger lastIndex = [result length] - 2;
                    if([result characterAtIndex: lastIndex] == ',')
                    {
                        [result replaceCharactersInRange: NSMakeRange(lastIndex, 1) 
                                              withString: @")"];
                    }else
                    {
                        [result appendString: @")"];
                    }
                    
                    if (returnNode)
                    {
                        [result appendString: @");\n    return 1;"];
                    }else 
                    {
                        [result appendString: @";\n return 0;"];
                    }
                    
                    [result appendString: @"\n}\n"];
                }
                nodeLooper = [nodeLooper nextSibling];
            }
        }
        
        [document release];
    }
    
    [functionList appendString: @"{NULL, NULL},\n};"];
    NSLog(@"%@ \n %@", result, functionList);
}

@end
