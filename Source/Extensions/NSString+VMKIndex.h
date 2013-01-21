//
//  NSString+VMKIndex.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKIndexing.h"

@interface NSString (VMKIndex)

- (void)indexObjectWithState: (struct lua_State *)L;

- (void)concatObjectWithState: (struct lua_State *)state;

- (void)getLengthOfObjectWithState: (struct lua_State *)state;

+ (NSString *)UUID;

@end

@interface NSMutableString (VMKIndex)

- (void)addObjectAtIndexWithState: (struct lua_State *)L;

@end
