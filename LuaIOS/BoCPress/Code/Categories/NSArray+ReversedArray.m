//
//  NSArray+ReversedArray.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+ReversedArray.h"

@implementation NSArray (ReversedArray)

- (NSArray *)reversedArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) 
    {
        [array addObject:element];
    }
    return [NSArray arrayWithArray: array];
}

@end
