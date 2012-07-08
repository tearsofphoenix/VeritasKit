//
//  ERGeneralMetaService.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ERGeneralConstants.h"
                                     
@protocol ERGeneralMetaService <NSObject>

+ (id)identity;

- (void)initServiceCallbackFunctions;

- (void)registerBlock: (ERGeneralServiceBlock)serviceBlock
            forAction: (NSString *)action;

- (void)callForAction: (NSString *)action 
            arguments: (NSArray *)arguments
         withCallback: (ERGeneralCallbackBlock)callbackBlock;

@end

@interface ERGeneralMetaService : NSObject<ERGeneralMetaService>

@end

extern NSString * const ERGeneralMetaServiceID;