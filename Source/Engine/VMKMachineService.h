//
//  VMKMachineService.h
//  LuaCL
//
//  Created by tearsofphoenix on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMetaService.h"

#include "VMKBase.h"

typedef void (^VMKBlock)(struct lua_State *L);

@interface VMKMachineService : VMetaService

@end

//IDs of Supported Features
//
extern NSString * const VMKMachineObjCSupport;

extern NSString * const VMKMachineUIKitSupport;

extern NSString * const VMKMachineParserSupport;

//Service ID
//
extern NSString * const VMKMachineServiceID;

//Service Actions
//
extern NSString * const VMKMachineServiceDoSourceCodeAction;

extern NSString * const VMKMachineServiceParseSourceCodeAction;

#pragma mark - internal use

extern NSString * const VMKMachineServiceRegisterGlobalConstantsAction;

extern NSString * const VMKMachineServiceDumpSourceCodeToPathAction;

extern NSString * const VMKMachineServiceDebugSourceFilesAction;

VMK_EXTERN_C_BEGIN

extern void LuaCall(NSString *sourceCode, NSString *functionName,
                    VMKBlock start, int argumentCount,
                    int returnCount,  VMKBlock completion);

VMK_EXTERN__C_END
