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

- (void)indexObjectWithState: (struct lua_State *)L;

- (void)concatObjectWithState: (struct lua_State *)state;

- (void)getLengthOfObjectWithState: (struct lua_State *)state;

- (lua_CFunction)luaEnumerator;

@end

@interface NSMutableDictionary (VMKIndex)

- (void)addObjectAtIndexWithState: (struct lua_State *)L;

@end