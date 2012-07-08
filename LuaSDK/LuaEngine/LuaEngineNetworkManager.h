//
//  LuaEngineNetworkManager.h
//  LuaCL
//
//  Created by E-Reach Administrator on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface LuaEngineNetworkManager : NSObject<NSURLConnectionDataDelegate>
{
@private
    NSMutableData *_receivedData;
}

- (void)postRequestToServerWithInfo: (id)info;

@end
