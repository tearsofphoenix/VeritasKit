//
//  VMKBridgeService.h
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct lua_State;

@interface VMKBridgeService : NSObject

+ (id)sharedService;

- (void)importFramework: (NSString *)frameworkName;

- (void)resolveName: (NSString *)name
          intoState: (struct lua_State *)state;

@end
