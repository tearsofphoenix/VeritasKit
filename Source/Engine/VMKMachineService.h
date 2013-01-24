//
//  VMKMachineService.h
//  LuaCL
//
//  Created by tearsofphoenix on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKBase.h"
#import <Foundation/Foundation.h>

typedef void (^ VMKBlock)(struct lua_State *L);
typedef void (^ VCallbackBlock)(NSArray *callbackArguments) ;

@interface VMKMachineService : NSObject

+ (id)sharedService;

- (void)doSourceCode: (NSString *)sourceCode;

- (void)parseSourceCode: (NSString *)sourceCode;

- (void)registerGlobalConstants: (NSArray *)constants;

- (void)dumpSourceCode: (NSString *)sourceCode
                toPath: (NSString *)path;

@end

//IDs of Supported Features
//
extern NSString * const VMKMachineObjCSupport;

extern NSString * const VMKMachineUIKitSupport;

extern NSString * const VMKMachineParserSupport;


VMK_EXTERN_C_BEGIN

extern void LuaCall(NSString *sourceCode, NSString *functionName,
                    VMKBlock start, int argumentCount,
                    int returnCount,  VMKBlock completion);

VMK_EXTERN__C_END
