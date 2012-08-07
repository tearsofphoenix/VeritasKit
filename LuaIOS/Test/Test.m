//
//  Test.m
//  LuaIOS
//
//  Created by tearsofphoenix on 7/24/12.
//
//

#import "Test.h"

@implementation Test

- (void)dealloc
{
    printf("in function: %s line: %d\n", __PRETTY_FUNCTION__, __LINE__);
    
    [super dealloc];
}

@end
