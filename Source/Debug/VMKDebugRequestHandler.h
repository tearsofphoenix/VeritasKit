//
//  VMKDebugRequestHandler.h
//
//  Copyright (c) 2012 Damian Kolakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HVRequestHandler <NSObject>

@required

- (BOOL)handleRequest: (NSDictionary *)parameters
             onSocket: (int)socket;

@end

@interface VMKDebugRequestHandler : NSObject <HVRequestHandler>

- (BOOL)writeData: (NSData *)rawData
         toSocket: (int)socket;

- (BOOL)writeOKStatus: (int)socket;

- (BOOL)writeText: (NSString *)text
         toSocket: (int)socket;

@end
