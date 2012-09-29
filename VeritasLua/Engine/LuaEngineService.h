//
//  LuaEngineService.h
//  LuaCL
//
//  Created by tearsofphoenix on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ERGeneralMetaService.h"

#include "LuaObjCBase.h"

@interface LuaEngineService : ERGeneralMetaService

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
                    ERGeneralCallbackBlock start,
                    int argumentCount,
                    int returnCount,
                    ERGeneralCallbackBlock completion);

__END_DECLS
