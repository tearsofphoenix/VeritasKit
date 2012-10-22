//
//  VMetaService.m
//  BoCPress
//
//  Created by tearsofphoenix on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMetaService.h"

@interface VMetaService ()
{
@private
    NSMutableDictionary *_registeredProcessors;
}

@end

@implementation VMetaService

static NSMutableDictionary *__resgiteredServices = nil;
static NSMutableDictionary *__registeredCallbackOnDidLoadOfService = nil;

+ (void)load
{
    if (!__resgiteredServices)
    {
        __resgiteredServices = [[NSMutableDictionary alloc] init];
    }
    if (!__registeredCallbackOnDidLoadOfService)
    {
        __registeredCallbackOnDidLoadOfService = [[NSMutableDictionary alloc] init];
    }
    
    [self registerService: self];
}

- (id)init
{
    if ((self = [super init]))
    {
        _registeredProcessors = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)registerBlock: (VServiceBlock)serviceBlock
            forAction: (NSString *)action
{
    if (serviceBlock && action)
    {
        serviceBlock = Block_copy(serviceBlock);
        
        [_registeredProcessors setObject: serviceBlock
                                  forKey: action];
        
        Block_release(serviceBlock);
    }
}

- (void)callForAction: (NSString *)action
            arguments: (NSArray *)arguments
         withCallback: (VCallbackBlock)callbackBlock
{
    VServiceBlock serviceBlock = CFDictionaryGetValue((CFDictionaryRef)_registeredProcessors, action);
    
    if (serviceBlock)
    {
        serviceBlock(callbackBlock, action, arguments);
    }
}

+ (id)identity
{
    return ERGeneralMetaServiceID;
}



+ (void)registerService: (Class)serviceClass
{
    
    id<VMetaService> service = [[serviceClass alloc] init];
    id serviceID = [serviceClass identity];
    
    [__resgiteredServices setObject: service
                             forKey: serviceID];
    
    [service release];
    
    VCallbackBlock block = [__registeredCallbackOnDidLoadOfService objectForKey: serviceID];
    if (block)
    {
        block(nil, [NSArray arrayWithObject: serviceID]);
    }
}

+ (id<VMetaService>)serviceByID: (NSString *)serviceID
{
    return [__resgiteredServices objectForKey: serviceID];
}

+ (void)registerBlock: (VCallbackBlock)block
   onDidLoadOfService: (id)serviceID
{
    
    if (block && serviceID)
    {
        //has registered, so just call it
        //
        if (CFDictionaryGetValue((CFDictionaryRef)__resgiteredServices, serviceID))
        {
            block(nil, [NSArray arrayWithObject: serviceID]);
            
        }else
        {
            block = Block_copy(block);
            
            [__registeredCallbackOnDidLoadOfService setObject: block
                                                       forKey: serviceID];
            
            Block_release(block);
        }
    }
}

@end

NSString * const ERGeneralMetaServiceID = @"com.ereach.metaservice.meta";
