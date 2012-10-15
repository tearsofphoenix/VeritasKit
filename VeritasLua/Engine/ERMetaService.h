//
//  ERMetaService.h
//  BoCPress
//
//  Created by tearsofphoenix on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

typedef void (^ERGeneralCallbackBlock)(NSString *action, NSArray *arguments);
typedef void (^ERGeneralServiceBlock)(ERGeneralCallbackBlock callback, NSString *action, NSArray *arguments);

@protocol ERMetaService <NSObject>

+ (id)identity;

- (void)initServiceCallbackFunctions;

- (void)registerBlock: (ERGeneralServiceBlock)serviceBlock
            forAction: (NSString *)action;

- (void)callForAction: (NSString *)action
            arguments: (NSArray *)arguments
         withCallback: (ERGeneralCallbackBlock)callbackBlock;

@end

@interface ERMetaService : NSObject<ERMetaService>

+ (void)registerService: (Class)serviceClass;

+ (id<ERMetaService>)serviceByID: (NSString *)serviceID;

+ (void)registerBlock: (ERGeneralCallbackBlock)block
   onDidLoadOfService: (id)serviceID;

@end

extern NSString * const ERGeneralMetaServiceID;

static inline void VSC(NSString *serviceID, NSString *action, ERGeneralCallbackBlock callback, NSArray *arguments)
{
    [[ERMetaService serviceByID: serviceID] callForAction: action
                                                arguments: arguments
                                             withCallback: callback];
}

