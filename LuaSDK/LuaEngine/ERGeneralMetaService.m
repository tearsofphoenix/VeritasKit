//
//  ERGeneralMetaService.m
//  BoCPress
//
//  Created by tearsofphoenix on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ERGeneralMetaService.h"
#import "ERGeneralDataSource.h"

@interface ERGeneralMetaService ()
{    
@private
    NSMutableDictionary *_registeredProcessors;
}

@end

@implementation ERGeneralMetaService

+ (void)load
{
    [super load];
    
    [ERGeneralDataSource registerService: self];
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

- (void)dealloc
{
    [_registeredProcessors release];
    
    [super dealloc];
}

- (void)registerBlock: (ERGeneralServiceBlock)serviceBlock
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
         withCallback: (ERGeneralCallbackBlock)callbackBlock
{    
    ERGeneralServiceBlock serviceBlock = [_registeredProcessors objectForKey: action];
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

@end

NSString * const ERGeneralMetaServiceID = @"com.ereach.metaservice.meta";
