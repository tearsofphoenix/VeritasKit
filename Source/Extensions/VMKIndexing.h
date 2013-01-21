//
//  VMKIndexing.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct lua_State;

@interface NSObject (VMKIndexing)

- (void)indexObjectWithState: (struct lua_State *)state;

- (void)addObjectAtIndexWithState: (struct lua_State *)state;

@end

@interface NSObject (VMKConcating)

- (void)concatObjectWithState: (struct lua_State *)state;

@end

@interface NSObject (VMKMeasurable)

- (void)getLengthOfObjectWithState: (struct lua_State *)state;

@end


