//
//  ERMetaService.m
//  BoCPress
//
//  Created by tearsofphoenix on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ERMetaService.h"

@interface ERMetaService ()
{
@private
    NSMutableDictionary *_registeredProcessors;
}

@end

@implementation ERMetaService

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

- (void)initServiceCallbackFunctions
{
    
}

- (id)init
{
    if ((self = [super init]))
    {
        _registeredProcessors = [[NSMutableDictionary alloc] init];
        [self initServiceCallbackFunctions];
    }
    return self;
}

- (void)registerBlock: (ERGeneralServiceBlock)serviceBlock
            forAction: (NSString *)action
{
    if (serviceBlock && action)
    {
        serviceBlock = Block_copy(serviceBlock);
        
        CFDictionarySetValue((CFMutableDictionaryRef)_registeredProcessors, action, serviceBlock);
        
        Block_release(serviceBlock);
    }
}

- (void)callForAction: (NSString *)action
            arguments: (NSArray *)arguments
         withCallback: (ERGeneralCallbackBlock)callbackBlock
{
    ERGeneralServiceBlock serviceBlock = CFDictionaryGetValue((CFDictionaryRef)_registeredProcessors, action);
   
    if (serviceBlock)
    {
        @autoreleasepool
        {
            serviceBlock(callbackBlock, action, arguments);
        }
    }
}

+ (id)identity
{
    return ERGeneralMetaServiceID;
}



+ (void)registerService: (Class)serviceClass
{
    @autoreleasepool
    {        
        id<ERMetaService> service = [[serviceClass alloc] init];
        id serviceID = [serviceClass identity];
        
        CFDictionarySetValue((CFMutableDictionaryRef)__resgiteredServices, serviceID, service);
        
        [service release];
        
        ERGeneralCallbackBlock block = [__registeredCallbackOnDidLoadOfService objectForKey: serviceID];
        if (block)
        {
            block(nil, [NSArray arrayWithObject: serviceID]);
        }
    }
}

+ (id<ERMetaService>)serviceByID: (NSString *)serviceID
{
    return [__resgiteredServices objectForKey: serviceID];
}

+ (void)registerBlock: (ERGeneralCallbackBlock)block
   onDidLoadOfService: (id)serviceID
{
    @autoreleasepool
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
                
                CFDictionaryAddValue((CFMutableDictionaryRef)__registeredCallbackOnDidLoadOfService, serviceID, block);

                Block_release(block);
            }
        }
    }
}

@end

NSString * const ERGeneralMetaServiceID = @"com.ereach.metaservice.meta";
