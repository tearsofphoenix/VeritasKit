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

#ifndef __VMK_VMKBRIDGESERVICE__
#define __VMK_VMKBRIDGESERVICE__ 1

#include "VMKBase.h"

typedef struct __VMKBridgeService *VMKBridgeServiceRef;

VMK_EXPORT CFTypeID VMKBridgeServiceGetTypeID(void);

VMK_EXPORT VMKBridgeServiceRef VMKBridgeServiceGetSharedService(void);

VMK_EXPORT void VMKBridgeServiceImportFrameworkWithName(VMKBridgeServiceRef service, CFStringRef frameworkName);

VMK_EXPORT void VMKBridgeServiceResolveNameIntoState(VMKBridgeServiceRef service, CFStringRef name, struct lua_State *state);


#endif
