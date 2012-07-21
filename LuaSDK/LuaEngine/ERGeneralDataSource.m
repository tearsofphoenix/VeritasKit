//
//  ERGeneralDataSource.m
//  ERGeneralPhaseII
//
//  Created by tearsofphoenix on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ERGeneralDataSource.h"

@implementation ERGeneralDataSource

static NSMutableDictionary *__resgiteredServices = nil;
static NSMutableDictionary *__registeredCallbackOnDidLoadOfService = nil;

+ (void)load
{
    [super load];
    
    @autoreleasepool 
    {                
        if (!__resgiteredServices) 
        {
            __resgiteredServices = [[NSMutableDictionary alloc] init];            
        }
        if (!__registeredCallbackOnDidLoadOfService)
        {
            __registeredCallbackOnDidLoadOfService = [[NSMutableDictionary alloc] init];
        }
    }
}

+ (void)registerService: (Class)serviceClass
{
    @autoreleasepool 
    {        
        if (!__resgiteredServices)
        {
            [self load];
        }
        
        id<ERGeneralMetaService> service = [[serviceClass alloc] init];
        id serviceID = [serviceClass identity];

        [__resgiteredServices setObject: service
                                 forKey: serviceID];
        [service release];
        
        ERGeneralCallbackBlock block = [__registeredCallbackOnDidLoadOfService objectForKey: serviceID];
        if (block)
        {
            block(nil, [NSArray arrayWithObject: serviceID]);
        }
    }
}

+ (id<ERGeneralMetaService>)serviceByID: (NSString *)serviceID
{
    return [__resgiteredServices objectForKey: serviceID];
}

+ (NSString *)documentPath
{
#if TARGET_IPHONE_SIMULATOR
    return @"/Users/tearsofphoenix/Desktop/CurrentWork/AZExihibit/AZExihibit/Resource/";
#else
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex: 0];
#endif
    
}

+ (NSString *)filePathInDocumentWithPathComponent: (NSString *)relativePath
{
    return [[self documentPath] stringByAppendingPathComponent: relativePath];
}

+ (NSString *)filePathInApplicationDirectoryWithPathComponent: (NSString *)relativePath
{
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: relativePath];
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
            if ([__resgiteredServices objectForKey: serviceID])
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
}

@end
