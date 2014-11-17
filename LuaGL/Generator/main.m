//
//  main.m
//  Generator
//
//  Created by Mac003 on 14/11/17.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString *content = [[NSString alloc] initWithContentsOfFile: @"./gl.txt"
                                                            encoding: NSUTF8StringEncoding
                                                               error: NULL];
        NSArray *lines = [content componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]];
        NSMutableString *rest = [[NSMutableString alloc] init];
        NSString *prefix = @"GL_API";
        NSInteger preLen = [prefix length];
        
        NSMutableArray *glFuncNames = [NSMutableArray arrayWithCapacity: [lines count]];
        NSCharacterSet *whiteSpaceSet = [NSCharacterSet whitespaceCharacterSet];
        
        for (NSString *lLooper in lines)
        {
            @autoreleasepool
            {
                if ([lLooper hasPrefix: prefix])
                {
                    NSRange range = [lLooper rangeOfString: @"gl\\w+"
                                                   options: NSRegularExpressionSearch];
                    
                    NSString *returnString = [lLooper substringWithRange: NSMakeRange(preLen, range.location - 1 - preLen)];
                    
                    returnString = [returnString stringByTrimmingCharactersInSet: whiteSpaceSet];
                    
                    NSString *funcName = [lLooper substringWithRange: range];
                    
                    range = [lLooper rangeOfString: @"\\(.+\\)"
                                           options: NSRegularExpressionSearch];
                    
                    NSString *argStr = [lLooper substringWithRange: NSMakeRange(range.location + 1, range.length - 2)];
                    
                    NSLog(@"-%@-%@-%@-", returnString, funcName, argStr);
                    
                    //record func name
                    [glFuncNames addObject: funcName];
                    
                    //func declearation
                    //
                    [rest appendFormat: @"static int lua_%@(lua_State *L)\n{\n", funcName];
                    
                    NSMutableString *callString = [NSMutableString string];
                    NSMutableArray *convertedArgString = [NSMutableArray array];
                    
                    //func body
                    if ([argStr length] == 0 || [argStr isEqualToString: @"void"])
                    {
                        //no arguments
                        [callString appendFormat: @"    %@();\n", funcName];
                    }else
                    {
                        NSArray *argParts = [argStr componentsSeparatedByString: @","];
                        [argParts enumerateObjectsUsingBlock: (^(NSString *obj, NSUInteger idx, BOOL *stop)
                                                               {
                                                                   idx = idx + 1;
                                                                   
                                                                   @autoreleasepool
                                                                   {
                                                                       NSString *al = [obj stringByTrimmingCharactersInSet: whiteSpaceSet];
                                                                       NSRange ar = [al rangeOfString: @"\\w+$"
                                                                                              options: NSRegularExpressionSearch];
                                                                       NSString *argName = [al substringWithRange: ar];
                                                                       NSString *argType = [[al substringToIndex: ar.location] stringByTrimmingCharactersInSet: whiteSpaceSet];
                                                                       
                                                                       [convertedArgString addObject: argName];
                                                                       
                                                                       if ([argType isEqualToString: @"GLclampf"]
                                                                         ||[argType isEqualToString: @"GLfloat"])
                                                                       {
                                                                           [callString appendFormat: @"    %@ %@ = lua_tonumber(L, %ld);\n", argType, argName, (long)idx];
                                                                           
                                                                       }else if ([argType isEqualToString: @"GLbitfield"]
                                                                           || [argType isEqualToString: @"GLboolean"]
                                                                           || [argType isEqualToString: @"GLbyte"]
                                                                           || [argType isEqualToString: @"GLenum"]
                                                                           || [argType isEqualToString: @"GLint"]
                                                                           || [argType isEqualToString: @"GLshort"]
                                                                           || [argType isEqualToString: @"GLsizei"]
                                                                           || [argType isEqualToString: @"GLubyte"]
                                                                           || [argType isEqualToString: @"GLuint"]
                                                                           || [argType isEqualToString: @"GLushort"]
                                                                           || [argType isEqualToString: @"GLchar"]
                                                                           || [argType isEqualToString: @"GLclampx"]
                                                                           || [argType isEqualToString: @"GLfixed"]
                                                                           || [argType isEqualToString: @"GLhalf"]
                                                                                 )
                                                                       {
                                                                           [callString appendFormat: @"    %@ %@ = (int)lua_tointeger(L, %ld);\n", argType, argName, (long)idx];
                                                                           
                                                                       }else if([argType isEqualToString: @"GLint64"]
                                                                           || [argType isEqualToString: @"GLuint64"]
                                                                           || [argType isEqualToString: @"GLintptr"]
                                                                           || [argType isEqualToString: @"GLsizeiptr"]
                                                                        )
                                                                       {
                                                                           [callString appendFormat: @"    %@ %@ = lua_tointeger(L, %ld);\n", argType, argName, (long)idx];
                                                                           
                                                                       }else if ([argType isEqualToString: @"const GLubyte*"]
                                                                                 || [argType isEqualToString: @"GLvoid*"])
                                                                       {
                                                                           [callString appendFormat: @"    %@ %@ = lua_tostring(L, %ld);\n", argType, argName, (long)idx];
                                                                           
                                                                       }else if ([argType isEqualToString: @"GLsync"])
                                                                       {
                                                                           [callString appendFormat: @"    %@ %@ = lua_touserdata(L, %ld);\n", argType, argName, (long)idx];
                                                                       }
                                                                   }
                                                               })];
                    }
                    
                    
                    //return count
                    if ([returnString isEqualToString: @"void"])
                    {
                        //no return value
                        [callString appendFormat: @"    %@(%@);\n", funcName, [convertedArgString componentsJoinedByString: @", "]];
                        [rest appendString: callString];
                        [rest appendString: @"    return 0;\n}\n\n"];
                        
                    }else if ([returnString isEqualToString: @"GLenum"]
                              || [returnString isEqualToString: @"GLuint"]
                              || [returnString isEqualToString: @"int"]
                              || [returnString isEqualToString: @"GLboolean"]
                              || [returnString isEqualToString: @"GLint"]
                              )
                    {
                        [callString appendFormat: @"    %@ ret = %@(%@);\n", returnString, funcName, [convertedArgString componentsJoinedByString: @", "]];
                        [callString appendFormat: @"    lua_pushinteger(L, ret);\n"];
                        [rest appendString: callString];
                        [rest appendString: @"    return 1;\n}\n\n"];
                        
                    }else if ([returnString isEqualToString: @"const GLubyte*"]
                              || [returnString isEqualToString: @"GLvoid*"]
                              || [returnString isEqualToString: @"GLsync"])
                    {
                        [callString appendFormat: @"    %@ ret = %@(%@);\n", returnString, funcName, [convertedArgString componentsJoinedByString: @", "]];
                        [callString appendFormat: @"    lua_pushlightuserdata(L, ret);\n"];
                        [rest appendString: callString];
                        [rest appendString: @"    return 1;\n}\n\n"];
                    }
                }
            }
        }
        
        [rest appendString: @"\n\n"];
        [rest appendString: @"static const luaL_Reg luagl_func = {\n"];
        for (NSString *nLooper in glFuncNames)
        {
            [rest appendFormat: @"{\"%@\", lua_%@}\n", [nLooper substringFromIndex: 2], nLooper];
        }
        
        [rest appendString: @"}\n"];
        
        [rest writeToFile: @"./result.c"
               atomically: YES
                 encoding: NSUTF8StringEncoding
                    error: NULL];
    }
    return 0;
}
