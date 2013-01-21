//
//  NSMethodSignature+argumentsEncodings.m
//  LuaIOS
//
//  Created by LeixSnake on 7/12/12.
//
//

#import "NSMethodSignature+argumentsEncodings.h"

@implementation NSMethodSignature (argumentsEncodings)

- (NSArray *)argumentsEncodings
{
    NSUInteger argumentCount = [self numberOfArguments];
    if (argumentCount > 0)
    {
        NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity: argumentCount];
        for (NSUInteger iLooper = 0; iLooper < argumentCount; ++iLooper)
        {
            [result addObject: @( [self getArgumentTypeAtIndex: iLooper] )];
        }
        return [result autorelease];
    }
    
    return nil;
}

@end
