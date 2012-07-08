//
//  ERGeneralDataSource.h
//  ERGeneralPhaseII
//
//  Created by E-Reach Administrator on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ERGeneralConstants.h"
#import "ERGeneralMetaService.h"

@interface ERGeneralDataSource : NSObject

+ (void)registerService: (Class)serviceClass;

+ (id<ERGeneralMetaService>)serviceByID: (NSString *)serviceID;

+ (void)registerBlock: (ERGeneralCallbackBlock)block 
   onDidLoadOfService: (id)serviceID;

+ (NSString *)documentPath;

+ (NSString *)filePathInDocumentWithPathComponent: (NSString *)relativePath;

+ (NSString *)filePathInApplicationDirectoryWithPathComponent: (NSString *)relativePath;

@end

static inline void ERSC(NSString *serviceID, NSString *action, ERGeneralCallbackBlock callback, NSArray *arguments)
{
    [[ERGeneralDataSource serviceByID: serviceID] callForAction: action
                                                   arguments: arguments
                                                withCallback: callback];
}