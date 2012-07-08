//
//  BoCPressNetworkSession.m
//  BoCPress
//
//  Created by E-Reach Administrator on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoCPressNetworkSession.h"

@implementation BoCPressNetworkSession

@synthesize targetURL = _targetURL;
@synthesize requestContent = _requestContent;
@synthesize callbackInfo = _callbackInfo;
@synthesize metaSessionID = _metaSessionID;
@synthesize sessionID = _sessionID;
@synthesize cacheInfo = _cacheInfo;

- (id)initWithMetaSessionID: (id)metaSessionID 
                  sessionID: (id)sessionID
{
    if ((self = [super init]))
    {
        _metaSessionID = [metaSessionID retain];
        _sessionID = [sessionID retain];
    }
    return self;
}


@end
