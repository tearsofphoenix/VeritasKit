//
//  VMKMachineService.h
//  LuaCL
//
//  Created by tearsofphoenix on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKBase.h"
#import <Foundation/Foundation.h>

typedef void (^ VMKBlock)(VMKLuaStateRef state);
typedef void (^ VCallbackBlock)(NSArray *callbackArguments) ;

@protocol VMKDebugServer <NSObject>

- (void)setState: (VMKLuaStateRef)state;

- (void)stop;

- (void)start;

@end

@interface VMKMachineService : NSObject

+ (id)sharedService;

- (void)doSourceCode: (NSString *)sourceCode;

- (void)parseSourceCode: (NSString *)sourceCode;

- (void)registerGlobalConstants: (NSArray *)constants;

- (void)dumpSourceCode: (NSString *)sourceCode
                toPath: (NSString *)path;

@property (nonatomic, assign) id<VMKDebugServer> debugServer;

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

VMK_EXTERN_C_END
