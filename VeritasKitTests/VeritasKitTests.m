//
//  VeritasKitTests.m
//  VeritasKitTests
//
//  Created by Mac003 on 14-6-24.
//
//

#import <XCTest/XCTest.h>
#import "VeritasMachineKit.h"

@interface VeritasKitTests : XCTestCase

@end

@implementation VeritasKitTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    NSString *sourceCode = (@"main = function()"
                            "           print('hello, world!')"
                            "        end");
    
    LuaCall(sourceCode, @"main", nil, 0, 0, nil);
}

@end
