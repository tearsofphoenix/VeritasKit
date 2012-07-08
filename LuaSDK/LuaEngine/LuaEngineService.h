//
//  LuaEngineService.h
//  LuaCL
//
//  Created by E-Reach Administrator on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "ERGeneralMetaService.h"
#import "ERGeneralDataSource.h"

extern NSString * const LuaEngineOpenLibrarySupport;

extern NSString * const LuaEngineDoSourceCode;

#pragma mark - internal use

extern NSString * const LuaEngineRegisterGlobalConstants;

extern NSString * const LuaEngineLoadClassList;

@protocol LuaEngineDelegate; 

@interface LuaEngineService : ERGeneralMetaService

@property (nonatomic, assign) id<LuaEngineDelegate> delegate;

@end


@protocol LuaEngineDelegate <NSObject>

@optional

- (void)showOutput: (NSString *)output
          ofEngine: (LuaEngineService *)engine;

@end

extern NSString * const LuaEngineXPathSupport;

extern NSString * const LuaEngineSqliteSupport;

extern NSString * const LuaEngineOpenGLESSupport;

extern NSString * const LuaEngineGLUSupport;

extern NSString * const LuaEngineCGLSupport;

extern NSString * const LuaEngineTCCSupport;

extern NSString * const LuaEngineObjCSupport;

extern NSString * const LuaEngineUIKitSupport;

extern NSString * const LuaEngineParserSupport;

extern NSString * const LuaEngineServiceID;

extern void LuaCall(NSString *sourceCode,
                    NSString *functionName,
                    ERGeneralCallbackBlock block, 
                    NSInteger argumentCount, NSInteger returnCount,
                    ERGeneralCallbackBlock completion);
