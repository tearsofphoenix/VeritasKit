//
//  VeritasParserTest.m
//  VeritasParser
//
//  Created by Mac003 on 14/11/10.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "VeritasParser.h"
#import <PEGKit/PEGKit.h>
#import "LuaParser.h"

@interface VeritasParserTest : XCTestCase<PKTokenizerDelegate>

@end

@implementation VeritasParserTest

- (void)setUp
{
    [super setUp];
    CGAffineTransform t = CGAffineTransformMake(1, 2, 3, 4, 5, 6);
    NSLog(@"%@", NSStringFromCGAffineTransform(t));
    CGAffineTransform c = CGAffineTransformConcat(t, t);
    NSLog(@"%@", NSStringFromCGAffineTransform(c));
    c = CGAffineTransformMakeRotation(M_PI);
    NSLog(@"%@", NSStringFromCGAffineTransform(c));

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNothing
{
    
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//    NSError *error = nil;
//    NSString *path = [[NSBundle bundleForClass: [self class]] pathForResource: @"Test"
//                                                                       ofType: @"v"];
//    
//    NSString *str = [[NSString alloc] initWithContentsOfFile: path
//                                                    encoding: NSUTF8StringEncoding
//                                                       error: &error];
//    if (error)
//    {
//        NSLog(@"%@", error);
//    }
//    
//    VeritasParser *parser = [[VeritasParser alloc] init];
//    [parser parseString: str
//                  error: &error];
//
//    if (error)
//    {
//        NSLog(@"%@", error);
//    }
//}

- (void)testLuaParser {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    NSError *error = nil;
    NSString *path = [[NSBundle bundleForClass: [self class]] pathForResource: @"Test"
                                                                       ofType: @"lua"];
    
    NSString *str = [[NSString alloc] initWithContentsOfFile: path
                                                    encoding: NSUTF8StringEncoding
                                                       error: &error];
    if (error)
    {
        NSLog(@"%@", error);
    }
    
    LuaParser *parser = [[LuaParser alloc] initWithDelegate: self];
    [parser parseString: str
                  error: &error];
    
    if (error)
    {
        NSLog(@"%@", error);
    }
}

- (void)parser:(PKParser *)p didMatchVar:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchIdentifier:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchVariable:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchVariables:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchVarVariables:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchVariablesOrExpr:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchSemi:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchVariablesOrExprStmt:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchStmt:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchFunction:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchOpenParen:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchCloseParen:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchParamListOpt:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchFunc:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchElement:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}

- (void)parser:(PKParser *)p didMatchProgram:(PKAssembly *)a
{
    NSLog(@"func: %s %@", __func__, a);
}


- (void)parser:(PKParser *)p didFailToMatch:(PKAssembly *)a
{
    
}

@end
