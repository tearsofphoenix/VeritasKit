//
//  BoCPressNetworkSession.h
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BoCPressCallbackInfo;

@protocol BoCPressNetworkSession

@required

#pragma mark - data

@property (nonatomic, retain) NSURL *targetURL;
@property (nonatomic, retain) NSString *requestContent;
@property (nonatomic, retain) id<BoCPressCallbackInfo> callbackInfo;

@property (nonatomic, retain) id cacheInfo;

@property (nonatomic, readonly) id metaSessionID;
@property (nonatomic, readonly) id sessionID;

#pragma mark - controller

@end

@interface BoCPressNetworkSession : NSObject<BoCPressNetworkSession>
{
@private
    id _metaSessionID;
    id _sessionID;
}

- (id)initWithMetaSessionID: (id)metaSessionID
                  sessionID: (id)sessionID;
@end
