//
//  VMetaService.h
//  BoCPress
//
//  Created by tearsofphoenix on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

typedef void (^ VCallbackBlock)(NSString *action, NSArray *arguments);
typedef void (^ VServiceBlock)(VCallbackBlock callback, NSString *action, NSArray *arguments);

@protocol VMetaService <NSObject>

+ (id)identity;

- (void)initServiceCallbackFunctions;

- (void)registerBlock: (VServiceBlock)serviceBlock
            forAction: (NSString *)action;

- (void)callForAction: (NSString *)action
            arguments: (NSArray *)arguments
         withCallback: (VCallbackBlock)callbackBlock;

@end

@interface VMetaService : NSObject<VMetaService>

+ (void)registerService: (Class)serviceClass;

+ (id<VMetaService>)serviceByID: (NSString *)serviceID;

+ (void)registerBlock: (VCallbackBlock)block
   onDidLoadOfService: (id)serviceID;

@end

extern NSString * const ERGeneralMetaServiceID;

static inline void VSC(NSString *serviceID, NSString *action, VCallbackBlock callback, NSArray *arguments)
{
    [[VMetaService serviceByID: serviceID] callForAction: action
                                                arguments: arguments
                                             withCallback: callback];
}

