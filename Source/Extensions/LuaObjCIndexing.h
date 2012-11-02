//
//  LuaObjCIndexing.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct lua_State;

@interface NSObject (LuaObjCIndexing)

- (void)indexObjectWithState: (struct lua_State *)state;

- (void)addObjectAtIndexWithState: (struct lua_State *)state;

@end

@interface NSObject (LuaObjCConcating)

- (void)concatObjectWithState: (struct lua_State *)state;

@end

@interface NSObject (LuaObjCMeasurable)

- (void)getLengthOfObjectWithState: (struct lua_State *)state;

@end


