//
//  VMetaService.m
//  BoCPress
//
//  Created by tearsofphoenix on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMetaService.h"
#import <objc/message.h>

@interface VMetaService ()
{
@private
    CFMutableDictionaryRef _registeredProcessors;
}

@end

@implementation VMetaService

static CFMutableDictionaryRef __resgiteredServices = nil;
static CFMutableDictionaryRef __registeredCallbackOnDidLoadOfService = nil;
static IMP _VMetaServiceCallforActionIMP = NULL;
static SEL _VMetaServiceCallforActionSEL = NULL;

+ (void)load
{
    if (!__resgiteredServices)
    {
        __resgiteredServices = (CFMutableDictionaryRef)[[NSMutableDictionary alloc] init];
    }
    if (!__registeredCallbackOnDidLoadOfService)
    {
        __registeredCallbackOnDidLoadOfService = (CFMutableDictionaryRef)[[NSMutableDictionary alloc] init];
    }
    
    _VMetaServiceCallforActionSEL = @selector(callForAction:arguments:callback:onQueue:);
    
    if (!_VMetaServiceCallforActionIMP)
    {
        _VMetaServiceCallforActionIMP = class_getMethodImplementation(self, _VMetaServiceCallforActionSEL);
    }
}

- (id)init
{
    if ((self = [super init]))
    {
        _registeredProcessors = (CFMutableDictionaryRef)[[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)dealloc
{
    CFRelease(_registeredProcessors);
    dispatch_release(_queue);
    
    [super dealloc];
}

- (void)initProcessors
{
    
}

- (void)registerBlock: (VServiceBlock)serviceBlock
            forAction: (NSString *)action
{
    if (serviceBlock && action)
    {
        serviceBlock = Block_copy(serviceBlock);
        
        [(NSMutableDictionary *)_registeredProcessors setObject: serviceBlock
                                                         forKey: action];
        
        Block_release(serviceBlock);
    }
}

- (void)callForAction: (NSString *)action
            arguments: (NSArray *)arguments
             callback: (VCallbackBlock)callbackBlock
              onQueue: (BOOL)isOnQueue
{
    VServiceBlock serviceBlock = CFDictionaryGetValue(_registeredProcessors, action);
    
    if (serviceBlock)
    {
        if (isOnQueue)
        {
            dispatch_async(_queue, (^
                                    {
                                        serviceBlock(callbackBlock, arguments);                                        
                                    }));
        }else
        {
            serviceBlock(callbackBlock, arguments);
        }
    }
}

+ (id)identity
{
    return nil;
}


+ (void)registerService: (Class)serviceClass
{
    
    VMetaService* service = [[serviceClass alloc] init];
    id serviceID = [serviceClass identity];
    service->_queue = dispatch_queue_create([serviceID UTF8String], DISPATCH_QUEUE_CONCURRENT);
    [service initProcessors];
    
    [(NSMutableDictionary *)__resgiteredServices setObject: service
                                                    forKey: serviceID];
    
    [service release];
    
    VCallbackBlock block = CFDictionaryGetValue(__registeredCallbackOnDidLoadOfService, serviceID);
    if (block)
    {
        block(@[ serviceID ]);
        
        CFDictionaryRemoveValue(__registeredCallbackOnDidLoadOfService, serviceID);
    }
}

+ (id<VMetaService>)serviceByID: (NSString *)serviceID
{
    return CFDictionaryGetValue(__resgiteredServices, serviceID);
}

+ (void)registerBlock: (VCallbackBlock)block
   onDidLoadOfService: (id)serviceID
{
    
    if (block && serviceID)
    {
        //has registered, so just call it
        //
        if (CFDictionaryGetValue(__resgiteredServices, serviceID))
        {
            block(@[ serviceID ]);
            
        }else
        {
            block = Block_copy(block);
            
            [(NSMutableDictionary *)__registeredCallbackOnDidLoadOfService setObject: block
                                                                              forKey: serviceID];
            
            Block_release(block);
        }
    }
}

void VSC(NSString *serviceID, NSString *action, VCallbackBlock callback, NSArray *arguments)
{
    id<VMetaService> service = CFDictionaryGetValue(__resgiteredServices, serviceID);
    _VMetaServiceCallforActionIMP(service, _VMetaServiceCallforActionSEL, action, arguments, callback, NO);
}

void VSQC(NSString *serviceID, NSString *action, VCallbackBlock callback, NSArray *arguments)
{
    id<VMetaService> service = CFDictionaryGetValue(__resgiteredServices, serviceID);
    _VMetaServiceCallforActionIMP(service, _VMetaServiceCallforActionSEL, action, arguments, callback, YES);
}

@end

