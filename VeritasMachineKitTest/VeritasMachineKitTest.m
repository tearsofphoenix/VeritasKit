//
//  VeritasMachineKitTest.m
//  VeritasMachineKitTest
//
//  Created by tearsofphoenix on 13-2-26.
//
//

#import "VeritasMachineKitTest.h"
#import "VeritasMachineKit.h"
#import <stddef.h>

#define __S(X) @""#X
#define STRINGFY(X) __S(X)

@implementation VeritasMachineKitTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    LuaCall(@"Test.v", @"foo", nil, 0, 0, nil);
}

@end
