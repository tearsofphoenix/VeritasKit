//
//  VMKIndexing.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "VMKBase.h"

@interface NSObject (VMKIndexing)

- (void)indexObjectWithState: (VMKLuaStateRef)state;

- (void)addObjectAtIndexWithState: (VMKLuaStateRef)state;

@end

@interface NSObject (VMKConcating)

- (void)concatObjectWithState: (VMKLuaStateRef)state;

@end

@interface NSObject (VMKMeasurable)

- (void)getLengthOfObjectWithState: (VMKLuaStateRef)state;

@end


