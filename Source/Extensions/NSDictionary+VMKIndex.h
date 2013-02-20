//
//  NSDictionary+VMKIndex.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKIndexing.h"
#import "VMKBase.h"

@interface NSDictionary (VMKIndex)

- (void)indexObjectWithState: (VMKLuaStateRef)state;

- (void)concatObjectWithState: (VMKLuaStateRef)state;

- (void)getLengthOfObjectWithState: (VMKLuaStateRef)state;

- (lua_CFunction)luaEnumerator;

@end

@interface NSMutableDictionary (VMKIndex)

- (void)addObjectAtIndexWithState: (VMKLuaStateRef)state;

@end