//
//  HVBase64StaticFile.m
//
//  Copyright (c) 2012 Damian Kolakowski. All rights reserved.
//

#import "HVBase64StaticFile.h"
#import "NSData+Base64.h"

@implementation HVBase64StaticFile

+ (HVBase64StaticFile *)handler: (NSString *)base64String
{
    return [[[HVBase64StaticFile alloc] initWith: base64String] autorelease];
}

- (id)initWith: (NSString*)base64String;
{
    self = [super init];
    if (self)
    {
        cachedResponse = [[NSData dataFromBase64String: base64String] retain];
    }
    return self;
}

- (void)dealloc
{
    [cachedResponse release];
    cachedResponse = nil;
    [super dealloc];
}

- (BOOL)handleRequest: (NSString *)url
          withHeaders: (NSDictionary *)headers
                query: (NSDictionary *)query
              address: (NSString *)address
             onSocket: (int)socket
{
    if ([super handleRequest: url
                 withHeaders: headers
                       query: query
                     address: address
                    onSocket: socket])
    {
        if ([self writeText: @"\r\n"
                   toSocket: socket])
        {
            return [self writeData: cachedResponse
                          toSocket: socket];
        }
    }
    
    return NO;
}


@end
