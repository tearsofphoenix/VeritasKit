//
//  NSString+LuaObjCIndex.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCIndexing.h"

@interface NSString (LuaObjCIndex)

- (void)indexObjectWithState: (struct lua_State *)L;

- (void)concatObjectWithState: (struct lua_State *)state;

- (void)getLengthOfObjectWithState: (struct lua_State *)state;

+ (NSString *)UUID;

@end

@interface NSMutableString (LuaObjCIndex)

- (void)addObjectAtIndexWithState: (struct lua_State *)L;

@end
