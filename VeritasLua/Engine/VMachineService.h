//
//  VMachineService.h
//  LuaCL
//
//  Created by tearsofphoenix on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMetaService.h"

#include "LuaObjCBase.h"

typedef void (^LuaObjCBlock)(struct lua_State *);

@interface VMachineService : VMetaService

@end

//IDs of Supported Features
//
extern NSString * const LuaEngineObjCSupport;

extern NSString * const LuaEngineUIKitSupport;

extern NSString * const LuaEngineParserSupport;

//Service ID
//
extern NSString * const LuaEngineServiceID;

//Service Actions
//
extern NSString * const LuaEngineServiceActionDoSourceCode;

#pragma mark - internal use

extern NSString * const LuaEngineServiceActionRegisterGlobalConstants;

__BEGIN_DECLS

extern void LuaCall(NSString *sourceCode,
                    NSString *functionName,
                    LuaObjCBlock start,
                    int argumentCount,
                    int returnCount,
                    LuaObjCBlock completion);

__END_DECLS
