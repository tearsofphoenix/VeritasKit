//
//  HVBase64StaticFile.h
//
//  Copyright (c) 2012 Damian Kolakowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMKDebugRequestHandler.h"

@interface HVBase64StaticFile : VMKDebugRequestHandler
{
    NSData *cachedResponse;
}

+ (HVBase64StaticFile *)handler: (NSString*)base64String;

- (id)initWith: (NSString*)base64String;

@end
