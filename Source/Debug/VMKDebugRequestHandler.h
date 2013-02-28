//
//  VMKDebugRequestHandler.h
//
//  Copyright (c) 2012 Damian Kolakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HVRequestHandler <NSObject>

@required

- (BOOL)handleRequest: (NSString *)url
          withHeaders: (NSDictionary *)headers
                query: (NSDictionary *)query
              address: (NSString *)address
             onSocket: (int)socket;

@end

@interface VMKDebugRequestHandler : NSObject <HVRequestHandler>

+ (id)handler;

- (BOOL)writeData: (NSData *)rawData
         toSocket: (int)socket;

- (BOOL)writeOKStatus: (int)socket;

- (BOOL)writeText: (NSString *)text
         toSocket: (int)socket;

@end
