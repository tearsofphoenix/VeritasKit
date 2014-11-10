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

@interface VeritasParserTest : XCTestCase

@end

@implementation VeritasParserTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    NSError *error = nil;
    NSString *path = [[NSBundle bundleForClass: [self class]] pathForResource: @"Test"
                                                                       ofType: @"v"];
    
    NSString *str = [[NSString alloc] initWithContentsOfFile: path
                                                    encoding: NSUTF8StringEncoding
                                                       error: &error];
    if (error)
    {
        NSLog(@"%@", error);
    }
    
    VeritasParser *parser = [[VeritasParser alloc] init];
    [parser parseString: str
                  error: &error];

    if (error)
    {
        NSLog(@"%@", error);
    }
}

@end
