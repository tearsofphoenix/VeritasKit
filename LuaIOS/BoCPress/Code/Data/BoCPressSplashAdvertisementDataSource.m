//
//  BoCPressSplashAdvertisementDataSource.m
//  BoCPress
//
//  Created by E-Reach Administrator on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BoCPressSplashAdvertisementDataSource.h"

#import "BoCPressDataSource.h"

@implementation BoCPressSplashAdvertisementDataSource

- (id)initWithService:(id<BoCPressDataSource>)rootDataSource
{
    if ((self = [super init]))
    {
        _rootDataSource = rootDataSource;
    }
    
    return self;
}

- (UIImage *)imageWithImageInfo: (NSDictionary *)info 
                       callback: (id<BoCPressCallback>)callback
{
    return [_rootDataSource getAvatarWithImageInfo: info
                                      withCallback: callback];
}

- (NSString *)cacheImageDirectoryPath
{
    return [_rootDataSource cacheImageDirectoryPath];
}
@end
