//
//  VMetaService.h
//  BoCPress
//
//  Created by tearsofphoenix on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ VCallbackBlock)( NSArray *arguments);
typedef void (^ VServiceBlock)(VCallbackBlock callback, NSArray *arguments);

@protocol VMetaService <NSObject>

+ (id)identity;

- (void)registerBlock: (VServiceBlock)serviceBlock
            forAction: (NSString *)action;

- (void)initProcessors;

@end

@interface VMetaService : NSObject<VMetaService>
{
@protected
    dispatch_queue_t _queue;
}

+ (void)registerService: (Class)serviceClass;

+ (id<VMetaService>)serviceByID: (NSString *)serviceID;

@end

extern void VSC(NSString *serviceID, NSString *action, VCallbackBlock callback, NSArray *arguments);

extern void VSQC(NSString *serviceID, NSString *action, VCallbackBlock callback, NSArray *arguments);
