//
//  VMachineService.h
//  LuaCL
//
//  Created by tearsofphoenix on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMetaService.h"

#include "LuaObjCBase.h"

typedef void (^LuaObjCBlock)(struct lua_State *L);

@interface VMachineService : VMetaService

@end

//IDs of Supported Features
//
extern NSString * const VMachineObjCSupport;

extern NSString * const VMachineUIKitSupport;

extern NSString * const VMachineParserSupport;

//Service ID
//
extern NSString * const VMachineServiceID;

//Service Actions
//
extern NSString * const VMachineServiceDoSourceCodeAction;

extern NSString * const VMachineServiceParseSourceCodeAction;

#pragma mark - internal use

extern NSString * const VMachineServiceRegisterGlobalConstantsAction;

extern NSString * const VMachineServiceDumpSourceCodeToPathAction;

extern NSString * const VMachineServiceDebugSourceFilesAction;

__BEGIN_DECLS

extern void LuaCall(NSString *sourceCode, NSString *functionName,
                    LuaObjCBlock start, int argumentCount,
                    int returnCount,  LuaObjCBlock completion);

__END_DECLS
