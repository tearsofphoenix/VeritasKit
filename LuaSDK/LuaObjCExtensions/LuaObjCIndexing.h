//
//  LuaObjCIndexing.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct lua_State;

@protocol LuaObjCIndexing <NSObject>

- (void)indexObjectWithState: (struct lua_State *)state;

- (void)addObjectAtIndexWithState: (struct lua_State *)state;

@end

@protocol LuaObjCConcating <NSObject>

- (void)concatObjectWithState: (struct lua_State *)state;

@end

@protocol LuaObjCMeasurable <NSObject>

- (void)getLengthOfObjectWithState: (struct lua_State *)state;

@end