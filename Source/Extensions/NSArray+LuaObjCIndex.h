//
//  NSArray+LuaObjCIndex.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCIndexing.h"

#import "LuaObjCBase.h"

@interface NSArray (LuaObjCIndex)

- (void)indexObjectWithState: (struct lua_State *)L;

- (void)concatObjectWithState: (struct lua_State *)state;

- (void)getLengthOfObjectWithState: (struct lua_State *)state;

- (lua_CFunction)luaEnumerator;

@end

@interface NSMutableArray (LuaObjCIndex)

- (void)addObjectAtIndexWithState: (struct lua_State *)L;

@end