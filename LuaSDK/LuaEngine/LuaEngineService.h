//
//  LuaEngineService.h
//  LuaCL
//
//  Created by tearsofphoenix on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "ERGeneralMetaService.h"

extern void LuaCall(NSString *sourceCode,
                    NSString *functionName,
                    ERGeneralCallbackBlock block,
                    int argumentCount,
                    int returnCount,
                    ERGeneralCallbackBlock completion);

@interface LuaEngineService : ERGeneralMetaService

@end

extern NSString * const LuaEngineObjCSupport;

extern NSString * const LuaEngineUIKitSupport;

extern NSString * const LuaEngineParserSupport;

extern NSString * const LuaEngineServiceID;

extern NSString * const LuaEngineDoSourceCode;

#pragma mark - internal use

extern NSString * const LuaEngineRegisterGlobalConstants;

