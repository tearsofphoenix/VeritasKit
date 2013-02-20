//
//  NSArray+VMKIndex.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKIndexing.h"

#import "VMKBase.h"

@interface NSArray (VMKIndex)

- (void)indexObjectWithState: (VMKLuaStateRef)state;

- (void)concatObjectWithState: (VMKLuaStateRef)state;

- (void)getLengthOfObjectWithState: (VMKLuaStateRef)state;

- (lua_CFunction)luaEnumerator;

@end

@interface NSMutableArray (VMKIndex)

- (void)addObjectAtIndexWithState: (VMKLuaStateRef)state;

@end