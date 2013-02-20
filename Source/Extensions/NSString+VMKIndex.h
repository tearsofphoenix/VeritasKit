//
//  NSString+VMKIndex.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKIndexing.h"

@interface NSString (VMKIndex)

- (void)indexObjectWithState: (VMKLuaStateRef)state;

- (void)concatObjectWithState: (VMKLuaStateRef)state;

- (void)getLengthOfObjectWithState: (VMKLuaStateRef)state;

+ (NSString *)UUID;

@end
